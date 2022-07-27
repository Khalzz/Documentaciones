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

---

# GLFW

Hay ciertos elementos que **OpenGl** no permite por defecto, como la creación de ventanas y el input del usuario.

Por ello utilizaremos una librería llamada **GLFW**.

Esta librería multiplataforma nos permite acceder a funcionalidades de **OpenGl** y **Vulkan** entregándonos distintas herramientas que no vienen por defecto con **OpenGl** como son:

+ La creación de ventanas.
+ Creación de contextos y superficies.
+ Lectura de input.
+ Manejo de eventos.
+ Entre otros.

Lo que haremos será descargar la librería desde [este link](https://www.glfw.org/download.html), específicamente recomiendo **descargar "el archivo pre compilado de windows de 64 bits"** para mayor facilidad en windows (luego veremos la forma de hacer lo mismo en otras plataformas).

Luego crearemos un **proyecto vacío en c++**, tras esto iremos al archivo del proyecto (mejor dicho al archivo de la solución ósea **donde encontramos el archivo `nombreProyecto.sln`**) y ahí crearemos una carpeta llamada "**Dependencies**" o dependencias en el que haremos una carpeta para **GLFW** en la que ingresaremos desde el archivo zip:

+ La carpeta "include"
+ La carpeta "lib" con la versión de nuestro visual studio (en mi caso lib-vc2022) dentro de este veremos varios archivos (solo nos importa el archivo que en mi caso tiene el nombre de "**glfw3.lib**" los demás podemos eliminarlos)

Tras esto debemos enlazar estos archivos a nuestro proyecto entrando en las propiedades de la solución (desde visual studio) y hacemos lo siguiente:

+ entrando a **`c/c++ > General`** buscaremos la casilla "Additional include directories" y añadimos donde ingresamos la carpeta "include" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLFW\include`**
+ entrando a **`linker > General`** en "Additional library directories" añadimos donde ingresamos la carpeta "lib" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLFW\lib-vc2022`**.
+ entrando a **`linker > Input`** en "Additional Dependencies" añadimos **`glfw3.lib;opengl32.lib;User32.lib;Gdi32.lib;Shell32.lib`** que son las librerías necesarias para el correcto funcionamiento de GLFW.

Al tener todo esto listo, recuerda revisar si tu proyecto esta siendo compilado como uno de **32** o **64** bits, dependiendo de la versión utilizada de **GLFW**, a demás tendrás que seleccionar las librerías especificas.

---

## Hola GLFW!

Como ya todos sabemos, al iniciar con un nuevo lenguaje  solemos hacer un "Hola Mundo!" y aqui no haremos una exepcion.

La pagina de GLFW nos entrega un codigo basico encargado de crear una ventana vacia el cual se vera como el siguiente:

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

Por ahora descargaremos los binarios para Windows específicamente en la opción de "**Binaries Windows 32-bit and 64-bit**"

Al descargarlo, tendremos un archivo `.zip` el cual extraeremos, la carpeta resultante la renombraremos por **`GLEW`**, y la llevaremos a nuestra carpeta de **`Dependencies`** dentro de nuestro proyecto, en el mismo lugar donde anteriormente agregamos la carpeta **`GLFW`**.

Dentro de la carpeta **`GLEW`** tendremos tanto una carpeta **`lib`** como una **`includo`**, estas las enlazaremos al proyecto en si de forma similar a como agregamos las dependencias anteriores.

+ Entrando a **`c/c++ > General`** buscaremos la casilla **`Additional include directories`** y añadimos donde ingresamos la carpeta "include" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLEW\include`**.

  ---

+ Entrando a **`linker > General`** en "**`Additional library directories`**" añadimos donde ingresamos la carpeta "lib" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLEW\lib\Release\Win32`**. 

  ---

+ Por ultimo enlazamos el archivo de la librería, en este caso al abrir **`lib > Release > win32`** nos daremos cuenta de que tenemos 2 archivos, nosotros nos centraremos en `glew32s.lib` dado que este es el archivo que contiene todas las funciones de la librería.

  Para utilizar este debemos entrando a **`linker > Input`** en **`Additional Dependencies`** añadir `glew32s.lib` a la lista de librerías ya añadidas.

Por ultimo debemos añadir una configuración a visual studio para trabajar con GLEW.

Para esto vamos a las propiedades de la solución y entramos en `C/C++ > Preprocessor` y en la opción **`Preprocessor definitions`** añadimos el valor **`GLEW_STATIC`** .

**Recuerda que para separar texto en estas opciones debemos utilizar `;` en lugar de `,`**

---

## Utilizando GLEW

Antes de poder escribir mas código tendremos que llamar a la libreria recien agregada utilizando:

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

# Vertex Buffer y Shaders

Anteriormente por razones de prueba mostre como hacer un triangulo en **OpenGl** con el siguiente codigo:

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
~~~

Quizá te preguntes **¿a que te refieres con tipo de renderizado?** en realidad es algo simple, esto define la cantidad de veces que se editara el buffer y la cantidad de veces que se mostrara en pantalla en base a 3 tipos:

+ STREAM: el contenedor de datos se modificara una vez y se mostrara en pantalla unas cuantas veces (no se utiliza tanto).
+ STATIC: el contenedor de datos se modificara una vez y se mostrara en pantalla muchas veces (ideal para imágenes estáticas).
+ DYNAMIC: el contenedor de datos se modificara repetidamente y se mostrara en pantalla muchas veces (ideal para animaciones).

Felicidades ahora podemos dibujar en la pantalla utilizando la siguiente lineal de código:

~~~c++
// glDrawArrays(la forma a dibujar, el indice del array donde iniciamos, cuantos vertices contar)
glDrawArrays(GL_TRIANGLES, 0, 3);
~~~

Lastimosamente al utilizar esta función no veras nada, aun nos faltan ciertos pasos como lo es el hacer un shader, pero por ahora al menos ya puedes decir que tu buffer esta listo.

