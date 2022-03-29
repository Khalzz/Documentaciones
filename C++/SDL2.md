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

## Creando una ventana

~~~cpp
//agregamos las librerias necesarias
#include <SDL.h>
#include <stdio.h>

//agregamos como constantes las dimensiones de la ventana
const int ANCHO_VENTANA = 640;
const int ALTO_VENTANA = 480;

int main(int argc, char* args[])
{
    //Creamos la ventana en la que se renderizara todo como nulo
    SDL_Window* ventana = NULL;

    //Creamos la superficie que tendra la ventana
    SDL_Surface* superficiePantalla = NULL;

    //Iniciamos SDL
    if (SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
    }
    else
    {
        //Creamos Ventana
        ventana = SDL_CreateWindow("Creando tu primera ventana", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, ANCHO_VENTANA, ALTO_VENTANA, SDL_WINDOW_SHOWN);
        if (ventana == NULL) // si la ventana no se ha creado
        {
            printf("Window could not be created! SDL_Error: %s\n", SDL_GetError()); // mostrar error
        }
        else
        {
            //obtenemos la superficie de la ventana
            superficiePantalla = SDL_GetWindowSurface(ventana); 

            //llenamos la superficie con el color blango
            SDL_FillRect(superficiePantalla, NULL, SDL_MapRGB(superficiePantalla->format, 0xFF, 0xFF, 0xFF));

            //Actualizamos la superficie
            SDL_UpdateWindowSurface(ventana);

            //Esperamos 5 segundos
            SDL_Delay(5000);
        }
    }
    // Destruimos la ventana
    SDL_DestroyWindow(ventana);

    //Salimos del sub sistema de SDL
    SDL_Quit();

    return 0;
}
~~~

---

## Separando nuestro codigo

Como ya vimos en el ejemplo anterior, hay una forma de crear una ventana que se encuentra dentro de una misma función (**específicamente la función main**), esto puede funcionar para ejemplos cortos, pero en proyectos reales como videojuegos lo mejor es separar nuestro código, esto por que en si a la hora del desarrollo, lo mejor es generar un código **modular**.

Para así ir agregando elementos sin mayor complicación con el tiempo.

Un ejemplo facil de lo que ya hicimos seria el siguiente:

~~~cpp
#include <SDL.h> // agregamos las librerias
#include <stdio.h> // agregamos las librerias

bool init(); // creamos una funcion para iniciar sdl
void close(); // creamos otra funcion para cerrar sdl

//agregamos como constantes las dimensiones de la ventana
const int ANCHO_VENTANA = 640;
const int ALTO_VENTANA = 480;

// creamos la ventana como una variable global
SDL_Window* ventanaGlobal = NULL;

// la superficie que contendra la ventana
SDL_Surface* gScreenSurface = NULL;

int main(int argc, char* args[])
{
    // iniciar SDL y creamos una ventana
    if (!init())
    {
        printf("Failed to initialize!\n");
    }
    else
    {
        SDL_UpdateWindowSurface(ventanaGlobal); // Actualizamos la superficie
        SDL_Delay(2000); // Esperamos 2 segundos
    }
    close(); // luego de todo cerramos la ventana
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
        // creamos la ventana
        ventanaGlobal = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, ANCHO_VENTANA, ALTO_VENTANA, SDL_WINDOW_SHOWN);
        if (ventanaGlobal == NULL) // si la ventana no se ha creado
        {
            printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
            success = false; // la funcion no ha sido eccitosa
        }
        else
        {
            // obtenemos la superficie de la ventana
            gScreenSurface = SDL_GetWindowSurface(ventanaGlobal);
        }
    }
    return success;
}

void close() // cerramos la ventana
{
    //Destroy window
    SDL_DestroyWindow(ventanaGlobal);
    ventanaGlobal = NULL;

    //Quit SDL subsystems
    SDL_Quit();
}
~~~

---

# Mostrando imagenes

Ya habiendo transformado nuestro código a algo mas fácil de escribir y entender podemos continuar con algo mas como lo es **mostrar imágenes en pantalla**, antes de continuar debes ser consiente que mostraremos imágenes en formato **BMP** que nos permite referenciar las imágenes como bloques de código en memoria, para hacer mas eficiente la carga.

Primero tendremos que preparar todo, en mi caso iré al archivo de mi proyecto y agregare la carpeta **`Assets/Images`** en la cual estará la imagen **Banana.bmp** (recuerda que esta carpeta debe estar posicionada donde se encuentre nuestro proyecto en si (si estas en **VS** es la carpeta con el archivo "**sdl2-test.vcxproj**"))

Para hacer esto tenemos que hacer lo siguiente:

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

