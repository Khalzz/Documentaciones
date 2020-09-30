# Unity

Unity es un motor gráfico ideado para el desarrollo de videojuegos (aun que también se puede usar en otros ámbitos como arquitectura, animación, entre otros).

Este gano popularidad gracias a tener una versión gratuita 100% funcional, ademas de trabajar con un lenguaje conocido (c#) y ademas permitirte exportar tus juegos a diferentes plataformas como son Windows, Mac, Linux, Android, Ios, Xbox one, Ps4, Nintendo switch e incluso para la web.

Este se ha usado en una gran variedad de juegos hoy en día, como:

+ CupHead
+ Hollow Knight
+ Gang Beast
+ Human fall flat
+ Karlson 3D (en desarrollo)
+ entre otros...

En esta documentación repasare lo principal a la hora de desarrollar un juego en 2D y una pequeña parte sobre desarrollo en 3D.

---

## Indice

+ [Estructura de proyectos](#Estructura-de-proyectos)
+ [Sprites](#Sprites)
  + [Editor de sprites](#Editor-de-sprites)
+ [Scripts y físicas](#Scripts-y-físicas)
  + [Estructura de scripts](#Estructura-de-scripts)
  + [Vectores y tiempo](#Vectores-y-tiempo)
  + [Input](#Input)
    + [Tipos de iteracion](#Tipos-de-iteracion)
    + [Teclas y botones](#Teclas-y-botones)
    + [Método por clave](#Método-por-clave)
      + [Input de gatillo](#Input-de-gatillo)
  + [Movimiento 2D](#Movimiento-2D)
    + [Movimiento básico](#Movimiento-básico)
    + [Girar objeto](#Girar-objeto)
    + [Moverse con físicas](#Moverse-con-físicas)
    + [Saltar con físicas](#Saltar-con-físicas)
  + [Movimiento 3D](Movimiento-3D)
    + [Cámara en primera persona](#Cámara-en-primera-persona)
      + [Caminar](#Caminar)
      + [Físicas](#Físicas)
      + [Saltar](#Saltar)
    + [Animaciones](#Animaciones)
      + [Tipos de animación](#Tipos-de-animación)
        + [Animación (Normal)](#Animación-(Normal))
        + [Animación (TimeLine)](#Animación-(TimeLine))

---

## Estructura de proyectos

Nuestros proyectos necesitan mantener un orden, tener un proyecto ordenado es tan importante como tener un código ordenado a la hora de programar y cuando un proyecto es grande, ser desordenado sera un infierno para tanto nosotros como la gente que quiera trabajar con nosotros.

Al crear un proyecto se creara una carpeta llamada `Assets` en el que ira tanto las carpetas, imágenes, sonidos, etc que crearan tanto el funcionamiento como la experiencia de nuestro juego

En `Assets` añadiremos las siguientes carpetas:

+ Animations
+ Audio
+ Materials
+ Prefabs
+ Scenes (se crea por defecto)
+ Scripts
+ Sprites

Obviamente puedes añadir mas carpetas e incluso otras carpetas dentro de estas, por lo que en realidad eres totalmente libre de romper estas reglas a tu comodidad.

---

## Sprites

Los sprites son la imagen que ocupan los objetos para ser representados en la escena, desde el jugador, hasta armas o incluso la tierra ocupan sprites, son simplemente eso, imagenes que se muestran en pantalla.

Como es un poco obvio, estos van en la carpeta de "sprites" dentro de assets, estos requieren un poco de configuración al ser añadidos pero no es compleja de por si.

al añadir el sprite en la misma carpeta debemos configurarla clickeando en la misma, esto nos abrirá las opciones en la pestaña "inspector".

las opciones de sprite "importantes en este caso" son las siguientes:

+ Sprite Mode: (nos permite elegir si nuestro sprite es una imagen independiente con `single` o son mas de un sprite en uno mismo con `Multiple`, ademas con `polygon` usaremos ciertas partes del sprite para hacer una imagen general).
+ pixels per unit: (nos permite elegir que tan grande sera nuestro sprite según el sistema de unidades de unity "en el caso por defecto es 100" **en este caso cada 100 pixeles son 1 unidad de unity**).
+ mesh type: (es la forma del contorno del sprite a añadir y este puede ser `Full Rect`(forma básica de contorno generada por 2 triángulos) `tight` (forma compleja de contorno) estos afectan principalmente en el rendimiento del mismo).
+ extrude edges: (marca cuanto espacio quieres dejar entre el sprite y el contorno).
+ pivot: (punto del sprite donde se aplicaran las transformaciones (rotación, escala, agrandar, etc...))
+ generate physics shapes: (se le dice a unity que queremos que la física de unity siga el contorno del sprite a la hora de hacer colisiones).

**advanced**

+ wrap Mode: (la forma en la que funciona el sprite a la hora de mostrarse(ejemplo seria los sprite tiled, sprites que se repiten cuando se agrandan)).
+ Filter mode: (filtro que se le aplica a la imagen, la mejor para pixelart es (point (no filter))).

Como otro tema importante, para prototipar ideas podemos crear sprites básicos en la carpeta de sprite haciendo clic derecho y eligiendo la opción de crear sprite, en este punto podemos seleccionar una forma y la idea de esto es poder practicar una idea si aun no tienes un diseño final.

**otra cosa importante es en la opción compression elegir none, eso nos dará la paleta de colores mas efectiva a la hora de crear nuestros sprites o de insertar los que ya creamos (recordar que a la hora de hacer este cambio debemos presionar `apply`).**

---

### Editor de sprites

Esta es una herramienta bastante necesaria para lo que es unity, ya que nos deja iterar ya sea con sprites ya creados como sprites nuevos, pero antes de entrar a que podemos hacer con esto debemos saber que tipos de sprite existen y que los caracteriza:

+ Sprite (simple) es el sprite por defecto, este es el mas sencillo pues es solo una imagen que puede representar objetos,personajes,fondos, etc.
+ Sprite atlas (objetos) es un "archivo/sprite/asset" que tiene en 1 sprite, un múltiple numero de sprites, este sirve para no tener que ingresar un nuevo sprite por cada objeto o fondo y que esto permita que mejore el rendimiento de los juegos.
+ Sprite sheet (animaciones) son sprites similares a los sprite atlas solo que estos envés de almacenar un conjunto de sprites que se usan como complementos del escenario o del juego en si, en este caso, el orden de los sprites en el sprite sheet cumple un rol **importante** dado que este mismo sigue un orden que se sigue a la hora de hacer animaciones.

Por ahora veremos la opción de Sprite editor solo con el sprite atlas, dado que este nos sirve mas a la hora de tener uno ademas de que trabajar con un sprite común es fácil y el tema de las animaciones serán algo que veremos mas adelante.

Aparte de eso hay 2 opciones extra en el `Sprite Editor` que son `custom outline` el cual se encarga de delimitar el contorno del sprite como imagen y el `custom physics shape` que se encarga de delimitar donde actuaran las físicas/colisionadores del objeto.

---

## Scripts y físicas

Los scripts como es obvio son algo de lo que haremos mucho uso a la hora de crear un juego, este es el código que maneja las reglas por las que se moverá nuestro mundo.

Como es obvio también los scripts van en la carpeta scripts.

---

### Estructura de scripts

Los archivos de código en c# se crean por defecto con la siguiente sintaxis:

~~~c#
//estas son las librerias que requieres en la aplicacion
using System.Collections;
using System.Collections.Generic;
using UnityEngine;	

public class movement : MonoBehaviour
{
    void Start()
    {
        //aqui va el codigo que se activa cuando se inicia el juego
    }

    void Update()
    {
        //aqui va el codigo que se comprueba cada frame (se actualiza constantemente)
    }
    //aqui van las demas funciones que añadiremos a nuestro proyecto
}
~~~

---

### Vectores y tiempo

En otros lenguajes de programación para mover algo debemos sumarle a la "posición" actual del objeto pero en el caso de unity debemos aplicar un vector y cuanta fuerza aplica por cierta cantidad de tiempo, pero antes de entrar en estos temas, un recordatorio.

+ sistema cartesiano bidimencional: (es un plano cartesiano que se considera por tener solo 2 ejes principales, el `eje x (horizontal)` ademas del`eje y (vertical)`).
+ sistema cartesiano tridimencional: (es un plano cartesiano que a diferencia del anteriormente mencionado, tiene 3 ejes principales, el `eje x (horizontal)`, el`eje y (vertical)`, ademas del `eje z (anchura)` ).
+ vector: son "fuerzas de movimiento que se aplican a objetos" en este caso por lo menos, estas se representan en un sistema cartesiano como flechas que señalan como se mueve un objeto desde el origen el cual es el inicio de la flecha en si.
  + Ejemplo (que un enemigo persiga al jugador): el vector para este caso que deberíamos  usar se calcula haciendo `destino(jugador)-Origen(enemigo)=vector(movimiento)`

A la hora de generar movimiento o que una animación se reproduzca tendremos que recorrer un cierto numero de "frames en el juego" pero en este caso si hacemos referencia a los frames, si en un dispositivo el juego corre a menos frames de los que tenemos ideados, las animaciones y movimientos serán mas lentas de lo que tenemos.

Por eso envés de entregarnos el "vector\*frames" para calcular el movimiento, usaremos "vector\*tiempo" pues en este caso no habrá variables en las animaciones o movimientos y se reproducirán a la misma velocidad en cada dispositivo, incluso habiendo variaciones en los fotogramas por segundo.

Pero para hacer esto debemos a la hora de llamar la velocidad con la que se se mueve el objeto escribirla así `Vectorf*Time.deltaTime`.

cabe recordar que el vector sera la fuerza que se aplica y la f representa que ese numero es un float, como ejemplo mas realista podemos hacer `5f*Time.deltaTime`

---

### Input

A la hora de jugar un videojuego la idea es que este sea principalmente interactivo, esto lo lograremos recibiendo información (usando un Input).

los input pueden ser tanto botones de teclado, clicks del mouse, la posición del mouse o incluso de un mando de consola.

---

#### Tipos de iteracion

Hay 3 tipos de iteracion principales que puedes aplicar a un botón.

*Estos son:*

+ `GetKey` se acciona cuando el botón es presionado de forma normal, también lee si este se mantiene.
+ `GetKeyDown` se acciona **solo cuando el botón baja.**
+ `GetKeyUp`  se acciona **solo cuando el botón se suelta.**

Todos estos nos generaran un valor booleano con el que se puede operar en condicionales usándolos de la siguiente forma:

~~~c#
if (Input.GetKey(boton a presionar)){
    //accion al presionar el boton
}
~~~

Pero cabe resaltar que nosotros usamos el `GetKey` como ejemplo, aun que estos también se dividen en otros tipos.

*por ejemplo usaremos los `Get`:*

+ `GetKey` nos permite obtener input de teclas y de algunos botones
+ `GetButton` nos permite obtener input de botones de principalmente parte de joysticks
+ `GetAxis` nos permite obtener input de el "eje" de algún dato variable por ejemplo sticks o gatillos
  + el axis también puede ser `GetAxisRaw` esto hará menos "suave" el input y la interpretación de este mismo en pantalla
+ `GetMouseButton` nos permite obtener el input de los botones del mouse
+ entre otros...

---

#### Teclas y botones

Como supongo que es obvio, a la hora de leer el input de algún botón, tecla o axis debemos saber **que botón esperamos que sea presionado**.

Para esto tenemos 2 métodos distintos para seleccionar estos botones y son los siguientes:

1. Método directo (**Elegimos directamente que tecla presionar**)
2. Método por "Clave" (**le asignamos a un conjunto de botones un "nombre" y los llamamos por el**)

---

#### Método directo

El método directo es la forma mas fácil para acceder a un input de teclado, para ello debemos usar alguna de las funciones ya mencionadas de `Input.GetKey` , `Input.GetButton` u otros, y añadirle el dato `KeyCode.tecla o boton a usar` todos con mayúscula o iniciando con el mismo.

*por ejemplo*

+ `Input.GetKey(KeyCode.A);` se accionara al presionar la tecla `A`
+ `Input.GetKey(KeyCode.Space);` se accionara al presionar la tecla `Espacio`
+ `Input.GetMouseButton(0);` se acciona al presionar click izquierdo y no requiere de `KeyCode`
  + 0 equivale a click izquierdo
  + 1 equivale a click derecho
  + 2 equivale a click con la rueda

Pero también podemos usar keycode para el mouse, incluso para usar input de algún mando de consola, pero el keycode de estos los puedes encontrar [aqui](https://docs.unity3d.com/ScriptReference/KeyCode.html).

---

#### Método por clave

(ojo su nombre real es `virtual axes` pero por inoperancia del escritor lo dejare como `metodo por clave`)

Como ya dije, el método por clave nos permite acceder a varios input con solo una palabra.

*por ejemplo:*

*digamos que estamos haciendo un juego de plataformas, en caso del teclado se salta con espacio pero también seleccionamos el botón `A` de un mando y a estos le añadimos el nombre `Jump`*

para acceder a este input deberíamos usar `Input.GetButton("Jump");` y nuestro input leerá ambos botones si es que uno o otro es presionado ademas de que el input lleva comillas si es por clave.

Estos datos podemos editarlos en `Edit` > `Project settings` > `Input manager` aquí nos aparecerán todas las opciones de botones por defecto o las que añadamos, para añadir mas debemos cambiar el numero de size (de 18 al numero de inputs que veamos necesario).

Pero las opciones importantes son las siguientes:

+ `name` clave o nombre de nuestros inputs

+ `negative button` y `positive button` nos permite añadir inputs contrarios, por ejemplo si nuestro input positivo es tecla izquierda nuestro negativo seria moverse a la derecha.
+ `alt negative button` y `alt positive button` es similar al anterior pero nos permite añadir botones extra que generan la misma acción.
+ entre otros

en este caso daré un ejemplo de como tomar en cuenta el input de un gatillo de control pues este es el mas complejo y de los pocos que usan algunas opciones que no mencionamos.

---

##### Input de gatillo

Para esto primero añadiremos un nombre a nuestro input, en este caso sera `Trigger`.

Tras esto deberemos dejar tanto el input positivo como negativo sin botones pues estos se obtendrán de otra forma.

luego como opciones recomendadas dejaremos:

+ `gravity` en 0
+ `dead` en 0
+ `sensitivity` en 1
+ `snap` lo dejamos en checked
+ `type` lo dejamos en joystick axis
+ `axis` lo dejamos en 3th axis si queremos usar el gatillo izquierdo y 6th axis para el gatillo derecho

Luego para usarlo como input en nuestro archivo de c# deberíamos usar la linea `Input.GetAxisRaw("Trigger") > 0 ` y con eso ya podríamos leer el input de un gatillo de mando, para mas información de esto puede ver [aqui](http://wiki.unity3d.com/index.php/Xbox360Controller). 

---

### Movimiento 2D

Como ya mostramos en la parte pasada, el movernos de esa forma es una forma notable, dado que de por si es algo que en todos nuestros juegos queremos hacer, pero también podemos hacer otras cosas como:

---

#### Movimiento básico

el movernos es algo que queremos hacer por obvios motivos en nuestro videojuego, podemos hacerlo con físicas o solo moviendo el objeto de forma normal, pero ahora como ejemplo mostrare el método mas básico que hay, aun que mas adelante demostrare como hacerlo con físicas.

*el código es el siguiente:*

~~~c#
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class movement : MonoBehaviour
{
    void Start()
    {
        
    }
    
    void Update()
    {
       //podemos cambiar el "left" por "KeyCode.a" o otra tecla
       if(Input.GetKey("left")) 
       {
           //en el parentesis esta (x,y,z)
           gameObject.transform.Translate(-3f * Time.deltaTime,0,0); 
       }
       //podemos cambiar el "left" por "KeyCode.d" o otra tecla
       if(Input.GetKey("right")) 
       {
           //en el parentesis esta (x,y,z)
           gameObject.transform.Translate(3f * Time.deltaTime,0,0); 
       }
    }
}
~~~

---

#### Girar objeto

Podemos rotar un objeto usando teclas como ejemplo básico de su función pues deberás luego aplicar algo similar si quisieras hacer esto con el mouse pero para hacer lo primero ya mencionado debemos o podríamos hacer lo siguiente:

~~~c#
//si Input.GetKey(KeyCode.A) se presiona la letra "a"
if (Input.GetKey(KeyCode.A)){
    //al "gameobject" (objeto al que se le aplica el script)
    //transformar la rotacion(eje x = 0, eje y = 0, eje z = 150 * tiempo pasado)
	gameObject.transform.Rotate(0,0,150 * Time.deltaTime);
}
~~~

En este caso lo que ocurre es que el objeto rotara cada vez que presionemos la A.

Podríamos hacer funcionar lo mismo con el mouse, pero para eso deberíamos calcular `posicion del objeto` ademas de `posicion del mouse` y calcular el angulo que generan y esto añadirlo al `gameObject.transform.Rotate(0, 0, Angulo del mouse);`.

---

#### Moverse con físicas

Ademas de lo ya mencionado hay un método incluso mejor de movimiento, que es usando físicas, esto hará que nuestro movimiento sea mas natural y lo lograremos de muchas formas, pero la que yo prefiero es la siguiente:

Para hacer esto seleccionamos nuestro objeto y en el inspector presionamos la opción `add component` y buscamos el componente llamado `Rigidbody 2D`.

**Esto le aplicara físicas a nuestro objeto y de hecho lo podemos comprobar ejecutando el juego, al hacerlo veremos que nuestro personaje caerá, eso significa que ya esta atado al sistema de físicas de unity.**

Tras esto Crearemos la superficie donde se parara y le añadimos un componente a este el cual es `Box Collider 2D` así este estará dispuesto a tener colisiones con objetos.

Luego de esto debemos hacer lo siguiente:

~~~c#
public class Movimiento : MonoBehaviour
{
	//Creamos las variables con las que trabajaremos
    private Rigidbody2D rb; //Declaramos una variable RigidBody como null
    public float velocidad; //Velocidad de movimiento

    void Start()
    {
        rb = GetComponent<Rigidbody2D>(); //El rb lo anidamos al componente RigidBody2D
    }

    void Update()
    {
        float x = Input.GetAxis("Horizontal"); //variable que lee el input horizontal
        float y = Input.GetAxis("Vertical"); //variable que lee el input vertical
        Vector2 direccion = new Vector2(x, y); 

        Caminar(direccion); //a la funcion caminar se le añade el valor (direccion)
    }

    private void Caminar(Vector2 direccion)
    {
        //esta funcion nos permite aplicar ese "movimiento" al personaje
        rb.velocity = (new Vector2(direccion.x * velocidad, rb.velocity.y));
    }
    
}
~~~

Esto nos dará la opción de "seleccionar" en el componente de `script` la velocidad de movimiento, ademas esto en el build nos puede generar problemas de lag en el personaje, esto lo arreglaremos llendo a la el rigidbody del personaje y activando la opción `interpolate ` en `interpolate`

---

#### Saltar con físicas

Las físicas aparte de permitirnos de una forma mas "agradable" también nos permite el hacer otras funciones con el mundo de nuestro juego.

En lo que ahora nos fijaremos sera en la acción de "saltar", Esto deben añadirlo en el mismo archivo de movimiento pues si no lo hacemos va a generar errores como quedarse quieto mientras hace el salto.

el código es:

~~~c#
public float fuerzaDeSalto; //fuerza de salto en null
public bool estaEnElSuelo; //booleano ¿esta el personaje tocando el suelo?
public Transform posicionPies; //nos hace marcar los pies de nuestro player
public float radioPies; //radio de contacto con objetos
public LayerMask queEsElSuelo; //nos permite marcar el "suelo"

void Update()
{
    
    /*
   	Physics2D.OverlapCircle(objeto1.position, float radio, objeto suelo)
   	esto compara si un objeto esta en contacto con otro, en este caso nos devuelve un bool
   	por lo que si esto ocurre nuestra variable "estaEnElSuelo" sera verdadera
    */ 
    estaEnElSuelo = Physics2D.OverlapCircle(posicionPies.position,radioPies,queEsElSuelo);

    //si el personaje esta en el suelo y presionamos espacio
    if (estaEnElSuelo == true && Input.GetButton("Jump")){
        //se le añade un vector hacia arriba de velocidad a nuestro objeto
        rb.velocity = new Vector2(rb.velocity.x, fuerzaDeSalto);
    }
}
~~~

Tras esto tendremos mas opciones en nuestro componente script, estos serán:

+ `fuerza De Salto` (numero que identifica la fuerza con la que saltara el personaje)
+ `esta En El Suelo` (booleano que dice si el personaje esta en contacto con el suelo)
+ `posición Pies` (objeto que representa los pies de nuestro personaje)
+ `radio Pies` (float que identifica el tamaño del "radio" que se dedica a buscar el contacto)
+ `que Es El Suelo` (selector de que capa representa el suelo)

Para esto debemos primero añadir los datos numéricos, a mi comodidad recomiendo usar 

+ `fuerza de salto = 20`
+ `radio pies = 0.3`

luego para la `posición de pies` creamos un objeto vació llamado "pies" o como nosotros elijamos, este objeto lo añadimos a nuestro personaje como un objeto "hijo" anidado al personaje.

Luego tomamos el objeto "pies" y lo arrastramos a la casilla `posicion de pies` o lo seleccionamos desde la misma.

Y como ultimo paso vamos a nuestro objeto suelo y damos a la lista de `layer` y seleccionamos `add layer` ahí vamos a aplicar el nombre suelo a alguna capa y luego la seleccionamos en la misma lista de `layer`, tras esto vamos a la opción `que Es El Suelo` en nuestro script y seleccionamos la layer del suelo que ya creamos.

Ademas podemos añadir un extra para que este el salto funcione como en otros plataformas, por ejemplo podemos hacer que el salto se mantenga y sea mas alto mientras mas mantengamos el `Espacio` y que se corte antes si lo dejamos de presionar.

*para este ejemplo el código debe ir en el mismo archivo:*

~~~c#
public class salto : MonoBehaviour{

    private float contadorDeSaltos;
    public float tiempoDeSalto;
    private bool estaSaltando;
    
	void Update(){
        
        if (estaEnElSuelo == true && Input.GetButton("Jump")){
        	rb.velocity = new Vector2(rb.velocity.x, fuerzaDeSalto);
        	estaSaltando = true; //añadimos esta linea
        	contadorDeSaltos = tiempoDeSalto; //añadimos esta linea
		}
        
    	if (Input.GetButton("Jump") && estaSaltando == true){
            if (contadorDeSaltos > 0){
               rb.velocity = new Vector2(rb.velocity.x, fuerzaDeSalto); 
               contadorDeSaltos -= Time.deltaTime;
            }else {
                estaSaltando = false;
            }   
        }
        if (Input.GetButtonUp("Jump")){
            estaSaltando = false;
        }
    }
}
~~~

A la hora de que esto lo apliquemos a nuestro código tendremos un problema, al todas las partes laterales de una plataforma nos quedaremos pegados en este, esto lo reparamos siguiendo los pasos que daré a continuación:

1. Creamos la carpeta "Materials" en nuestros assets.
2. Creamos un `New Physics Material 2D` y dejamos la opción `Friction` y `Bounciness` en 0.
3. En el box colider 2D de nuestro player añadimos el `New Physics Material 2D` en la opción material.

---

### Movimiento 3D

El movimiento en 3D es otro tema bastante importante para muchos juegos, en este caso me fijare mas que nada en movimiento en primera persona pero podemos luego añadir otros tipos como movimiento con path finding o incluso movimiento en tercera persona.

Pero primero debemos configurar nuestro jugador.

A diferencia de en juegos en 2D el jugador debemos hacerlo con un objeto vacío que tiene como hijo otros 2 objetos (La cámara y el cuerpo del jugador) aun que el cuerpo del jugador puede ser un objeto a nuestra elección, aun que yo prefiero usar cilindros.

#### Cámara en primera persona

Como primer tema a tomar en cuenta sera la cámara, obvio a la hora de movernos en 3D mas importante que cualquier cosa (aun que en 2D también es importante).

La cámara nos permite darle un enfoque a nuestro mundo de distinta forma y la cámara en primera persona nos permite incluso añadirle una presentación distinta a nuestra aventura, presentarla mas en un plano que te hace sentir inmerso en la historia que quieres contar.

Para esto crearemos un scripts para la cámara, este scripts sera el siguiente:

~~~c#
public float sensibilidadMouse = 100f; //sensibilidad basica de camara
public Transform cuerpoJugador; //objeto del jugador

float rotacionX = 0f; //cantidad base de rotacion de camara

void Start()
{
        Cursor.lockState = CursorLockMode.Locked; //bloquea el cursor mientras se ejecuta
}

void Update()
{
    //input de eje x camara
	float camaraX = Input.GetAxis("Horizontal View") * sensibilidadMouse * Time.deltaTime; 
    //input de eje y camara
	float camaraY = Input.GetAxis("Vertical View") * sensibilidadMouse * Time.deltaTime;
    
    rotacionX -= camaraY;
    rotacionX = Mathf.Clamp(rotacionX, -90f, 90f); //rotacion maxima en eje y

	//rotacion del objeto en base a "rotacionX"
    transform.localRotation = Quaternion.Euler(rotacionX, 0f, 0f);
    cuerpoJugador.Rotate(Vector3.up * camaraX); //rotacion de jugador en base a camara x
}
~~~

Este lo añadiremos a nuestra cámara y luego en el inspector seleccionamos el objeto padre de nuestro jugador en la opción `Cuerpo Jugador` esto hará que al girar la cámara, todo rote con el incluyendo el objeto que representa nuestro jugador.

***Hay que aclarar que a la hora de hacer esto no funcionara por defecto, pues lo que hice fue cambiar el nombre de los input de  (Mouse X/Mouse Y) en el input manager por `Horizontal View` y `Vertical view` aun que técnicamente tienen la misma función (recuerden que en el vertical view deben darle a check en la opción "invert" si es que lo usaran con un stick analogo)***

*Recordar también que podemos cambiar la sensibilidad del mouse con la variable sensibilidad, aun que lo que yo hice fue dejarla igual y en el input de mouse dejar la opción sensibility en `0.2` para que el mouse sea mas sensible que el stick a usar.*

---

##### Caminar

Caminar es otro tema a tomar en cuenta, obviamente en muchos casos queremos hacer que un personaje se mueva, especialmente si la cámara es en primera persona, para esto lo que haremos sera añadir a nuestro objeto padre **jugador** un componente llamado `Character Controller` y lo configuramos para que este a la medida con nuestro mundo, cambiando datos como:

+ center (centrar la localización en la que se moverá el jugador (suele requerir subir y pues usualmente el jugador tiene su mitad dentro del suelo del juego))
+ Radius (radio de la colisión del jugador al chocar con otros objetos (recomiendo que sea 0.1))
+ Step Offset (espacio mínimo para subirte a un objeto ejemplo escaleras (recomiendo para estas 0.7))
+ entre otras opciones útiles que no enseñare por ahora.

*Ademas de usar el siguiente código usar el siguiente código:*

~~~c#
public CharacterController controller; //llamamos el componente Character controller

public float speed; //definimos la velocidad como nula (recomiendo 3 para caminar lento)


void Update()
{
    float x = Input.GetAxis("Horizontal"); //input horizontal (teclado y joystick)
    float z = Input.GetAxis("Vertical"); //input vertical (teclado y joystick)

    Vector3 move = transform.right * x + transform.forward * z; // creamos el movimiento

    controller.Move(move * speed * Time.deltaTime);	//ejecutamos el movimiento
}
~~~

Este debe ir en el objeto jugador y seleccionamos en la opción `Controller` nuestro componente`Character controller` y listo, tras esto podríamos en teoría movernos y ver a nuestro alrededor.

---

##### Físicas

Las físicas a diferencia que en el 2D se añaden de otra forma en entornos tridimensionales, especialmente si a lo que queremos aplicar físicas es a nuestro jugador.

En el caso del 2D debemos añadirlo con un rigidbody 2D, pero en caso de el 3D nos generara problemas si queremos hacer lo mismo con un rigidbody normal.

En este caso debemos hacerlo con código, específicamente en el mismo código que usamos para movernos.

*Pero primero unos pequeños ajustes:*

+ Al igual que en el juego 2D debemos crear un objeto invisible en el jugador que sirva como `pies`
+ crear una layer llamada suelo o floor y la elegiremos en todos los objetos que sean suelo, escaleras y otras superficies que el jugador pisara. 

Luego de eso  iniciamos con el código:

~~~c#
//recordar que esto va en el mismo codigo que nuestro archivo 
public float gravedad; //variable gravedad (-9.81f base)(-39.24 recomendado)
Vector3 velocidad; //vector de velocidad

public Transform posicionPies; //objeto pies
public float radioPies = 0.4f; //radio de comprobacion pies
public LayerMask Suelo; //layer que represente el suelo
bool estaEnElSuelo; //esta tocando el suelo?

void Update()
{
    //esta tocando el suelo?
    estaEnElSuelo = Physics.CheckSphere(posicionPies.position, radioPies, Suelo);

    //si esta en el suelo y la velocidad es menor a 0
    if(estaEnElSuelo && velocidad.y < 0)
    {
        //la velocidad del eje y sera -2f
        velocidad.y = -2f;
    }
	
    //ajustar valor de velocidad.y
    velocidad.y += gravedad * Time.deltaTime;
    //ejecutamos la "gravedad" cuando sea necesario
    controller.Move(velocidad * Time.deltaTime);
}

~~~

Recordar que en el script en `inspector` tenemos que ajustar 2 valores:

+ Posición Pies = objeto que representa los pies de nuestro jugador.
+ Suelo = Layer que representa todos los objetos que son el suelo.

---

##### Saltar

Aun que el acceso a la gravedad es distinto que en 2D en 3D no es tan diferente saltar, esta acción tan útil es bastante similar a lo que estamos acostumbrados, y lo hacemos con el siguiente código:

~~~c#
//Recordar que este codigo va en el mismo archivo que el de fisicas y movimiento
//altura de salto (se puede editar)
public float alturaSalto = 3f;

void update()
{
    //si se presiona el boton saltar y se esta en el suelo
    if (Input.GetButtonDown("Jump") && estaEnElSuelo)
        {
        	//calculo que genera el salto
            velocidad.y = Mathf.Sqrt(alturaSalto * -2 * gravedad);
        }
}
~~~

---

## Animaciones

Las animaciones son parte fundamental en la visual de nuestros videojuegos, animaciones hermosas pueden traer consigo que el juego se sienta tanto vivo como incluso mas placentero el jugarlo.

En esta parte no enseñare como hacer animaciones pero si enseñare el funcionamiento básico de estas y de que formas podemos implementarlas en nuestro juego ademas de efectos y otras cosas que nos serán muy útiles en el mismo.

(Como extra, la herramienta que yo utilizo es ***[aseprite](https://www.aseprite.org/)*** un editor de sprites y herramienta de animación de estos mismos, no es gratuito pero para mi el precio vale la pena).

### Tipos de animación

A la hora de aplicar animaciones a nuestro juego veremos que hay 2 tipos fundamentales, *estos son:*

+ **Animación normal (usando la ventana animation)**
+ **Animación por TimeLine (usando la ventana TimeLine)**

Ambas al ser relativamente similares son de por si bastante distintas, trabajan de forma separada y ambas se usan en casos diferentes.

#### Animación (Normal)

Las animaciones (que en su defecto se hacen con la ventana `animation`) esta sirve para animar acciones como lo serian "caminar", "saltar", agacharte y otras animaciones que se activan específicamente dependiendo de la acción que haga el jugador.

Para esto debemos ir a `Window` > `Animation` > `Animation` y así se abrirá la ventana `Animation` , para iniciar con esta debemos seleccionar nuestro objeto a animar con la ventana `hierarchy`, tras eso en la ventana animation se nos dará un texto:

***To begin animating (objeto seleccionado), create an animatior and animation clip*** ademas de un botón que nos da la opción `Create`, al presionar esta seleccionamos donde crear estos assets (yo lo hago en una carpeta especifica para estas animaciones).

Luego de haber arreglado todo esto seleccionamos lo que queremos editar de nuestro objeto (por ejemplo su posición) y podemos empezar a animar nuestros sprites, aquí podemos tanto añadir las animaciones frame por frame ya creadas como al simplemente ir añadiendo Keyframes y moviendo nuestro objeto por cada frames.

En este caso las opciones que mas nos importan al terminar son la ventana `animator` en esta podemos seleccionar las funciones que generaran esa animación especifica de nuestro jugador de forma gráfica, lo demás es relativamente básico y simplemente es jugar con opciones, como el framerate de la animación o si queremos que esta se repita o mantenga un bucle (esto ultimo lo logramos seleccionando el asset de el objeto a animar en la carpeta animación que hicimos anteriormente, ahí esta la opción `loop cicle` dejándolo en unchecked o desmarcado).

#### Animación (TimeLine)

A diferencia de el anteriormente mencionado, este no esta pensado para pequeñas acciones como esta, sino para cosas mas grandes, principalmente para scripts (script como animación en el juego que no involucra una acción sino una secuencia de estas por ejemplo iniciar un nivel caminando y luego darle el control al jugador).

Para esto debemos ir a `Window` > `Sequencing` > `TimeLine`, tras esto se nos abrirá una ventana similar a la de animation pero que no es la misma.

Tras esto nos saldrá una advertencia similar a la de la ventana animation con un botón `Create`, hacemos lo mismo que en el anterior y se nos abrirá otra linea de tiempo, en esta  daremos clic derecho en el lado izquierdo de la linea de tiempo y daremos en `track group` luego damos en el botón `+` y seleccionamos la opción `animation track` y seleccionamos el objeto a animar en el, luego podemos empezar a animar.

a diferencia de la animación normal esta no se ejecuta en bucle por defecto y al terminar por ejemplo si animamos al jugador, este nos entregara el control del mismo luego de su ejecución y cabe resaltar que la animación que añadamos puede ser de mover el objeto como un sprite al mismo tiempo y de otros tipos igualmente.

Ademas en este hacer las animaciones es mas fácil pues solo elijes los puntos clave de la animación y esta se rellenara por si sola, por ejemplo si creamos una animación que te mueve de un punto `a` a un punto `b` el punto que tengan entre medio se rellenara solo.

---