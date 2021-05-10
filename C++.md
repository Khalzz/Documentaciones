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
+ 

---

# Primeros pasos en C++

C++ es un mundo gigante a explorar pero aun así como supongo es "obvio" debemos empezar desde el inicio.

---

## Conocimientos previos

Antes de enseñarte a codificar en si debes ser consiente de algunos "términos" específicos que te ayudaran a entender mas esta documentación **especialmente la introducción si no la entendiste inicialmente**.

Estos términos "importantes" son:

+ **Lenguaje de nivel bajo**: los "niveles de abstracción" representan como el lenguaje se comunica con el ordenador, un lenguaje de alto nivel requiere un interprete para ejecutarse (un programa que transforme el código en lenguaje de maquina y su funcionamiento exitoso depende del sistema), mientras que un lenguaje de bajo nivel se ejecuta por un compilador que directamente transforma nuestros scripts en código nativo.

  ---

+ **Tipado fuerte**: al definir variables de un tipo, estas no pueden transformarse a otro a no ser que se haga una conversión, o sea que si definimos una variable como entero, luego no podemos darle un valor string por ejemplo.

  ---

+ **Tipado estático**: significa que necesitamos "definir" el tipo de dato para las variables.

  ---

+ **Programación orientada a objetos**: Es un tipo de programación que ocupa principalmente un esquema de "clases" y "métodos" (tema que se profundizara mas adelante).

---

## Instalando C++

En si para trabajar con C++ vamos a requerir de 2 distintos elementos:

+ Visual Studio 2019 (puede ser otro IDE o otra versión de Visual Studio, pero esta será la que utilizare para enseñarte).
+ El WorkLoad "**Desktop development with C++**" (obligatorio) y "**Game development with C++**" (opcional). Ambos los encontraremos en la pestaña de "instalación de módulos" o "workloads" al instalar Visual Studio o al abrir "Visual Studio Installer".

Tras tener todo esto instalado podemos comenzar a editar nuestro código.

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

Esto ocurre por que `std::cout` requiere que manualmente hagamos un salto de línea, principalmente utilizando un salto de linea y tenemos 2 métodos para hacerlo.

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
      std::cout << "Buenas Noches!!!"; // no hace falta añadir la secuencia de escape dado que es la ultima linea
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

## <<

Como ya notaron (**al menos en el std::cout <<**) a diferencia de otros lenguajes de programación que para llamar las funciones utilizan `print("texto")` en C++ utilizamos `std::cout << "texto";` y quiero hacer un notable enfasis en el signo `<<`.

El signo `<<` lo que en este caso hace es ejecutarse como una "función" en si mismo, de hecho seria como hacer esto:

~~~c++
std::cout.print("texto"); // recuerda que esto es un ejemplo, de hecho no funcióna en c++
~~~

Entonces al menos por ahora cuando veas el signo `<<` piensa en el como una función en especifico mas que en un operador, como es en otros lenguajes.

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

Por lo que en el caso de tener un numero de 8 bits **por defecto** el rango va desde **-128, hasta 127** y hago un enfasis en **por defecto** dado que tambien podemos usar ese bit como un valor numérico en lugar de un signo y es usando **`unsigned`** al definir nuestras variables, de la siguiente forma:

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

Esto ocurre específicamente por que al mostrarlo en la consola con `std::cout <<` este se encargara de leer los bits del char y hacer una evaluación sobre la necesidad, si se usa de forma aritmética (en sumas, restas u otras operaciones) seguirá siendo un numero, pero al querer mostrarlo en pantalla.

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
      std::cout << suma(1,2); // le damos 2 parametros y mostramos en la consola el valor retornado de la función
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
      int numerosSumados = suma(1,2); // le damos 2 parametros y aplicamos el valor retornado a una variable
  }
  ~~~

---

**Hay un tema importante a tomar en cuenta.**

Como ya alguno se habrá dado cuenta nuestra función "**main**" tiene un tipo de dato **int** antes de su nombre, eso significa que ¿debe retornar algún valor?, pues **no**.

En la función main no es necesario usar un return dado que esta es especial y técnicamente lo que hace es "retornar un 0 automáticamente" mientras que en todas las funciones (que no sea **main** ni sean un **void**) necesitamos retornar algún valor para que estas funcionen sin generar errores.

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

Como podemos ver, un archivo es nuestro main y otro tiene una función, lo que ocurre es que si queremos acceder a esa funcón desde nuestro archivo main, debemos "instanciar la función" dentro de nuestro main.

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
    short numero = 0; // si quisieramos sumarle 1 a la variable podriamos hacer numero = numero + 1, o tambien:
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

el operador de conjugación es `and` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

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

El operador de disyunción es `or` y sirve para evaluar si el valor o condición del lado izquierdo **o** el del lado derecho se cumplen.

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

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

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




