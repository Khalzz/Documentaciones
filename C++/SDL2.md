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

