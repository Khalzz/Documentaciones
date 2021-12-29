Unity (multiplayer)

**Mini-documentación hecha por Rodrigo Seguel**

Los videojuegos multijugador son una moda vigente y que perdurara con nosotros el resto de la historia, la sociabilidad que te ofrece un mundo ficticio en el que puedes ser lo que sea nos atrae mucho y no es poco probable que alguna vez hayas pensado en tu mismo hacer una experiencia multijugador para que disfrute gente de todo el mundo.

Unity y el multijugador es como el agua y el aceite, 2 compuestos que por su funcionamiento parecerían tener sentido uno al lado del otro pero en si son muy distintos y sinceramente muy poco cooperativos entre si.

Pero en esta documentación me tomare la tarea de educarte un poco sobre el concepto de multijugador y networking en el entorno de Unity, por que es tan difícil, como quitarnos gran parte de ese peso de encima y una respuesta general a las dudas que te pueden salir mientras sigues esta documentación.

---

# Conceptos de Networking

En esta parte me encargare de hablar sobre la parte teórica de lo que haremos, explicar temas que se van a tomar en cuenta en varios momentos que hablemos sobre el "networking" en general.

---

## Como funcionan el sistema "cliente-servidor"?

Cuando te adentras a un multijugador este te suele permitir abrir una de estas 3 instancias:

+ Cliente: La "forma básica" del usuario que se conecta a nuestro servidor el mismo se encarga tanto de enviar datos como de recibirlos y así mostrar en un ente "observable" el estado del mismo, desde cosas como disparar o ver el personaje de alguien moviéndose, todo esto se puede observar desde el cliente.

  **En pocas palabras es quien se conecta al servidor.**

  ---

+ Servidor: Es nuestra instancia de "importancia" para el juego, es quien se encarga de hacer los cálculos relevantes para el desarrollo de la partida y se encarga de recibir datos, "procesarlos" y enviarlos de vuelta para que el cliente pueda ver cambios reflejados en la partida.

  **Es en pocas palabras el ordenador al que los clientes se conectan.**

  ---

+ Host: Este es uno "especial" Técnicamente se encarga de hacer las 2 tareas en una misma instancia, crea el servidor y hace los calculos pertinentes para otros jugadores, mientras que al mismo tiempo se conecta para poder jugar directamente.

  **Es en pocas palabras el ordenador al que los clientes se conectan al mismo tiempo que es un "cliente" y se conecta a el mismo.**

Por ultimo debo resaltar que el sistema (cliente-servidor) es mejor conocido como "**sistema de servidor local**" ya que dado que la existencia del servidor no depende del host, si algún jugador se desconecta el servidor puede continuar sin problemas.

Por otro lado, el sistema (cliente-host), **P2P** o **peer to peer** es un sistema que depende de un "jugador especial" por lo que si este pierde la conexión, se perderá la conexión de los demás jugadores ya que estos están conectados a la maquina del jugador que acaba de perder su conexión.

Aun así debo resaltar que hay juegos que te permiten ingresar a un servidor por medio de estos 2 tipos de conexión al mismo tiempo como por ejemplo **Counter Strike 1.6** que te permite agregar jugadores a una partida como host por medio de steam pero también crear tu propio servidor dedicado.

---

## Modelo OSI

El modelo OSI (Open System Interconnection) es lo que conocemos como un "framework conceptual" que define la forma en la que las aplicaciones se conectan sobre la red.

Este es dividido en capas que representan la abstracción de los datos según como son enviados desde un cliente hasta como son recibidos por nuestro servidor, estas resumen de una forma entendible los pasos que se deben llevar a cabo para que esta conexión sea tanto efectiva como funcional y aquí las podrás aprender:

+ **La capa de aplicación**: Esta capa se encarga de ofrecer servicios de red al usuario final y por medio de protocolos poder trabajar con los datos que se reciban del mismo, por ejemplo en las paginas web usamos el protocolo **HTTP** y estos protocolos son la forma en la que un cliente y servidor se "comuniquen" entre ellos.

+ **La capa de presentación**: En esta capa nos encargamos de **procesar los datos para su posterior envió** transformándolos su sintaxis a un conjunto de bits para un envió eficiente y encriptándolos para que el proceso sea seguro si este lo necesita.

---

+ **La capa de sesión**: En esta capa nos encargamos de manejar la **construcción, dirección y conclusión** de conexión entre dispositivos, esta nos permite acceder a distintos tipos de conexión a demás de ser la encargada de la autentificación de estas o de reconexión si un problema se presenta en la misma.

---

+ **La capa de transporte**: Esta capa se encarga de según ciertos protocolos **enviar la información de forma estable o rápida según lo que necesitemos** utilizando tanto **TCP para una conexión estable pero mas lenta** o **UDP para una conexión propensa a fallos pero mucho mas rápida** y estos protocolos coordinan cuanta información se envía, que tan rápido y hacia donde va la misma.

---

+ **La capa de red**: Esta capa se encarga de dirigir los datos hacia el servidor correcto por medio de una búsqueda por **dirección IP y dirección Mac** para así encontrar precisamente hacia donde debe llegar la información dentro de la conexión de nuestros servidores y que así no llegue a otro por error (la capa de **IP** de **TCP/IP** es el método convencional que utiliza el internet como su capa de red).

  + Dirección MAC: Esta se asemeja a la "identificación de una persona" y nos permite **identificar el dispositivo especifico en una red**.
  + Dirección IP: Esta se asemeja a la "dirección de tu casa" y nos permite **identificar donde se encuentra un dispositivo de red en especifico**.

  Por ejemplo en una casa pueden haber 6 personas con una identificación distinta, en el caso de  estas direcciones es lo mismo pero hablando de redes, o sea **en una dirección ip (conexión a router) hay 6 dispositivos identificables vía "dirección MAC"**.

---

+ **La capa de enlace de datos**: Esta capa es la mas compleja, se encarga de tomar los datos y "separarlos" en un conjunto de "paquetes" o sea "**un conjunto de datos que representan tanto a quien envía los datos, quien los recibe y obvio los datos y "instrucciones" para volver a armarlos**", esto se hace para así evitar "atascos" y que los datos puedan transportarse de forma eficiente.

---

+ **La capa física**: Cuando te conectas de forma inalámbrica a un router estas enviando "ondas", cuando estas conectado por cable envías "pulsos electromagnéticos", ambos al ser leídos pueden representar valores como 1 y 0, estos se conocen como bits los cuales ordenados y agrupados de cierta forma pueden representar cualquier dato que nosotros deseemos enviar.

  **La capa física se conoce así dado el medio físico por el que estos se envían los datos (ya sean cables, repetidores, ondas, etc...).**

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

---

## Enviando datos desde el servidor al cliente

Cuando envias datos por la red, no puedes enviar booleanos, integers o strings, solo puedes enviar bytes, por ese motivo utilizamos algo llamado packet o paquetes, por eso tenemos que utilizar un codigo digamos "complejo" para llevar a cabo este proceso de "transformacion" de datos digitales a bytes.

Los paquetes en general no son mas que una forma en la que transportamos datos de forma mas eficiente por la red por lo que es indispensable el correcto manejo de estos.

Para ello en nuestro servidor dedicado crearemos una clase llamada "Packet.cs" en la cual ingresaras el codigo que encontraras [en el siguiente enlace](https://github.com/tom-weiland/tcp-udp-networking/blob/tutorial-part2/GameServer/GameServer/Packet.cs), este se encarga de "**transformar los datos a bytes para enviarlos por medio de la red**" aun que hace lo mismo al revés "**convierte grupos de bytes en datos con los que podamos trabajar**". 

Técnicamente lo que hace este código es "transformar los datos en bytes, empaquetarlos en una lista para enviarlos de forma eficiente".

Luego iremos a nuestra clase "Client" de nuestro servidor y agregaremos lo siguiente:

~~~c#
internal class Client
{
    public void Connect(TcpClient _socket) {}   

    // agregamos lo siguiente entre la funcion Connect() y ReceiveCallback()
    public void SendData(Packet _packet)
    {
        try
        {
            if (socket != null)
            {
                stream.BeginWrite(_packet.ToArray(), 0, _packet.Length(), null, null);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error sending data to player {id} via TCP {ex}");
        }
    }
    // agregamos lo siguiente entre la funcion Connect() y ReceiveCallback()

    private void ReceiveCallback(IAsyncResult _result) {} // esta funcion ya existe, no debes tocarla
}
~~~

Luego creamos otra clase que llamaremos "ServerSend.cs" aquí crearemos métodos que se definirán todos los paquetes que se enviaran por la red y sera de la siguiente forma:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameServer
{
    internal class ServerSend
    {
        // esto envia datos al cliente especificado
        private static void SendTcpData(int _toClient, Packet _packet) 
        {
            // esto nos entrega el largo de la lista de bytes y lo inserta al inicio del paquete
            _packet.WriteLength(); // si olvidamos este metodo no seras capaz de manejar los datos correctamente

            // accedemos al cliente que recibira el mensaje
            Server.clients[_toClient].tcp.SendData(_packet); // enviar datos
        }

        // esto envia datos a todos los clientes
        private static void SendTcpDataToAll(int _toClient, Packet _packet) 
        {
            _packet.WriteLength() // esto nos entrega el largo de la lista de bytes y lo inserta al inicio del paquete

            for (int i = 1; i <= Server.maxPlayers; i++) // seleccionamos a cada cliente con este loop
            {
                Server.clients[i].tcp.SendData(_packet); // enviar datos
            }
        }

        // esto envia datos a todos los clientes excepto por uno
        private static void SendTcpDataToAll(int _exceptClient, int _toClient, Packet _packet) 
        {
            _packet.WriteLength(); // esto nos entrega el largo de la lista de bytes y lo inserta al inicio del paquete

            for (int i = 1; i <= Server.maxPlayers; i++) // seleccionamos a cada cliente con este loop
            {
                if (i != _exceptClient) // si el cliente NO es la excepcion
                {
                    Server.clients[i].tcp.SendData(_packet); // enviar datos
                }
            }
        }

        public static void Welcome(int _toClient, string _msg) // creamos esta funcion para hacer un "oaquete de bienvenida"
        {
            // agregamos aqui el paquete por que necesitamos que se deje de usar despues de haberlo hecho
            using (Packet _packet = new Packet((int)ServerPackets.welcome))
            {
                // escribimos nuestro mensaje para el cliente en el paquete
                _packet.Write(_msg);
                _packet.Write(_toClient);
                SendTcpData(_toClient, _packet); // finalmente enviamos datos via tcp
            }
        }
    }
}

~~~

Y finalmente usamos nuestro "paquete de bienvenida en nuestro cliente en el método de "conexión" de la siguiente forma:

~~~c#
internal class Client
{
        public TCP(int _id) {} // esta funcion esta ya hecha, no hace falta modificarla

        public void Connect(TcpClient _socket)
        {
            socket = _socket;
            socket.ReceiveBufferSize = dataBufferSize; 
            socket.SendBufferSize = dataBufferSize; 
            stream = socket.GetStream();
            receiveBuffer = new byte[dataBufferSize];
            stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);
            
            ServerSend.Welcome(id, "Welcome to the server"); // enviamos el mensaje de bienvenida al cliente
        }

        public void SendData(Packet _packet) {} // esta funcion esta ya hecha, no hace falta modificarla
~~~

---

## Enviando datos desde el cliente al servidor

Empezaremos abriendo nuestro proyecto anteriormente creado y haremos 3 nuevos scripts:

+ ClientHandle
+ Packet
+ ThreadManager (lo metemos en nuestro "ClientManager")

Abrimos primero "ThreadManager" aquí nos encargaremos de "especificar temas como los hilos del procesador con el que se harán cálculos" escribir datos puede ser una tarea laboriosa pero hacerlo con múltiples hilos puede generarnos errores muy difíciles de solucionar por lo que para mantenerlo simple vamos a copiar y pegar en este archivo [el siguiente código](https://github.com/tom-weiland/tcp-udp-networking/blob/tutorial-part2/GameClient/Assets/Scripts/ThreadManager.cs).

Ahora vamos a nuestro servidor y copiamos la clase "Packet" de nuestro servidor a la clase "Packet" de nuestro cliente (recuerda borrar la clase packet que ya existe heredando MonoBehaviour, la existencia de esta nos puede generar errores a demás de agregar `using System;` y ``using System.Text`).

Ahora reciviremos los datos desde el servidor, abrimos el archivo "ClientHandle" y hacemos lo siguiente:

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ClientHandle : MonoBehaviour
{
    public static void Welcome(Packet _packet) // creamos el mensaje de bienvenida que recibira el cliente
    {
        // los datos enviados desde el paquete deben ser leidos en el mismo orden
        // osea si creamos "myId" y "msg" en ese orden no podemos leer "msg" y luego "myId"
        string _msg = _packet.ReadString(); // leemos el mensaje
        int _myId = _packet.ReadInt(); // leemos el id del cliente

        print($"Message from server: {_msg}");
        Client.instance.myId = _myId; // creamos instancia de cliente

        //TODO: enviar mensaje de "bienvenida recibida"
    }
}

~~~

Ahora viene una de las partes mas dificiles de este proceso, "el manejo de datos" para eso vamos a volver a nuestro archivo "Client.cs" de unity y haremos los siguientes cambios:

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Net;
using System.Net.Sockets;
using System;

public class Client : MonoBehaviour
{
    public static Client instance;
    public static int dataBufferSize = 4096;

    public string ip = "127.0.0.1"; // local server (we can change it on the future)
    public int port = 27000; // the same port of our dedicated server (we can change it on the future)
    public int myId = 0;
    public TCP tcp;

    // agregamos lo siguiente
    private delegate void PacketHandler(Packet _packet); // un manejador de paquetes
    private static Dictionary<int, PacketHandler> packetHandlers; // y un diccionario con todos los manejadores creados

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

    private void Start()
    {
        tcp = new TCP();
    }

    public void ConnectToServer()
    {
        InitializeClientData(); // llamamos la funcion que inicia nuestros datos del cliente

        tcp.Connect();
    }

    public class TCP
    {
        public TcpClient socket;

        private NetworkStream stream;
        private Packet receivedData; // creamos un paquete que recibe datos y lo iniciamos en ConnectCallback()
        private byte[] receiveBuffer;

        public void Connect()
        {
            socket = new TcpClient
            {
                ReceiveBufferSize = dataBufferSize,
                SendBufferSize = dataBufferSize,
            };

            receiveBuffer = new byte[dataBufferSize];
            socket.BeginConnect(instance.ip, instance.port, ConnectCallback, socket);
        }

        private void ConnectCallback(IAsyncResult _result)
        {
            socket.EndConnect(_result);

            if (!socket.Connected)
            {
                return;
            }

            stream = socket.GetStream();

            receivedData = new Packet(); // inicializamos la variable

            stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);
        }

        // agregamos esta funcion para enviar datos desde nuestro cliente mas adelante
        public void SendData(Packet _packet)
        {
            try
            {
                if (socket != null)
                {
                    stream.BeginWrite(_packet.ToArray(), 0, _packet.Length(), null, null);
                }
            }
            catch (Exception ex)
            {
                print($"Error sending data to the server via TCP {ex}");
            }
        }

        private void ReceiveCallback(IAsyncResult _result)
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

                // manejar datos
                receivedData.Reset(HandleData(_data)); // el paquete se reinicia dependiendo del dato retornado por "HandleData()"
                /*
                hacemos esto por que nuestro cliente y servidor esta conectado por el protocolo tcp
                este envia constantemente informacion de forma continua y se asegurara de que todos 
                los paquetes sean enviados y recibidos en el orden correcto.
                
                Mientras que la llegada de los "trozos" de informacion estan garantizados a llegar, no esta garantizado que lleguen
                en una sola pieza, por lo que cuando se envian estos paquetes se agregan en una lista larga
                que esperara a que se acumulen los suficientes para realizar una gran entrega.
                
                Tcp nos permite seleccionar lo que queremos hacer si por ejemplo nuestros paquetes se "separan" en 2 grandes envios
                por esa razon no reiniciamos los bytes recibidos por que si estos no llegan aun estariamos "tirando datos a la basura"
                lo que resulta en nosotros perdiendo paquetes
                */

                stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);
            }
            catch (Exception _ex)
            {
                // disconnect
            }
        }
        private bool HandleData(byte[] _data)
        {
            int _packetLength = 0; // creamos un dato de "el largo del paquete"

            receivedData.SetBytes(_data);

            if (receivedData.UnreadLength() >= 4) // si el largo que aun no se lee es mayor a 4
            {
                _packetLength = receivedData.ReadInt(); // se vuelve a leer los datos recibidos
                if (_packetLength <= 0) // si el largo del paquete es menor o igual a 0
                {
                    return true; // reiniciamos los datos recibidos
                }
            }

            // mientras que el largo del paquete sea mayor a 0 y el largo del paquete leido sea mayor al largo de los paquetes sin leer
            while (_packetLength > 0 && _packetLength <= receivedData.UnreadLength())
            {
                byte[] _packetBytes = receivedData.ReadBytes(_packetLength); // se leen los bytes aun no leidos
                ThreadManager.ExecuteOnMainThread(() => {
                    using (Packet _packet = new Packet(_packetBytes))
                    {
                        int _packetId = _packet.ReadInt();
                        packetHandlers[_packetId](_packet);
                    }
                });
                _packetLength = 0; // reiniciamos el largo del paquete cuando el loop termine

                if (receivedData.UnreadLength() >= 4) // si el largo del paquete sin leer es mayor o igual a 4
                {
                    _packetLength = receivedData.ReadInt(); // se sigue leyendo el paquete
                    if (_packetLength <= 0) // si el largo del paquete es menor o igual a 0
                    {
                        return true; // reiniciamos los datos recibidos
                    }
                }
            }

            if (_packetLength <= 1) // si el largo del paquete es menor o igual a 1
            {
                return true; // reiniciamos los datos recibidos
            }

            return false; // no reiniciamos todavia
        }
    }

    private void InitializeClientData()
    {
        packetHandlers = new Dictionary<int, PacketHandler>()
        {
            {(int)ServerPackets.welcome,ClientHandle.Welcome}
        };
        print("paquetes iniciados.");
    }
}
~~~

---

## Dejemos a nuestro cliente responder

Ya hemos enviado datos del servidor al cliente pero ahora queremos hacerlo de forma inversa enviar datos del cliente al servidor, para ello vamos a crear una nueva clase de c# en nuestro proyecto de Unity la cual llamaremos "ClientSend" en el; que nos dedicaremos a enviar de vuelta los datos que posea el cliente.

En este haremos lo siguiente:

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ClientSend : MonoBehaviour
{
    private static void SendTcpData(Packet _packet) // enviamos datos por tcp
    {
        _packet.WriteLength();
        Client.instance.tcp.SendData(_packet);
    }

    #region Packets
    public static void WelcomeReceived() // damos una "respuesta" al paquete de bienvenida
    {
        using (Packet _packet = new Packet((int)ClientPackets.welcomeReceived))
        {
            _packet.Write(Client.instance.myId);
            _packet.Write(UiManager.instance.usernameField.text);

            SendTcpData(_packet);
        }
    }
    #endregion
}
~~~

Luego en nuestra clase "ClientHandle" agregamos lo siguiente:

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ClientHandle : MonoBehaviour
{
    public static void Welcome(Packet _packet)
    {
        string _msg = _packet.ReadString();
        int _myId = _packet.ReadInt();

        print($"Message from server: {_msg} user number {_myId}");
        Client.instance.myId = _myId;

        ClientSend.WelcomeReceived(); // simplemente llamamos la funcion de bienvenida recibida
    }
}

~~~

---

## Manejando datos en el servidor

Ahora volviendo a nuestro servidor simplemente agregamos una nueva clase llamada "ServerHandle.cs" y hacemos lo siguiente:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameServer
{
    internal class ServerHandle
    {
        public static void WelcomeReceived(int _fromClient, Packet _packet)
        {
            /*
            cuando enviamos datos no podemos definir el dato que se envio antes de tiempo
            por lo que es mejor seguir un orden, entonces
            los datos deben ser leidoss en el mismo orden que fueron enviados, en este caso 1. id, 2. username
            */
            int _clientIdCheck = _packet.ReadInt();
            string _username = _packet.ReadString();
            // si lo hacemos al revez el _username sera igual al id y el _clientIdCheck sera igual al username 
            // (aun que dara error por el tipo de dato)

            Console.WriteLine($"{Server.clients[_fromClient].tcp.socket.Client.RemoteEndPoint} connected succesfully and is now player {_fromClient}");

            if (_fromClient != _clientIdCheck) // esto no se deberia ejecutar nunca pero si llega a ejecutarse algo ha salido muy mal
            {
                Console.WriteLine($"player \"{_username}\" (ID: {_fromClient} has assumed the wrong client ID: ({_clientIdCheck}))!");
            }

            // TODO: send player into game
        }
    }
}
~~~

Y similar a como lo hacia el cliente, el servidor necesita saber que método llamar del cliente, por lo que en la clase "Server.cs" de nuestro servidor haremos lo siguiente:

```c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;

namespace GameServer
{
    internal class Server
    {
        public static int maxPlayers { get; private set; }
        public static int port { get; private set; }  
        public static Dictionary<int,Client> clients = new Dictionary<int,Client>(); 
        
        public delegate void PacketHandler(int _fromClient, Packet _packet); // creamos un manejador de paquetes 
       	public static Dictionary<int, PacketHandler> packetHandlers; // y luego hacemos una lista de manejadores de paquetes

        private static TcpListener tcpListener;

        public static void Start(int _maxPlayers, int _port)
        {

            maxPlayers = _maxPlayers;
            port = _port;

            Console.WriteLine("Iniciando servidor!!!");

            InitializeServerData();

            tcpListener = new TcpListener(IPAddress.Any, port);
            tcpListener.Start();
            tcpListener.BeginAcceptTcpClient(new AsyncCallback(TCPConnectCallback), null);

            Console.WriteLine($"El servidor se ha iniciado excitosamente en el puerto: {port}");
        }

        private static void TCPConnectCallback(IAsyncResult _result) 
        {
            TcpClient _client = tcpListener.EndAcceptTcpClient(_result);
            tcpListener.BeginAcceptTcpClient(new AsyncCallback(TCPConnectCallback), null);

            Console.WriteLine($"Conexion llegando de {_client.Client.RemoteEndPoint}...");

            for (int i = 1; i <= maxPlayers; i++)
            {
                if (clients[i].tcp.socket == null)
                {
                    clients[i].tcp.Connect(_client);
                    return;
                }
            }

            Console.WriteLine($"{_client.Client.RemoteEndPoint} conexion fallida: servidor lleno!!!");
        }

        private static void InitializeServerData()
        {
            for (int i = 1; i <= maxPlayers; i++)
            {
                clients.Add(i, new Client(i));
            }
            
            packetHandlers = new Dictionary<int, PacketHandler>() {
                {(int)ClientPackets.welcomeReceived, ServerHandle.WelcomeReceived}
            };
            Console.WriteLine("paquetes iniciados.");
        }
    }
}
```
y finalmente tenemos que realmente manejar los datos que recibimos así que, vamos a la clase "Client.cs" de nuestro servidor y hacemos lo siguiente:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;


namespace GameServer
{
    internal class Client
    {
        public static int dataBufferSize = 4096;

        public int id;
        public TCP tcp;


        public Client(int _clietnId)
        {
            id = _clietnId;
            tcp = new TCP(id);
        }

        public class TCP
        {
            public TcpClient socket;

            private readonly int id;

            private NetworkStream stream;

            private Packet receivedData; // creamos este dato y lo iniciamos en el connect

            private byte[] receiveBuffer;

            public TCP(int _id)
            {
                id = _id;  
            }

            public void Connect(TcpClient _socket)
            {
                socket = _socket;
                socket.ReceiveBufferSize = dataBufferSize; 
                socket.SendBufferSize = dataBufferSize; 

                stream = socket.GetStream();

                receivedData = new Packet(); // iniciado
                
                receiveBuffer = new byte[dataBufferSize];

                stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);

                ServerSend.Welcome(id, "Welcome to the server");
            }

            public void SendData(Packet _packet)
            {
                try
                {
                    if (socket != null)
                    {
                        stream.BeginWrite(_packet.ToArray(), 0, _packet.Length(), null, null);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error sending data to player {id} via TCP {ex}");
                }
            }

            private void ReceiveCallback(IAsyncResult _result)
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

                    receivedData.Reset(HandleData(_data)); // manejamos datos

                    stream.BeginRead(receiveBuffer, 0, dataBufferSize, ReceiveCallback, null);
                }
                catch (Exception _ex)
                {
                    Console.WriteLine($"Error receiving the TCP data {_ex}");
                }
            }
            
            // este metodo esta literalmente copiado y pegado de la clase "Client.cs" de nuestro cliente (Unity)
            private bool HandleData(byte[] _data) 
            {
                int _packetLength = 0;

                receivedData.SetBytes(_data);

                if (receivedData.UnreadLength() >= 4) 
                {
                    _packetLength = receivedData.ReadInt();
                    if (_packetLength <= 0) 
                    {
                        return true;
                    }
                }
                while (_packetLength > 0 && _packetLength <= receivedData.UnreadLength())
                {
                    byte[] _packetBytes = receivedData.ReadBytes(_packetLength);
                    ThreadManager.ExecuteOnMainThread(() => {
                        using (Packet _packet = new Packet(_packetBytes))
                        {
                            int _packetId = _packet.ReadInt();
                            packetHandlers[_packetId](_packet);
                        }
                    });
                    _packetLength = 0;
                    if (receivedData.UnreadLength() >= 4) 
                    {
                        _packetLength = receivedData.ReadInt(); 
                        if (_packetLength <= 0) 
                        {
                            return true; 
                        }
                    }
                }
                if (_packetLength <= 1)
                {
                    return true; 
                }
                return false;
            }
        }
    }
}
~~~

Tras esto tendremos un error con la clase "ThreadManager" entonces creamos una nueva clase en nuestro servidor con ese nombre y pegamos lo que hay dentro de la clase, así nos quedaría lo siguiente:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameServer
{
    internal class ThreadManager
    {
        private static readonly List<Action> executeOnMainThread = new List<Action>();
        private static readonly List<Action> executeCopiedOnMainThread = new List<Action>();
        private static bool actionToExecuteOnMainThread = false;
        // eliminamos la funcion update ya que solo funciona en unity
        public static void ExecuteOnMainThread(Action _action)
        {
            if (_action == null)
            {
                Console.WriteLine("No action to execute on main thread!"); // cambiamos este de debug.log a Console.WriteLine() 
                return;
            }

            lock (executeOnMainThread)
            {
                executeOnMainThread.Add(_action);
                actionToExecuteOnMainThread = true;
            }
        }

        public static void UpdateMain()
        {
            if (actionToExecuteOnMainThread)
            {
                executeCopiedOnMainThread.Clear();
                lock (executeOnMainThread)
                {
                    executeCopiedOnMainThread.AddRange(executeOnMainThread);
                    executeOnMainThread.Clear();
                    actionToExecuteOnMainThread = false;
                }

                for (int i = 0; i < executeCopiedOnMainThread.Count; i++)
                {
                    executeCopiedOnMainThread[i]();
                }
            }
        }
    }
}

~~~

Ahora todo funcionara bien, verdad? en realidad no, tecnicamente no hay fallos en el funcionamiento pero como nunca llamamos la funcion "UpdateMain()" de nuestro ThreadManager este nunca se actualiza, y por que no tenemos acceso al update de unity en el servidor tendremos que hacer un "Game loop".

Creamos una clase llamada "GameLogic.cs" en el servidor y agregamos lo siguiente:

~~~c#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameServer
{
    internal class GameLogic
    {
        public static void Update()
        {
            ThreadManager.UpdateMain(); // llamamos la funcion updateMain
        }
    }
}
~~~

Y por ultimo vamos a nuestra clase "Program.cs" y agregamos lo siguiente:

~~~c#
using System;
using System.Threading; // agregamos esto

namespace GameServer
{
    class Program
    {
        private static bool isRunning = false; // creamos un dato que verifique que nuestro servidor este corriendo

        static void Main(string[] args)
        {
            Console.Title = "Game Server";
            
            isRunning = true; // lo activamos en la clase

            Thread mainThread = new Thread(new ThreadStart(MainThread));
            mainThread.Start(); // iniciamos el hilo

            Server.Start(5, 27000);

            // eliminamos el console.readkey, ya no lo necesitamos
        }

        private static void MainThread() // aqui ejecutamos nuestro "GameLoop"
        {
            // aqui mostraremos un mensaje donde mencionaremos los ticks a los que corre el servidor
            // eso para saber a que frecuencia corre el mismo y que lo hagta de forma constante
            Console.WriteLine($"Main thread has started. Running at {} ticks per second.");
        }
    }
}
~~~

El mensaje de los ticks esta vacio y aqui debemos dar un valor constante por lo que crearemos una nuvea clase a la que llamaremos "Constants.cs" en la cual haremos lo siguiente:

~~~C#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameServer
{
    internal class Constants
    {
        public const int TICKS_PER_SECOND = 30;
        public const int MS_PER_TICK = 1000 / TICKS_PER_SECOND;
    }
}
~~~

Volviendo a nuestro a nuestra clase "Program.cs" podemos mostrar la cantidad de ticks del servidor de la siguiente forma:

~~~c#
using System;
using System.Threading; // agregamos esto

namespace GameServer
{
    class Program
    {
        private static bool isRunning = false; // creamos un dato que verifique que nuestro servidor este corriendo

        static void Main(string[] args)
        {
            Console.Title = "Game Server";
            
            isRunning = true; // lo activamos en la clase

            Thread mainThread = new Thread(new ThreadStart(MainThread));
            mainThread.Start(); // iniciamos el hilo

            Server.Start(5, 27000);

            // eliminamos el console.readkey, ya no lo necesitamos
        }

        private static void MainThread() // aqui ejecutamos nuestro "GameLoop"
        {
            // aqui mostraremos un mensaje donde mencionaremos los ticks a los que corre el servidor
            // eso para saber a que frecuencia corre el mismo y que lo hagta de forma constante
            Console.WriteLine($"Main thread has started. Running at {Constants.TICKS_PER_SECOND} ticks per second.");
            DateTime _nextLoop = DateTime.Now; // creamos el momento del loop

            while (isRunning) // mientras el programa este corriendo
            {
                while (_nextLoop < DateTime.Now) // mientras el momento del loop sea menor al tiempo actual
                {
                    GameLogic.Update(); // actualizamos la logica del juego
                    _nextLoop = _nextLoop.AddMilliseconds(Constants.MS_PER_TICK); // agregamos tiempo al loop
                }
            }
        }
    }
}
~~~

 Listo ahora al ejecutar nuestro servidor y conectarnos por medio del cliente veremos el mensaje de ""



 

