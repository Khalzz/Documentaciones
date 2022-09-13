# SDL2

SDL2 es una librería de desarrollo multiplataforma diseñada para entregar acceso de nivel bajo a **audio**, **input de un usuario** y **hardware grafico** por medio de **OpenGl, Direct3D, Metal y Vulkan**.

Usado tanto para **desarrollo de videojuegos** como para **programas de consumo de multimedia**, SDL se ha usado en múltiples proyectos de relativa importancia, como son:

* Los motores **Source** y **Golden source** de **valve**.
* **Half Life 2**.
* **Counter Strike: Global Offensive**.
* **FTL: Faster Than Light**.
* **Factorio**.
* Entre muchos otros...

Esta librería en su mayoría es usada con el lenguaje **C++** con el que lo usaremos en esta documentación.

---

# Configuración

Antes de iniciar escribiendo código tendremos que hacer revisión a ciertos elementos a configurar, por ello haremos un repaso de como llevar esto a cabo en **Visual Studio Code**.

## Requerimientos

Para crear un proyecto en SDL necesitamos los siguientes elementos:

* Un editor de código en este caso **`Visual Studio Code`**.
* Un compilador de C++ en este caso **`MinGW`**.
* Un comando para hacer **builds** en nuestro caso será el comando **`make`**

No entregare un tutorial de instalación de estos ya que de por si no son complejos de instalar, aun así recomiendo que busques sus respectivas documentaciones ya que tanto **`MinGw`** como el comando **`make`** requiere de cierta configuración inicial.

## Creando un proyecto con SDL2

Para crear un proyecto de **SDL2** tendremos que hacer un conjunto de carpetas que recomiendo tengan la siguiente estructura:

+ NombreProyecto
  + assets: aquí posicionaremos nuestros archivos como modelos, imágenes, sonidos, entre otros.
  + **bin**: aquí agregaremos todos los elementos relevantes para nuestros ejecutables.
  + **include**: aquí agregaremos todos nuestros archivos con extensión **`.h`**.
  + **lib**: aquí agregamos todas nuestras librerías.
  + **src**: aquí es donde estará el código que nosotros nos encargaremos de escribir.
  + **`Makefile`**: este archivo se encargara de la configuracion de nuestro proyecto.

Ahora **descargaremos SDL2**  [el siguiente enlace](https://www.libsdl.org/download-2.0.php)** (selecciona la versión compatible con **MinGW**).

Ahora para utilizar estos elementos tenemos 2 formas de trabajar:

1. **Agregando la librería desde una carpeta general**.

   Esta forma es la mas cómoda **para la creación de proyectos**, esto por que simplemente **agregaremos nuestros elementos a una carpeta** luego desde nuestros proyectos **haremos referencia a esa carpeta**.

   Un tema de importancia es que cada vez que lo intentes abrir desde un nuevo ordenador, tendrás que crear la misma carpeta en el mismo lugar, o cambiar la configuración del proyecto.

   Para ocupar este método recomiendo ir a tu disco local **`"C:"`** y agregar una carpeta con el nombre **`Development`** y finalmente dentro de este agregaremos uno de las 2 carpetas del archivo descargado:

   + **`i686-w64-mingw32`**: La versión de 32 bits (renombrándolo a **`SDL2_W32`**).
   + **`x86_64-w64-mingw32`**: La versión de 64 bits (renombrándolo a **`SDL2_W64`**) *utilizaremos este*. 

   Tras esto avanza a la sección de **Configurando Visual Studio Code**.

   ---

2. **Agregando las carpetas de la librería a nuestro proyecto**.

   Esta forma es la mas cómoda si lo que buscamos es **transportabilidad del proyecto**, si planeas abrirlo desde un segundo ordenador, trabajas en equipo o prefieres subirlo a **GitHub** este podría ahorrarte dolores de cabeza a cambio de espacio.

   Ya que debemos agregar archivos de la libreria dentro de nuestro proyecto, por lo que este al final terminara pesando mas para quien desee acceder a este.

   **este es específicamente el que utilizaremos en la documentación**

   En el archivo encontraremos varios elementos, necesito que te fijes en 2 especialmente:

   + **`i686-w64-mingw32`**: La versión de 32 bits.
   + **`x86_64-w64-mingw32`**: La versión de 64 bits.

   La versión en la que nos fijaremos es en la de 64 bits y dentro de este buscaremos 3 elementos:

   + **`include`**: La carpeta con los "header files" de **SDL2**.
   + **`lib`**: La carpeta de la librería.
   + El archivo **`.dll`** dentro de la carpeta **`bin`**.

   Todos estos los llevaremos a nuestro proyecto, mezclando los datos dentro de las carpetas especificas y ingresando el archivo **`.dll`** dentro de la carpeta donde generaremos nuestros ejecutables la que **en nuestro caso es `bin`**.

   ---

Un tema importante es que en cada caso que descarguemos un modulo para **SDL2** (como **SDL_IMAGE**) lo haremos mezclando las carpetas **`include/SDL2`**, **`lib`** y agregaremos todos los archivos **`.dll`** necesarios a la carpeta **`bin`** de nuestro proyecto.

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
	"src\\*.cpp",
    
	"-o",
    // seleccionamos donde se creara nuestro ejecutable (en nuestro caso la carpeta bin)
	"${workspaceFolder}\\bin\\${fileBasenameNoExtension}.exe", // y le damos el nombre del archivo main

    // si utilizamos el metodo de agregar la libreria al proyecto
    "-Iinclude",
	"-Llib",
    
	"-lmingw32",
	"-lSDL2main",
	"-lSDL2"
]
~~~

Si utilizamos el método de agregar la librería desde una carpeta general:

~~~json
// debemos agregar estas lineas bajo el include y lib ya agregados
"-IC:\\Development\\SDL2_W64\\include",
"-LC:\\Development\\SDL2_W64\\lib",
~~~

Listo, ahora por medios de prueba en nuestro **`Main.cpp`** haremos lo siguiente:

~~~c++
#include <iostream>
#include <SDL2/SDL.h>

int main(int argc, char* args[]) // sdl necesita estos parametros si o si
{
    std::cout << "Hola!";
    std::cin.get();
    
    return 0; // sdl necesita retornar 0 si o si
}
~~~

Al presionar **`f5`** se debería generar un ejecutable en nuestra carpeta **`bin`**, al ejecutarlo debería abrirse una terminal con un mensaje y al presiona `enter` esta debería cerrarse.

**Ojo:** existen 2 errores que podrian aparecer al intentar ejecutarlo, uno haciendo mencion a que falta un archivo **.dll** y otro directamente diciendo que el programa no se ha logrado iniciar.

Estos errores pueden aparecer por 2 posibilidades:

1. Te falta un **`.dll`**, revisa los que tengas y busca por si falta alguno.
2. Estas utilizando un **`.dll`** de 64bits para un proyecto con la librería de 32bits (o viceversa).

Cualquier error aparecido al presionar **`f5`** se debe a que algún paso anterior se ha concertado de forma errónea.

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

   Cuando nuestra ventana llega al final de su vida o la cerramos, tenemos que encargarnos de cerrar el funcionamiento de SDL, a demás de cerrar las superficies creadas.

Ya con esto listo podemos comenzar a crear ventanas, aquí tienen un ejemplo de todo esto funcionando.

~~~cpp
#include <iostream>
#include <SDL.h> 

int main(int argc, char* args[])
{
	SDL_Init(SDL_INIT_EVERYTHING); // iniciamos SDL
	SDL_Window* ventana = SDL_CreateWindow("Ventana de prueba", 100, 100, 800, 600, SDL_WINDOW_SHOWN); // creamos la ventana

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

Un codigo efectivo tanto en su lectura como ejecucion deberia ser una prioridad para nosotros, pero otro elemento que quiza no priorizes tanto es la **modularidad**.

La capacidad de un código de ser separable lo suficiente como para facilitar su uso a la hora de agregad funcionalidades nuevas y aumentar el tamaño del proyecto.

Existen varias formas de modularizar nuestro, en este caso veremos las siguientes:

---

### Modularización funcional

Una de las formas es separando nuestro código (al menos lo que tenemos hecho) en funciones, dando una a cada funcionalidad necesitada.

~~~c++
// CREAMOS LA VENTANA Y SUPERFICIE COMO ELEMENTOS GLOBALES
SDL_Window* VENTANA_G = NULL;
SDL_Surface* SUPERFICIE_VENTANA_G = NULL;

// empezamos dando una funcion que nos permita cerrar la ventana
void close()
{
	SDL_DestroyWindow(VENTANA_G); // PRIMERO DESTRUIMOS LA VENTANA
	VENTANA_G = NULL;
	SUPERFICIE_VENTANA_G = NULL;
	SDL_Quit(); // POR ULTIMO CERRAMOS SDL
}
~~~

~~~c++
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
~~~

~~~c++
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
~~~

Esta forma es relativamente sencilla principalmente por que nos permite tener cada funcionalidad en el mismo archivo.

---

### Modularización por clases

Otra forma relativamente común es la separación por clases de estas funcionalidades, a lo que me refiero es a lo siguiente:

Primero crearemos un archivo con el nombre **`RenderWindow.hpp`**, aquí definiremos como **header file** la clase que definirá el renderizado de nuestra ventana (recuerda que este va en la carpeta **`include`**).

~~~cpp
#pragma once // al ser un header file utilizamos esto para que se ejecute solo una vez
#include <iostream>
#include <SDL2/SDL.h>

// en este archivo creamos la renderizacion de la ventana como si fuera un objeto
class RenderWindow
{
public:
    // esta funcion se encargara de renderizar la ventana
    RenderWindow(const char* p_title, int p_w, int p_h);
    
    // esta funcion se encargara de limpiar la ventana antes de cerrarla
    void cleanUp();
private:
    SDL_Window* window;
    SDL_Renderer* renderer;
};
~~~

Luego definimos directamente la funcionalidad de cada una de estas funciones en un archivo llamado **`renderwindow.cpp`** (recuerda que este debe ir en la carpeta **`src`**).

~~~cpp
#include <iostream>
#include <SDL2/SDL.h>

#include "RenderWindow.hpp" // incluimos el header file

RenderWindow::RenderWindow(const char* p_title, int p_w, int p_h)  // declaramos la funcion
    :window(NULL), renderer(NULL) // iniciamos nuestra ventana y renderer como nulos
{
   	// creamos la ventana
	window = SDL_CreateWindow(p_title, SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, p_w, p_h, SDL_WINDOW_SHOWN);


    if (window == NULL) // en caso de que la ventana no se crea
    {
        std::cout << "Window failed to init. Error:" << SDL_GetError() << std::endl;
    }

    // nuestro renderizador es directamente nuestra gpu
    //y este utilizara la ventana para mostrar elementos
    renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
}

// limpiamos la ventana
void RenderWindow::cleanUp()
{
    SDL_DestroyWindow(window);
}
~~~

Luego en nuestro archivo **`main.cpp`** agregamos lo siguiente:

~~~c++
#include <iostream>
#include <SDL2/SDL.h> 

#include "RenderWindow.hpp"

int main(int argc, char* args[])
{
    if (SDL_Init(SDL_INIT_VIDEO) > 0) { // comparamos que sdl inicie el video correctamente
        std::cout << "Hey, SDL_Init ha fallado. SDL_ERROR: " << SDL_GetError() << std::endl;
    }

    RenderWindow window("Juego", 800, 600); // creamos la ventana
    
    SDL_Delay(5000); // esperamos

    window.cleanUp(); // limpiamos la ventana
    SDL_Quit(); // salimos de sdl
    
    return 0;
}
~~~

Con esto listo ya no deberían haber problemas, en este caso nos mantendremos con este ultimo método y iremos trabajando sobre este mas adelante.

---

# Eventos

Los eventos son en efecto **acciones hechas por el usuairo** provenientes tanto un mouse, teclado, control, entre otros...

Estos se revisan de forma constante e infinita (hasta que el programa se cierre) en un proceso conocido como "**Event Loop**", que acumulara estos **eventos** en un elemento que conocemos como **"Event Queue"**.

Estos serán leídos de forma constante permitiéndonos generar acciones en respuestas a las mismas.

---

## Event Loop

Como su nombre lo explica, el **"Event Loop"** es **un bucle que se encarga de generar funcionalidades de forma infinita hasta que el programa se cierre**.

Este lo definimos como un bucle infinito que se acabara **en el momento que se encuentre un evento relacionado al cierre del programa**.

Suponiendo que seguimos **la modularizarían por clases** agregaremos lo siguiente al **`main()`** en nuestro archivo **`main.cpp`**.

~~~cpp
int main(int argc, char* args[])
{
    if (SDL_Init(SDL_INIT_VIDEO) > 0) {
        std::cout << "Hey, SDL_Init ha fallado. SDL_ERROR: " << SDL_GetError() << std::endl;
    }

    RenderWindow window("Juego", 800, 600);
    
    bool gameRunning = true; // este se encargara de mantener nuestro loop en ejecucion
    SDL_Event event; // generamos un evento


    while (gameRunning) // mientras el juego siga en ejecucion
    {
        while (SDL_PollEvent(&event)) // la funcion PollEvents busca por eventos en un SDL_Event
        {
            // aqui es donde agregaremos nuestros eventos y sus funcionalidades
            if (event.type == SDL_QUIT)  // si se detecta un evento que represente el cierre
            {
                gameRunning = false; // el juego deja de correr
            }
        }
    }

    // cerramos todo
    window.cleanUp();
    SDL_Quit();
    
    return 0;
}
~~~

Mientras el programa no se cierre, se mantendrá de forma constante la ejecución de nuestro **Game Loop**.

---

## Revisión de eventos

Como mencione en la sección del **Event Loop**, tendremos un bucle con la función **`SDL_PollEvent()`** la cual se encargara de revisar por si hay algún evento existente.

~~~c++
while (SDL_PollEvent(&event)) // la funcion PollEvents busca por eventos en un SDL_Event
{
	// aqui es donde agregaremos nuestros eventos y sus funcionalidades
	if (event.type == SDL_QUIT)  // si se detecta un evento que represente el cierre
	{
		gameRunning = false; // el juego deja de correr
	}
}
~~~

Y como quizá será obvio, podemos llevar a cabo mas tipos de eventos a parte de solo revisar si hemos o no salido del programa, por ello aquí tienes una lista de los **tipos de eventos** que puedes llevar a cabo.

| Tipo de dato (Uint32)                                        | Tipo de evento | Definición del evento                 |
| ------------------------------------------------------------ | -------------- | ------------------------------------- |
| [SDL_WindowEvent](https://wiki.libsdl.org/SDL_WindowEvent)   | **window**     | Evento de ventana                     |
| [SDL_KeyboardEvent](https://wiki.libsdl.org/SDL_KeyboardEvent) | **key**        | Evento de teclado                     |
| [SDL_TextEditingEvent](https://wiki.libsdl.org/SDL_TextEditingEvent) | **edit**       | Evento de edición de texto            |
| [SDL_TextInputEvent](https://wiki.libsdl.org/SDL_TextInputEvent) | **text**       | Evento de escritura de texto          |
| [SDL_MouseMotionEvent](https://wiki.libsdl.org/SDL_MouseMotionEvent) | **motion**     | Evento de "mover el ratón"            |
| [SDL_MouseButtonEvent](https://wiki.libsdl.org/SDL_MouseButtonEvent) | **button**     | Evento de "presionar botón del ratón" |
| [SDL_MouseWheelEvent](https://wiki.libsdl.org/SDL_MouseWheelEvent) | **wheel**      | Evento de "rueda del ratón"           |
| [SDL_QuitEvent](https://wiki.libsdl.org/SDL_QuitEvent)       | **quit**       | Evento de salida del programa.        |

A demás de estos, hay muchos otros que podrían llamar tu atención, estos puedes encontrarlos [aquí](https://wiki.libsdl.org/SDL_Event).

La comparacion de **`event.type`** nos permite accionar algo **cuando se detecte un evento especifico**, por ejemplo podriamos hacer lo siguiente:

~~~c++
while (gameRunning) 
{
    while (SDL_PollEvent(&event))
    {
        if (event.type == SDL_MOUSEMOTION) 
        {
            // daremos este mensaje cada vez que el raton se mueva
            std::cout << "el raton se esta moviendo\n"; 
        }

        if (event.type == SDL_KEYDOWN) 
        {
            // daremos este mensaje cada vez que se presione una tecla
            std::cout << "se ha presionado una tecla\n";
        }

        if (event.type == SDL_QUIT) 
        {
            // se cerrara el programa cuando se detecte un evento de cierre
            gameRunning = false;
        }
    }
}
~~~

Aun que así definimos eventos de forma general, que ocurre si yo quiero detectar la pulsación de una tecla especifica por ejemplo?

Podemos definir especificamente elementos como la tecla presionada al verificar el tipo de evento y cosas como la accion en particular.

Por ejemplo en el caso de presionar una tecla podemos tener 2 "KeySym" disponibles, siendo estos a que "teclado" responder.

+ **scancode**: Se revisara el valor físico que tiene cada tecla (lo que en un teclado puede ser el `;` en otro es la `ñ`).
+ **sym**: Se revisara el valor virtual de cada tecla (permitiendo leer el `;` y la  `ñ` como "la tecla al lado de la `l`").

En el primer caso seriamos sensibles al cambio de teclado de tipo español a ingles, mientras que el segundo seria sensible a **la posición del mismo**.

Ya con esto aclarado podemos pasar a hacer una pequeña prueba:

~~~c++
while (SDL_PollEvent(&event))
{
    if (event.type == SDL_KEYDOWN) // si se presiona una tecla
    {
        if (event.key.keysym.sym == SDLK_0) // y su valor virtual es la tecla con el valor "0"
        {
            std::cout << "la tecla precionada es el 0\n"; // mostramos mensaje
        }
    }
}
~~~

Pero otra forma de hacer exactamente lo mismo es por medio de **`States`**, estos son un tipo de **"array"** el cual almacena todos los valores posibles de algún evento, para luego por medio de variables **scancode**.

Este método funciona de la siguiente forma:

~~~c++
while (SDL_PollEvent(&event))
{
    // Primero creamos el estado que se encargara de constantemente leer si se presiona una tecla
	const Uint8* state = SDL_GetKeyboardState(NULL); 
    
    if (state[SDL_SCANCODE_0]) // si el valor de estado es el keycode de la tecla "0"
    {
        std::cout << "la tecla precionada es el 0\n"; // mostrar mensaje
    }
    // aqui podremos facilmente acceder a las otras teclas como:
    if (state[SDL_SCANCODE_RIGHT]) // si el valor de estado es el keycode de la tecla "0"
    {
        std::cout << "presionaste la flecha a la derecha\n"; // mostrar mensaje
    }
}
~~~

Para encontrar mas de estos "**scancodes**" revisa [el siguiente enlace](https://wiki.libsdl.org/SDL_Scancode).

---

# Manejando imagenes

Como es obvio, a la hora de trabajar en un juego o en otro tipo de proyectos siempre estaremos en búsqueda de mostrar elementos en pantalla.

Dibujos, fotos o texturas, todos estos elementos en si tienen la capacidad de ser mostrados en la pantalla gracias a una librería llamada **`SDL_image`**, la cual podrás encontrar en [el siguiente enlace](https://github.com/libsdl-org/SDL_image/releases).

Su instalación es realmente simple.

1. Descarga una versión de la librería en mi caso será la que contenga "**MinGW**" en el nombre.
2. Ahí seleccionas la versión compatible con tu versión de "**SDL**", de este archivo copiaremos tanto la carpeta de "**includes**" como la carpeta "**lib**" y las mezclaras con los "**includes**" y "**libs**" del archivo de **SDL** que ya tienes en tu proyecto.
3. En la carpeta "**bin**" encontraras un archivo con extensión **`.dll`**, agrégalo donde se creara el ejecutable de tu proyecto.
4. Y finalmente agrega **`"-lSDL2_image"`** a la ultima lineal de nuestro **`tasks.js`**.

En términos básicos, **SDL2** nos permite solo el ingresar imágenes con el formato **`.bpm`**, esta librería nos entrega la posibilidad de utilizar otros formatos, como **`.png`**, **`.jpg`**, **`.gif`**, entre otros...

---

## Agregando nuestra textura

Empezaremos agregando una imagen cualquiera a nuestra carpeta de **`assets`**, en mi caso dentro de este archivo tengo otro con el nombre **`sprites`** y ahi tengo una imagen llamada **`imagen.png`**.

Empezaremos agregando unas lineas a nuestro codigo, empezando por nuestro **`RenderWindow.hpp`** donde agregaremos lo siguiente:

~~~cpp
class RenderWindow
{
public:
    RenderWindow(const char* p_title, int p_w, int p_h);  
    
    SDL_Texture* loadTexture(const char* p_filePath); // esta funcion cargara nuestra textura
    
    void cleanUp();

    // funciones de pantalla
    void clear(); // esta funcion se encargara de limpiar nuestro "render"
    void render(SDL_Texture* p_text); // esta funcion renderizara una imagen
    void display(); // esta funcion mostrara en pantalla todo lo que se renderize
private:
    SDL_Window* window;
    SDL_Renderer* renderer;
};
~~~

Tras esto simplemente implementamos las funciones nuevas en nuestro archivo **`windowrender.cpp`**,  creando las siguientes funciones:

~~~c++
SDL_Texture* RenderWindow::loadTexture(const char* p_filePath)
{
    SDL_Texture* texture = NULL; // creamos una textura vacia
    texture = IMG_LoadTexture(renderer, p_filePath); // cargamos la imagen en el renderer

    if (texture == NULL) // si a este punto la textura es "null" algo salio mal
    {
        std::cout << "La textura no se ha cargado de forma exitosa" << SDL_GetError() << std::endl;
    }

    return texture; // devolvemos la textura
}

void RenderWindow::clear()  
{
    SDL_RenderClear(renderer); // limpiamos el renderer
}

void RenderWindow::render(SDL_Texture* p_text) 
{
    // copiamos la imagen en el renderer con rotacion y si se voltea
    SDL_RenderCopy(renderer, p_text, NULL, NULL); 
}

// esta funcion se encarga de mostrar todos los elementos renderizados en la pantalla
void RenderWindow::display() 
{
    SDL_RenderPresent(renderer); 
}
~~~

Finalmente en nuestro **`main.cpp`** haremos lo siguiente:

~~~c++
int main(int argc, char* args[])
{
    if (SDL_Init(SDL_INIT_VIDEO) > 0) {
        std::cout << "Hey, SDL_Init ha fallado. SDL_ERROR: " << SDL_GetError() << std::endl;
    }

    RenderWindow window("Juego", 800, 600);

    // cargamos la imagen
    // usamos ../ para retroceder una carpeta
    SDL_Texture* texturaRara = window.loadTexture("../assets/sprites/imagen.png"); 

    bool gameRunning = true;

    SDL_Event event;


    while (gameRunning) 
    {
        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_QUIT) 
            {
                gameRunning = false;
            }
        }
		
        // el proceso de carga, renderizado y mostrar la imagen se hace en el game loop
        window.clear();
        window.render(texturaRara);
        window.display();
    }

    window.cleanUp();
    SDL_Quit();
    
    return 0;
}
~~~

---

# Entidades

A la hora de trabajar con cada elemento en nuestro juego, quizá la mejor forma de utilizarlos es clasificándolos en algo conocido como "Entidad de clase", esto referenciando a cada objeto como una clase con una cantidad especifica de datos y funcionalidades.

En si una "entidad" es todo objeto renderizable en nuestra pantalla, pero por mantener nuestro control, le asignaremos unos valores a estos.

---

## SDL_RenderCopy

Un ejemplo rápido a esta funcionalidad de "Separar todo por entidades" es la posibilidad que nos entrega la función **`SDL_RenderCopy(renderer, p_text, NULL, NULL); `** anteriormente utilizada.

Esta función nos permite copiar un elemento como una textura o imagen entregándole los siguientes parámetros:

1. un **renderer** donde se mostrara la imagen, textura o elemento en cuestión.

2. un **string** en el que referenciamos la carpeta en la imagen se encuentra.

3. Un **`origen`** del valor referenciando el punto de origen donde se renderizara la imagen.

   Este valor se referencia de 2 formas:

   + Uno es por medio de un **`NULL`** significando así que se renderizara la imagen completa, sin cambiar su tamaño.

     ---

   + El otro es por medio de un **`Struct`** que nos permite definir la posición de origen de la imagen de la siguiente forma:

     ~~~c++
     SDL_Rect src;// esto es un struct que representara el tamano de el elemento
             src.x = 0; // eje x (en el null es 0)
             src.y = 0; // eje y (en el null es 0)
             src.w = 32; // ancho visible del sprite
             src.h = 32; // height visible del sprite
     ~~~

     En mi caso tengo una imagen con una resolución de **`32x32`**, por ello hacer este ejemplo seria exactamente lo mismo que utilizar **`NULL`**, experimenta con estos valores dependiendo de lo que quieras hacer.

     ---

4. Un **`destino`** referenciando la posición en la pantalla en la que este objeto se mostrara, siguiendo la misma lógica que el valor anterior.

   Este valor se referencia de 2 formas:

   + Uno es por medio de un **`NULL`** renderizando la imagen en el punto **`(0,0)`** con el tamaño base de la imagen.

     ---

   + El otro es por medio de un **`Struct`** que nos permite definir la posición de origen de la imagen de la siguiente forma:

     ~~~c++
     SDL_Rect dst;// esto es un struct que representara el tamano de el elemento
             dst.x = 400;
             dst.y = 300;
             dst.w = 32 * 2;
             dst.h = 32 * 2;
     ~~~

     En mi caso al tener una imagen tan pequeña, reescalamos la misma para que esta tenga un tamaño visible, a demás cambiamos la posición en la que este se renderiza en la ventana.

Ya con estos valores entregados nuestra funcion se veria de la sigueinte forma:

~~~c++
SDL_RenderCopy(renderer, p_text, &src, &dst); // los 2 ultimos deben ser pointers
~~~

Recuerda hacer todo  esto en la misma función en la que **renderizas** la imagen (en el caso de nuestros ejemplos es en **`RenderWindow::render()`**).

---

## Creando nuestra entidad

Sabiendo lo anterior ahora podremos iniciar directamente con la creación de una entidad.

Para esto crearemos 2 archivos en nuestro proyecto:

1. **`Entity.hpp`** en nuestra carpeta **`includes`**, en este archivo haremos lo siguiente:

    ~~~c++
    #pragma once
    #include <SDL2/SDL.h>
    #include <SDL2/SDL_image.h>
    
    class Entity
    {
    public:
        Entity(float p_x, float p_y, SDL_Texture* p_texture); // constructor
        
        // creamos nuestros getters para acceder a los valores de nuestra entidad
        float GetX();
        float GetY();
        SDL_Texture* GetTexture();
        SDL_Rect GetFrame();
    private:
        // la posicion de nuestra entidad 
        //agregariamos una posicion z en caso de que hagamos nuestro juego en 3D
        float x, y;
        SDL_Rect currentFrame; // el &src de la funcion SDL_RenderCopy()
        SDL_Texture* texture;
    };
    ~~~

---

2. **`entity.cpp`** en nuestra carpeta **`src`**, en este archivo agregaremos lo siguiente:

   ~~~c++
   #include "Entity.hpp"
   
   // esta funcion creara nuestra entidad con una poscion y una textura
   Entity::Entity(float p_x, float p_y, SDL_Texture* p_texture)
   :x(p_x), y(p_y), texture(p_texture) // aqui definimos los valores iniciales de nuestro constructor
   {
       // estos valores son los valores iniciales de renderizado de nuestro sprite
       currentFrame.x = 0;
       currentFrame.y = 0;
       currentFrame.w = 32;
       currentFrame.h = 32;
   }
   
   
   // estas funciones se encargan de permitir el acceso a estos valores (ya que los mismos son privados)
   float Entity::GetX() 
   {
       return x;
   }
   float Entity::GetY()
   {
       return y;
   }
   
   SDL_Texture* Entity::GetTexture()
   {
       return texture;
   }
   SDL_Rect Entity::GetFrame()
   {
       return currentFrame;
   }
   ~~~

   ---

Con todo esto ya podríamos crear nuestras entidades instanciándolas en  nuestro **`main.cpp`** pero antes vamos a hacer unos cambios a la forma en la que renderizamos nuestros elementos.

Como recordaras en nuestra clase **`RenderWindow`** tendremos una función con el nombre **`render()`**, esta se ha encargado por ahora de renderizar una imagen estática, pero ahora le haremos ciertos cambios para que nos permita renderizar nuestras **entidades**.

Agregamos **`#include "Entity.hpp"`** arriba del todo.

Luego cambiaremos el parámetro de la misma, en **`RenderWindow.hpp`** hacemos lo siguiente:

~~~c++
// intercambiamos la siguiente linea:
void render(SDL_Texture* p_text);

// por la siguiente linea
void render(Entity& p_entity); // & es para no crear una copia, solo buscar la entidad que ya existe
~~~

Con esto listo, ahora debemos cambiar la lógica de nuestra función, en **`renderwindow.cpp`** hacemos lo siguiente:

~~~c++
void RenderWindow::render(Entity& p_entity) 
{
    SDL_Rect src;// esto es un struct que representara el tamano de el elemento
        src.x = p_entity.GetFrame().x; // eje x
        src.y = p_entity.GetFrame().y; // eje y
        src.w = p_entity.GetFrame().w; // width (ancho)
        src.h = p_entity.GetFrame().h; // height (alto)

    SDL_Rect dst;// esto es un struct que representara el tamano de el elemento
        dst.x = p_entity.GetX() * 2; // eje x (si solo escalamos el alto y ancho pueden haber bugs)
        dst.y = p_entity.GetY() * 2; // eje y
        dst.w = p_entity.GetFrame().w * 2; // width (ancho)
        dst.h = p_entity.GetFrame().h * 2; // height (alto)

    SDL_RenderCopy(renderer, p_entity.GetTexture(), NULL, &dst);
}
~~~

Y finalmente en nuestro **`main.cpp`** agregamos **`include "Entity.hpp"`** y luego de crear nuestra textura instanciamos una entidad:

~~~c++
SDL_Texture* textura = window.loadTexture("../assets/sprites/imagen.png");
Entity entidad0(100,100,textura); // creamos una entidad en 100,100 con nuestra textura
~~~

Y ahora finalmente lo renderizamos en nuestro "**game loop**" de la siguiente forma:

~~~c++
while (gameRunning) 
    {
        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_QUIT) 
            {
                gameRunning = false;
            }
        }

        window.clear();
        window.render(entidad0); // aqui renderizamos nuestra entidad
        window.display();
    }
~~~

---

### Dibujando múltiples entidades

Probablemente te estés preguntando **¿como puedo instanciar múltiples entidades?** y ahí es donde los arrayas o vectores y bucles entran en juego.

Técnicamente podríamos hacer algo transformando nuestro código en lo siguiente:

Primero agregamos **`#include<vector>`** arriba de nuestro **`main.cpp`** para permitirnos crear arrays dinámicos.

~~~c++
// creariamos las entidades dentro de una lista como la siguiente
SDL_Texture* texturaRara = window.loadTexture("../assets/sprites/imagen.png");

std::vector<Entity> plataformas = { Entity(30, 30, texturaRara),
                                    Entity(60, 30, texturaRara),
                                    Entity(0, 30, texturaRara),
                                    Entity(30, 60, texturaRara)};
~~~

Y luego donde instanciábamos solo una entidad haríamos ahora lo siguiente:

~~~c++
while (gameRunning) 
    {
        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_QUIT) 
            {
                gameRunning = false;
            }
        }

        window.clear();
    	// este bucle iterara una vez por cada elemento en el vector "plataformas"
        for (Entity& p : plataformas) // recuerda que Entity es el tipo de dato de "p"
        {
            window.render(p);
        }
        window.display();
    }
~~~

Para agregar una entidad a la lista podemos hacer lo siguiente (antes de renderizar las entidades):

~~~c++
{
	Entity plataformaNueva(100, 40, texturaRara); // primero creamos la nueva entidad
	plataformas.push_back(plataformaNueva); // con esta funcion agregamos elementos a un vector
}
~~~

Te darás cuenta que ambas líneas están entre llaves **`{}`**, esto es para permitirnos "destruir" el objeto luego de crearlo y subirlo a la lista.

Ya que este mismo se mantendrá ocupando memoria si no nos deshacemos de el luego de pasarlo a la lista (esto también funciona si creamos una entidad dentro de una clase o de una condición).

---

## Vectores

