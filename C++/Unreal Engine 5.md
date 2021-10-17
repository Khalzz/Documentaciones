# Unreal Engine 5

Este es un motor de grafico ideado para el desarrollo de videojuegos, la animación, arquitectura, entre otras tareas que requieran una fuerte capacidad de procesamiento grafico y/o interactivo.

Este esta principalmente ideado para el desarrollo de videojuegos en 3D, aun que también utilizando ciertos aditamentos, podemos ser capaces de hacer juegos enteramente 2D gracias a la potencia de Unreal Engine 5.

La popularidad de este motor se debe a que durante mucho tiempo fue utilizado por grandes empresas para producciones de alto calibre como serian:

+ Star Wars: Jedi fallen order
+ Back 4 Blood
+ Fortnite (y la mayoría de los juegos de Epic Games)
+ Asetto Corsa Competizione
+ Batman: Arkham city.
+ Little nightmares (1 & 2)
+ Entre muchos otros...

Pero gracias a que este adapto un servicio similar a unity, ya que solo estas obligado a pagar la licencia cuando consigues cierta cantidad en ventas, así permitiendo el acceso libre a una gran cantidad de usuarios y especialmente para estudios independientes.

Esta documentación esta pensada como una guía de ayuda para la gente que se esta introduciendo al motor, a demás como requisito, recomiendo fuertemente tener un conocimiento relativamente básico-intermedio en otros motores como Unity (que es mi caso), Godot, Game Maker Studio, entre otros.

A demás te recomiendo echarle un ojo a la documentación de C++ que he hecho anteriormente dado que este motor funciona con este lenguaje.

---

# Abriendo Unreal Engine

Cuando finalmente hayas instalado Unreal Engine 5 veras una ventana pequena rodeada con opciones que te dejaran hacer proyectos vacios, iniciar tus proyectos anteriores, iniciar proyectos de prueba y seleccionar las opciones de estos proyectos.

Lo que debes hacer es seleccionar una de las opciones para el desarrollo de videojuegos (recomiendo: Blank, First Person o Third Person) luego seleccionamos en la esquina inferior derecha:

1. El lenguaje principal con el que queremos iniciar el proyecto (ojo que luego podemos trabajar con ambos al mismo tiempo si así lo deseamos).
   + BluePrints: Programación visual mas accesible y fácil para los que no controlan mucho el código.
   + C++: Programación pura y dura con uno de los lenguajes mas utilizados en la historia moderna y lo que en mi caso voy a seleccionar.
2. La calidad grafica por defecto del proyecto (la opcion no es tan relevante ya que esto luego podremos cambiarlo dentro del editor cuando queramos).
   + Maximum: todas las opciones graficas por defecto están definidas al maximo.
   + Scalable: algunas opciones graficas están desactivadas para aumentar el rendimiento.
3. Contenido de inicio: agregan ciertos elementos con los que puedes iniciar a probar cosas.
4. RayTracing: te permite agregar trazado de rayos en el proyecto (no recomendable si no tienes una tarjeta grafica que lo soporte).

Luego de seleccionar todo esto vamos a seleccionar la ruta en la que el proyecto se almacenara, para luego elegir un nombre y finalmente crear el proyecto.

---

## Optimizando UE5

Si te encuentras en la misma situacion y version que yo (5.0.0 early acess 2) es probable que tengas ciertos problemas de rendimiento con el motor, esto es debido a que el mismo inicia con ciertas configuraciones que aun no estan optimizadas del todo.

### Cambiando las opciones de escalabilidad

Primero iniciaremos haciendo cambios a la configuración grafica, para esto iremos  al engranaje con el texto **Settings** y dentro de este buscaremos la opción **Engine Scalability Settings** y ahí configuramos según nuestras preferencias y especificaciones técnicas, en mi caso lo baje **de "Epic" a "high"** manteniendo la escala de resolución al 100% y **bajando a "Medium" el post procesado y las sombras**, dado que estos últimos son las opciones que mas rendimiento consumen.

### Desactivando lumen

Luego recomiendo desactivar Lumen, esto para los que no sepan es **un "nuevo" método que tiene unreal engine de trabajar con iluminación global en tiempo real o ray tracing en otras palabras**, aun que este esta apoyado por software, personalmente no soy muy fan de este ya que no he trabajado en proyectos con un coste de rendimiento tan alto, principalmente juegos "low poly", pero si en tu caso quieres hacer cosas que requieran tecnologías como el RayTracing te recomiendo echarle un ojo.

En otro caso, si no vas a juguetear con lumen y prefieres priorizar el rendimiento de tu proyecto, es mayormente recomendado desactivar este mismo, para eso tendremos que ir a **`Edit > project settings > Rendering`**, al llegar a esta pestaña buscaremos la opción **Global Ilumination** y la cambiaremos de Lumen a None.

### Desactivando el limite de frames

Cuando abras el editor puede que haya algo que te desconcierte en ciertos casos, los frames no suben de 60 o 30, esto puede ser por distintas razones, una de ellas es la configuración de tu pantalla o tarjeta grafica que esta limitando los fps de la aplicación, tu computador mágicamente es capaz de mantener una taza constante de fps que nunca superan el numero 60 por alguna razón y la mas probable, **tus frames están limitados por el programa**.

Esto es fácil de arreglar, en la parte inferior izquierda de la ventana veras una pequeña pestaña  que dice "**CMD**" junto a un pequeño espacio en el que ingresar texto, esta es una "terminal o consola" y en ella podremos ingresar comandos que van a interactuar con el engine en si.

En este pequeño cuadro ingresaremos el texto **`t.MaxFps = `** y lo igualaremos a la cantidad deseada, en mi caso ingreso **`t.MaxFps = 144`** dado que este es el limite de mi monitor, pero tu puedes agregar la cantidad que desees.

**Esto tendrá que hacerse cada vez que entres o abras el proyecto en cuestión al menos por ahora**.

### Desactivando NANITE

Nanite es una potente herramienta que facilita al sistema el procesado de polígonos extremadamente complejos, esto nos va de perlas si vamos a trabajar con objetos que contienen un poligonado extremo, pero por otro lado si como yo y otros muchos solo te dedicaras a trabajar con objetos con una cantidad de polígonos menor al absurdo esta herramienta no es para ti.

De hecho en dicho caso que quieras hacer low poly para mejorar el rendimiento, es incluso probable que el tener NANITE activado termine **empeorando el rendimiento de tu juego**, por lo que en mi caso y el de muchos recomiendo desactivarlo, claro solo si no planeas trabajar con modelos que contengan miles de polígonos.

Aun que debo recordar que NANITE tiene diversas limitaciones como por ejemplo que **solo se puede aplicar a objetos o modelos que sean 100% estáticos, entre otros**.

Para desactivar esta opción debemos ir nuevamente a nuestra terminal "**CMD**" y ingresaremos el siguiente texto: **`r.Nanite 0`**, gracias a esto ultimo logre obtener un aumento de aproximadamente 30 fps en una escena vacía.

**Esto, al igual que el limite de frames tendrá que hacerse cada vez que entres o abras el proyecto en cuestión al menos por ahora**.

Listo, ya habremos optimizado lo mas posible nuestro Unreal Engine 5, ahora podemos empezar a revisar todo lo que el motor nos tiene para ofrecer.

---

# La interfaz

Cuando iniciemos nuestro primer proyecto en blanco en Unreal Engine 5 veremos una ventana llena de cosas que probablemente te frustre no entenderlas, pero déjame facilitarte un poco el entendimiento de estas.

+ **Editor**

  Entre todos los elementos de la interfaz, el mas notable es en si la ventana del editor.

  Esta se caracteriza por ser la parte que mas ocupa de nuestra pantalla, en este podemos visualizar los elementos que se veran en nuestra escena, el mapa, nuestros personajes, objetos, etc...

  Este nos permite posicionar estos elementos de diversas formas a demás movernos dentro de la misma gracias a distintos controles que se accionan al mantener presionado el clic derecho en esta pestaña y moviéndote con W, A, S & D.

+ **World Outliner**

  En Unity teníamos una pestaña conocida como la "Jerarquía", en esta se agregaban los elementos instanciados en el editor en si, y nos permite trabajar con los objetos que se encuentran dentro de nuestra "escena" (que por cierto en Unreal Engine a las "Scenes" se le conocen como "Worlds").

+ **Details**

  La pestaña de "detalles" es similar a la pestaña del "inspector" en esta editaremos los componentes que están aplicados a los objetos de nuestro juego, cosas como su posición, el tamaño de sus colliders, los scripts aplicados a estos entre otros.

+ **Content Drawner**

  En esta pestaña podremos ver los "assets" y carpetas de nuestro proyecto, para así acceder a nuestros scripts, modelos 3D, audios, sprites, entre otros muchos elementos que agregaremos a nuestro juego.

+ **Terminal (cmd)**

  Unreal Engine cuenta con una terminal que nos permite por medio de comandos, activar funcionalidades especificas del editor, a demas de acceder a herramientas que nos pueden facilitar el trabajo en este.

  Unos ejemplos de estas sfuncionalidades son por ejemplo los comandos anteriormente mencionados:

  + `r.Nanite 0` para desactivar Nanite.
  + `t.MaxFps 144` para aumentar a 144 el máximo de fps del editor.

---

# La estructura de tus proyectos

Como es obvio, cuando empezamos a jugar con esta clase de herramientas que terminaran siendo basadas en una gran cantidad de elementos suele ser necesario mantener un orden entre estos, para facilitar tanto nuestro acceso a estos componentes pero también para facilitar el entendimiento de otros hacia nuestro proyecto si es que trabajaremos con mas personas.

Aun así si no tienes amigos y trabajas solo es preferible utilizar esta guía como referencia a la hora de estructurar tus proyectos, ya que como mencione con anterioridad, es muy común el revisar elementos de tus proyectos anteriores para reutilizarlos en los nuevos. 





