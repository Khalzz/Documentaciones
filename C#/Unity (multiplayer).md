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

## Protocolos para el envio de datos

A la hora de enviar datos entre distintos dispositivos tenemos que utilizar distintos protocolos para "asegurarnos" que estos datos lleguen de forma segura o eficiente.

Para esto internet utiliza principalmente 2 protocolos (aun que existen mas, no nos centraremos en ellos aun):

+ **TCP/IP**: Este "**protocolo de control de transmisión y protocolo de internet** se encarga del procesado de datos y envió de los mismos para que lleguen de forma "fiable" a nuestro destino aun que es mas lento.

  Este utiliza el sistema de 

+ **UDP**: Este "**protocolo de datagramas de usuario**" se encarga igualmente del procesamiento de datos y envió de los mismos, pero en lugar de centrarse en la "fiabilidad", se centra en la eficacia aun que este **puede** generar ciertos problemas entre medio (perdida de paquetes por ejemplo).

---

## Sockets

Cuando queremos hacer una conexión "cliente-servidor" usualmente ocurre de la siguiente forma:

El usuario hace una "petición" al servidor y este ultimo actualiza su estado enviando una "respuesta", esto funciona bien en varios casos pero tiene un problema y es que si por ejemplo algo del servidor se ha actualizado y nuestro cliente no hace una petición, a este no se le mostrara esta actualización hasta que lleve3 a cabo una petición nueva.

Esto ocurre por que el servidor de cierta forma no puede tener acceso a lo que nuestro equipo puede visualizar ni puede "avisarle" sobre el nuevo cambio.

Para esto usamos sockets, este nos permite mantener una comunicación activa-activa entre el cliente y el servidor, o sea el server por ejemplo será capaz de enviar notificaciones al cliente mientras que este podrá interactuar con lo que sea que le envié el servidor. Y por medio de este se pueden enviar integers, strings booleanos entre otros muchísimos datos u objetos y luego notificarnos en tiempo real cuando algo ocurra(por ejemplo se conecta otro dispositivo con conexión activo-activo).

A demás podremos por ejemplo saber cuándo un usuario se desconecta, un usuario nuevo se conecta o un usuario se vuelve a conectar.

---

## RiptideNetworking

RiptideNetworking es un proyecto de código abierto que nos permite conectar nuestro proyecto a un sistema multijugador de forma sencilla quitándonos muchas pegas de encima ya funcionando de una forma clara y mas entendible que otros métodos anteriormente requeridos para lo mismo en Unity.

Este proyecto de la mano de "Tom Weiland" es una iteración a un proyecto anterior de su mano que buscaba facilitar por medio de tutoriales la creación de multijugadores, pero ahora con el uso de un framework abierto y de mas fácil uso.

Este lo pueden encontrar [en el siguiente enlace](https://github.com/tom-weiland/RiptideNetworking) a demás de encontrar el video explicativo del mismo [aquí](https://www.youtube.com/watch?v=6kWNZOFcFQw&t=262s&ab_channel=TomWeiland).

Los sistemas en el que este funciona dependen de la forma en la que los datos se transformen, pero por ahora se tiene certeza de su funcionamienteo tanto en Windows, Linux, Mac y Android.

La cantidad de jugadores permitidos por el sistema de riptide es totalmente proporcional al poder de procesado que encontramos en el dispositivo que este funcionando como servidor o "host" de la partida, pero esta totalmente a nuestra mano limitar el numero de jugadores si esto es lo que deseamos.

Pero **¿en que se diferencia Riptide de otras opciones como Mirror?**, pues comparar estos no es justo ya que ambos sirven para distintos propósitos, pero en términos generales Mirror entrega mas características, pero a cambio ofrece menos control, mientras que Riptide ofrece menos características aun que aumentando el control que tienes en las mismas.

---

# Iniciando con Riptide

Antes de comenzar debo recordar lo siguiente, para el proceso utilizaremos o "crearemos" 2 instancias/proyectos, uno siendo nuestro servidor, mientras que el otro funcionara como cliente, esto podría tener cambios a futuro así que por ahora es solo un aviso.

Por lo que iniciaremos creando 2 proyectos de unity (**en mi caso serán proyectos 3D con URP**), uno tendrá el nombre "**Server**" mientras que el otro se llamara "**Client**".

Tras esto dependiendo de nuestra versión de unity o de nuestro tipo de proyecto limpiaremos todo para eliminar objetos por defecto entre otros que nos pueden molestar durante el proceso.

---

## Instalación y configuración

Primero lo primero, iremos a nuestros proyectos "**Server**" y "**Client**" para crear una carpeta titulada "**Scripts**", dentro de esta crearemos otra con el nombre "**Multiplayer**", tras esto "instalaremos Riptide en nuestro proyecto" desde el github del mismo en el [siguiente enlace](https://github.com/tom-weiland/RiptideNetworking).

Para instalarlo podemos hacer lo siguiente:

### Si tienes git instalado:

1. En la pagina del proyecto vamos a la sección de **`Releases`** y seleccionamos la ultima versión disponible (en mi caso la v1.1.0).
2. Vamos a nuestro proyecto "**Server**" y seleccionamos **`Window > Packet Manager`**.
3. Seleccionamos el signo **`+`** y le damos a **`Add package from git URL`**.
4. Pegamos el enlace de la pagina ya anteriormente abierta y damos en **Add**.

---

### Si no tienes git instalado:

1. En la pagina del proyecto vamos a la sección de **`Releases`** y seleccionamos la ultima versión disponible (en mi caso la v1.1.0).
2. Descargamos los archivos **`RiptideNetworking.dll`** y **`RiptideNetworking.xml`**.
3. En la carpeta **`Scripts > Multiplayer`** que creamos en ambos proyectos insertaremos los archivos anteriormente descargados.

Elige el que simplemente sea mas fácil para ti.

---

## Creando el servidor

Tras esta instalacion comenzaremos agregando 2 scripts a nuestro proyecto "**Server**" en la misma carpeta "**Multiplayer**", estos seran:

+ MessageExtensions
+ NetworkManager

Y por fuera de esta carpeta en "**Scripts**" crearemos:

+ GameLogic
+ Player

Por ultimo en nuestro proyecto "**Client**" creamos los mismos scripts a demas de uno el cual llamaremos "**UiManager**".

Tras esto empezaremos con el codigo:

~~~c#
// NetworkManager (server)
using RiptideNetworking; // agregamos lo siguiente
using RiptideNetworking.Utils; // agregamos lo siguiente

using UnityEngine;

public class NetworkManager : MonoBehaviour
{

    /*
    cremaos un singleton para que asi podamos agregar este codigo a un objeto y acceder a esa instancia especifica
    desde cualquier parte de nuestro codigo, a demas de asegurarnos de la existencia de una sola instancia del NetworkManager
    */
    private static NetworkManager _singleton;
    public static NetworkManager singleton
    {
        get => _singleton;
        private set
        {
            if (_singleton == null)
            {
                _singleton = value;
            }
            else if (_singleton != null)
            {
                print($"{nameof(NetworkManager)} Una instancia ya existe, destruyendo duplicado!");
                Destroy(value);
            }
        }
    }

    public Server Server { get; private set; } // iniciamos la clase de nuestro servidor

    // aagregamos datos basicos para la conexion (puertos y numero maximo de clientes)
    // son SerializeField para que unity nos permita editarlos en el editor aun siendo privados
    [SerializeField] private ushort port;
    [SerializeField] private ushort maxClientCount;

    private void Awake()
    {
        singleton = this;
    }

    private void Start()
    {
        // llamamos a esta funcion para que asi se muestren en la consola los errores internos que puede tener Riptide
        RiptideLogger.Initialize(Debug.Log, Debug.Log, Debug.LogWarning, Debug.LogError, false); 

        // iniciamos nuestro server
        Server = new Server();
        Server.Start(port, maxClientCount);
    }

    private void FixedUpdate()
    {
        Server.Tick(); // esto se asegurara de que nuestros mensajes lleguen al servidor y que podamnos trabajar con los datos
    }

    // cerramos el servidor cuando el programa se cierre
    private void OnApplicationQuit()
    {
        Server.Stop();
    }
}
~~~

Ahora cremamos un nuevo objeto en nuestro proyecto de unity, este lo llamaremos "NetworkManager" y lo posicionaremos en cualquier parte de nuestra escena.

Tras esto le agregaremos nuestro script recién creado y definiremos el máximo de jugadores junto al puerto del mismo.

**Importante**: El máximo de jugadores depende únicamente de la capacidad que tiene nuestro sistema o el que usemos como servidor de manejar instancias del juego, pueden ser 2 o 100, todo dependiendo de cuantos aguante tu dispositivo sin explotar a demás el puerto puede ser a tu elección según [el siguiente enlace](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers), aquí podrás ver varios puertos común mente utilizados, recomiendo usar cualquiera que **no se encuentre en la lista**.

listo, ya habremos creado nuestro servidor, si le das a "Play" nos deberia dar un mensaje diciendo "Started on port (puerto seleccionado)" y al cerrar esta prueba nos deberia dar el mensaje de "Server stopped".

---

## Conectando el cliente

Ya después de terminar la creación de nuestro servidor continuaremos con la creación de nuestro cliente el que se conectara a nuestro servidor, para esto iremos a nuestro proyecto "**Client**" y entraremos en el script "**NetworkManager**" para agregar lo siguiente:

~~~c#
// NetworkManager (Client)
using RiptideNetworking; // agregamos lo siguiente
using RiptideNetworking.Utils; // agregamos lo siguiente

using UnityEngine;

public class NetworkManager : MonoBehaviour
{
    // copiamos esto desde el NetworkManager del servidor
    private static NetworkManager _singleton;
    public static NetworkManager singleton
    {
        get => _singleton;
        private set
        {
            if (_singleton == null)
            {
                _singleton = value;
            }
            else if (_singleton != null)
            {
                print($"{nameof(NetworkManager)} instance already exists, destroying duplicate!");
                Destroy(value);
            }
        }
    }

    public Client Client { get; private set; }

    // creamos los datos importantes para el servidor (ip y puerto)
    [SerializeField] private string ip;
    [SerializeField] private ushort port;

    private void Awake()
    {
        singleton = this;
    }

    private void Start()
    {
        // usamos esto para mostrar los errores internos de riptide si es que aparecen
        RiptideLogger.Initialize(Debug.Log, Debug.Log, Debug.LogWarning, Debug.LogError, false);

        Client = new Client(); // creamos nuestro cliente
        Client.Connect($"{ip}:{port}"); // lo conectamos asi por ahora pero en el futuro haremos algo distinto
    }

    private void FixedUpdate()
    {
        Client.Tick(); // esto se asegurara de que nuestros mensajes lleguen al cliente y que podamnos trabajar con los datos
    }

    private void OnApplicationQuit()
    {
        Client.Disconnect(); // desconectamos al cliente cuando el juego se cierre
    }
}
~~~

y hacemos lo mismo que en nuestro servidor, creamos un objeto nuevo llamado "NetworkManager" y le damos este script, luego simplemente ponemos el ip local (**127.0.0.1**) y el puerto que elegimos anteriormente para el servidor.

**Importante:** recuerda que el 127.0.0.1 solo representa al mismo dispositivo en una instancia distinta, si quieres conectarte a otro dispositivo como cliente, tendrás que utilizar el ip global del mismo el cual puedes encontrar en la terminal.

Ahora deberíamos poder probar sin complicaciones, tomando, si ejecutamos nuestro cliente nos aparecerá que se esta conectando a un servidor pero nos mostrara un mensaje avisando de que no se ha logrado.

por otro lado si iniciamos el servidor primero y luego el cliente deberíamos ver un mensaje confirmando nuestra conexión al servidor tanto de parte del cliente como de parte del servidor.

---

## Conectándonos con un botón y enviando nombre de usuario

Como ya abras notado, logramos conectarnos efectivamente pero de forma automática, pero esta no es siempre la mejor opción, por lo que vamos a necesitar de un botón que nos permita hacer esta conexión a demás de pasar ciertos datos como en este caso el nombre de usuario.

Iniciaremos desde nuestro proyecto "**Client**" especificamente en nuestro codigo "**UiManager**" en el cual haremos lo siguiente:

~~~c#
// UiManager (Client)
using RiptideNetworking; // agregamos lo siguiente

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI; // agregamos lo siguiente

public class UiManager : MonoBehaviour
{
    // copiamos esto desde el NetworkManager del servidor y cambiamos todos los "NetworkManager" por "UiManager"
    private static UiManager _singleton;
    public static UiManager singleton
    {
        get => _singleton;
        private set
        {
            if (_singleton == null)
            {
                _singleton = value;
            }
            else if (_singleton != null)
            {
                print($"{nameof(UiManager)} instance already exists, destroying duplicate!");
                Destroy(value);
            }
        }
    }

    // creamos los datos para la conexion
    [Header("Connect")]
    [SerializeField] private GameObject ConnectUi;
    [SerializeField] private InputField usernameField;

    private void Awake()
    {
        singleton = this;
    }

    public void ConnectClicked() // si presionamos el boton "conectar"
    {
        // desactivamos la funcionalidad de los campos
        usernameField.interactable = false;
        ConnectUi.SetActive(false);

        NetworkManager.singleton.Connect(); // llamamos una funcion que utilizaremos para conectarnos al servidor (este aun no existe)
    }

    public void BackToMain() // creamos una funcion que referencie a la "desconexion del servidor"
    {
        // esta habilita nuevamente los siguientes campos
        usernameField.interactable = true;
        ConnectUi.SetActive(true);
    }
}
~~~

Tras esto volvemos al script "**NetworkManager**" de nuestro proyecto "**Client**" y agregamos lo siguiente:

~~~c#
// NetworkManager (Client)
using RiptideNetworking;
using RiptideNetworking.Utils;

using System; // agregamos este

using UnityEngine;

public enum ClientToServerId : ushort // este enumerador contendra los id de todos los mensajes que enviemos del cliente al servidor
{
    name = 1, // empezando por el 1
}

public class NetworkManager : MonoBehaviour
{
    private static NetworkManager _singleton;
    public static NetworkManager singleton
    {
        get => _singleton;
        private set
        {
            if (_singleton == null)
            {
                _singleton = value;
            }
            else if (_singleton != null)
            {
                print($"{nameof(NetworkManager)} instance already exists, destroying duplicate!");
                Destroy(value);
            }
        }
    }

    public Client Client { get; private set; }
    
    [SerializeField] private string ip;
    [SerializeField] private ushort port;

    private void Awake()
    {
        singleton = this;
    }

    private void Start()
    {
        // we create this class to show riptide internal errors on the console
        RiptideLogger.Initialize(Debug.Log, Debug.Log, Debug.LogWarning, Debug.LogError, false);

        Client = new Client(); // we create our client
        // movemos la linea que se encontraba aqui
        
        // agregamos lo siguiente:
        Client.Connected += DidConnect;
        Client.ConnectionFailed += FailedToConnect;
        Client.Disconnected += DidDisconnect;
    }

    private void FixedUpdate() {} // no cambiamos nada de esta funcion (solo borramos su contenido por temas de la documentacion)

    private void OnApplicationQuit() {} // no cambiamos nada de esta funcion (solo borramos su contenido por temas de la documentacion)

    public void Connect() // funcion que permitira la conexion
    {
        Client.Connect($"{ip}:{port}"); // y la dejamos en esta nueva funcion
    }

    private void DidConnect(object sender, EventArgs e)
    {
        UiManager.singleton.SendName(); // enviamos el nombre por medio de esta funcion que crearemos en un instante
    }


    // creamos 2 funciones de desconexion ya que ambas funcionaran en el futuro de forma distinta para nuestro cliente
    private void FailedToConnect(object sender, EventArgs e)
    {
        UiManager.singleton.BackToMain();
    }

    private void DidDisconnect(object sender, EventArgs e)
    {
        UiManager.singleton.BackToMain();
    }
}
~~~

Luego de esto volvemos a nuestro "**UiManager**" y damos los toques finales agregando la siguiente funcion:

~~~c#
// UiManager (Client)
using RiptideNetworking;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI; // agregamos lo siguiente
using TMPro; // agregamos lo siguiente

public class UiManager : MonoBehaviour
{
    // copiamos esto desde el NetworkManager del servidor y cambiamos todos los "NetworkManager" por "UiManager"
    private static UiManager _singleton;
    public static UiManager singleton
    {
        get => _singleton;
        private set
        {
            if (_singleton == null)
            {
                _singleton = value;
            }
            else if (_singleton != null)
            {
                print($"{nameof(UiManager)} instance already exists, destroying duplicate!");
                Destroy(value);
            }
        }
    }

    // creamos los datos para la conexion
    [Header("Connect")]
    [SerializeField] private GameObject ConnectUi;
    [SerializeField] private TMP_InputField usernameField; // utilizaremos text mesh pro por lo que usaremos tmp

    private void Awake()
    {
        singleton = this;
    }

    public void ConnectClicked() // si presionamos el boton "conectar"
    {
        // desactivamos la funcionalidad de los campos
        usernameField.interactable = false;
        ConnectUi.SetActive(false);

        NetworkManager.singleton.Connect(); // llamamos una funcion que utilizaremos para conectarnos al servidor (este aun no existe)
    }

    public void BackToMain() // creamos una funcion que referencie a la "desconexion del servidor"
    {
        // esta habilita nuevamente los siguientes campos
        usernameField.interactable = true;
        ConnectUi.SetActive(true);
    }

    // con esta funcion enviaremos nuestro nombre de usuario
    public void SendName()
    {
        /*
            a la hora de enviar mensajes tenemos 2 tipos o modos para enviarlos:
                1. MODO SEGURO 
                (utiliza tcp para asegurarse de que el mensaje sea recibido en perfectas condiciones sin importar cuanto tarde)
                    para este utilizamos Message.Create(MessageSendMode.reliable)

                2. MODO RAPIDO 
                (utiliza udp para enviar el mensaje, no aseguramos la llegada completa de la informacion pero si su velocidad)
                    para este utilizamos Message.Create(MessageSendMode.unreliable)
         */
        // en este casos enviaremos el nombre asi que necesitamos seguridad
        Message message = Message.Create(MessageSendMode.reliable, (ushort)ClientToServerId.name); 
        message.AddString(usernameField.text); // agregamos al mensaje el nombre de usuario obtenido por la interfaz
        NetworkManager.singleton.Client.Send(message); // enviamos el mensaje al servidor por medio del NetworkManager
    }
}
~~~

Luego de esto simplemente agregamos un canvas a nuestra escena, en este crearemos un "contenedor" donde agregaremos nuestro script UiManager (este puede ser una imagen, un objeto vacío o lo que quieras), en este agregaremos el script "**UiManager**" a demás de un **InputField** y un **botón** que utilizaremos para conectarnos.

Tras esto simplemente los referenciamos en nuestro editor en el contenedor y agregamos la función de ConnectOnClicked al botón recién creado, y listo ahora podrás enviar estos datos al servidor.

Al hacer esto te deberías dar cuenta de 2 cosas:

1. La conexión al servidor debería generarse normalmente si lo activamos normalmente.
2. Si la conexión al servidor falla el botón de conexión deberían aparecer nuevamente.

Por ultimo seguro no veras tu nuevo nombre de usuario en ni un lado, esto es por que enviamos los datos, pero aun no los utilizamos, para ello continua en la siguiente seccion de.

---

## Manejando el mensaje (nombre de usuario) en el servidor

