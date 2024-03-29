# C++

**Documentación escrita por Rodrigo Seguel**

C++ es un lenguaje de programación de nivel bajo, orientado a objetos y con un tipado tanto fuerte como estático el cual dado a su bajo nivel de "abstracción" tiene un gran rendimiento al ser ejecutado.

Creado el año **1979** por **Bjarne Stroustrup**, la intención principal del mismo era **extender el lenguaje "C" añadiendo el paradigma orientado a objetos**.

Actualmente C++ es uno de los lenguajes de programación mas populares, aun que no forma parte de los mas usados dado que este lenguaje tiene una alta complejidad tanto teórica como técnica, aun así esta complejidad le permite ser muy efectivo en programación de microcontroladores (como Arduino) o incluso para programas que requieran de un alto rendimiento como videojuegos.

----

## índice

+ [Primeros pasos en C++](#Primeros-pasos-en-C++)
  + [Conocimientos previos](#Conocimientos-previos)
  + [Instalando C++](#Instalando-C++)
  + [Hola Mundo](#Hola-Mundo)
+ [Como funciona C++](Como-funciona-C++)
  + [Include y declaraciones pre-procesadas](#Include-y-declaraciones-pre-procesadas)
  + [Main](#Main)
+ [Variables y tipos de datos](#Variables-y-tipos-de-datos)

---

# Primeros pasos en C++

C++ es un mundo gigante a explorar pero aun así como supongo es "obvio" debemos empezar desde el inicio.

Por ello en esta sección nos encargaremos de hacer una revisión a todos los elementos necesarios para iniciar nuestros proyectos con c++, desde la "instalación" de las herramientas necesarias, hasta una demostración de los elementos básicos de una aplicación de c++, aquí es donde darás tus primeros pasos.

---

## Instalando lo necesario

En términos simples C++ es un lenguaje que viene en casi todo sistema con el que podamos interactuar, el problema es que necesitaremos ciertos elementos para trabajar con este.

Para trabajar con C++ vamos a requerir los siguientes elementos:

+ Visual Studio 2019 (puede ser otro IDE o otra versión de Visual Studio, pero esta será la que utilizare para enseñarte).
+ El WorkLoad "**Desktop development with C++**" (obligatorio) y "**Game development with C++**" (opcional). Ambos los encontraremos en la pestaña de "instalación de módulos" o "workloads" al instalar Visual Studio o al abrir "Visual Studio Installer".

Tras tener todo esto instalado podemos comenzar a editar nuestro código.

---

## Configuración de proyectos

A la hora de iniciar un nuevo proyecto hay unas cuantas configuraciones que por comodidad debemos hacer a nuestros proyectos, estas quizá no serán notables al inicio, pero notablemente nos hará mas fácil el "control" en la "estructura de nuestros proyectos".

Para empezar añadiremos algunos parámetros especiales a nuestros proyectos (estos se deben añadir tras crear el proyecto como recomendación).

Para eso debemos seguir los siguientes pasos:

1. Tras haber creado nuestro proyecto debemos fijarnos en la pestaña "**Solution Explorer**".
2. Damos clic derecho en el icono con el nombre de nuestro proyecto (usualmente suele ser el primero de  todos los archivos que aparecen) y seleccionamos la opción "**Propiedades**" (también podemos presionar **`alt`** + **`enter`**).
3. En la pestaña "**Configuration**" seleccionamos la opción **"All Configurations"** y en la pestaña **"Platform"** seleccionamos **"All Platforms"**.
4. Luego de esto buscamos las siguientes opciones:
   + Output Directory: añadimos **`$(SolutionDir)bin\$(Platform)\$(Configuration)\`**
   
     Este será el sitio donde se crearan nuestros binarios y archivos `.exe`, estos se posicionaran en **la carpeta del proyecto**, dentro de **la plataforma especificada (x32 o x64)**  y finalmente dentro de la carpeta **debug** veremos los ejecutables.
   + Intermediate Directory: añadimos **`$(SolutionDir)bin\intermediates\$(Platform)\$(Configuration)\`**
   
     Aquí se guardaran nuestros **archivos intermediarios** con una distribución similar a la carpeta de nuestros ejecutables.

Estas ultimas opciones nos permiten seleccionar la forma en la que las carpetas de nuestro proyecto se estructuraran.

Y hablando sobre la estructura de nuestros proyectos, este es un tema que puede complicarnos en algún punto, cuando creamos un archivo con estas configuraciones se estructurara de la siguiente forma:

+ `nombre del proyecto` (carpeta principal)
  + `bin` (carpetas intermediarias y builds)
  + **`nombre del proyecto`** (archivos del proyecto)
    + `src` (código fuente)
    + otros archivos (configuraciones del proyecto)
  + `nombre del proyecto.sln` (archivo a abrir en visual studio)

Recomiendo mantener esto añadiendo ciertas carpetas en la carpeta de "archivos del proyecto" (la carpeta resaltada), de hecho, en esta carpeta deberías tener las siguientes:

+ include (**header files** `.h` de carácter públicos)
+ src (código fuente privado y archivos `.h` internos)
+ test (donde tendremos nuestros códigos de "testing" si es que usaremos)
+ libs (donde tendremos las librerías, sean propias o de terceros)

---

## Hola Mundo

Antes de pasar al "Hola Mundo" daré los pasos para hacer un nuevo archivo de C++, estos pasos pueden variar en base a tu IDE de preferencia.

Los pasos son:

1. Abrir Visual Studio.
2. Selecciona la opción "Create a new project".
3. Busca y selecciona la opción "Empty Project" (si no la encuentras puedes filtrar por lenguaje).
4. Elige un nombre para el proyecto y donde este se va a localizar.
5. Cuando se cree el proyecto busca la pestaña "Solution Explorer" y da clic derecho sobre "Source Files".
6. Cliqueas `Add > New Item` y seleccionas "C++ File (.cpp)"

Al terminar estos pasos veras un archivo en blanco, donde escribirás lo siguiente:

~~~c++
#include <iostream> // incluimos las librerias

int main() // creamos una funcion principal
{
	// todo lo que este aqui se ejecutara
	std::cout << "Hola Mundo!!!"; // escribir mensaje en la consola
}
~~~

Ahora, si presionas `f5` el código debería ejecutarse "abriendo una terminal y mostrando el mensaje "Hola Mundo!!!" además de tener un espacio debajo gracias el \n que hay en el texto, pero hare énfasis en eso mas adelante.

De este Hola Mundo logramos aprender que:

+ C++ funciona similar a lenguajes como C# que requieren un `;` al final de casi todas las líneas (solo que en c++ las librerías no requieren uno, **de esto hablaremos mas adelante**). 

+ Los "input" o escritura en la consola son con `std::cout << "texto a escribir";`.

+ La función main es donde escribimos el código que si o si se ejecutara y desde ahí llamaremos a las otras funciones que crearemos, **profundizaremos en este tema lo veremos mas adelante**.

+ Para escribir un comentario podemos usar 2 métodos:

  ~~~C++
  // para hacer comentarios de una sola linea.
   
  /*
  Para hacer comentarios
  con mas de una linea.
  */
  ~~~

  Y a pesar de no haber visto el segundo tipo de comentario, este nos será muy útil a la hora de documentar nuestro código.

Listo, ahora si quieres puedes probar distintas cosas mientras juegas con el "output" que te ofrece el lenguaje, pero antes debo advertirte algo.

En lenguajes como python, si intentas hacer lo siguiente:

~~~python
print("Buenos Dias!!!")
print("Buenas Noches!!!")
~~~

Nos entregara en la terminal el mensaje:

~~~
>> Buenos Dias!!!
>> Buenas Noches!!!
~~~

Como podrás ver, python incluye por defecto un salto de línea al igual que muchos otros lenguajes.

En el caso de C++ esto no ocurre, dado que si hacemos esto:

~~~c++
int main()
{
    std::cout << "Buenos Dias!!!";
    std::cout << "Buenas Noches!!!";
}
~~~

El mensaje que nos dará es:

~~~
>> Buenos Dias!!!Buenas Noches!!!
~~~

Esto ocurre por que `std::cout` requiere que manualmente hagamos un salto de línea, principalmente utilizando un salto de línea y tenemos 2 métodos para hacerlo.

+ **Terminando la línea con un `<< std::endl;` al final de la lineal**, ósea que nuestro código quedaría así:

  ~~~c++
  int main()
  {
      std::cout << "Buenos Dias!!!" << std::endl; // con el std::endl hacemos que este texto "termine" la linea
  }

+ **Con un salto de líneas usando `\n`**.

  Para esto usaremos `\n` dentro del texto, esto nos va a permitir hacer el salto de línea de forma automática.

  ~~~c++
  int main()
  {
      std::cout << "Buenos Dias!!!\n"; // añado la secuencia de escape para generar el salto de linea
      std::cout << "Buenas Noches!!!";
  }
  ~~~

  Y también podemos ahorrarnos algunas líneas de código escribiendo todo junto de la siguiente forma:

  ~~~c++
  int main()
  {
      std::cout << "Buenos dias!!!\nBuenas Noches!!!";
  }
  ~~~

---

# Como funciona C++

C++ como ya vimos tiene una sintaxis especial a la hora de iniciar con nuestro hola mundo, pero hay algunas cosas aun mas técnicas que podemos sacar del mismo y esas cosas las revisaremos ahora.

---

## Include y declaraciones pre-procesadas

Y pues debemos iniciar por el principio, Como se vio anteriormente en la primera línea de nuestro "Hola Mundo" vemos la siguiente línea:

~~~c++
#include <iostream>
~~~

Esto lo que hace (específicamente el `include <>`) es llamar otros archivos de C++ y permitirnos acceder a este desde el archivo en el que lo estamos llamando, en este caso llamamos el archivo **iostream**, librería que nos entrega funciones básicas del lenguaje.

Pero esto tiene otra particularidad y es el `#` que tiene al inicio, ese símbolo lo convierte en un **Preprocessor Statement** o una declaración pre-procesada.

Esto significa que el compilador primero verificara todas las declaraciones pre-procesadas antes de que el mismo ejecute el código, de ahí viene su nombre..

Lo mismo ocurrirá con **todas las declaraciones que tengan el símbolo `#` al inicio**. 

---

## Main

Los archivos de C++ siempre deben tener algo muy especifico para ejecutarse de forma exitosa y es **una función main**.

Esta "función" o "método" es el lugar donde nosotros escribiremos nuestro código principal, llamaremos otras funciones y haremos todo lo que requiramos para la ejecución de nuestro programa.

~~~c++
int main()
{
    std::cout << "Hola Mundo!!!"; // esto se ejecutara exitosamente
}
~~~

Y si escribimos cosas fuera de esta función no se ejecutaran, a no ser que estas sean funciones, en ese caso ocurrirá lo mismo **a no ser que las llamemos dentro de nuestra función "main"**

Y de una forma menos técnica **la función main es como la puerta de entrada cuando ejecutemos nuestro código**.

---

# Variables y tipos de datos

Las Variables son un factor de vital importancia para la programación y de hecho una de las mas sencillas de entender.

Podemos resumirlas como "cajas" que almacenan datos que pueden tener distintos tipos, aun que el "tipo de dato" será un tema a ver un poco mas adelante, estas "cajas" almacenan en la memoria con un "nombre" que nos permitirá acceder a los mismos en el momento que sea necesario.

Otra forma fácil de verlo es compararlos con la algebra básica dado que en matemáticas podríamos representar un valor dando a saber que por ejemplo `x = 5` entonces durante todo el calculo `x` tendrá ese valor y al menos en la programación podemos hacer que el valor de este cambie, ya sea haciendo operaciones matemáticas o simplemente cambiando su valor final.

La sintaxis de una variable es así:

~~~c++
// tipoDeDato nombreDeVariable = valorDeVariable;
int x = 5; // aqui hice una variable similar a la que hacemos referencia en el ejemplo anterior

// y para acceder a ella solo tenemos que mencionarla en una función como lo es cout
std::cout << x; // esto mostrara en la pantalla el valor de x, o sea 5
~~~

También podemos hacer constantes, datos similares a las variables solo que como dice su nombre **su valor será estático y no puede cambiar**.

*la sintaxis de una constante es:*

~~~c++
// const tipoDeDato nombreDeConstante = valorDeVariable;
const int x = 5;

x = 15; // si intentamos cambiar el valor de la constante tendremos un error
~~~

---

## Tipos de datos numéricos

Como ya mencione hay varios tipos de datos y en muchos casos estos serán numéricos, estos se dividen en varios tipos separados por la cantidad de bits que tienen y antes de eso te enseñare como encontrar el rango valido en base a los bits que definen el mismo rango.

Para esto debemos tener algo de conocimientos previos sobre los Bytes y bits.

Empecemos definiendo un bit, en si son un valor booleano que representa el paso y no paso de electricidad y puede tener 2 valores, específicamente 1 (para el paso de energía) y 0 (para el no paso de energía).

Los Byte en si mismos son **un conjunto de 8 bits unidos** que dejan de representar el paso de energía y empiezan a representar información, por lo que tener 4Bytes seria equivalente a tener 32bits.

De esta forma podemos definir valores numéricos de la siguiente forma.

~~~
00000001 esto seria equivalente a 1 (esto es 1Byte = 8bits)
00000010 esto seria equivalente a 2
00000100 esto seria equivalente a 4

00000000 00000001 esto seria equivalente a 1 (esto es 2Bytes = 16bits)
00000000 00000000 00000001 esto seria equivalente a 1 (esto es 3Bytes = 24bits)
00000000 00000000 00000000 00000001 esto seria equivalente a 1 (esto es 4Bytes = 32bits)
~~~

Y como ya mencione, en base a la cantidad de bits se define el rango de números posibles.

Aun que un dato importante es que **por defecto hay un bit que se reserva para el signo** por si el numero ingresado es negativo o positivo.

O sea que:

~~~
00000001 esto equivale a 1
10000001 esto equivale a -1
~~~

Por lo que en el caso de tener un numero de 8 bits **por defecto** el rango va desde **-128, hasta 127** y hago un enfasis en **por defecto** dado que también podemos usar ese bit como un valor numérico en lugar de un signo y es usando **`unsigned`** al definir nuestras variables, de la siguiente forma:

~~~c++
unsigned char numero = 0; // este es un numero de 8 bits
// al ser unsigned(sin signo) su rango ya no es del -128 hasta 127, sino del 0 hasta el 255.
~~~

Esto se aplica a todos los valores numéricos que se definen por bits o Bytes.

También podemos ver el tamaño de un tipo de dato en Bytes usando la función `sizeof(tipoDeDato/dato)`, por ejemplo:

~~~c++
std::cout << sizeof(int); // esto nos deberia dar el valor 4
~~~

Ahora si, los tipos de datos numéricos son los siguientes:

| Tipo de dato  |                         Descripción                          |
| :-----------: | :----------------------------------------------------------: |
|    **int**    | números enteros con un rango de **4Bytes** con un **valor por defecto entre -2.147.483.648 y 2.147.483.647**. |
|   **char**    | números enteros con un rango de **1Byte** con un **valor por defecto entre -128 y 127** |
|   **short**   | números enteros con un rango de **2Bytes** con un **valor por defecto entre  -32.768 y 32.767** |
|   **long**    | números enteros con un rango de **4Bytes** al igual que el **int** pero que dependen del compilador |
| **long long** | números enteros con un rango de **8Bytes** (valor por defecto entre -9.223.372.036.854.775.807 y 9.223.372.036.854.775.806) |

Aun que hay un tema interesante y raro con varios tipos de datos numéricos, especialmente **char**, este en especial no solo nos permite añadirle como valor un numero sino también un "carácter" o sea una letra o símbolo **principalmente representados por ir dentro de comillas simples `''`**.

por lo que si por ejemplo hacemos lo siguiente:

~~~c++
char variable = 'A'; // nos mostrara en la pantalla el char 'A' dado que este se representa como un valor numerico (el 65)

// pero si hacemos lo siguiente
char variable = 65; // nos mostrara en pantalla el char 'A' dado que llamamos especificamente ese valor numerico (el que representa la A)
~~~

Esto ocurre específicamente por que al mostrarlo en la consola con `std::cout <<` este se encargara de leer los bits del **char** y hacer una evaluación sobre la necesidad, si se usa de forma aritmética (en sumas, restas u otras operaciones) seguirá siendo un numero, pero al querer mostrarlo en pantalla.

Entonces:

~~~c++
// si hacemos lo siguiente:
char variable = 65;
std::cout << variable; // nos mostrara en pantalla el char  'A' por que entiende que queremos un char

// pero si añadimos una operación aritmetica asi:
std::cout << variable + 0; // nos mostrara en pantalla el valor 65 por que entiende que queremos un numero
~~~

En otros tipos de datos numéricos se muestra algo similar, solo que al ingresar un texto usando comillas simples este nos devolverá su valor en base a los bytes, pero si lo hacemos al revés solo mostraran el mismo numero ingresado.

---

## Tipos de datos decimales

En el caso de los números decimales tenemos 2 tipos distintos de datos que nos permitirán definirlos, estos son:

+ **float**: son números decimales de 4bytes y tiene un rango entre 1.2E-38 y 3.4E+38.
+ **double**: son números decimales de 8Bytes y tiene un rango entre 2.3E-308 y 1.7E+308.

La principal diferencia entre ellos es que el double guarda mas números luego de la coma que el float.

Peor hay un problema y es que si hacemos lo siguiente: 

~~~c++
float decimal = 2.5; // este valor se guardara como double

// para que esto no ocurra debemos al valor añadirle una f o F de la siguiente forma
float decimal = 2.5f;
~~~

---

## Tipo de dato booleano

Los booleanos o **bool** son un tipo de dato especial que de por si solo tiene 2 valores: **true** y **false** (verdadero y falso), esto nos permitirá trabajar en casos que solo necesitemos dos estados.

Al mostrar este tipo de dato en la consola notaremos algo particular y es que los booleanos solo devuelven el valor **0** (si ingresamos **false** o **0**) o nos darán el valor **1** (si ingresamos **true**, **1** o cualquier otro dato que no sea el numero **0**).

Otro tema importante, a pesar de que los booleanos solo obtienen datos de un bit, **en realidad ocupan 1Byte de la memoria** dado que por defecto se nos es imposible acceder a los bits individualmente.

---

# Funciones

Las funciones son una parte bastante útil para nuestros desarrollos.

En si son **bloques de código con funciones especificadas por nosotros y que podemos ejecutar llamándolos por el nombre que le aplicamos** un tema a tomar en cuenta es que estos al estar dentro de una clase dejan de llamarse funciones y pasan a tener el nombre de **métodos** pero profundizare en eso mas adelante.

Las funciones en si se hacen usualmente para ejecutar ciertas tareas especificas, además de eliminar la necesidad de duplicar código.

La sintaxis de estas es así:

~~~c++
// tipoDeDatoRetornado nombreFuncion(tipoDeDato parametros) puede tener tanto 0 parametros como 1, 2, 3...
int suma(int numero) //en este caso la función tendra que devolver un valor int y su unico parametro debe ser un int
{
    return numero + 2 //devolvemos el parametro + 2
}
~~~

También podemos hacer funciones que no devuelvan ni un tipo de parámetro usando "void" en el tipo de dato de la siguiente forma:

~~~c++
void suma(int numero) {
    std::cout << numero + 2;
}
~~~



importante recordar que cuando tenemos mas de 1 parámetro en la función debemos escribirlo así: **`void suma(int numero1, int numero2)`** y añadimos mas si esto es necesario.

Y las funciones pueden ser llamadas de múltiples formas (todas estas deben ser o desde la función **main** o desde otra función que sea llamada desde esta) estas formas son:

+ llamándolas de forma simple: esto lo logramos simplemente mencionando `nombreFunción(parametros)` recuerden que los parámetros solo se incluyen si la función los tiene. 

  Esta forma se vería de la siguiente forma:

  ~~~c++
  int suma(int numero1, int numero2) //los parametros pasados tienen el nombre "numero1 y numero2"
  {
      std::cout << numero1 + numero2; 
  }
  
  int main()
  {
      suma(1,2) // ejecutamos de forma simple la función y le damos 2 parametros
  }
  ~~~

  **Recuerden que en c++ las funciones deben ir siempre sobre nuestra función main**.

  ---

+ llamándolas con alguna otra función: también podemos a veces iterar directamente con ellas como lo haríamos de la siguiente forma:

  ~~~c++
  int suma(int numero1, int numero2) //los parametros pasados tienen el nombre "numero1 y numero2"
  {
      return numero1 + numero2; 
  }
  
  int main()
  {
      // le damos 2 parametros y mostramos en la consola el valor retornado de la función
      std::cout << suma(1,2); 
  }
  ~~~

  ---

+ Aplicándolas a una variable: también podemos aplicarlas a una variable que acepte el tipo de dato retornado, por ejemplo:

  ~~~c++
  int suma(int numero1, int numero2) //los parametros pasados tienen el nombre "numero1 y numero2"
  {
      return numero1 + numero2; 
  }
  
  int main()
  {
      int numerosSumados = suma(1,2); 
  }
  ~~~

---

**Hay un tema importante a tomar en cuenta.**

Como ya alguno se habrá dado cuenta nuestra función "**main**" tiene un tipo de dato **int** antes de su nombre, eso significa que ¿debe retornar algún valor?, pues **no**.

En términos simples la función `main()` no requiere del retorno de un valor a parte de un 0 que **se ejecuta de forma automática al final de la misma función**, al igual que en todas las funciones que son **void**, pero el `main()` si puede retornar un valor.

**En caso de que la función `main()` retorne 0, la ejecución de la misma se parara en esa línea especifica**.

---

# Header files

Hagamos una revisión de nuestro hola mundo.

~~~c++
#include <iostream>

int main()
{
    std::cout << "Hola Mundo";
}
~~~

De todo lo que se presenta ahí, hay solo 1 tema que aun no hemos revisado y esta presente en la primera línea, hablo de los **header files**.

Los **header files** son archivos de c++ a los que referenciamos desde nuestro código, estos contienen ciertas funciones y en ciertos casos, sirven para hacer un código mas limpio.

De hecho como podemos ver en el "Hola Mundo", usando la línea `#include <iostream>` lo que hacemos es **llamar a todas las funciones que se encuentran dentro de un archivo con el nombre "iostream"** y de hecho, podemos hacer nuestros propios **header files**.

Pero antes imagina que tienes 2 archivos de c++:

~~~c++
// archivo 1
#include <iostream>

int main()
{
}
~~~

~~~c++
// archivo 2
int suma(int numero1, int numero2)
{
    return numero1 + numero2;
}
~~~

Como podemos ver, un archivo es nuestro main y otro tiene una función, lo que ocurre es que si queremos acceder a esa función desde nuestro archivo main, debemos "instanciar la función" dentro de nuestro main.

eso lo hacemos escribiendo solo los "datos superiores de la función" en nuestro archivo main, de la siguiente forma:

~~~c++
// archivo 1
#include <iostream>

int suma(int numero1, int numero2);

int main()
{
}
~~~

Esto significa que podemos acceder a esta función en especifico, pero este método tiene un problema y es que si queremos acceder a varias funciones o no queremos copiar y pegar todo eso en los demás archivos que lo requieran podemos finalmente **hacer un header file**.

Y de hecho hacer un **header file** es bastante fácil y al menos en Visual Studio 2019 (el IDE que utilizo) solo requiere de hacer los siguientes pasos:

1. Ve a la pestaña "Solution Explorer" y da clic derecho en la carpeta **"Header Files"** (también se puede en source pero por temas de orden es mejor la anterior).
2. Das clic en `Add > New Item` y seleccionas la opción **Header File.**
3. Le añades un nombre y cliqueas la opción "**Add**".

Tras esto se creara un archivo con extensión `.h` (imaginemos que su nombre es **`sumando.h`**) con lo siguiente:

~~~c++
#pragma once // esto le dice al compilador que compruebe que este archivo se llame solo 1 vez por archivo
~~~

Luego de tener el archivo creado aquí tendremos que "**instanciar**" las funciones que llamaremos con nuestro **header file** y basándonos en el ejemplo que di, debemos hacerlo de la siguiente forma:

~~~c++
#pragma once

int suma(int numero1, int numero2);
~~~

Y para llamar esa función en nuestro archivo main debemos añadir el header file con `#include` de la siguiente manera:

~~~c++
#include <iostream>
#include "sumando.h"

int main()
{
    suma(1,4); // ahora podemos acceder sin problemas a esa función y las demas que deseemos añadir
}
~~~

---

# Operadores

A la hora de trabajar con datos de distintos tipos es muy probable que tengamos la necesidad de iterar entre ellos de ciertas formas como: sumando, asignando o comparando. 

Formas de iterar que se generan gracias a los distintos operadores que el lenguaje nos entrega.

---

## Operadores aritméticos

Los operadores aritméticos son los que nos permiten hacer cálculos matemáticos básicos.

| Operador |          Descripción          |
| :------: | :---------------------------: |
|    +     |             Suma              |
|    -     |             Resta             |
|    *     |        Multiplicación         |
|    /     |           División            |
|    %     | Modulo (sobrante de división) |
|    =     |          Asignación           |
|    ++    |            Sumar 1            |
|    --    |           Restar 1            |

En si los básicos son estos pero tengo que mencionar algo en el caso de los operadores `--` y `++`.

Si intentamos hacer lo siguiente:

~~~c++
int main()
{
    int numero = 0;
	std::cout << numero++; // este valor seguira siendo 0
}
~~~

Esto ocurre dado que tanto estos operadores como los de asignación se deben aplicar antes de usarse, por ejemplo:

~~~c++
int main()
{
    int numero = 0;
    numero++ // le sumamos 1
	std::cout << numero; // este valor seguira siendo 1
}
~~~

Y hablando sobre los operadores de asignación, son los siguientes:

| Operador |                         Descripción                          |
| :------: | :----------------------------------------------------------: |
|    =     |                  Asignar un dato a un valor                  |
|    +=    |                      Suma en asignación                      |
|    -=    |                     Resta en asignación                      |
|    *=    |                 Multiplicación en asignación                 |
|    /=    |                    División en asignación                    |
|    %=    |                     Modulo en asignación                     |
|   <<=    | Asignar desplazamiento a la izquierda (se vera mas adelante) |
|   >>=    | Asignar desplazamiento hacia la derecha (se vera mas adelante) |
|    &=    |       Asignar "AND" entre bits (se vera mas adelante)        |
|    ^=    |       Asignar "XOR" entre bits (se vera mas adelante)        |
|   \|=    |        Asignar "OR" entre bits (se vera mas adelante)        |

Todos estos funcionan cuando queremos operar sobre el mismo elemento, por ejemplo:

~~~c++
int main()
{
    short numero = 0; // podriamos sumarle 1 a la variable haciendo "numero = numero + 1", o tambien:
    numero += 1; // esto nos permite acortar la linea en base a ese operador
}
~~~

---

## Operadores condicionales

Como ya mencione, cuando trabajamos con datos una de las formas de iterar entre ellos es haciendo comparaciones mejor llamadas "condicionales", pero ya llegaremos a eso.

Los operadores lógicos nos permiten comparar 2 datos de distintas formas y tras esto nos devuelven el valor **true** si esta condición es verdadera y **false** si ocurre lo contrario.

Estos operadores son:

| operador |  definición   |
| :------: | :-----------: |
|   `==`   |     igual     |
|   `!=`   |   no igual    |
|   `>`    |   mayor que   |
|   `>`    |   menor que   |
|   `>=`   | mayor o igual |
|   `<=`   | menor o igual |

Y de por si podemos hacer varias cosas con estos, cosas como:

~~~c++
// añadirlos a una variable que reciba un booleano
bool verdadero = (1 == 1); // el valor de esto es true
bool falso = (1 != 1); // el valor de esto es falso

// en condicionales
if (1 == 1)
{
    // ejecutar codigo
}
~~~

Este ultimo lo veremos un poco mas adelante.

---

## Operadores Lógicos

Los operadores lógicos nos permiten sacar un valor booleano en base a 2 condiciones y su estado, estos los utilizaremos principalmente a la hora de usar condicionales y nos permiten trabajar de forma mas sencilla utilizando mas de 1 condición.

Técnicamente su uso se basa en la siguiente sintaxis: `(condicion1) operador (condicional2)` y dependiendo del valor de los condicionales (y el operador) se determinara un valor (**true** o **false**).

**Antes de continuar, tengo que mencionar algo importante, para hacer mas "fácil" esta documentación, los operadores lógicos los ingresare junto a su misma versión en python**, podrás verlo mas adelante, pero con eso ya dicho.

Los operadores lógicos se dividen en:

### Conjugación lógica

el operador de conjugación es `&&` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

| C++  | Conjugación | Python |
| :--: | :---------: | :----: |
|  &&  |      y      |  and   |

Este operador se puede mencionar como **multiplicación lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |    &&(*)    |  false(0)   | false(0)  |
|  false(0)   |    &&(*)    |   true(1)   | false(0)  |
|   true(1)   |    &&(*)    |  false(0)   | false(0)  |
|   true(1)   |    &&(*)    |   true(1)   |  true(1)  |

---

### Disyunción lógica

El operador de disyunción es `||` y sirve para evaluar si el valor o condición del lado izquierdo **o** el del lado derecho se cumplen.

| C++  | disyunción | python |
| :--: | :--------: | :----: |
| \|\| |     o      |   or   |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |   \|\|(+)   |  false(0)   | false(0)  |
|  false(0)   |   \|\|(+)   |   true(1)   |  true(1)  |
|   true(1)   |   \|\|(+)   |  false(0)   |  true(1)  |
|   true(1)   |   \|\|(+)   |   true(1)   |  true(1)  |

---

### Negación lógica

El operador de negación es `!` se encarga de **transformar** booleanos de true a false y viceversa

| C++  | Negación | python |
| :--: | :------: | :----: |
|  !   |    no    |  not   |

Este operador funciona así:

| negación | booleano | resultado |
| :------: | :------: | :-------: |
|    !     |   true   |   false   |
|    !     |  false   |   true    |

---

# Condicionales

Las condicionales son en efecto parte fundamental a la hora de escribir código.

Estas nos permiten ejecutar (o no) un bloque de código **en base a una condición o booleano**, así permitiéndonos controlar el flujo lógico de nuestro código y estos se dividen en los siguientes:

---

## Condicional If

La condicional "**if**" es la "principal" de todas las existentes, sin esta las demás no pueden existir (excepto en el caso de los bucles).

*Su sintaxis es la siguiente:*

~~~c++
// si (una condicion o booleano) es "True"
if (condición o booleano)
{
    //ejecutar bloque de codigo
}
~~~

Con lo de "condición o booleano" me refiero al factor de que en los "**if***" puedes hacer lo siguiente:

~~~c++
// ejemplo con condicional
if (1 == 1)
{
    std::cout << "la condición se cumple";
}

// ejemplo con booleano
if (true) // si añadimos una variable booleana verdadera, no hace falta hacer (variable == true), solo debemos llamar la variable
{
    std::cout << "la condición se cumple";
}
~~~

---

## Condicional Else if

Los "**else if**" son una continuación directa del if (si es que la condición de este no se cumple) y nos va a funcionar como un "plan b" a la hora de trabajar con condicionales, de hecho el "**else if**" no funcionara si no tenemos antes de este un if al que este anidado.

*Su sintaxis es la siguiente:*

~~~c++
if (1 != 1) // en este caso hare un if con una condición "false"
{
	// ejecutar bloque de codigo
}
else if (condición o booleano)
{
    // ejecutar código
}
~~~

De hecho en temas de su "condición o booleano" admite los mismos tipos de datos que el if y de las mismas formas.

**Un dato importante es que el condicional "else if" es el único que se puede repetir mas de 1 vez a diferencia de los "if" o "else"**.

---

## Condicional Else

Este es ya "nuestro ultimo plan" y nos permite ejecutar un bloque de código (**en caso que ni una condicional anterior "if o else if" tiene un valor "true"**) y a diferencia de estos anteriores **este no requiere de una condición**

*Su sintaxis es la siguiente:*

~~~c++
if (1 != 1) // en este caso hice un if con una condición "false"
{
	// ejecutar bloque de codigo
}
else if (2 != 2) // en este caso hice un else if con una condición "false"
{
    // ejecutar código
}
else
{
    // ejecutar código
}
~~~

----

# Bucles 

Imaginemos que quieres mostrar en pantalla el texto "Hola!!!", tarea fácil, ¿no?, solo seria usar `std::cout << "Hola!!!";` y no habría problema, pero...

**Que ocurre si queremos hacerlo 100 veces**, podríamos simplemente copiar y pegar la misma línea 100 veces (no lo hagas) o usar bucles.

Los bucles tienen una función similar a las condicionales y es que ambos ejecutan un bloque de código según cierta instrucción o condición, a excepción que los bucles **repiten  ese bloque de código hasta que nosotros lo hagamos detenerse**.

Hay 2 bucles en c++ **y debes recordar que el uso de uno u otro depende mas de lo que necesites**.

---

## Bucle for

El bucle for es el "mas controlable de todos", este nos permite **ejecutar el bucle en base a un "conteo"**, esto lo logramos con la siguiente sintaxis:

~~~c++
// for (variable nueva; condición que hará nuestro bucle romperse (cuando sea false); edicion a aplicar)
for (int i = 0; i < 100; i++)
{
    std:cout << "Hola!!!" << std::endl;
}
~~~

En este ejemplo:

1. Como variable nueva hacemos un "int" con el valor 0 (puede ser cualquier valor inicial mientras sea el mismo tipo de dato).
2. Como condición añadí (i < 100)  y el bucle se repetirá hasta que esto sea falso.
3. Como "editor" añadí (i++) ósea que cada vez que se repita el código se le sumara 1 a la variable i

Entonces **cuando la variable "i" tenga un valor menor a 100, nuestro bucle dejara de repetirse**

Incluso podemos hacer un contador imprimiendo el valor de **`i`** de la siguiente forma:

~~~c++
for (int i = 0; i < 100; i++)
{
    std:cout << i << std::endl;
}
~~~

Pero quizá te diste cuenta de algo y es que cuando imprimimos el **"Hola!!!"** este se mostro 100 veces en pantalla, mientras que en el caso que imprimimos el contador, este llego hasta 99.

Esto es por un tema muy especifico que tienen muchos lenguajes de programación y es que en muchos casos, a la hora de hacer conteos estos **siempre** empezaran por el 0, en este ultimo ejemplo no es que tengamos 99 números, **son 100** solo que el 0 esta añadido a ellos.

---

## Bucle while

El bucle while es mas similar a una condicional que el bucle "for".

Los bucles while se caracterizan por ser en efecto un bloque de código que se repetirá **hasta que una condición sea falsa** de hecho su sintaxis es la siguiente:

~~~c++
while (condición o booleano)
{
    // bloque de código a ejecutar
}
~~~

Y si, al igual que el if, también puede recibir un "true" o "false" como condición.

Este en si es mas "inseguro" dado que debemos poner mas atención en el bucle en si para no hacerlo "infinito", por ejemplo:

~~~c++
// si quisieramos hacer un bucle que muestr un mensaje de forma infinita podriamos hacer eso
while (true) // podemos cambiarlo por otra condición
{
    std::cout << "Hola!!!" << std::endl; // este mensaje se mostrara infinitamente
}
~~~

mientras que para ser mas precavidos podríamos "imitar" la forma en la que funciona un "for", por ejemplo:

~~~c++
int count = 0; // creamos una variable con valoro inicial 0
while (count < 100) // nuestro bucle se debe repetir hasta que la variable sea mayor o igual a 100
{
	std::cout << "Hola!!!" << std::endl; 
	count++; // le sumamos 1 al contador (para intentar hacer "false" la condición)
}
~~~

Esto nos permitirá mostrar en pantalla 100 veces el mensaje "Hola!!!" como hicimos anteriormente y con solo algunos cambios, podríamos hacer que muestre el valor actual de la variable "count" cada vez que el bucle se repita, así haciendo un contador.

También existe otra "versión" del ciclo while, solo que este **ejecuta un bloque de código y luego comprueba la condicional**, este es mejor conocido como el bucle "**Do while**" 

*Su sintaxis es la siguiente:*

~~~c++
do
{
  // bloque de codigo
}
while (condicion o booleano);
~~~

---

## Sentencias de control de flujo

Las sentencias de control de flujo son ciertas "Palabras clave" que nos permiten iterar sobre el flujo de nuestros bucles, estas sentencias son: **`continue`**, **`break`** y **`return`**.

Primero iniciemos con **`continue`**, este nos permite **saltar a la siguiente iteración del bucle**, o sea:

~~~c++
// imagina que tenemos un bucle que muestra los numeros del 0 al 9 pero saltandose los numeros pares
for (int i = 0; i < 10; i++)
{
    if (i%2 == 0) // si el modulo de i / 2 = 0 (osea el numero es par)
    {
        continue // se salta esta iteracion
    }
    else // si no
    {
     	std::cout << i << std::endl;   
    }
}
~~~

Esto nos permitirá comprobar si el valor de i es un numero par y de ser así este código **continuara** a la siguiente iteración.

---

El siguiente será **`break`** y este nos permite "**romper**" el bucle, o sea:

~~~c++
// imagina que tenemos un conteo infinito y queremos que este termine en el 49 (es un mal ejemplo pero servira)
int i = 0; // creamos una variable con la que iterar
while (true) // creamos el bucle infinito
{
    std::cout << i << std::endl; // mostramos en la consola un numero
    i++; // sumamos 1 al numero que mostraremos en la consola
    if (i == 50) // cuando el numero sea igual a 50
    {
        break; // romper el bucle
    }
}
~~~

El bucle tras romperse continuara ejecutando lo que este fuera del bucle en si.

---

El ultimo es **`return`** y de hecho este es el único de estos ya mencionados que puede usarse también fuera de un bucle.

La función de este es devolver un valor (cualquiera) dentro de una función, **al ocurrir esto, la función se cerrara (cerrando el programa en caso que este sea posicionado en el main)**, o sea:

~~~c++
int main()
{
    return 0; // este siempre debe ir acompañado de un dato para funcionar
    std::cout << "Este texto no se mostrara en pantalla, dado que el return cerrara el programa antes";
}
~~~

---

# Manejo de memoria

A la hora de programar hay muchos temas de los que tenemos que preocuparnos y **el manejo de la memoria** puede ser uno de los mas importantes, en ella se almacenara todos los datos relacionados a nuestro código **cuando este se ejecute** y el procesador acudirá a ella para así ejecutar nuestro código y almacenar en la misma los datos que requieran ser guardados.

Aun que hay muchos lenguajes que trabajan con la memoria de forma automática, en el caso de c++ el saber trabajar con esta **será esencial a la hora de hacer nuestro código lo mas eficaz posible**.

Antes de continuar veamos como se estructura la memoria al menos para c++.

Imagina una columna llena de casillas como la siguiente:

| Índice | Memoria por casilla |
| :----: | :-----------------: |
|   0    |   1Byte (8 bits)    |
|   1    |   1Byte (8 bits)    |
|   2    |   1Byte (8 bits)    |
|   3    |   1Byte (8 bits)    |
|   4    |   1Byte (8 bits)    |
|   5    |   1Byte (8 bits)    |
|  ...   |         ...         |

En este caso cada casilla tiene un valor de 1 Byte (8 bits) y nos permite almacenar información en ellos.

*Según el ejemplo:*

+ Un dato de tipo **`bool`** utiliza una casilla (1 Byte)
+ Un dato de tipo **`Char`** utiliza una casilla (1 Byte)
+ Un dato de tipo **`Int`** utiliza cuatro casillas (4 Bytes)
+ Y así con otros tipos de datos...

---

## Referencias

Las "referencias" (references como lo veras en otros lugares) son "**datos que referencian un espacio especifico de la memoria**".

A la hora de crear variables e iterar con estas cada uno de esos datos se almacenan en distintas partes de la memoria, **incluso si tienen el mismo valor** y las referencias sirven como un "alias" para estas partes de la memoria.

*Entonces:*

~~~c++
// si creamos una variable
int a = 5; // digamos que este referencia 4 casillas de la memoria index(0,1,2,3)

// y la referenciamos desde otra de forma normal
int b = a; // en este caso, esta variable referencia otras 4 casillas distintas index(4,5,6,7)

// en total estos datos usaran 8 Bytes de memoria
~~~

Pero para hacer que la segunda variable llame el mismo dato (en la misma posición de la memoria) debemos usar el operador **`&`**, este nos permitirá crear ese "alias" para referenciar esas "casillas".

Debo mencionar que las referencias pueden tener 3 variantes que en su sintaxis son correctas y estas por ejemplo son:

+ **`int & b = a`**
+ **`int& b = a`**
+ **`int &b = a`**

Y no habrán errores en ni uno de estos casos.

*Por ejemplo:*

~~~c++
int a = 5; // digamos que este referencia 4 casillas de la memoria index(0,1,2,3)

int &b = a; // al hacer esto otorgamos a la variable "b" en la memoria con posicion index(0,1,2,3)

//entonces si llamamos a ambos datos
std::cout << a << std::endl; // este llamara al dato almacenado en las casillas index(0,1,2,3)
std::cout << b << std::endl; // este tambien llamara al dato almacenado en las casillas index(0,1,2,3) solo que lo llama por su alias
~~~

Entonces tanto **`a`** como **`b`** mencionan el mismo valor tanto como la misma posición en memoria, otro tema a mencionar es que en este caso si hacemos una edición en la variable **`a`** como en su referencia.

*Por lo que si hacemos lo siguiente:*

~~~c++
int a = 5;
int& b = a;

a += 10; // esta edicion se aplicara tanto a la variable "a" como a su referencia

//entonces si llamamos a ambos datos
std::cout << a << std::endl; // este nos dara el valor 15
std::cout << b << std::endl; // este igualmente nos dara el valor 15
~~~

**Un uso muy común de este es dentro de una función** específicamente **pasando datos a esta**.

*Por ejemplo:*

~~~c++
void sumarUno(int& x) // cuando creamos el parametro, este sera una referencia a la posicion en la memoria
{
    x++ // sumamos 1 a la variable
}

int num = 2; // digamos que este valor hace referencia a index(2,3,4,5)
sumarUno(num) // pasamos el dato a la variable
~~~

Estos tienen los siguientes pros:

+ Guarda memoria (para datos grandes)
+ Puede cambiar los datos en una función sin problemas

Este ultimo es importante dado que como vieron en el ejemplo no hace falta usar un **"return"** para aplicar los cambios hechos dentro de la función.

---

## Pointers

Si las referencias nos servían para para en efecto "**referenciar un dato en base a su posición en la memoria en lugar de basándonos en su variable**", los pointers nos permiten "apuntar" hacia una posición en la memoria y trabajar con los datos que esta referencia.

Esto lo lograremos con el operador **`&`** para representar la posición en la memoria de un dato y el operador **`*`** para inicializar un pointer.

~~~c++
// de hecho si por ejemplo hacemos lo siguiente:
int x = 10;
std::cout << &x; // esto nos entregara la posicion/indice en memoria del dato (en hexadecimal) en mi caso es 008FFDE8
~~~

Ojo que el valor puede variar dado que el dato se define automáticamente en una posición que este desocupada de la memoria y para inicializar un pointer debemos hacer lo siguiente:

~~~c++
int x = 10; // creamos una variable con la que vamos a trabajar
int *ptr = &x;

// ahora al hacer
std::cout << ptr; // esto llamara la posicion en memoria igualmente (008FFDE8)
~~~

El operador **`*`** puede estar presente de estas 3 formas:

+ **`int *ptr = &x;`**
+ **`int * ptr = &x;`**
+ **`int* ptr = &x;`**

Ni una de estas generara error.

Otra cosa importante a mencionar en cuanto a la sintaxis de los **pointers** es que un **int pointer** es diferente a un **int** común, por lo que si intentamos hacer algo como lo siguiente:

~~~c++
int x = 1;
int *ptr = &x;

bool dato = (ptr == x); // esto dara falso

// por otro lado si hacemos:
bool dato2 = (*ptr == x) // esto nos dara true dado que en este caso el "*" llama el valor dentro del pointer
~~~

En términos simples **utilizamos el `*` para mencionar que crearemos un pointer de un tipo de dato** (por ejemplo un `int*` es el pointer de un int) **y el `&` para obtener la posición en memoria**.

---

# Poo

La programación orientada a objetos es un "paradigma de programación" (o sea es una forma de programar) y uno de los lenguajes que lanzo esto a la popularidad es c++, de hecho a pesar de ser una comparación incorrecta, se le suele mencionar a **C++** como un **C** con clases.

Este paradigma nos permite la creación de "objetos" o clases que serán contenedores de tanto los datos que componen a nuestro objeto, como de las acciones que el mismo puede hacer (mejor llamados métodos).

---

## Clases

Las clases las utilizaremos para representar los objetos que crearemos, esta puede verse como una "caja" llena de los datos que pertenecen al objeto en si, además de las "acciones" que este puede hacer en forma de funciones.

La sintaxis "básica" de una clase se vería de la siguiente forma:

~~~c++
class nombreClase
{
    int x = 50;
    void nombreMetodo() // tecnicamente un metodo es una funcion, solo que el nombre de "metodo" se le aplica al ser parte de un objeto
    {
        // bloque de codigo
    }
    // aqui iran tanto los datos del objeto, como sus metodos
}; // las clases deben terminar si o si con un ";"

// entonces:
int main()
{
    // primero, para llamar una clase debemos inicializarla de la siguiente forma:
    nombreClase nuevoNombreClase; // ahora para acceder a la clase usamos "nuevoNombreClase"
    
    // si queremos llamar los datos de la clase usaremos: nombreClase.dato y lo podremos usar por ejemplo asi:
    std::cout << nuevoNombreClase.x << std::endl; // en este caso llamaremos el valor "50"
    
    // si queremos ejecutar un metodo de una clase utilizamos la siguiente sintaxis:
    nuevoNombreClase.nombreMetodo();
}
~~~

Un tema importante en este caso es el factor de que al llamar el dato **x** en el main, este nos dará error dado que estos datos por defecto son privados, o sea que solo son accesibles por los métodos del objeto.

Pero podemos cambiar eso haciendo lo siguiente:

~~~c++
class nombreClase
{
    int z = 150; // este valor al estar afuera del "public" se quedara privado
public:	// podemos hacer lo contrario usando "private:"
    // todos los datos ingresados aqui seran publicos
    int x = 50; 
    int y = 100;
};

int main()
{
    nombreClase nuevoNombreClase;
    
	std::cout << nuevoNombreClase.x << std::endl; // este se mostrara de forma exitosa
    std::cout << nuevoNombreClase.y << std::endl; // este se mostrara de forma exitosa
    std::cout << nuevoNombreClase.z << std::endl; // este valor nos generara un error dado que su variable es privada
}
~~~

Debo aclarar que lo mismo ocurrirá con los métodos si no están dentro de la KeyWord **`public:`**.

Otro tema que nos puede generar confusiones son los **Structs**, estos funcionan exactamente igual a las clases excepto que estos **por defecto definen sus datos y funciones como publicas**, ejemplo:

~~~c++
struct nombreStruct
{
    int z = 150; // este valor es publico
private:
    // todos los datos ingresados aqui seran privados
    int x = 50; 
    int y = 100;
};
~~~

Y al igual que una clase común, puede almacenar funciones (métodos).

Otro tema es que debemos recordar que los objetos son como un "molde", por lo que podemos "instanciar múltiples objetos con los mismos datos" pero con distintos valores, por ejemplo:

~~~c++
struct nombreStruct
{
    int num; // en este caso el valor sera nulo
};

int main()
{
    nombreStruct numero; // creamos el objeto "numero" en base al struct "numero"
    nombreStruct numero2; // creamos el objeto "numero2" en base al struct "numero"
    
    numero.numero = 5; // el valor de "num" en "numero" es 5
    numero.numero2 = 10; // el valor de "num2" en "numero" es 10
} 
~~~

---

## Static

El static es una "**KeyWord**" que cambia de utilidad dependiendo de donde este colocada, o mejor dicho dependiendo de su "contexto".

*Estos pueden ser:*

+ Dentro de una clase o struct:

  imagina que tenemos 1 clase con 2 datos en su interior:

  ~~~c++
  #include <iostream>
  
  class ejemplo
  {
  public:
      int x;
      int y;
  
      void print() // hacemos una funcion que mostrara en pantalla los datos de la clase
      {
          std::cout << x << ", " << y << std::endl;
      }
  };
  
  int main()
  {
      // iniciamos los objetos
      ejemplo objeto1;
      objeto1.x = 10;
      objeto1.y = 20;
      
  	ejemplo objeto2;
      objeto2.x = 30;
      objeto2.y = 40;
  
      objeto1.print();// el valor de estos datos es (10, 20)
      objeto2.print();// el valor de estos datos es (30, 40)
  }
  ~~~

  En este caso hacemos una clase normal pero si usamos Static de la siguiente forma:

  ~~~c++
  #include <iostream>
  
  class ejemplo
  {
  public:
      // añadimos la palabra static a los datos que lo usaran
      static int x; 
      static int y;
  
      void print() // hacemos una funcion que mostrara en pantalla los datos de la clase
      {
          std::cout << x << ", " << y << std::endl;
      }
  };
  
  // el primer cambio es que debemos referenciar los datos desde fuera de la clase y la funcion main asi:
  int ejemplo::x;
  int ejemplo::y
  
  int main()
  {
      ejemplo objeto1; // en este caso solo haremos cambios en 1 objeto
      ejemplo objeto2;
      objeto1.x = 10; 
      objeto1.y = 20;
      
      objeto1.print();// el valor de estos datos es (10, 20)
      objeto2.print();// el valor de estos datos es (10, 20)
  }
  ~~~

  Esto ocurre dado que los "datos static" en una clase se aplican a todas las instancias de la clase, no importa si hacemos el cambio en el objeto 1 como en el 2, en ambos se aplicara el mismo cambio.

  Y si queremos hacer lo mismo con una función, debemos hacer lo siguiente:

  ~~~c++
  #include <iostream>
  
  class ejemplo
  {
  public:
      static void print() // añadimos "static a la funcion"
      {
          std::cout << "este es un mensaje" << std::endl;
      }
  };
  
  int main()
  {
      // iniciamos nuestros objetos pero tecnicamente no hace falta
      ejemplo objeto1;
      ejemplo objeto2;
      
      // en este caso solo hace falta llamar a la clase principal y a la funcion que queremos ejecutar
      ejemplo::print();
      ejemplo::print();
  }
  ~~~

  **Recuerda que un método que sea static solo puede interactuar con valores que sean predefinidos como static**.

  ---

+ Fuera de una clase o struct:

  Imagina que tenemos 2 archivos de c++ distintos en la misma carpeta con los siguientes códigos:

  ~~~c++
  #include <iostream>
  
  // si definimos una variable o funcion aqui, esta sera visible desde el archivo principal
  int numero = 5;
  // si quisieramos llamar el otro valor exacto deberemos usar "extern int numero;"
  
  // archivo principal
  int main()
  {
      std::cout << numero;
  }
  ~~~

  Y el archivo secundario:

  ~~~c++
  // archivo secundario
  
  // si definimos una variable o funcion aqui, esta sera visible desde el archivo principal
  int numero = 10;
  ~~~

  Por lo que si hacemos esto recibiremos un error diciendo que **se ha encontrado una o mas instancias del mismo dato**.

  Para evitar esto utilizamos el Static que hace un valor privado específicamente para el archivo en si, por lo que si hacemos esto:

    ~~~c++
    #include <iostream>
    
    // si definimos una variable o funcion aqui, esta sera visible desde el archivo principal
    int numero = 5; // este valor sera nuevo y no generara problemas al ser ejecutado
    
    // archivo principal
    int main()
    {
        std::cout << numero; // nos dara el valor 5
    }
    ~~~

    Y el archivo secundario:

    ~~~c++
    // archivo secundario
    static int numero = 10; // esto solo sera accesible desde aqui
    ~~~

  Si intentamos llamar el dato con el ejemplo del "extern" teniendo un dato Static, este nos dará un error.

  **Todo esto se aplica tanto a los datos, variables y constantes como a las funciones**

---

## Static local

Un static local es un dato o función estática que se ingresa dentro del scope (los `{}`) de una función, condicional, clase, etc.. y que nos permite hacer referencia a un dato "que guardara un valor después de ser llamado".

por ejemplo, digamos que queremos hacer lo siguiente:

~~~c++
for (int i = 0; i <= 5; i++)
{
    std::cout << i << std::endl;
}
~~~

Esto funcionara como un contador que aumentara en 1 la variable **i** cada vez que se repita el bucle, pero... 

¿y si quisiéramos hacer algo similar con una función?, intentemoslo:

~~~c++
void count()
{
    int i = 0; // iniciamos el dato como "0"
    std::cout << i << std::endl; // mostramos en pantalla el valor de la variable
    i++; // sumamos en 1 el valor de la variable
}

int main()
{
    count();
    count();
    count();
    count();
    count();
    count();
}
~~~

A pesar de "aparentar tener sentido" en este caso al intentar ejecutar el código nos daremos cuenta de algo importante y es que **todas las funciones nos mostraran el 0** en lugar de sumar de 1 en 1 y mostrar el resultado.

Esto ocurre dado que al iniciarse la funcion "count()" esta define i con el valor de 0 y este deja de existir al terminar la funcion, esto lo podemos arreglar haciendo lo siguiente:

~~~c++
int i = 0; // al definir aqui la variable, esta estara siempre disponible y su valor se vera editado por la funcion

void count()
{
    std::cout << i << std::endl; // mostramos en pantalla el valor de la variable
    i++; // sumamos en 1 el valor de la variable
}

int main()
{
    // esto funcionara correctamente haciendo un contador del 0 al 5
    count();
    count();
    count();
    count();
    count();
    count();
}
~~~

 el problema de esto es que esa variable será visible para todo nuestro código, si queremos hacer algo mas "limpio" o incluso mejor en varios casos, debemos usar los "static locales", para esto y usando el mismo ejemplo ejecutaremos lo siguiente:

~~~c++
void count()
{
	static int i = 0; // el valor al ser static, su estado final se mantiene guardado
    std::cout << i << std::endl; // mostramos en pantalla el valor de la variable
    i++; // sumamos en 1 el valor de la variable
}

int main()
{
    // esto funcionara correctamente haciendo un contador del 0 al 5
    count();
    count();
    count();
    count();
    count();
    count();
}
~~~

----

## Enums

Los **enums** son similares a las clases, solo que estos nos permiten "almacenar" valores numéricos que requieran de un conteo, como son dias de la semana, horas o solo números que irán en orden cronológico (a  no ser que digamos lo contrario).

Se hacen de la siguiente forma:

~~~c++
enum semana
{lunes, martes, miercoles, jueves, viernes, sabado, domingo};
~~~

Entonces si hacemos lo siguiente:

~~~c++
int main()
{
    semana dia; // primero referenciamos el enum
    std::cout << lunes; // en este caso al ser el primer valor mostrara un "0"
    std::cout << miercoles; // en este caso al ser el tercer valor mostrara un "2"
}
~~~

Estos valores van por defecto desde el 0 y aumentaran dependiendo del orden de los datos ingresados, pero como ya mencione anteriormente esto puede cambiar, de las siguientes formas:

~~~c++
enum ejemplo1 // el valor de estos es el por defecto (0, 1, 2, 3, 4, 5)
{x, y, z, a, b, c}; 

enum ejemplo2 // el valor de estos inicia desde el 10 (10, 11, 12, 13, 14, 15)
{x = 10, y, z, a, b, c}; 

enum ejemplo3 // el valor variara hasta el ultimo valor asignado, desde aqui aumentara normalmente (10, 5, 3, 4, 5, 6)
{x = 10, y = 5, z = 3, a, b, c}; 
~~~

---

## Constructors

Estos son métodos especiales que se ejecutan obligatoriamente cada vez que nuestra clase sea instanciada, y su uso común es "**aplicar los valores básicos a los datos que hay dentro de las variables de nuestra clase**".

*Para esto nos basaremos en el siguiente ejemplo:*

~~~c++
class nombreClase
{
    int x; // iniciamos x como un valor nulo
    
    nombreClase() // nuestro construct debe tener el mismo nombre que su clase
    {
    	x = 10; // asignamos un valor a "x" dentro de la misma clase
    }
};
~~~

Esta es la función básica de un constructor, pero si queremos añadir datos desde una función como lo es nuestro "main" podemos hacer lo siguiente:

~~~c++
class nombreClase
{
public:
    int x;
    
    nombreClase(int y) // en este caso podemos añadir el valor que querramos al crear el objeto
    {
        x = y // asignamos el valor recogido a la variable que ya tenemos 
    }
};

int main()
{
    // instanciamos el objeto
    nombreClase clase(5) // creamos la clase y le damos el parametro 5 a su constructor (x = 5)
}
~~~

---

## Destructors

Los **Destructors** son como el gemelo "malvado" de los constructors, dado que su función es similar pero inversa, o sea que estos a diferencia de los constructors **solo se ejecutaran cuando el "objeto" o mejor dicho su instancia sea destruida**.

*Por ejemplo:*

~~~c++
class nombreClase
{
public:
    nombreClase() // este es nuestro constructor
    {
        // este mensaje se mostrara al crear el objeto
        std::cout << "el objeto se ha creado" << std::endl; 
    }
    ~nombreClase() // los destructors llevan el nombre de su clase pero con un "~" antes
    {
        // este mensaje se mostrara al destruir el objeto
        std::cout << "el objeto se ha destruido" << std::endl 
    }
};

void funcionPrueba()
{
    // al estar dentro de una funcion el objeto se creara y estara vivo hasta que la misma termine
    nombreClase clase; 
}

int main()
{
    funcionPrueba()
}
~~~

Esto nos mostrara los 2 mensajes de forma exitosa.

---

## Herencia

La herencia es **la "relación" entre 2 clases, una "padre" y otra "hija" donde la clase "padre" hereda sus datos y métodos a la clase hija** y esto es bastante útil para evitar la repetición de código.

*Por ejemplo:*

~~~c++
// imagina que estamos haciendo un juego y tenemos una base para hacer los personajes
class personaje
{
public:
    int vidas;
    bool estaVivo = True;
    int posicionX;
    int posicionY;
};

// para hacer un objeto que herede estos datos hacemos:
class jugador : public personaje
{
  // todos los datos de "personaje" ahora estan en "jugador"  
};

int main()
{
    // si hacemos algo como lo siguiente:
    jugador jug;
    srd::cout << jug.estaVivo; // esto se ejecutara de forma exitosa
}
~~~

---

## Funciones virtuales

Imagina que hacemos 2 clases, la segunda hereda todos los datos y métodos de la primera, pero hay ciertas funciones que queremos cambiar, para esto usamos las **funciones virtuales**, son funciones que "nos permiten" recrearlas en sus "clases hijo" sin generar problemas, por ejemplo:

~~~c++
class persona
{
public:
    void saludar()
    {
        std::cout << "buenos dias" << std::endl;
    }
};

class persona2 : public persona
{
public:
    void saludar()
    {
        std::cout << "holas" << std::endl;
    }
};
~~~

Si intentamos hacer esto funcionara de forma correcta si simplemente ejecutamos nuestra función desde nuestro main, pero en otro caso si intentamos hacer cosas mas complejas, puede que esto nos genere errores en el output de nuestro programa.

Para esto debemos marcar las funciones como **"Funciones virtuales"** lo cual nos asegurara que esa función en especifico nos permite "sobrescribirla".

Esto lo hacemos con la siguiente sintaxis:

~~~c++
virtual void saludar()
{
    // bloque de codigo
}
~~~

Y esto no es obligatorio pero recomiendo usar la keyword **override** cuando sobrescribamos un método, esto no generará un "cambio en su funcionamiento" es mas o menos como un "marcador" para señalar que la función que acabamos de sobrescribir es en efecto una un método sobrescrito. 

De la siguiente manera:

~~~c++
class persona
{
public:
    virtual void saludar() // esta funcion es "virtual"
    {
        std::cout << "buenos dias" << std::endl;
    }
};

class persona2 : public persona
{
public:
    void saludar() override // de esta forma "marcamos que esta funcion ha sido sobrescrita"
    {
        std::cout << "holas" << std::endl;
    }
};
~~~

Si queremos hacer algo llamado **Funciones virtuales puras** o "interfaces" en otros lenguajes, osea "funciones puras que solo reciben un bloque de codigo cuando se sobrescribe en una clase hijo" hacemos lo siguiente

~~~c++
class padre
{
public:
    virtual void saludar() = 0; // creamos la funcion virtual y la dejamos vacia (igualandola a 0) 
};

class hijo : public padre
{
public:
    void saludar() override // la "sobrescribimos" desde su clase hijo
    {
        std::cout << "holas" << std::endl;
    }
};
~~~

---

