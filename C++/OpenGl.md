# OpenGl

**Documentación escrita por Rodrigo Seguel**

Nuestro ordenador a la hora de ejecutar código usualmente lo hará desde el procesador y este se encargara de trabajar con la lógica de nuestros programas y juegos.

Pero ¿y si queremos ejecutar código que genere representaciones graficas por medio de nuestra **GPU**?, para esto debemos utilizar ciertas funciones que nos permitan usar acceder a esta, por medio de un "api" que en efecto nos permite interactuar con gráficos tanto en 2D como en 3D.

Hay varios en la actualidad como Direct3D, Vulkan y el que nos importa en esta documentación **OpenGl**.

Por cualquier duda también recomiendo echarle un vistazo a [esta documentación](https://docs.gl/)

---

## ¿Que es OpenGl?

Las diferencias principales entre estos es que tanto OpenGl y Vulkan dependen de la GPU, por lo que el sistema en el que se use no es tan importante, mientras que DirectX (o mejor dicho Direct3D) es una api que depende totalmente del sistema **dado que es exclusivo de Windows**, por lo que es optimo para este sistema, pero habrá que buscar otras opciones para Linux y Mac



---

## Pre-requisitos



Lo que haremos será descargar la librería desde [este link](https://www.glfw.org/download.html), específicamente recomiendo **descargar "el archivo pre compilado de windows de 32 bits"** para mayor facilidad en windows (luego veremos la forma de hacer lo mismo en otras plataformas).

Luego crearemos un **proyecto vacío en c++**, tras esto iremos al archivo del proyecto (mejor dicho al archivo de la solución ósea **donde encontramos el archivo `nombreProyecto.sln`**) y ahí crearemos una carpeta llamada "**Dependencias**" o dependencias en el que haremos una carpeta para **GLFW** en la que ingresaremos desde el archivo zip:

+ La carpeta "include"
+ La carpeta "lib" con la versión de nuestro visual studio (en mi caso lib-vc2019) dentro de este veremos varios archivos (solo nos importa el archivo que en mi caso tiene el nombre de "**glfw3.lib**" los demás podemos eliminarlos)

Tras esto debemos enlazar estos archivos a nuestro proyecto entrando en las propiedades de la solución (desde visual studio) y hacemos lo siguiente:

+ entrando a **`c/c++ > General`** buscaremos la casilla "Additional include directories" y añadimos donde ingresamos la carpeta "include" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLFW\include`**
+ entrando a **`linker > General`** en "Additional library directories" añadimos donde ingresamos la carpeta "lib" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLFW\lib-vc2019`**.
+ entrando a **`linker > Input`** en "Additional Dependencies" añadimos **`glfw3.lib;opengl32.lib;User32.lib;Gdi32.lib;Shell32.lib`** que son las librerías necesarias para el correcto funcionamiento de GLFW.

---

## Hola mundo

Si tenemos todo configurado en la pagina de GLFW encontraremos un documento básico de "Hello World" que nos permite abrir una ventana vacía, ese código es el siguiente:

~~~c++
#include <GLFW/glfw3.h> // llamamos la libreria

int main(void)
{
    GLFWwindow* window;

    if (!glfwInit()) // inicia la libreria
        return -1;

    // "creamos el objeto" ventana en base a una variable que la creara con la resolucion y titulo especificados
    window = glfwCreateWindow(640, 480, "Hello OpenGl", NULL, NULL);
    if (!window) // si la ventana ya no existe
    {
        glfwTerminate(); // la libreria se "termina"
        return -1; // se cierra el programa (returna un valor al main)
    }

    glfwMakeContextCurrent(window);

    // se repite mientras el usuario no cierre la ventana
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

Ahora como prueba mostraremos un triangulo en la pantalla, para esto usaremos algo de código legacy (ósea código viejo) pero actualmente hay mejores formas de hacerlo, aun que eso lo veremos mas adelante, por ahora y por bien de la facilidad y de comprobar el funcionamiento de openGl haremos lo siguiente:

Buscamos el bucle que renderiza las imágenes en pantalla (búscalo en el código que añadí anteriormente):

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

Ahora, hacer esto de forma manual seria solo un dolor de cabeza dado que dejaría de ser "multiplataforma"  dado que manualmente deberíamos buscar este `.dll` manualmente, para evitar esto utilizaremos una librería.

---

## GLEW



Dentro de la carpeta **GLEW** veremos una carpeta "lib" y una "include" ambos tenemos que enlazarlos desde los archivos a nuestro proyecto entrando en las propiedades de la solución (desde visual studio) y hacemos lo siguiente:

+ entrando a **`c/c++ > General`** buscaremos la casilla "Additional include directories" y añadimos donde ingresamos la carpeta "include" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLEW\include`** (recuerda que si ya hay algo debes usar `directorio1;directorio2`).

  o sea que en nuestro caso debería quedar: **`$(SolutionDir)Dependencies\GLFW\include;$(SolutionDir)Dependencies\GLEW\include`**

+ entrando a **`linker > General`** en "Additional library directories" añadimos donde ingresamos la carpeta "lib" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLEW\lib`**(recuerda que si ya hay algo debes usar `directorio1;directorio2`).

  o sea que en nuestro caso debería quedar: **`$(SolutionDir)Dependencies\GLFW\lib-vc2019;$(SolutionDir)Dependencies\GLEW\lib/Release/Win32`**.

+ Por ultimo enlazamos el archivo de la librería, en este caso al abrir **lib > Release > win32** nos daremos cuenta de que tenemos 2 archivos, nosotros nos centraremos en `glew32s.lib` dado que este es el archivo que contiene todas las funciones de la librería.

  Para utilizar este debemos entrando a **`linker > Input`** en "Additional Dependencies" añadir `glew32s.lib` a la lista de librerías ya añadidas, o sea que en nuestro caso debería quedar:  **`glfw3.lib;opengl32.lib;User32.lib;Gdi32.lib;Shell32.lib;glew32s.lib`**.

Y por ultimo debemos añadir una configuración a visual studio para trabajar con GLEW.

Para esto vamos a las propiedades de la solución y entramos en `C/C++ > Preprocessor` y en la opción **Preprocessor definitions** añadimos el valor **GLEW_STATIC** (recuerda separarlo con un ";" de ya existentes)

---

## Usando GLEW

Para empezar a usar Glew debemos iniciar llamando la librería que anteriormente añadimos de la siguiente forma en nuestro proyecto:

~~~c++
#include <GL/glew.h> // llamamos la libreria en nuestro proyecto
~~~

Algo importante es que si tenemos mas de una librería en el mismo archivo de c++, y estos son llamados **antes** que glew, nos generara errores, por lo que:

~~~c++
// en lugar de hacer esto:
#include <GLFW/glfw3.h>
#include <GL/glew.h>

// debemos hacer esto:
#include <GL/glew.h>
#include <GLFW/glfw3.h>
~~~

Tras esto debemos "inicializar" glew, esto lo hacemos con la función `glewInit()` de la siguiente forma:

~~~c++
#include <GL/glew.h> // llamamos la libreria en nuestro proyecto
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

    glfwMakeContextCurrent(window);
	// aqui debemos iniciar glew, dado que segun la documentacion "antes hay que crear un conntexto de OpenGl valido"
    glewInit();
    
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

Glew init en si retorna un valor en especifico, si Glew se ejecuta correctamente este valor será `GLEW_OK`, por lo que si queremos "comprobar que glew funcione correctamente" podemos hacer lo siguiente:

~~~c++
if (glewInit() != GLEW_OK)
{
    std::cout << "Glew ha tenido un error" << std::endl;
}
~~~

Esto nos mostrara un mensaje dependiendo de el estado de Glew, recomiendo hacer la prueba, ingresarlo sobre el "contexto" de la ventana y debajo de este, para que veas que sobre el mismo se genera error.

Técnicamente en este estado nuestro glew ya se habrá iniciado, solo que a la vez hacemos una comparación de si este funciona o no, además (después de iniciar glew) podemos ver la versión de OpenGl junto a la de los drivers de tu tarjeta grafica, haciendo lo siguiente:

~~~c++
if (glewInit() != GLEW_OK)
{
    std::cout << "Glew ha tenido un error" << std::endl;
}

std::cout << glGetString(GL_VERSION) << std::endl;
~~~

---

# Vertex Buffers y Shaders

Anteriormente mostré una prueba con OpenGl donde mostraba un triangulo en pantalla con el siguiente código:

~~~c++
glBegin(GL_TRIANGLES);
glVertex2f(-0.5f, -0.5f);
glVertex2f(0.0f, 0.5f);
glVertex2f(0.5f, -0.5f);
glEnd();
~~~

Esto es algo que se conoce como **Legacy OpenGl** o sea, usamos funciones que se considerarían como un método "viejo" para aplicar renderizado de gráficos el cual en este caso es un triangulo.

Actualmente la forma en la que se hace esto es mas compleja y requiere mas configuraciones para trabajar con estos, pero aun así es mucho mas poderoso en lo que podemos lograr con "Legacy OpenGl".

Y para lograr esto debemos **lograr hacer un "vertex buffer" y también lograr hacer un shader**.

---

## ¿Que es un Vertex Buffer?

Un **Vertex buffer** es en si un "buffer" (un espacio en la memoria donde se almacenan datos de forma temporal) solo que en lugar de ser almacenados en la memoria ram **son almacenados en la memoria VRAM o la capacidad de memoria de nuestra GPU** así permitiéndonos almacenar no "datos lógicos" sino "array de bytes" que representa los datos del objeto a mostrar en pantalla. 

Esto después nos permite hacer algo llamado "Draw call" o "llamada de dibujo" que en si nos  permite acceder a estos datos almacenados en la VRAM, llamarlos y mostrarlos en pantalla.

---

## ¿Como hacer un Vertex Buffer?

Para hacer un Vertex Buffer tenemos que "generarlo/s" por medio de una función, su sintaxis es la siguiente:

~~~c++
// glGenBuffers(cantidad de Buffers, pointer de un int unsigned)
unsigned int buffer; // creamos primero el unsigned int
glGenBuffers(1, &buffer); // haremos 1 buffer y referenciamos el pointer del int (este sera el "id" de nuestro buffer)

// con el buffer ya creado ahora debemos "seleccionarlo" y esto en openGl se conoce como "binding"
glBindBuffer(GL_ARRAY_BUFFER, buffer); // primero definimos que los datos del buffer son un array y luego el bufffer al que pertenecen
~~~

Ahora debemos "definir los datos que van dentro del buffer" pero esto no lo hacemos añadiendo los adtos directamente, primero definimos el tamaño de los datos.

Basémonos en los datos vistos en el triangulo que hicimos anteriormente:

~~~c++
/*
-0.5f, -0.5f
 0.0f,  0.5f
 0.5f, -0.5f
*/

// en lugar de ingresarlos de 1 en 1 como hicimos anteriormente, podemos hacer un array
float posiciones[6]
{
   -0.5f, -0.5f, // esto es un vertice que se define en base a 2 cordenadas
	0.0f,  0.5f, // esto es otro vertice que se define en base a 2 cordenadas
 	0.5f, -0.5f // esto es otro vertice que se define en base a 2 cordenadas
};

// Ahora "definamos" los datos del buffer (glBufferData(GL_ARRAY_BUFFER, tamaño del buffer en bytes, datos, tipo de renderizado))
glBufferData(GL_ARRAY_BUFFER, 6 * sizeof(float), posiciones, GL_STATIC_DRAW);
// en este caso tenemos 6 floats dentro del array por lo que el tamaño es (tamaño de array) * 6
~~~

Quizá te preguntes **¿a que te refieres con tipo de renderizado?** en realidad es algo simple, esto define la cantidad de veces que se editara el buffer y la cantidad de veces que se mostrara en pantalla en base a 3 tipos:

+ STREAM: el contenedor de datos se modificara una vez y se mostrara en pantalla unas cuantas veces (no se utiliza tanto).
+ STATIC: el contenedor de datos se modificara una vez y se mostrara en pantalla muchas veces (ideal para imágenes estáticas).
+ DYNAMIC: el contenedor de datos se modificara repetidamente y se mostrara en pantalla muchas veces (ideal para animaciones).

Ahora para "dibujar en pantalla" el buffer debemos crear un shader pero por bien de la documentación vamos a ver el método que nos permite hacer esto aun que por ahora no hará efecto dado que como ya mencione, **necesitamos shaders**).

Por ahora usaremos **glDrawArrays()** usando la siguiente sintaxis:

~~~c++
// glDrawArrays(lo que se mostrara en pantalla, el indice del array desde donde iniciamos, cuantos vertices contar)
glDrawArrays(GL_TRIANGLES, 0, 3);
~~~

Y como ya hice mención, esto en teoría **debería** mostrar nuestro triangulo en pantalla, pero como ya mencione, aun debemos hacer el shader para esto por lo que aun quedan unos pasos antes de poder renderizar un triangulo con OpenGl.

---

