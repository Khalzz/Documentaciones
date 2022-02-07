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

---

## Manejando el mensaje (nombre de usuario) en el servidor y spawneando jugadores

Seguramente tras haber hecho todo esto te preguntaras, ¿Y mi nombre? ya que agregamos este como un dato a recibir por el servidor, en efecto este dato se esta recibiendo, pero lamentablemente para poder trabajar con este vamos a necesitar de la cooperación de parte del servidor y para esto haremos lo siguiente.

Primero copiaremos el "selector de id" para poder identificar el mensaje recibido por el servidor del script "**NetworkManager**" de nuestro proyecto "**Client**", este ira en el "**NetworkManager**" del proyecto "**Server**" de la siguiente forma:

~~~c#
// NetworkManager (Server)
using RiptideNetworking;
using RiptideNetworking.Utils;

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

    public Server Server { get; private set; }
    [SerializeField] private ushort port;
    [SerializeField] private ushort maxClientCount;

    private void Awake()
    {
        singleton = this;
    }

    private void Start()
    {
        RiptideLogger.Initialize(Debug.Log, Debug.Log, Debug.LogWarning, Debug.LogError, false); 
        Server = new Server();
        Server.Start(port, maxClientCount);
    }

    private void FixedUpdate()
    {
        Server.Tick();
    }

    private void OnApplicationQuit()
    {
        Server.Stop();
    }
}
~~~

Luego vamos a nuestra clase "**Player**" en nuestro proyecto "**Server**" y agregamos lo siguiente:

~~~c#
// Player (Server)
using RiptideNetworking; // agregamos RiptideNetworking

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    // creamos un diccionario estatico para acceder a los jugadores segun un id
    public static Dictionary<ushort,Player> list = new Dictionary<ushort,Player>();

    public ushort Id { get; private set; }
    public string Username { get; private set; }

    // ahora para manejar el mensaje que viene con nuestro nombre de usuario tendremos que hacer lo siguiente:

    // esta funcion se activa cuando nuestro jugador es destruido (se desconecta)
    private void OnDestroy()
    {
        list.Remove(Id);
    }

    public static void Spawn(ushort id, string username) // creamos la funcion que va a generar nuestros jugadores en la partida
    {
        // y los generamos segun un prefab
        Player player = Instantiate(GameLogic.singleton.PlayerPrefab, new Vector3(1, 1, 1), Quaternion.identity).GetComponent<Player>(); 		
        player.name = $"Player {id} ({(string.IsNullOrEmpty(username) ? "Guest" : username)})";
         // esto es tecnicamente una condicional if pero en linea
        // revisamos que el nombre de usuario no este vacio y de ser asi aplicamos el nuevo nombre de usuario

        // agregamos los ultimos datos y ingresamos al jugador a la lista de jugadores
        player.Id = id;
        player.Username = string.IsNullOrEmpty(username) ? "Guest" : username;  
        list.Add(id, player);
    }

    [MessageHandler((ushort)ClientToServerId.name)]
    private static void Name(ushort fromClientId, Message message)
    {
        Spawn(fromClientId, message.GetString());
    }
}
~~~

Ahora vamos al "**NetworkManager**" de nuestro proyecto "**Server**" y hacemos lo siguiente:

~~~c#
// NetworkManager (Server)
using RiptideNetworking;
using RiptideNetworking.Utils;

using UnityEngine;

public enum ClientToServerId : ushort
{
    name = 1,
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

    public Server Server { get; private set; } // we start our server class
    [SerializeField] private ushort port;
    [SerializeField] private ushort maxClientCount;

    private void Awake()
    {
        singleton = this;
    }

    private void Start()
    {
        RiptideLogger.Initialize(Debug.Log, Debug.Log, Debug.LogWarning, Debug.LogError, false); 
        Server = new Server();
        Server.Start(port, maxClientCount);

        Server.ClientDisconnected += PlayerLeft; // actualizamos los jugadores restantes
    }

    private void FixedUpdate()
    {
        Server.Tick()
    }

    private void OnApplicationQuit()
    {
        Server.Stop();
    }

    // agregamos lo siguiente:
    private void PlayerLeft(object sender, ClientDisconnectedEventArgs e)
    {
        Destroy(Player.list[e.Id].gameObject);
    }
}

~~~

Ahora copiamos el código de nuestro Singleton y lo pegamos en nuestro script "**GameLogic**" en el proyecto "**Server**" y luego cambiamos las referencias a este proyecto a demás de lo siguiente:

~~~c#
// GameLogic (Server)
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameLogic : MonoBehaviour
{
    // agregamos el singleton
    private static GameLogic _singleton;
    public static GameLogic singleton
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
                print($"{nameof(GameLogic)} instance already exists, destroying duplicate!");
                Destroy(value);
            }
        }
    }

    // agregamos el prefab que representa a nuestro jugador
    public GameObject PlayerPrefab => playerPrefab;

    [Header("Prefabs")]
    [SerializeField] private GameObject playerPrefab;

    private void Awake()
    {
        singleton = this;
    }
}
~~~

Ya con esto listo podemos ir a nuestro proyecto "**Server**" y crear un objeto vacío que representara a nuestro jugador y le asignamos el script "**Player**", luego como hijo le agregamos una capsula como objeto 3D y le eliminamos su collider (esto lo trabajaremos mas adelante), finalmente agregamos el script "**GameLogic**" a nuestro **objeto** NetworkManager y creamos el prefab de nuestro jugador en la carpeta prefab, eliminamos el jugador de nuestra escena y lo referenciamos en el script "**GameLogic**" dentro de nuestro NetworkManager.

Tras esto al conectarnos como cliente deberíamos ver a nuestro "jugador" en el proyecto "**Server**" a demás de tener este el nombre de usuario en el nombre del prefab.

---

## Spawneando jugadores en el cliente

Como vimos anteriormente al instanciar jugadores, estos solo se verán desde el servidor, por lo que necesitamos hacer unas cuantas cosas extra para que esto ocurra de forma que el cliente pueda ver al jugador instanciado.

Para esto itermos al script "**NetworkManager**" de nuestro proyecto "***Server**" y agregamos lo siguiente:

~~~c#
// NetworkManager (Server)
using RiptideNetworking;
using RiptideNetworking.Utils;
using UnityEngine;

public enum ServerToClientId : ushort // este enumerador contendra los id de todos los mensajes que enviemos del servidor al cliente
{
    playerSpawned = 1, // empezando por el 1
}

// este ya existia, solo lo agrego como referencia para donde posicionar el enumerador anterior
public enum ClientToServerId : ushort
{
    name = 1,
}
~~~

Despues en nuestro script "**Player**" del proyecto "**Server**" hacemos lo siguiente:

~~~c#
using RiptideNetworking;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public static Dictionary<ushort,Player> list = new Dictionary<ushort,Player>();

    public ushort Id { get; private set; }
    public string Username { get; private set; }
    private void OnDestroy()
    {
        list.Remove(Id);
    }

    public static void Spawn(ushort id, string username)
    {
        Player player = Instantiate(GameLogic.singleton.PlayerPrefab, new Vector3(1, 1, 1), Quaternion.identity).GetComponent<Player>();
        player.name = $"Player {id} ({(string.IsNullOrEmpty(username) ? "Guest" : username)})";

        player.Id = id;
        player.Username = string.IsNullOrEmpty(username) ? "Guest" : username;  

        list.Add(id, player);
    }

    #region Messages
    //creamos el metodo que se encargara de enviar el mensaje de "spawn"
    private void sendSpawned()
    {
        Message message = Message.Create(MessageSendMode.reliable, (ushort)ServerToClientId.playerSpawned); // creamos el mensaje
        message.AddUShort(Id); // creamos el id
        message.AddString(Username); // y creamos el nombre de usuario
    }

    [MessageHandler((ushort)ClientToServerId.name)]
    private static void Name(ushort fromClientId, Message message)
    {
        Spawn(fromClientId, message.GetString());
    }
    #endregion
}

~~~

Pero como podra el cliente saber donde vamos a posicionar al jugador?, pues pasandole las posiciones de donde va a spawnear el mismo, bien si podemos ponerlo simplemente agregando 3 float, esto es muy ineficiente, por lo que vamos a copiar y pegar [el código del siguiente enlace](https://github.com/tom-weiland/RiptideNetworking/blob/main/UnityPackage/Runtime/MessageExtensionsUnity.cs) en nuestro "**MessageExtensions**" del proyecto "**Server**" cambiando nuestra clase básica de unity por la clase que se ve en este mismo y luego agregamos el `using RiptideNetworking;` arriba del todo **a demas recuerda hacer esto mismo pero en el proyecto "Client"**.

Luego de esto podemos volver a nuestro script "**Player**" de "**Server**" y agregar lo siguiente:

~~~c#
using RiptideNetworking;

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public static Dictionary<ushort,Player> list = new Dictionary<ushort,Player>();

    public ushort Id { get; private set; }
    public string Username { get; private set; }

    private void OnDestroy()
    {
        list.Remove(Id);
    }

    public static void Spawn(ushort id, string username)
    {
        // hacemos esto para que el mensaje llegue a todos los jugadores que no sean el recien creado
        foreach (Player otherPlayer in list.Values) 
        {
            otherPlayer.sendSpawned(id);
        }

        Player player = Instantiate(GameLogic.singleton.PlayerPrefab, new Vector3(1, 1, 1), Quaternion.identity).GetComponent<Player>();
        player.name = $"Player {id} ({(string.IsNullOrEmpty(username) ? "Guest" : username)})";
        player.Id = id;
        player.Username = string.IsNullOrEmpty(username) ? "Guest" : username;

        player.sendSpawned(); // esto envia el mensaje de spawn al jugador que llego pero no a los otros

        list.Add(id, player);
    }

    #region Messages // aqui es donde mas cambios hemos hecho
        
    // creamos 2 metodos de spawn, uno que envia los datos a un solo jugador y otro que lo hace de forma general    
    private void SendSpawned() // este metodo se encargara de enviar el mensaje de "spawn" a todos los usuarios
    {
        NetworkManager.singleton.Server.SendToAll(AddSpawnData(Message.Create(MessageSendMode.reliable, (ushort)ServerToClientId.playerSpawned)));
    }

    private void SendSpawned(ushort toClientId) // este metodo se encargara de enviar el mensaje de "spawn" a un usuario en especifico
    {
        NetworkManager.singleton.Server.Send(AddSpawnData(Message.Create(MessageSendMode.reliable, (ushort)ServerToClientId.playerSpawned)), toClientId);
    }

    private Message AddSpawnData(Message message) // creamos esto como un facilitador del proceso de crear el mensaje
    {
        // enviamos aqui los datos de spawn
        message.AddUShort(Id); // creamos el id
        message.AddString(Username); // y creamos el nombre de usuario
        message.AddVector3(transform.position); // usamos esto para enviar la posicion de este objeto al cliente
        return message;
    }

    [MessageHandler((ushort)ClientToServerId.name)]
    private static void Name(ushort fromClientId, Message message)
    {
        Spawn(fromClientId, message.GetString());
    }
    #endregion
}
~~~

---

## Recibiendo datos de spawn desde el cliente

Ahora tenemos que conseguir esos datos desde el cliente por lo que haremos lo siguiente en "**NetworkManager**" del proyecto "**Client**".

~~~c#
// NetworkManager (Client)
using RiptideNetworking;
using RiptideNetworking.Utils;
using UnityEngine;

public enum ServerToClientId : ushort // este lo copiamos y pegamos de NetworkManager (Server)
{
    playerSpawned = 1,
}

// este ya existia, solo lo agrego como referencia para donde posicionar el enumerador anterior
public enum ClientToServerId : ushort
{
    name = 1,
}
~~~

Luego vamos al script "**Player**" de nuestro proyecto "**Client**" y agregamos lo siguiente:

~~~c#
// Player (Client)
using RiptideNetworking; // agregamos riptide

using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public static Dictionary<ushort, Player> list = new Dictionary<ushort, Player>();

    public ushort id { get; private set; }
    public bool isLocal { get; private set; }
    private string username;

    private void OnDestroy()
    {
        list.Remove(id);
    }

    // generamos el spawn y revisamos si el jugador es o no local
    public static void Spawn(ushort id, string username, Vector3 position)
    {
        Player player;
        if (id == NetworkManager.singleton.Client.Id)
        {
            player = Instantiate(GameLogic.singleton.LocalPlayerPrefab, position, Quaternion.identity).GetComponent<Player>();
            player.isLocal = true;
        }
        else
        {
            player = Instantiate(GameLogic.singleton.PlayerPrefab, position, Quaternion.identity).GetComponent<Player>();
            player.isLocal = false;
        }

        player.name = $"Player {id} ({(string.IsNullOrEmpty(username) ? "Guest" : username)})";
        player.id = id;
        player.username = username;

        list.Add(id, player);
    }

    // ahora creamos un "manejador de mensajes" para nuestro jugador spawneado
    [MessageHandler((ushort)ServerToClientId.playerSpawned)]
    private static void SpawnPlayer(Message message)
    {
        // recuerda que para recibir mensajes se deben leer de la misma forma que se envian
        //(en nuestro caso enviamos id, nombre de usuario y posicion)
        // asi que leemos en el mismo orden (ushort, string, vector3)
        Spawn(message.GetUShort(), message.GetString(), message.GetVector3());
    }
}
~~~

Ahora agregamos en el "**GameLogic**" de nuestro "**Client**" el singleton de la siguiente forma:

~~~c#
//GameLogic (Client)
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameLogic : MonoBehaviour
{
    // agregamos el singleton (copiado y pegado desde nuestro Server)
    private static GameLogic _singleton;
    public static GameLogic singleton
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
                print($"{nameof(GameLogic)} instance already exists, destroying duplicate!");
                Destroy(value);
            }
        }
    }

    public GameObject LocalPlayerPrefab => localPlayerPrefab;
    public GameObject PlayerPrefab => playerPrefab;

    [Header("Prefabs")]
    [SerializeField] private GameObject localPlayerPrefab;
    [SerializeField] private GameObject playerPrefab;

    private void Awake()
    {
        singleton = this;
    }
}
~~~

Finalmente vamos a unity y creamos nuestro jugador de la misma forma que lo hicimos en el servidor, creamos un objeto vacío y le damos el script "**Player**", luego creamos y agregamos su modelo, en mi caso sera una capsula y creare 2 prefabs, uno que represente al jugador local y otro qeu represente los jugadores externos, esto lo hare dandole un material de color distinto a ambos.

Luego al objeto "NetworkManager" le entregamos el script "**GameLogic**" y agregamos nuestros prefabs en sus correspondientes casillas.

Por ultimo en el "**NetworkingManager**" de nuestro proyecto "**Client**" creamos la posibilidad de desconectar jugadores de la siguiente forma:

~~~c#
// NetworkManager (Client)
using RiptideNetworking;
using RiptideNetworking.Utils;
using System;
using UnityEngine;

public enum ServerToClientId : ushort
{
    playerSpawned = 1,
}

public enum ClientToServerId : ushort
{
    name = 1,
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
        RiptideLogger.Initialize(Debug.Log, Debug.Log, Debug.LogWarning, Debug.LogError, false);
        Client = new Client();

        Client.Connected += DidConnect;
        Client.ConnectionFailed += FailedToConnect;
        
        Client.ClientDisconnected += PlayerLeft; // agregamos el siguiente
        
        Client.Disconnected += DidDisconnect;
    }

    private void FixedUpdate()
    {
        Client.Tick();
    }

    private void OnApplicationQuit()
    {
        Client.Disconnect();
    }

    public void Connect()
    {
        Client.Connect($"{ip}:{port}");
    }

    private void DidConnect(object sender, EventArgs e)
    {
        UiManager.singleton.SendName();
    }

    private void FailedToConnect(object sender, EventArgs e)
    {
        UiManager.singleton.BackToMain();
    }

    private void PlayerLeft(object sender, ClientDisconnectedEventArgs e) // destruimos el objeto de jugador
    {
        Destroy(Player.list[e.Id].gameObject);
    }

    private void DidDisconnect(object sender, EventArgs e)
    {
        UiManager.singleton.BackToMain();
    }
}

~~~

---

Listo, tras esto nuestro proyecto funcionara en lo básico, podremos conectarnos al servidor, enviar nuestro nombre de usuario y instanciar un objeto que se vera de igual forma en todos los clientes.

Puede que nuestro servidor este ocupando demás de nuestro equipo para procesar todo y veremos que el mismo esta corriendo a mas de 200 fps en ciertas ocasiones, para ello podemos ir a nuestro agregando `Application.targetFrameRate = 60` en el "**NetworkManager**"  del proyecto "**Server**".

Ya nuestro servidor básico esta acabado, ahora simplemente falta intentar hacer las cosas mas avanzadas, como lo es el movimiento del jugador entre muchos otros.

---

# Agregando Movimiento

Obviamente como ya mencione anteriormente en varios casos tendremos que enviar datos entre el cliente y servidor, uno de estos será el movimiento hecho por nuestro jugador.

Esto no se complica tanto como el inicio de nuestras conexiones pero hay un factor que puede dificultar nuestro desarrollo de movimiento.

Uno de estos es **"la protección de los datos"**, a lo que me refiero es que no debemos y repito **no debemos** confiar en nuestros clientes, si lo hacemos nos abrimos a la posibilidad de ser vulnerables a hackers.

La forma en la que tenemos que hacer esto es obteniendo el input de nuestros jugadores y calculando la posición de este y el movimiento en general en el servidor.

Para ello haremos lo siguiente:

---

## Recibiendo Input

Para poder obtener input desde el jugador vamos primero a nuestro proyecto "**Client**" creando 3 scripts:

+ PlayerController
+ CameraController
+ PlayerAnimationManager

Y en "**PlayerController**" hacemos lo siguiente:

~~~c#
using RiptideNetworking;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] private Transform camTransform; // referenciamos el transform de la camara
     
    private bool[] inputs; // creamos un array de "entradas"

    private void Start()
    {
        inputs = new bool[6]; // iniciamos el array con 6 elementos para enviar
    }

    private void Update()
    {
        if (Input.GetKey(KeyCode.W))
        {
            inputs[0] = true;
        }
        if (Input.GetKey(KeyCode.S))
        {
            inputs[1] = true;
        }
        if (Input.GetKey(KeyCode.A))
        {
            inputs[2] = true;
        }
        if (Input.GetKey(KeyCode.D))
        {
            inputs[3] = true;
        }
        if (Input.GetKey(KeyCode.Space))
        {
            inputs[4] = true;
        }
        if (Input.GetKey(KeyCode.LeftShift))
        {
            inputs[5] = true;
        }

        // dejamos el "Input[6]" para la posicion de la camara
    }

    #region Messages
    private void SendInput() // creamos la funcion que enviara nuestros mensajes
    {
        Message message = Message.Create(MessageSendMode.unreliable, ClientToServerId.input); // esta linea nos dara un error
        message.AddBools(inputs, false);
        message.AddVector3(camTransform.forward);
        NetworkManager.singleton.Client.Send(message);
    }
    #endregion 
}
~~~

Para solucionar el error que nos dará tenemos que ir al "**NetworkManager**" de nuestro proyecto "**Client**" y ahí hacer lo siguiente:

~~~c#
// NetworkManager (Client)

public enum ServerToClientId : ushort
{
    playerSpawned = 1,
    playerMovement, // agregamos el mensaje del movimiento del jugador
}

public enum ClientToServerId : ushort 
{
    name = 1, 
    input, // agregamos el mensaje de input
}
~~~

---

## Calculando el movimiento desde el servidor

Ahora para proceder tenemos primero que copiar lo anteriormente hecho en el "**NetworkManager**" del cliente para nuestro servidor, simplemente copiando y pegando lo mismo que ya había.

En nuestro servidor ahora haremos un script llamado "**PlayerMovement**" en el agregaremos lo siguiente:

~~~c#
using RiptideNetworking; // referenciamos riptide
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

// hacemos esto por que para este ejemplo vamos a usar character controllers
[RequireComponent(typeof(CharacterController))] 

public class PlayerMovement : MonoBehaviour
{
    // creamos los datos relevantes a nuestro jugador
    [SerializeField] private Player player; 
    [SerializeField] private CharacterController controller;
    [SerializeField] private Transform camProxy;
    [SerializeField] private float gravity;
    [SerializeField] private float movementSpeed;
    [SerializeField] private float jumpHeight;

    // creamos los datos relevantes al mundo
    private float gravityAcceleration;
    private float moveSpeed;
    private float jumpSpeed;

    // referenciamos las entradas de datos y la velocidad en el eje y
    private bool[] inputs;
    private float yVelocity;

    // validamos la existencia de un elemento controller y player para luego "inicializar" la lectura constante
    private void OnValidate()
    {
        if (controller == null)
            controller = GetComponent<CharacterController>();
        if (player == null)
            player = GetComponent<Player>();
        Initialize();

    }

    private void Start()
    {
        Initialize(); // inizializamos la lectura constante de datos
        inputs = new bool[6];
    }

    private void FixedUpdate() // usamos fixed update para leer input y enviarlo a la funcio nde movimiento
    {
        Vector2 inputDirection = Vector2.zero;
        if (inputs[0]) // w
            inputDirection.y += 1;
        if (inputs[1]) // s
            inputDirection.y -= 1;
        if (inputs[2]) // a
            inputDirection.x -= 1;
        if (inputs[3]) // d
            inputDirection.x += 1;

        Move(inputDirection, inputs[4], inputs[5]);
    }

    private void Initialize() // aqui tenemos todos los datos que constantemente se actualizaran
    {
        gravityAcceleration = gravity * Time.fixedDeltaTime * Time.fixedDeltaTime;
        moveSpeed = movementSpeed * Time.fixedDeltaTime;
        jumpSpeed = Mathf.Sqrt(jumpHeight * -2f * gravityAcceleration);
    }
    
    private void Move(Vector2 inputDirection, bool jump, bool sprint) // la funcion principal de movimiento
    {
        Vector3 moveDirection = Vector3.Normalize(camProxy.right * inputDirection.x + Vector3.Normalize(FlattenMove(camProxy.forward)) * inputDirection.y);
        moveDirection *= moveSpeed;

        if (sprint)
        {
            moveDirection *= 2f;
        }
        if (controller.isGrounded)
        {
            yVelocity = 0f;
            if (jump)
                yVelocity = jumpSpeed;
        }
        yVelocity *= gravityAcceleration;

        moveDirection.y = yVelocity;
        controller.Move(moveDirection);

        SendMovement();
    }

    // este nos facilita el movimiento en caso de que el jugador no se mueva mientras ve adelante
    private Vector3 FlattenMove(Vector3 vector) 
    {
        vector.y = 0;
        return vector;
    }

    // conseguimos el input del jugador
    public void SetInput(bool[] inputs, Vector3 forward)
    {
        this.inputs = inputs;
        camProxy.forward = forward;
    }

    // enviamos la posicion nueva de todos los jugadores
    private void SendMovement()
    {
        Message message = Message.Create(MessageSendMode.unreliable, ServerToClientId.playerMovement);
        message.AddUShort(player.Id);
        message.AddVector3(transform.position);
        message.AddVector3(transform.forward);
        NetworkManager.singleton.Server.SendToAll(message);
    }
}

~~~

**Ojo:** todo lo de este script que no este apegado al envió de datos puede ser editado, específicamente lo que tiene que ver con como calculamos el movimiento, esto depende de los valores que tu quieras darle, mas adelante daré un ejemplo de como hacer esto mismo con movimiento por medio de físicas usando rigidbodys.

---

## Manejando los mensajes de "Input"

Antes de continuar con nuestro movimiento tenemos que primero poder manejar bien nuestros mensajes de entrada de datos, para esto entraremos al script "**Player**" de nuestro proyecto "**Server**" y haremos lo siguiente:

~~~c#
using RiptideNetworking;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public static Dictionary<ushort,Player> list = new Dictionary<ushort,Player>();

    public ushort Id { get; private set; }
    public string Username { get; private set; }

    // agregamos estos
    public PlayerMovement Movement => movement;
    [SerializeField] private PlayerMovement movement;

    private void OnDestroy()
    {
        list.Remove(Id);
    }

    public static void Spawn(ushort id, string username)
    {
        foreach (Player otherPlayer in list.Values) 
        {
            otherPlayer.SendSpawned(id);
        }

        Player player = Instantiate(GameLogic.singleton.PlayerPrefab, new Vector3(1, 1, 1), Quaternion.identity).GetComponent<Player>(); 
        player.name = $"Player {id} ({(string.IsNullOrEmpty(username) ? "Guest" : username)})";

        player.Id = id;
        player.Username = string.IsNullOrEmpty(username) ? "Guest" : username;

        player.sendSpawned();

        list.Add(id, player);
    }

    #region Messages
    
    private void sendSpawned()
    {
        NetworkManager.singleton.Server.SendToAll(AddSpawnData(Message.Create(MessageSendMode.reliable, ServerToClientId.playerSpawned)));
    }

    private void SendSpawned(ushort toClientId)
    {
        NetworkManager.singleton.Server.Send(AddSpawnData(Message.Create(MessageSendMode.reliable, ServerToClientId.playerSpawned)), toClientId);
    }

    private Message AddSpawnData(Message message)
    {
        message.AddUShort(Id); 
        message.AddString(Username);
        message.AddVector3(transform.position);
        return message;
    }

    [MessageHandler((ushort)ClientToServerId.name)]
    private static void Name(ushort fromClientId, Message message)
    {
        Spawn(fromClientId, message.GetString());
    }

    // agregamos el mensaje de input
    [MessageHandler((ushort)ClientToServerId.input)]
    private static void Input(ushort fromClientId, Message message)
    {
        if (list.TryGetValue(fromClientId, out Player player))
            player.Movement.SetInput(message.GetBools(6), message.GetVector3());
    }
    #endregion
}

~~~

---



