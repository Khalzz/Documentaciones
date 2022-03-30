# SDL2

SDL2 es una librería de desarrollo multiplataforma diseñada para entregar acceso de nivel bajo a **audio**, **input de un usuario** y **hardware grafico** vía **OpenGl, Direct3D, Metal y Vulkan**.

Usado tanto para **desarrollo de videojuegos** como para **programas de consumo de multimedia**, SDL (tanto el original como el actual) se ha usado en multiples proyectos de relativa importancia, como son:

* Los motores **Source** y **Golden source** de **valve**.
* **Half Life 2**.
* **Counter Strike: Global Offensive**.
* **FTL: Faster Than Light**.
* **Factorio**.
* Entre muchos otros...

Esta librería en su mayoría es usada con el lenguaje **C++** con el que lo usaremos en esta documentación.

---

# Mis primeros pasos en SDL2

Como es obvio tenemos que empezar por el principio y la mejor forma es:

## Creando un proyecto con SDL2

En si esta librería no requiere de una "instalación", lo que si requiere es de una configuración para poder "**aplicarlo en nuestro código**" por lo que haremos lo siguiente:

1. **Creamos un proyecto vacío de c++** (en Visual Studio).
2. **Descargamos SDL2 en [el siguiente enlace](https://www.libsdl.org/download-2.0.php)** (selecciona la opción SDL2-devel-2.0.20-**VC**.zip (Visual C++ 32/64-bit)) debe traer el VC
3. El archivo que nos de debemos **extraerlo, renombrarlo (si quieres) y llevarlo a la carpeta de nuestro proyecto** (yo lo llamare "SDL2")
4. **Entramos a las propiedades del proyecto** en **`Proyect > proyect-name Properties`**.
5. En la opción "**C/C++**", en esta opción seleccionamos "**Additional include directories**", en esta opción haremos lo siguiente:
   1. Seleccionamos la flecha abajo y presionamos **`<Edit...>`**.
   2. Presionamos el botón **New Line** (el botón con el logo de la carpeta).
   3. Seleccionamos la carpeta **include** dentro de nuestro archivo de la librería.
   4. Damos **Ok** y **Apply**.
6. Tras esto en la opción "**Linker**" en "**General**" repetimos un proceso similar al anterior en la opción "**Additional Library Directories**":
   1. Seleccionamos la flecha abajo y presionamos **`<Edit...>`**.
   2. Presionamos el botón **New Line** (el botón con el logo de la carpeta).
   3. Seleccionamos la carpeta **lib** y seleccionamos una opción u otra según nuestro sistema (en mi caso seleccionare **x64**).
   4. Damos **Ok** y **Apply**.
7. Por ultimo agregamos el archivo **SDL2.dll** al archivo de nuestro proyecto, para esto:
   1. Vamos al **Solution Explorer** y damos clic derecho en nuestro proyecto para y damos en **Open Folder in File Explorer**
   2. Copiamos aquí el archivo **SDL2.dll** que encontramos en la carpeta de nuestra librería (**`SDL2/lib/x64`**)

Listo, con esto hecho ya deberíamos poder trabajar totalmente en nuestro proyecto.

---

# Creando una ventana

A la hora de crear una ventana tenemos que ejecutar varios "pasos" para que este proceso se ejecute de forma eficiente y funcional, desde **iniciar el funcionamiento de SDL** hasta obviamente **cerrarlo**, a este proceso me gusta llamarlo el "ciclo de vida de una ventana".

## El ciclo de vida de una ventana

Las ventanas al menos en términos programáticos deben seguir los siguientes pasos para funcionar:

1. **Iniciación de SDL**.

   Uno de los pasos esenciales es **iniciar SDL** permitiéndonos acceder tanto a funciones como a elementos provenientes a la generación de la pagina.

2. **Creación de la ventana**

   Creamos la ventana como una variable de tipo **`SDL_Window`** a esta variable le entregamos la función **`SDL_CreateWindow()`** y esta toma como parámetro:

   1. **El nombre de la ventana**.
   2. **La posición de la ventana en la pantalla (en el eje x, en el eje y).**
   3. **Las dimensiones de la ventana (en el eje x, en el eje y).**
   4. **Elemento para mostrar la ventana**, en este caso es **`SDL_WINDOW_SHOWN`**.

3. **Crear superficie y actualizarla**

   La superficie es el lugar o "la zona" que tenemos disponible para dibujar imágenes en la ventana y para poder trabajar con esta la instanciamos como una  variable y le entregamos una función que marca la superficie de la ventana como disponible.

4. **Cerrar SDL**

   Cuando puesta ventana llega al final de su vida o la cerramos, tenemos que encargarnos de cerrar el funcionamiento de SDL, a demas de cerrar las superficies creadas.

Ya con esto listo podemos comenzar a crear ventanas, aquí tienen un ejemplo de todo esto funcionando.

~~~cpp
#include <iostream>
#include <SDL.h> 
#include <stdio.h>

int main(int argc, char* args[])
{
	SDL_Init(SDL_INIT_EVERYTHING); // iniciamos SDL
	SDL_Window* ventana = SDL_CreateWindow("Ventana de prueba", 100, 100, 640, 480, SDL_WINDOW_SHOWN); // creamos la ventana

	if (!ventana) { // comprobamos que no hayan errores en la creacion de la ventana
		std::cout << "Algo ha fallado al crear la ventana! Error: " << SDL_GetError() << std::endl;
	}

	SDL_Surface* superficieVentana = SDL_GetWindowSurface(ventana); // creamos la supperficie
	SDL_UpdateWindowSurface(ventana); // actualizamos la superficie
	
	SDL_Delay(2000); // ESPERAMOS 2 SEGUNDOS (SOLO PARA QUE NO SE CIERRE AL INSTANTE)

	// PROCESO DE CIERRE
	SDL_DestroyWindow(ventana); // PRIMERO DESTRUIMOS LA VENTANA

	// Y ELIMINAMOS LOS DATOS DE NUESTRAS VENTANAS Y SUPERFICIES
	ventana = NULL;
	superficieVentana = NULL;
	SDL_Quit(); // POR ULTIMO CERRAMOS SDL
	return 0;
}
~~~

---

## Modularizando 

Una idea fundamental para el funcionamiento eficaz del código es el "**Modularizarlo**" así preparamos nuestro desarrollo para futuras ediciones, facilitándonos el agregar funcionalidades nuevas y aumentar el tamaño de nuestro proyecto.

En este caso como en muchos otros es posibles y la forma que aplicamos para lo anteriormente visto seria la siguiente:

~~~cpp
#include <iostream>
#include <SDL.h> 
#include <stdio.h>

bool init(); // creamos una funcion para iniciar sdl
void close(); // creamos otra funcion para cerrar sdl

// CREAMOS LA VENTANA Y SUPERFICIE COMO ELEMENTOS GLOBALES
SDL_Window* VENTANA_G = NULL;
SDL_Surface* SUPERFICIE_VENTANA_G = NULL;

int main(int argc, char* args[])
{
    if (!init()) // si la funcion 
    {
        printf("Failed to initialize!\n");
    }
    else
    {
        SDL_UpdateWindowSurface(VENTANA_G); // Actualizamos la superficie
        SDL_Delay(5000); // Esperamos 2 segundos
    }
    close(); // luego de todo cerramos la ventana
    return 0;
}

bool init()
{
    bool success = true;
    if (SDL_Init(SDL_INIT_VIDEO) < 0) // devuelve 0 al ser eccitoso pero si es menor
    {
        printf("SDL no se ha iniciado correctamente! SDL_Error: %s\n", SDL_GetError()); // mostramos un mensaje de error
        success = false;
    }
    else
    {
        // creamos la ventana (si en la posicion de la ventana ponemos SDL_WINDOWPOS_UNDEFINED centramos la ventana)
        VENTANA_G = SDL_CreateWindow("Ventana de prueba", 100, 100, 680, 460, SDL_WINDOW_SHOWN);
        // CREAMOS LA SUPERFICIE
        if (VENTANA_G == NULL) // si la ventana no se ha creado
        {
            printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
            success = false; // la funcion no ha sido exitosa
        }
        else
        {
            // obtenemos la superficie de la ventana
            SUPERFICIE_VENTANA_G = SDL_GetWindowSurface(VENTANA_G);
        }
    }
    return success;
}

void close()
{
	SDL_DestroyWindow(VENTANA_G); // PRIMERO DESTRUIMOS LA VENTANA
	VENTANA_G = NULL;
	SUPERFICIE_VENTANA_G = NULL;
	SDL_Quit(); // POR ULTIMO CERRAMOS SDL
}
~~~

---

# Agregar imágenes en SDL

El proceso de agregar imagenes no es tan complejo como podrias creer, pero antes debes entender un concepto basico, el concepto de los **BMP**.

Usualmente consumimos 2 tipos de "imagenes" en el mundo digital:

1. **Vectoriales**: Son un conjunto de cálculos matemáticos que permiten la generación teórica de líneas y formas, estas se caracterizan por usualmente mantener su definición sin importar del aumento que se le aplique a la imagen.
   1. **Bitmaps**: Son imágenes generadas por medio de un "sistema de pixeles" o pequeños elementos cuadrados que poseen valores numéricos que representan el color de los mismos.

A la hora de ingresar imágenes en nuestra ventana estas prioritariamente deben ser un Bitmap **con extensión `.bmp`**(con ciertos cambios puede ser un png, jpg u otros, pero eso se vera mas adelante).

Y técnicamente hablando **las imágenes son superficies** esto es un elemento en el que nos adentraremos mas adelante.

Las imágenes poseen varias formas de ser trabajadas y utilizadas, algunas de estas son:

1. **Carga de bitmaps**: hacemos la búsqueda de los elementos que nos interese mostrar en pantalla (y muestra error en caso que no se logre).

   ~~~cpp
   SDL_Surface* imagen = SDL_LoadBMP( "Carpeta/imagen.bmp" ); // primero buscamos la imagen a uttilizar
   
   if ( !imagen ) {
   	// la imagen no se ha encontrado (se creativo)
   }
   ~~~

   **Importante:**

   Imagina las ventanas como una **mesa**, mientras que la "**superficie**"  es **el espacio disponible para posicionar elementos en la misma**, **mientras mas elementos posicionamos, menos espacio habrá para objetos futuros**, por lo que algo esencial para trabajar con las superficies de forma eficiente es **limpiarlas/vaciarlas**.

   Esto también se aplica a las imágenes cuando dejan de utilizarse y para lograrlo debemos hacer lo siguiente:

   ~~~cpp
   // si dejamos de usar una imagen o superficie dehbemos limpiarla con:
   SDL_FreeSurface(imagen); // en este caso limpiamos la imagen
   ~~~

   ---

2. **Guardado de bitmaps**: otra utilidad necesaria de vez en cuando es lo contrario a la carga de **bitmaps**, **el guardarlos**, tan simple como eso.

   Para esto simplemente usamos lo siguiente:

   ~~~cpp
   // esta funcion devuelve 0 si es exitosa, menos de 0 si algo falla
   int resultado = SDL_SaveBMP( superficie_a_guardar, "Carpeta/guardado.bmp" );
   
   if ( resultado < 0 ) {
   	// el guardado no se ha concretado (se creativo)
   }
   ~~~

   en este caso `superficie_a_guardar` es la superficie que en efecto será guardada y el lugar donde se guardara junto al nombre del archivo.

   ---

3. **Blitting de superficies**: este es el proceso de "dibujar una superficie en otra" permitiendo cosas como dibujar una imagen dentro de la superficie entregada a la ventana.

   ~~~cpp
   // creamos el destino en el que se mostrara en nuestra superficie
   SDL_Rect destino;
   destino.x = 100; // eje x
   destino.y = 50; // eje y
   
   // esta funcion devuelve 0 si es exitosa, menos de 0 si algo falla
   // (imagen a imprimir, null, superficie en la que se imprimira la imagen, destino de la superficie donde se pondra la imagen)
   int resultado = SDL_BlitSurface(imagen, NULL, superficieVentana, &destino); 
   if ( resultado < 0 ) {
   	// blit fallado (se creativo)
   }
   ~~~

   ---

4. **Escalado de imágenes**: este funciona similar al blitting de imágenes pero contiene mas datos a tomar en cuenta:

   ~~~cpp
   SDL_Rect destino;
   destino.x = 100; // posicion en el eje x
   destino.y = 50; // posicion en el eje y
   destino.w = 200; // escalado en el eje x
   destino.h = 100; // escalado en el eje y
   
   int resultado = SDL_BlitScaled( imagen, NULL, superficieVentana, &destino );
   
   if ( resultado < 0 ) {
   	// blit fallado (se creativo)
   }
   ~~~

Un ejemplo claro de la carga de una imagen seria:



~~~cpp
#include <SDL.h> 
#include <stdio.h>

bool init();

bool loadMedia(); //creamos una funcion que cargue la imagen

void close();

const int ANCHO_VENTANA = 640;
const int ALTO_VENTANA = 480;

SDL_Window* ventanaGlobal = NULL;
SDL_Surface* gScreenSurface = NULL;

SDL_Surface* gHelloWorld = NULL; //creamos la imagen que vamos a instanciar en la superficie

int main(int argc, char* args[])
{
    if (!init())
    {
        printf("Failed to initialize!\n");
    }
    else
    {
        if (!loadMedia())
        {
            printf("Failed to load media!\n");
        }
        else
        {
            //aplicamos la imagen
            SDL_BlitSurface(gHelloWorld, NULL, gScreenSurface, NULL);
            SDL_UpdateWindowSurface(ventanaGlobal); // actualizar la superficie de la ventana
            SDL_Delay(2000);
        }
    }
    // liberar recursos y cerrar
    close();
    return 0;
}

bool init()
{
    bool success = true;
    if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
        success = false;
    }
    else
    {
        ventanaGlobal = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, ANCHO_VENTANA, ALTO_VENTANA, SDL_WINDOW_SHOWN);
        if (ventanaGlobal == NULL)
        {
            printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
            success = false;
        }
        else
        {
            gScreenSurface = SDL_GetWindowSurface(ventanaGlobal);
        }
    }
    return success;
}

bool loadMedia() // esta funcion se dedicara a cargar la imagen y entregarla en la variable que vamos a utilizar
{
    // carga comletada (flag)
    bool success = true;
    // cargamos la imagen
    gHelloWorld = SDL_LoadBMP("Assets/Images/Banana.bmp");
    if (gHelloWorld == NULL) // en caso que la imagen no se encuentre
    {
        printf("Unable to load image %s! SDL Error: %s\n", "Assets/Images/Banana.bmp", SDL_GetError());
        success = false;
    }
    return success;
}

void close()
{
    // destruir superficie
    SDL_FreeSurface(gHelloWorld);
    gHelloWorld = NULL;

    SDL_DestroyWindow(ventanaGlobal);
    ventanaGlobal = NULL;
    SDL_Quit();
}
~~~

---

# Programación orientada a eventos

Como es obvio, los videojuegos son mas que una imagen que aparezca en pantalla, estos requieren de cierto nivel de "datos ingresados por el usuario" pero este **input** lo almacenamos en algo llamado "Eventos" que es con lo que trabajaremos ahora.

