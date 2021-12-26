# Unity (multiplayer)

**Mini-documentación hecha por Rodrigo Seguel**

Unity y el multijugador es como el agua y el aceite, 2 compuestos que por su funcionamiento parecerían tener sentido uno al  lado del otro pero en si son muy distintos y sinceramente muy poco cooperativos entre si.

Pero en esta documentación me tomare la tarea de educarte un poco sobre el concepto de multijugador en el entorno de unity, por que es tan difícil, como quitarnos gran parte de ese peso de encima y una respuesta general a las dudas que te pueden salir mientras sigues esta documentación.

---

# Teoría

En esta parte me encargare de hablar sobre la parte teórica de lo que haremos, explicar temas que se van a tomar en cuenta en varios momentos que hablemos sobre el "networking" en general.

---

## TCP/IP

Y como inicio tengo que hablar de Tcp/Ip, este es un "**protocolo de control de transmisión y protocolo de internet**" que por medio de ciertas capas nos permite interactuar con una conexión a internet de distintas formas.

Estas capas son las siguientes:

+ **Capa de aplicación**: En esta "capa" interactuamos directamente con los programas, paginas y juegos que requerirán de esta "conexión" en base a distintos protocolos (en las paginas web por ejemplo utilizamos el protocolo http).

---

+ **Capa de transporte**: En esta capa encontramos TCP a demás de UDP que es otro protocolo con un tiempo de respuesta mas rápido especialmente util para aplicaciones que requieran de baja latencia como ciertos juegos (aun que para lo que haremos no será necesario usarlo). 

  Cuando nosotros queremos enviar algo por TCP lo que ocurre es que **la aplicación ingresa los datos en un protocolo el cual es enviado a un puerto con el que TCP interactuara y de donde este sacara la información que necesitaremos** (por ejemplo la mayoría de la actividad que ocurre en un buscador web va por el puerto 80).

  Una vez que TCP obtiene la información la "separa" en distintas piezas que conocemos como "paquetes" para así dividirse y de forma separada intenten llegar de la forma mas rápida hasta donde deban llegar (un servidor por ejemplo)

  Para que nuestro destinatario(en este caso nuestro servidor) pueda volver a "reunir la información" TCP envía estos paquetes con un "encabezado" el cual contiene instrucciones para el servidor sobre como "organizar los paquetes", luego de esto los "paquetes reconstruidos" son enviados a lo que conocemos como.

---

+ **Capa de internet**: Aquí utilizamos el "protocolo de internet" (IP) para adjuntar tanto la dirección IP de origen y la de destino del paquete, para que el mismo sepa de donde viene y hacia donde debe ir, tras esto los datos son enviados a.

---

+ **Capa de red**: En este lugar al paquete se le adjunta la "dirección MAC" la cual le permite acceder hasta el "dispositivo físico correcto" ósea al ordenador correcto dentro de un grupo de servidores por ejemplo a demás de transformar esa información en impulsos eléctricos que pueden transportar por medio de cables y tubos.

---

En si cada paquete debe pasar por este laboríos proceso para ir desde un ordenador a otro y de hecho a pesar de parecer un arduo trabajo, este sistema facilita y efectiviza el proceso de traspaso de datos evitando por varios medios los "atascos" o cuellos de botella.

por esta razon necesitamos el IP ()

Ah y por cierto si quieres sentirte inseguro, TCP/IP le dice a una pagina desde donde te estas conectando según tu IP.

---

## Sockets

Cuando queremos hacer una conexión "cliente-servidor" usualmente ocurre de la siguiente forma:

El usuario hace una "petición" al servidor y este ultimo actualiza su estado enviando una "respuesta", esto funciona bien en varios casos pero tiene un problema y es que si por ejemplo algo del servidor se ha actualizado y nuestro cliente no hace una petición, a este no se le mostrara esta actualización hasta que lleve3 a cabo una petición nueva.

Esto ocurre por que el servidor de cierta forma no puede tener acceso a lo que nuestro equipo puede visualizar ni puede "avisarle" sobre el nuevo cambio.

Para esto usamos sockets, este nos permite mantener una comunicación activa-activa entre el cliente y el servidor, o sea el server por ejemplo será capaz de enviar notificaciones al cliente mientras que este podrá interactuar con lo que sea que le envié el servidor. Y por medio de este se pueden enviar integers, strings booleanos entre otros muchísimos datos u objetos y luego notificarnos en tiempo real cuando algo ocurra(por ejemplo se conecta otro dispositivo con conexión activo-activo).

A demás podremos por ejemplo saber cuándo un usuario se desconecta, un usuario nuevo se conecta o un usuario se vuelve a conectar.

---

# Proceso de desarrollo

En esta parte se mostrara la parte mas "practica" de este proceso, con muchos ejemplos y referencias a la parte teorica que se ha mencionado en la misma sección de [Teoría](#Teoría).

---

## Servidor dedicado

Cuando nos adentramos en el mundo del desarrollo de multijugadores nos daremos cuenta que requeriremos de una cosa muy particular, **servidores dedicados**, veras usualmente hay 2 tipos de juegos multijugador, los que te permiten tener una instancia de juego y el servidor creado desde el mismo juego (sistema host) o los que requieren una instancia para el servidor y otra para el juego (sistema de servidor dedicado).

*lo anteriormente mencionado debe tomarse a interpretación en realidad estos sistemas pueden estar unificados a demás de que pueden existir varios sistemas distintos.*

Cuando trabajamos con servidores dedicados lo que haremos será tener un trozo de código que se ejecutara en nuestro servidor y se encargara de recibir datos de parte de los clientes que se conecten al mismo, para así poder recibir peticiones y devolver respuestas a los clientes.

Nosotros en este caso haremos un servidor dedicado que no será mas que un código en **C#** el cual utilizaremos para "manejar" las conexiones y los datos que recibimos de parte de nuestros clientes.

Entonces crearemos un nuevo **proyecto (Console App)** de **C#** (en nuestro caso con Visual Studio Comunity 2022 y .net 6.0) y el nombre del proyecto es GameServer.

Cuando lo hayamos creado debemos crear nuestra clase principal en la que se ejecutara nuestro programa (Program.cs):

~~~c#
// debemos crear una clase completa ya que en .net 6.0 nuestro HolaMundo no utiliza una clase
using System;

namespace GameServer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "Game Server"; // en mi caso lo que hice fue cambiar el "titulo" de la consola
            Console.ReadKey(); // a demas hacemos esto para que el programa no se cierre al ejecutarse hasta que presiones una tecla
        }
    }
}
~~~

Tras esto creamos una nueva clase en el proyecto la cual llamaremos "Server.cs" y en esta empezaremos a desarrollar nuestro servidor de la siguiente forma:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// agregamos lo siguiente para permitirnos el manejo de internet
using System.Net;
using System.Net.Sockets;

namespace GameServer
{
    internal class Server
    {
        // creamos los siguientes datos de "importancia" y en los mismos damos un getter y setter (este ultimo siendo privado) 
        public static int maxPlayers { get; private set; }
        public static int port { get; private set; }

        // creamos un diccionario donde guardamos nuestros clientes(id,cliente) 
        public static Dictionary<int,Client> clients = new Dictionary<int,Client>();

        private static TcpListener tcpListener; // creamos nuestro tcp que "escucha por conecciones de clientes tcp"

        public static void Start(int _maxPlayers, int _port)
        {
            // datos importantes para el server (tecnicamente funcionan como un setter para esta clase)
            maxPlayers = _maxPlayers;
            port = _port;

            Console.WriteLine("Iniciando Servidor!!!");
            InitializeServerData(); // creamos los "datos para clientes (las instancias vacias de cliente)"
            tcpListener = new TcpListener(IPAddress.Any, port); // usamos TcpListener para recibir datos de un puerto especifico
            tcpListener.Start(); // iniciamos la escucha del TCP (lo activamos)
            
            // usamos esto para aceptar una peticion de coneccion pendiente
            tcpListener.BeginAcceptTcpClient(new AsyncCallback(TCPConnectCallback), null); 
            Console.WriteLine($"el servidor se ha iniciado exitosamente en el puerto: {port}");
        }

        private static void TCPConnectCallback(IAsyncResult _result) // ejecutamos la coneccion por tcp
        {
            // creamos un cliente tcp para manipular segun el resultado de la conexion
            TcpClient _client = tcpListener.EndAcceptTcpClient(_result); 
            tcpListener.BeginAcceptTcpClient(new AsyncCallback(TCPConnectCallback), null); // aceptamos la misma conexion del cliente tcp
            Console.WriteLine($"conexion en camino de: {_client.Client.RemoteEndPoint}...");

            for (int i = 1; i <= maxPlayers; i++) // revisamos la cantidad maxima de jugadores
            {
                if (clients[i].tcp.socket == null) // si el socket del cliente tcp es null eso significa que ese "espacio" esta vacio
                {
                    clients[i].tcp.Connect(_client); // entonces permitimos la coneccion al cliente
                    return; // cerramos la funcion
                }
            }
	
    		// cuando el ciclo for no pueda seguir ejecutandose significara que el servidor esta lleno        
        	Console.WriteLine($"{_client.Client.RemoteEndPoint} conexion fallida: servidor lleno!!!");
        }

        private static void InitializeServerData() // "iniciamos los datos del servidor" 
        {
            for (int i = 1; i <= maxPlayers; i++) // contamos la cantidad maxima de jugadores con un loop
            {
                clients.Add(i, new Client(i)); // creamos un nuevo "espacio para clientes" en el servidor
                /*
                creamos estos "espacios vacios para clientes" por cada cliente (basando en la cantidad maxima de clientes/jugadores)
                con un "socket" vacio (con valor null) se le entrega ese socket null que identifica su estado como "sin utilizar"
                Luego hacemos una confirmacion de estos para sabr si hay o no espacios disponibles en el servidor
                */
            }
        }
    }
}

~~~

Finalmente debemos "crear nuestro cliente" como un objeto accesible a nuestra clase "Server" creando una clase nueva que en este caso se llamara "Client.cs" y este funcionara de la siguiente forma:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// agregamos lo siguiente
using System.Net;
using System.Net.Sockets;

namespace GameServer
{
    internal class Client
    {
        // un buffer de datos es "un espacio temporal en la memoria" donde ingresamos nuestros datos usualmente para un solo uso
        public static int dataBufferSize = 4096;

        public int id;
        public TCP tcp;

        // constructor de nuestra clase cliente
        public Client(int _clietnId)
        {
            id = _clietnId;
            tcp = new TCP(id);
        }

        public class TCP
        {
            // los sockets permiten mantener una coneccion al server por lo que no hay que hacer peticiones para recibir actualizaciones
            public TcpClient socket; 
            private readonly int id;

            private NetworkStream stream;
            private byte[] receiveBuffer;

            public TCP(int _id) // constructor de clase
            {
                id = _id;  
            }

            public void Connect(TcpClient _socket) // funcio9n de conexion que recibe un socket
            {
                socket = _socket;
                
                // socket.ReceiveBufferSize y socket.SendBufferSize funciona como getter y setter para el tamaño del buffer recibido
                socket.ReceiveBufferSize = dataBufferSize;
                socket.SendBufferSize = dataBufferSize;

                stream = socket.GetStream(); // esto retorna el "NetworkStream" usado para enviar datos (gracias a byte streams)
                
                receiveBuffer = new byte[dataBufferSize]; // establecemos el nuevo tamaño de los byteStreams del buffer

                stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null); // empezamos a leer nuestros byte streams
            }

            private void ReceiveCallback(IAsyncResult _result) // recibimos respuesta de los datos recibidos gracias al tcp del cliente
            {
                try
                {
                    int _byteLength = stream.EndRead(_result);
                    if (_byteLength <= 0)
                    {
                        return;
                    }

                    byte[] _data = new byte[_byteLength];
                    Array.Copy(receiveBuffer, _data, _byteLength);

                    stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);
                }
                catch (Exception _ex)
                {
                    Console.WriteLine($"Error receiving the TCP data {_ex}");
                }
            }
        }
    }
}
~~~

Finalmente en nuestra clase main debemos agregar una linea para asi poder permitir a nuestro servidor dedicado iniciarse, el codigo se veria de la siguiente forma:

~~~c#
using System;

namespace GameServer
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "Game Server";
            Server.Start(5, 27000); // esta es la linea agregada
            Console.ReadKey();
        }
    }
}
~~~

Lo que hacemos es llamar la función `Server.Start()` y al mismo le pasamos primero la cantidad máxima de clientes/jugadores (en este caso 5) y un puerto que este vacío, en este caso uso el 27000 pero puedes usar cualquier puerto vacío entre los que encuentres en la [siguiente pagina](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers).

---

## Conectándonos con Unity

Ahora que ya tenemos nuestro servidor dedicado finalizado y corriendo podemos empezar a hacer pruebas con unity, en el mismo vamos a crear un proyecto nuevo, en mi caso sera un proyecto 3D el cual tendra el nombre de "MultiplayerTesting".

Tras esto en la carpeta Assets crearemos otra carpeta con el nombre Scripts en el cual crearemos 2 Scripts:

+ Client (se encargara de generar la conexión a nuestro servidor).
+ UiManager (se encargara de manejar nuestra interfaz para llevar a cabo la conexión).

Con esto listo pasemos al codigo "Client" ya anteriormente creado:

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net;

// agregamos lo siguiente
using System.Net.Sockets;
using System;

public class Client : MonoBehaviour
{
    public static Client instance; // creamos una instancia del cliente
    public static int dataBufferSize = 4096;

    public string ip = "127.0.0.1"; // ip del local server (esate puede cambiar si dejamos de hacerlo local)
    public int port = 27000; // el mismo puerto de nuestro servidor (este puede ser cambiado dependiendo del servidor)
    public int myId = 0; // el id del cliente (enviado por el servidor)
    public TCP tcp;

    // aqui revisamos que no existan 2 o mas instancias del mismo cliente (si las hay se borraran las sobrantes para evitar problemas)
    private void Awake()
    {
       if (instance == null) // si no existe una instancia de el cliente
       {
            instance = this; // esta sera la instancia del mismo
       }
       else if (instance != this) // si la instancia no es esta
       {
            print("Instance already exist, destroying object!!!");
            Destroy(this); // destruir instancia
       }
    }

    private void Start()
    {
        tcp = new TCP(); // creamos un nuevo tcp
    }

    public void ConnectToServer() // generamos la coneccion al server
    {
        tcp.Connect();
    }

    public class TCP // creamos una clase tcp 
    {
        public TcpClient socket; // generamos un socket para el cliente
        
        private NetworkStream stream; // generamos un stream de red que enviara datos
        private byte[] receiveBuffer; // creamos un buffer de datos perteneciente al mismo

        public void Connect()
        {
            socket = new TcpClient // creamos un nuevo cliente para el socket
            {
                // definimos el tamaño del buffer del cliente
                ReceiveBufferSize = dataBufferSize,
                SendBufferSize = dataBufferSize,
            };

            receiveBuffer = new byte[dataBufferSize];
            socket.BeginConnect(instance.ip, instance.port, ConnectCallback, socket); // iniciamo la coneccion del cliente
        }

        private void ConnectCallback(IAsyncResult _result) // necesitamos "using system para esta funcion"
        {
            socket.EndConnect(_result); 

            if (!socket.Connected) // si el socket no esta conectado 
            {
                return; // se termina la funcion
            }

            stream = socket.GetStream(); // de no ser asi creamos el stream de datos
            stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null); // y empezamos a hacer lectura del mismo
        }

        private void ReceiveCallback(IAsyncResult _result) // recibimos respuesta de los datos enviados al servidor gracias al tcp
        {
            try
            {
                int _byteLength = stream.EndRead(_result);
                if (_byteLength <= 0)
                {
                    return;
                }

                byte[] _data = new byte[_byteLength];
                Array.Copy(receiveBuffer, _data, _byteLength);

                stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);
            }
            catch (Exception _ex)
            {
                // disconnect
            }
        }
    }
}
~~~

Tras esto nos vamos al script "UiManager" en el que ingresaremos lo siguiente:

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// agregamos los siguientes
using UnityEngine.UI;
using TMPro;

public class UiManager : MonoBehaviour
{
    public static UiManager instance; // creamos una instancia de la clase

    public GameObject startMenu; // nuestro boton "conectar"
    public TMP_InputField usernameField; // nuestro campo de texto para el usuario (este con text mesh pro)

    // aqui comprobamos la existencia de la instancia ya creada (literalmente copiado y pegado desde la clase cliente)
    private void Awake()
    {
        
        if (instance == null)
        {
            instance = this;
        }
        else if (instance != this)
        {
            print("Instance already exist, destroying object!!!");
            Destroy(this);
        }
    }

    public void ConnectToServer()  // ejecutamos la coneccion mientras desactivamos los campos de ingreso de datos (botones y textfield)
    {
        startMenu.SetActive(false);
        usernameField.interactable = false;
        Client.instance.ConnectToServer();
    }
}

~~~

Ahora finalmente tendrás que ingresar a tu proyecto de unity y crear un objeto vacío que llamaremos "ClientManager" este manejara nuestra conexión al servidor a demás de un canvas (le pondremos de nombre "Menu") en el que ingresaremos un botón (cuyo texto si quieres puedes cambiarlo por "conectar") a demás de un InputField(TMP).

En nuestro "ClientManager" agregamos como componente el script "Client.cs" recientemente creado y en el canvas "Menu" ingresaremos el "UiManager.cs" Tras esto en el "Menu" seleccionamos nuestro botón y nuestro text field.

Finalmente a nuestro botón le daremos la función "ConnectToServer" (adjuntando el UiManager al selector de "OnClick()" y seleccionando en el menú desplegable: UiManager > ConnectToServer).

Listo, ahora podemos iniciar nuestro servidor dedicado, luego nuestro cliente, presionar conectar y en la terminal del servidor debería aparecer un mensaje afirmando la correcta conexión al mismo desde una dirección ip (en este caso es la ip local 127.0.0.1).

Ahora si quieres cambiar el ip y puerto de conexión puedes acceder a este por medio del inspector de elementos del "ClientManager".

