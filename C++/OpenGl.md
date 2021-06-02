# OpenGl

OpenGl (Open Graphic Library) es una **api de graficos**, multi-lenguaje y multi-plataforma que nos permite por medio de código **interactuar con gráficos 2D y 3D** o sea en términos simples es "un conjunto de funciones que nos dejan interactuar con gráficos en 2D y 3D" permitiéndonos en el proceso "acceder" a nuestra GPU.

Este tiene muchos usos en torno al desarrollo de contenido 2D y 3D, tanto como renderizar el contenido de una aplicación, realidad virtual y el principal de todos y en especifico en lo que nos centraremos durante esta documentación, "**el desarrollo de video juegos**".

Como ya mencione, **OpenGl** es "multi-lenguaje" o sea que el mismo puede ser ejecutado tanto con Java, C#, C++, entre muchos otros. y en nuestro caso, lo utilizaremos en el lenguaje **C++**.

---

## Pre-requisitos

Antes de iniciar a trabajar con OpenGl debemos hacer algunas cosas básicas, en este caso y lo principal es "crear una ventana", el problema es que implementar esto a mano significaría hacerlo 1 vez por cada sistema operativo, para evitar esto nosotros usaremos una librería que nos permite hacer esto llamada **GLFW**.

Esta es una librería de C++ que nos permite interactuar con ventanas de forma multiplataforma (para windows y mac hay una versión lista, en el caso de Linux hay que hacer unos datos extra).

Lo que haremos será descargar la librería desde [este link](https://www.glfw.org/download.html), específicamente recomiendo **descargar "el archivo pre compilado de windows de 32 bits"** para mayor facilidad en windows (luego veremos la forma de hacer lo mismo en otras plataformas).

Luego crearemos un **proyecto vacío en c++**, tras esto iremos al archivo del proyecto (mejor dicho al archivo de la solución ósea **donde encontramos el archivo `nombreProyecto.sln`**) y ahí crearemos una carpeta llamada "**Dependencias**" o dependencias en el que haremos una carpeta para **GLFW** en la que ingresaremos desde el archivo zip:

+ La carpeta "include"
+ La carpeta "lib" con la versión de nuestro visual studio (en mi caso lib-vc2019) dentro de este veremos varios archivos (solo nos importa el archivo que en mi caso tiene el nombre de "**glfw3.lib**" los demás podemos eliminarlos)

Tras esto debemos enlazar estos archivos a nuestro proyecto entrando en las propiedades de la solución (desde visual studio) y hacemos lo siguiente:

+ entrando a **`c/c++ > General`** buscaremos la casilla "Additional include directories" y añadimos donde ingresamos la carpeta "include" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLFW\include"`**
+ entrando a **`linker > General`** en "Additional library directories" añadimos donde ingresamos la carpeta "lib" de nuestro extraíble, en mi caso es **`$(SolutionDir)Dependencies\GLFW\lib-vc2019`**.
+ entrando a **`linker > Input`** en "Additional Dependencies" añadimos **`glfw3.lib;opengl32.lib;User32.lib;Gdi32.lib;Shell32.lib`** que son las librerías necesarias para que esto funcione.

Si hacemos 

---

## Hola mundo

Si tenemos todo configurado en la pagina de GLFW encontraremos un documento basico de "Hello World" que nos permite abrir una ventana vacia, ese codigo es el siguiente:

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

