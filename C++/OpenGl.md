# OpenGl

**Documentación escrita por Rodrigo Seguel**

Nuestro ordenador se encarga constantemente de ejecutar código para permitir las distintas funcionalidades que cada uno va a requerir.

En la mayoría de casos esta se ejecutara desde el procesador, lo que por ejemplo en el desarrollo de videojuegos, es suficiente para calcular la lógica del mismo.

Pero ¿y si queremos ejecutar código que genere representaciones graficas por medio de nuestra **GPU**?, para esto debemos utilizar alguna **API** que se encargue de manejar esto facilitándonos la interactividad con gráficos tanto en **3D** como en **2D**.

Entre estos **API**(S) encontraremos varias opciones como serian:

+ **Direct3D**.
+ **DirectX(9, 10, 11 y 12)**.
+ **Vulkan**.
+ Y el que nos trae por aquí **OpenGl**.

---

## ¿Que es OpenGl?

OpenGl (Open Graphic Library) es una **api de gráficos**, multi-lenguaje y multi-plataforma que nos permite por medio de código **interactuar con gráficos 2D y 3D** o sea en términos simples es "un conjunto de funciones que nos dejan interactuar con gráficos en 2D y 3D" permitiéndonos en el proceso "acceder" a nuestra GPU.

A pesar de lo que su nombre indica, este no debe considerarse como una librería, en este caso OpenGl no requiere que descargues esas funciones para poder aplicarlas en tus proyectos, dado que OpenGL y las funciones referente a este **son llamadas desde los drivers de la GPU**.

Este tiene muchos usos en cualquier área que requiera mostrar contenido tanto **2D** como **3D**, desde **la creación de interfaces simples** al **desarrollo de videojuegos**, siendo especialmente esta ultima en la que nos centraremos.

OpenGl es accesible por medio de distintos lenguajes ya que varios tienen alguna forma de implementarlo en si, pero en este caso utilizaremos **C++** ya que este nos entrega principalmente las funcionalidades  básicas al interactuar con este, sin tener que hacer tantos malabares para llegar a una aplicación básica.

Vulkan es igual mente un api grafico multiplataforma solo que es una iteración mas novedosa, mas incluso suponiendo que OpenGl se lanzo al publico el año **1992** mientras que Vulkan el **2016** y al acceder a funciones aplicadas a tarjetas mas novedosas, nos permite interactuar con estas a un mayor rendimiento.

Aun así trabajaremos con OpenGl dado que su uso es mucho mas simple que el de Vulkan para la gente nueva en el mundo de la programación grafica.

Esto lo haremos por medio de una librería llamada **GLFW**.

Esta librería multiplataforma nos permite acceder a funcionalidades de **OpenGl** y **Vulkan** entregándonos distintas herramientas que no vienen por defecto con **OpenGl** como son:

+ La creación de ventanas.
+ Creación de contextos y superficies.
+ Lectura de input.
+ Manejo de eventos.
+ Entre otros.

---

# Configuración

Antes de iniciar con el código tendremos que "preparar" todo en nuestro proyecto, en este caso utilizaremos **Visual Studio Code** y enseñare la forma en la que puedes crear un proyecto y configurarlo en este editor.

Antes de continuar toma en cuenta que necesitaremos obviamente el editor **`Visual Studio Code`** a demás de un compilador de C++, en este caso utilizaremos **`MinGW`**.

---

## Creando un proyecto

Para crear nuestro proyecto simplemente seguiremos la siguiente estructura de archivos donde posicionaremos nuestros elementos:

+ NombreProyecto
  + **bin**: aquí agregaremos todos los elementos relevantes para nuestros ejecutables.
  + **include**: aquí agregaremos todos nuestros archivos con extensión **`.h`**.
  + **lib**: aquí agregamos todas nuestras librerías.
  + **src**: aquí es donde estará el código que nosotros nos encargaremos de escribir.
    + **`main.cpp`** este archivo sera donde nosotros 

Con esto listo debes asegurarte de descargar **GLFW** desde [el siguiente enlace](https://www.glfw.org/download.html), aquí descargaremos el binario pre-compilado de Windows para 64 bits (los "**bits**" a utilizar dependerán de la versión de **`MinGw`** que utilicemos para ejecutar nuestro código).

Ahora para utilizar las funcionalidades del mismo tenemos que agregar a la carpeta "**include**" los archivos que encontramos en la carpeta con el mismo nombre dentro del archivo extraíble que hemos descargado.

Y en nuestra "**lib**" haremos lo mismo respectivamente.


---

## Configurando Visual Studio Code

Por ultimo ya nos quedaría configurar el proyecto dentro de **Visual Studio Code**, en este tendremos que mencionar que carpeta de librerías revisar, que carpeta de "includes" utilizar y otros valores como donde deberíamos crear nuestros ejecutables.

Dentro de nuestra carpeta **`src`** crea un archivo con el nombre "**`main.cpp`**" y crea un "**hola mundo**".

Al hacerlo y ejecutarlo (con f5) veremos que en nuestras carpetas se creara una con el nombre **`.vscode`**, aquí integraremos la configuración de como se generara o leerá nuestro proyecto por el compilador interno de **Visual Studio Code**.

Entre estos archivos veremos uno con el nombre **`tasks.json`** donde encontraremos el campo **`args[]`** donde haremos lo siguiente:

~~~json
"args": [
	"-fdiagnostics-color=always",
	"-g",
    
    // nos encargamos de que se ejecuten/lean todos los archivos en "src" con extencion ".cpp"
	"${workspaceFolder}\\src\\*.cpp",
    
	"-o",
    // seleccionamos donde se creara nuestro ejecutable (en nuestro caso la carpeta bin)
	"${workspaceFolder}\\bin\\${fileBasenameNoExtension}.exe", // y le damos el nombre del archivo main

    // si utilizamos el metodo de agregar la libreria al proyecto simplemente usariamos:
	"-Iinclude",
	"-Llib",
    
    // agregamos las librerias
	"-lopengl32",
    "-lglfw3",
    "-lgdi32",
]
~~~

Listo, ahora por medios de prueba en nuestro **`Main.cpp`** haremos lo siguiente:

~~~c++
#include <iostream>
#include <GLFW/glfw3.h>

int main(int argc, char* args[]) // sdl necesita estos parametros si o si
{
    std::cout << "Hola!";
    std::cin.get();
    
    return 0; // sdl necesita retornar 0 si o si
}
~~~

Al presionar **`f5`** se debería generar un ejecutable en nuestra carpeta **`bin`**, al ejecutarlo debería abrirse una terminal con un mensaje y al presiona `enter` esta debería cerrarse.

---

## Hola GLFW!

Como ya todos sabemos, al iniciar con un nuevo lenguaje  solemos hacer un "Hola Mundo!" y aquí no haremos una excepción.

La pagina de GLFW nos entrega un código básico encargado de crear una ventana vacía el cual se vera como el siguiente:

~~~c++
#include <GLFW/glfw3.h> // llamamos la libreria

int main(void)
{
    GLFWwindow* window;

    if (!glfwInit()) // inicia la libreria
        return -1;

    // "creamos el objeto" con una variable conteniendo la resolucion y titulo especificados
    window = glfwCreateWindow(640, 480, "Hello OpenGl", NULL, NULL);
    if (!window) // si la ventana ya no existe
    {
        glfwTerminate(); // la libreria se "termina"
        return -1; // se cierra el programa (returna un valor al main)
    }

    glfwMakeContextCurrent(window); // creamos el "contexto de la ventana"

    while (!glfwWindowShouldClose(window)) // mientras que la ventana (window) no este cerrada
    {
        
        // aqui va lo que se renderizara en la ventana
        glClear(GL_COLOR_BUFFER_BIT);

        /* Swap front and back buffers */
        glfwSwapBuffers(window);

        /* Poll for and process events */
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
~~~

Y como una prueba simple vamos a crear un triangulo en la pantalla.

**Disclaimer**: El código que utilizaremos para esto es una forma "legacy" de utilizar la librería, o sea no es la forma mas efectiva para hacer esto, el siguiente código utilízalo **solo como un ejemplo**.

Ya con el aviso listo, busca simplemente el bucle que se encarga de comprobar que la ventana no este cerrada y cámbialo por esto:

~~~c++
while (!glfwWindowShouldClose(window)) // mientras que la ventana (window) no este cerrada
{
    // aqui va lo que se renderizara en la ventana
    glClear(GL_COLOR_BUFFER_BIT);

    /* añadimos lo siguiente */
    glBegin(GL_TRIANGLES);
    glVertex2f(-0.5f, -0.5f); // un vertice esta posicionado en (-0.5, -0.5)
    glVertex2f(0.0f, 0.5f); // otro vertice en (0, 0.5)
    glVertex2f(0.5f, -0.5f); // el ultimo esta en (0.5, -0.5)
    glEnd();

    /* Swap front and back buffers */
    glfwSwapBuffers(window);

    /* Poll for and process events */
    glfwPollEvents();
}
~~~

---

# OpenGl moderno

**OpenGl** salió originalmente en su versión **1.0** el año **1992**, esta version del **API** era algo rara por lo que luego el año **1997**, una version mas moderna fue publicada, siendo lo que hoy conocemos como **OpenGl 1.1**.

**OpenGl** se ha seguido actualizando con el tiempo pero Windows por defecto solo entrega acceso a la versión **1.1**, por lo que necesitamos una forma de acceder a todas las nuevas utilidades que han salido con el tiempo en las nuevas versiones del **API**.

Como ya mencionamos con anterioridad **OpenGl** en si **no es una librería** ya que todas las funciones a las que queremos acceder (de la versión 1.1 en adelante), ya están incluidas en nuestra tarjeta grafica.

Pero para ello debemos poder **declarar estas funciones**, entregándonos acceso a las mismas, en nuestro código desde el driver de nuestra gpu, **accediendo así a los archivos `.dll` de estas funciones**.

Tras esto podremos tener acceso a estas funciones de la misma forma que tendríamos con un pointer **no accediendo a la función en si, sino a su espacio en la memoria**.

Podríamos hacer esto de forma manual, pero solo lograríamos un dolor de cabeza, ya que en cada sistema el nombre de los mismos `.dll` es distinto, por lo que habría que manualmente crear una versión distinta para cada sistema.

Para eliminarnos este problema, utilizaremos una librería.

---

## Configurando GLEW

**GLEW** es una librería para la "carga de archivos" integrando una forma eficiente de definir que archivos de **OpenGl** son compatibles con el dispositivo utilizado, lo que nos permite hacer nuestro código **Multiplataforma**. 

Este lo encontramos [en el siguiente enlace](http://glew.sourceforge.net/).

Por ahora descargaremos los binarios para Windows específicamente en la opción de "**Binaries Windows 32-bit and 64-bit**".

Al descargarlo, tendremos un archivo `.zip` del cual nos centraremos simplemente en las carpetas **`lib`** donde encontraremos 2 carpetas (una para **32 bits** y una de **64 bits** utilizaremos uno u otro dependiendo de la version de **MinGW**) y **`include`**, los elementos dentro de estas carpetas los llevaremos a los **`lib`** y **`include`** de nuestro proyecto.

Con esto hecho ya podremos empezar a trabajar con **GLEW**.

---

## Utilizando GLEW

Antes de poder escribir mas código tendremos que llamar a la librería recién agregada utilizando:

~~~c++
#include <GL/glew.h>
~~~

**Ojo:** a la hora de llamar a esta librería, si lo hacemos en el mismo archivo de **C++** en el que estamos llamando a **GLFW**, este ultimo deberá ser llamado **después de GLEW**, de la siguiente forma:

~~~c++
// en lugar de hacer esto:
#include <GLFW/glfw3.h>
#include <GL/glew.h>

// debemos hacer esto:
#include <GL/glew.h>
#include <GLFW/glfw3.h>
~~~

Ahora podemos iniciar nuestro **GLEW**, esto lo hacemos con la función **`glewInit()`** que por cierto **según la documentación** debemos posicionarlo **después** de crear un contexto valido de **OpenGl** por lo que cuando iniciemos **GLEW** lo haremos de la siguiente forma:

~~~c++
#include <GL/glew.h>
#include <GLFW/glfw3.h>

int main(void)
{
    GLFWwindow* window;

    if (!glfwInit())
        return -1;

    window = glfwCreateWindow(640, 480, "Hello OpenGl", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        return -1;
    }
	
    // aqui iniciamos el contexto de OpenGl
    glfwMakeContextCurrent(window);
    glewInit(); // por lo que desde aqui podemos iniciar Glew
    
    while (!glfwWindowShouldClose(window))
    {
        glClear(GL_COLOR_BUFFER_BIT);
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
~~~

La función `glewInit()` en si retorna un valor en especifico, si **GLEW** se ejecuta correctamente este valor será `GLEW_OK`, por lo que si queremos "comprobar que **GLEW** funcione correctamente" podemos hacer lo siguiente:

~~~c++
if (glewInit() != GLEW_OK)
{
    std::cout << "Glew ha tenido un error" << std::endl;
}
~~~

Esto nos mostrara un mensaje dependiendo de el estado de **GLEW**, recomiendo hacer la prueba, ingresarlo sobre el "contexto" de la ventana y debajo de este, para que veas que sobre el mismo se genera error.

Luego de haber iniciado nuestro **GLEW** sin problemas podremos en teoría revisar la versión actual de **OpenGl**, intenta ejecutar la siguiente línea después del `glewInit()` para probar si **GLEW** esta funcionando correctamente.

~~~c++
std::cout << glGetString(GL_VERSION) << std::endl;
~~~

---

# Vertex Buffer

Anteriormente por razones de prueba mostré como hacer un triangulo en **OpenGl** con el siguiente código:

~~~c++
glBegin(GL_TRIANGLES);
glVertex2f(-0.5f, -0.5f);
glVertex2f(0.0f, 0.5f);
glVertex2f(0.5f, -0.5f);
glEnd();
~~~

A pesar de llevar a cabo su función esto se considera "**legacy OpenGl**" o sea, una forma "vieja" y que ya no se utiliza para llevar a cabo este trabajo.

Actualmente se utiliza un método un poco mas complejo que requiere mas configuraciones para llevar a cabo una tarea como esta, pero por esa misma razón podemos lograr resultados mas poderosos que los que obtendríamos con **"legacy OpenGl"**.

Esto lo logramos gracias a los **Vertex Buffers**

---

## Que es un vertex buffer

Un **buffer** es una memoria donde se almacenan datos de forma temporal, como en este nuestro caso serian **la memoria ram** y  **la memoria vram de tu gpu**.

**El buffer normal** (**nuestra memoria ram**) es un gran lugar para almacenar información de forma eficiente para cuando la necesitemos, pero lastimosamente hay ciertos casos en los que necesitaremos almacenar y utilizar los datos de forma distinta, de forma mas eficiente y rápida.

Para ello tenemos los **Vertex Buffers**, estos son conjuntos de datos como los que tendríamos en la memoria ram, solo que estos se envían directamente en la **vram de tu gpu** y por medio de una función **`Draw()`** nos permite mostrar el resultado de estos datos en la pantalla.

---

## ¿Como hacer un Vertex Buffer?

Para hacer un Vertex Buffer tenemos que "generarlo/s" por medio de una función, su sintaxis es la siguiente:

~~~c++
// esto deberia ir abajo del "glewInit()"
unsigned int buffer; // creamos primero un unsigned int

// glGenBuffers(cantidad de Buffers, pointer de un int unsigned)
// haremos 1 buffer y referenciamos el pointer del int (este sera el "id" de nuestro buffer)
glGenBuffers(1, &buffer); 

// con el buffer ya creado ahora debemos "seleccionarlo" y esto en openGl se conoce como "binding"
glBindBuffer(GL_ARRAY_BUFFER, buffer); // seleccionamos el buffer como un "array"
~~~

El bind es totalmente necesario ya que nos permite seleccionar que es lo que se mostrara al ejecutar la función **`Draw()`**

Ahora simplemente podemos definir los valores que representan la forma que deseamos crear por medio de por ejemplo un array, el cual contendrá todos los valores necesarios, como en el siguiente ejemplo:

~~~c++
float triangulo[6] // recomiendo posicionar esto en la seccion de variables de tu codigo
{
   -0.5f, -0.5f, // cada vertice se define en base a 2 coordenadas
	0.0f,  0.5f,
 	0.5f, -0.5f
};

/* 
	definimos los datos del buffer pasando:
		- tipo de dato del buffer (array)
		- tamaño del buffer en bytes
		- datos a leer
		- ripo de renderizacion
*/
glBufferData(GL_ARRAY_BUFFER, 6 * sizeof(float), triangulo, GL_STATIC_DRAW);
glEnableVertexAttribArray(0); // activamos los vertex seleccionados dandole el "id" = 0
~~~

Quizá te preguntes **¿a que te refieres con tipo de renderizado?** en realidad es algo simple, esto define la cantidad de veces que se editara el buffer y la cantidad de veces que se mostrara en pantalla en base a 3 tipos:

+ STREAM: el contenedor de datos se modificara una vez y se mostrara en pantalla unas cuantas veces (no se utiliza tanto).
+ STATIC: el contenedor de datos se modificara una vez y se mostrara en pantalla muchas veces (ideal para imágenes estáticas).
+ DYNAMIC: el contenedor de datos se modificara repetidamente y se mostrara en pantalla muchas veces (ideal para animaciones).

Felicidades ahora podemos dibujar en la pantalla utilizando la siguiente lineal de código:

~~~c++
// glDrawArrays(la forma a dibujar, el indice del inicio del vertex activado, cuantos vertices contar)
glDrawArrays(GL_TRIANGLES, 0, 3);
~~~

Lastimosamente al utilizar esta función no veras nada, aun nos faltan ciertos pasos como lo es el hacer un shader, pero por ahora al menos ya puedes decir que tu buffer esta listo.

---

## Atributos de un vertex

A la hora de crear nuestros buffers es probable que te hagas ciertas preguntas, especialmente sobre como es que **OpenGl** sabe interpretar nuestros buffers, como sabe que significa que.

A la hora de hacer un **Vertex Buffer** Tenemos que definir **el como OpenGl leerá nuestros datos**, especificando exactamente que significa cada uno de ellos, si es una posicion, un color, una textura, etc...

**Ojo:** el proceso de entregarle atributos a un vertex debe hacerse después de "seleccionar" (**`glBindBuffer()`**) nuestro buffer y también recomiendo hacerlo después de entregarle los datos al mismo (**`glBufferData()`**).

Para elegir cual es el "layout" de nuestro buffer utilizaremos la función **`glVertexAttribPointer()`**, el mismo posee los siguientes parámetros:

+ **Índice**: Este elemento hace referencia al índice del array al que le daremos un tipo de atributo.

  ---

+ **Tamaño**:  Es la cantidad de valores que le pasaremos **dependiendo de los vértices**, por ejemplo:

  ~~~c++
  float triangulo[6]
  {
     -0.5f, -0.5f, // en este caso cada vertice equivale a 2 floats
  	0.0f,  0.5f,
   	0.5f, -0.5f
  };
  ~~~

  Por lo que el "tamaño de un vértice" es de 2 floats.

  ---

+ **Tipo de dato**: dependiendo del tipo de dato de los valores del array, por ejemplo en el caso de nuesro triangulo usariamos **`GL_FLOAT`**, para encontrar mas  [Revisa el siguiente enlace](https://docs.gl/gl4/glVertexAttribPointer).

  ---

+ **Normalized**: especifica si los valores serán normalizados, **este lo dejaremos con `GL_FALSE`**.

  ---

+ **Stride**: define el espacio que hay entre el inicio de un buffer y el inicio del siguiente **en bytes**, esto para saber exactamente cada cuando "inicia el siguiente vertex del buffer".

  Por ejemplo, imagina que tienes el siguiente buffer: **`[[x1],[y1],[z1],[x2],[y2],[z2],[x3],[y3],[z3]]`** y que cada valor del mismo es un **float**.

  Cada valor `x`, `y` & `z` representan coordenadas de los vértices `1`, `2` y `3` respectivamente.

  Como cada valor es un **float**, estos poseen un valor de 4Bytes, suponiendo que hay 3 valores significa que **el stride entre las coordenadas del objeto 1 y las coordenadas del objeto 2 es de 12Bytes (4*3)**.

  O sea que si iniciamos en el índice `0` daremos con el `x1`, si avanzamos 12Bytes llegamos a `x2` y así sucesivamente

  ---

+ **Offset**: define el espacio que hay entre el inicio de un atributo de un vertex y el siguiente **en bytes**, esto para por ejemplo saber que valores representan la posición, cuales representan el color, cuales representan las coordenadas de texturas, etc...

  Por ejemplo, imagina que tienes el siguiente buffer: **`[[x1],[y1],[z1],[r1],[g1],[b1],[nx1],[ny1],[nz1]]`** y que cada valor del mismo es un **float**.

  Este buffer pertenece a solo un vertex pero se divide en 3 atributos y su offset se puede calcular según lo siguiente:

  | Indice |      Atributos      | Inicio | offset       |
  | :----: | :-----------------: | :----: | ------------ |
  |   0    |  `x1`, `y1`, `z1`   |   0    | 0*4 = **0**  |
  |   1    |  `r1`, `g1`, `b1`   |   3    | 3*4 = **12** |
  |   2    | `nx1`, `ny1`, `nz1` |   6    | 6*4 = **24** |

  Esto significa que:

  + **El atributo 0** inicia en el Byte **0** del buffer.
  + **El atributo 1** inicia en el Byte **12** del buffer.
  + **El atributo 2** inicia en el Byte **24** del buffer.

Estos últimos valores tanto el **Stride** como el **Offset** son valores relativamente complejos, por lo que existen formas para hacer estos mas fáciles, aun así es preferible que entiendas antes la forma en la que estos valores funcionan.

Finalmente llegando al ejemplo del triangulo suponiendo que nuestro triangulo se estructura asi:

~~~c++
float triangulo[6]
{
    -0.5f, -0.5f,
     0.0f,  0.5f,
     0.5f, -0.5f
};
~~~

A la hora de utilizar la función haremos lo siguiente:

~~~c++
/*
	- primero entregamos el inicio del array (0)
    - luego pasamos la cantidad de datos que hacen un vertex (2 floats por vertex)
    - el tipo de dato de los valores (float)
    - si queremos normalizar (false)
    - el striide entre un vertex y el siguiente (el tamaño de un float * 2 = 8bytes por vertex
    - al no tener atributos no hace falta agregar un offset (0)
*/

// finalmente la funcion se veria de la siguiente forma:
glVertexAttribPointer(0,2,GL_FLOAT, GL_FALSE, sizeof(float) * 2, 0);
~~~

Aun que mas adelante ya veremos mas formas de utilizar estas funciones.

---

# Shaders

En las secciones anteriores nos encargamos de crear los datos que representaran nuestras figuras "al menos lógicamente", pero aun nos queda un paso importante.

Y es el programar **los shaders** de nuestras figuras.

Un **shader** es una parte programable de nuestro **graphics pipeline**, **una característica del OpenGl moderno** que nos permite escribir programas en nuestra **GPU**.

---

## Graphics Pipeline

Antes de continuar con lo que es un **shader**, revisaremos un concepto teorico util para entender como **OpenGl** se encargara de tomar nuestros datos y transformarlos finalmente en una forma construida.

Este es el **Graphics pipeline**, el cual podemos definir como **el camino de un vertex/línea/triangulo desde los datos 3D, hasta tu pantalla en 2D**.

Esto dividiéndose en los siguientes pasos:

+ **`Vertex Specification`**: Donde configuramos nuestra geometría en el **CPU**.
+ **`Vertex Shader`**: Se ejecuta en cada vértice preocupándose de posicionarlos.
+ **`Tessellation`**: La subdivisión de formas (opcional).
+ **`Geometry shader`**: Genera mas formas desde una forma base (opcional).
+ **`Vertex post-processing`**: Modifica nuestros vertices.
+ **`Primitive assembly`**: Como ensamblamos los datos de nuestra geometría.
+ **`Rasterization`**: El rellenar los pixeles necesarios
+ **`Fragment shader`**: Se ejecuta una vez por cada fragmento/pixel permitiendo dar un color a cada pixel **rasterizado**.
+ **`Per-sample operations`**: Salida de datos.

---

## Escribiendo Shaders

Por ahora nos centraremos en 2 tipos de **shaders**:

+ **Vertex Shaders**: Se encarga de la posición de cada **vertex** (se ejecuta por cada **vertex**)
+ **Fragments Shader**: Se encarga de entregar un color por cada pixel **rasterizado** (se ejecuta por cada **pixel**).

Hay mas tipos de **shaders** pero por ahora y en la mayoría de proyectos, estos son los mas utilizados.

### Configurando Shaders

Antes de continuar con la escritura de **shaders**, tendremos que directamente seleccionar ciertos elementos sobre la lectura y compilación de los **shaders**, agregando las siguientes funciones:

~~~c++
// esta funcion se encargara de compilar nuestro shader
static unsigned int CompileShader(unsigned int type, const std::string& source)
{
    // creamos un shader con el tipo indicado
    unsigned int id = glCreateShader(type);
    const char* src = source.c_str(); // tambien podriamos usar &source[0] pero no lo recomiendo
    glShaderSource(id, 1, &src, nullptr);
    glCompileShader(id);

    int result;
    glGetShaderiv(id, GL_COMPILE_STATUS, &result);

    if (result == GL_FALSE)
    {
        int length;
        glGetShaderiv(id, GL_INFO_LOG_LENGTH, &length);
        // si intentamos hacer "char message[length];" no funcionara por lo que haremos:
        char* message = (char*)alloca(length * sizeof(char));
        glGetShaderInfoLog(id, length, &length, message);
        std::cout << "Failed to compile" << (type == GL_VERTEX_SHADER ? "Vertex" : "Fragment") << std::endl;
        std::cout << message << std::endl;
    }
    return id;
}

// esta funcion se encargara de cargar y crear el shader
static int CreateShader(const std::string& vertexShader, const std::string& fragmentShader) 
{
    unsigned int program = glCreateProgram(); // primero creamos un "programa"
    
    // luego creamos tanto el vertex como el fragment shader
    unsigned int vs = CompileShader(GL_VERTEX_SHADER, vertexShader);
    unsigned int fs = CompileShader(GL_FRAGMENT_SHADER, fragmentShader);

    // por ultimo ingresamos nuestros shaders al programa, los enlazamos y validamos
    glAttachShader(program, vs);
    glAttachShader(program, fs);
    glLinkProgram(program);
    glValidateProgram(program);

    // por ultimo eliminaremos los shaders
    glDeleteShader(vs);
    glDeleteShader(fs);

    return program;
}
~~~

