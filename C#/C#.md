# C#

**Documentación hecha por Rodrigo Seguel**

C# (c sharp) es un lenguaje de programación multiparadigma (pero principalmente orientado a objetos) multi-propósito el cual funciona principalmente con el **framework .NET** aunque también es compatible con otros, como Xamarin para creación de aplicaciones móviles nativas multi-plataforma o con Unity para la creación de videojuegos .

Este nace el 2001 de mano de Microsoft como una opción que pudiera competir con c++ tanto como con java de por si, **de hecho el "#" de su nombre viene de agregar otros ++ a los que ya tiene c++ y esto lo usaban para "decir" que c# es una versión mas fuerte de c++ (aun que sus usos no sean ni mínimamente similares en algunos casos)**.


## Indice

1. [Abrir proyecto](#Abrir-proyecto)
2. [Comentarios](#Comentarios)
3. [Hello World](#Hello-World)
4. [Variables y tipo de datos](#Variables-y-tipos-de-datos)
   + [Métodos de variables](#Métodos-de-variables)
   + [Métodos de string](#Métodos-de-string)
   + [Secuencias de escape](#Secuencias-de-escape)
5. [Operadores](#Operadores)
   + [Operadores aritméticos](Operadores-aritméticos)
   + [Operadores de asignación](Operadores-de-asignación)
   + [Operadores lógicos](#Operadores-lógicos)
     + [Conjugación lógica](#Conjugación-lógica)
     + [Disyunción lógica](#Disyunción-lógica)
     + [Negación lógica](#Negación-lógica)
6. [Condicionales](#Condicionales)
   + [Operadores de lógica booleana](#Operadores-de-lógica-booleana)
   + [Condicional if](#Condicional-if)
   + [Condicional else if](#Condicional-else-if)
   + [Condicional else](#Condicional-else)
   + [Instrucciones de selección condicional]()
7. [Bucles](#Bucles)
   + [For](#For)
   + [While](#While)
   + [Do while](#Do-while)
   + [Foreach](#Foreach)
   + [Instrucción break y continue](#Instrucción-break-y-continue)
8. [Colecciones](#Colecciones)
   + [Arrays](#Arrays)
   + [Arrays multidimensionales](#Arrays-multidimensionales)
   + [Listas](#Listas)
     + [Métodos de lista](#Métodos-de-lista)
   + [Diccionarios](#Diccionarios)
9. [Poo](#Poo)
   + [Clases](#Clases)
   + [Métodos y funciones](#Métodos-y--funciones)
     + [Método constructor](#Método-constructor)
   + [Encapsulamiento](#Encapsulamiento)
   + [Llamar clases externas](#Llamar-clases-externas)
   + [Herencia](#Herencia)
     + [Polimorfismo](#Polimorfismo)
10. [Windows Forms](#Windows-Forms)

---

## Abrir proyecto

Para abrir un proyecto de consola, debemos entrar en nuestro editor **en este caso uso visual studio code** y escribir en la terminal `dotnet new console`.

Esto abrirá una aplicación de consola, añadiendo todos los archivos y carpetas necesarios para iniciar el proyecto.

A la hora de ejecutar el código se creara un archivo en una carpeta oculta de visual studio code con el nombre de **launch.json** ahí podemos configurar la forma en la que se ejecutara el programa, pero en el caso de novatos, y usuarios de programas de consola, la opción mas importante es la siguiente linea:

~~~json
"console": "internalConsole",
//esto genera que la aplicacion se ejecute en la terminal integrada del editor de codigo
//----------------------------------------------------------------------------------------
"console": "externalTerminal",
//este genera que la aplicacion se ejecute en una terminal externa
~~~

Y con todo esto ya logrado, podremos empezar a programar en el archivo "program.cs"

---

## Comentarios 

Como ya he mencionado este tema en algunas documentaciones anteriores, específicamente en mi documentación de python,

Los comentarios son muy importantes en cada proyecto, sea el lenguaje que sea, sea de lo que sea que se trate, debes mantener a tu equipo o a tu futuro yo documentado e informado de lo que hiciste en tu código

Para hacer comentarios en **C#** usamos `//`

~~~c#
//este es un comentario de una linea
------------------------------------------------------------------------------------------
/* este es
un comentario
multi linea */
~~~

---

## Hello World

Cuando creas el nuevo archivo de C#, este ya vendrá con un **Hello World** por defecto y desde este puedes empezar a hacer tu propio proyecto.

~~~c#
using System; //este "using" permite tanto acortar el codigo, como agregar modulos

namespace prueba_doc
{
    class Program //clase programa
    {
        static void Main(string[] args) //metodo principal
        {
            Console.WriteLine("Hello World!"); //hola mundo
        }
    }
}
~~~

Cabe resaltar que a diferencia de python, este lenguaje requiere de un uso constante de CamelCase y de el ";" para terminar muchas de sus lineas de código.

---

## Variables y tipos de datos

Para almacenar datos en la memoria de la aplicación usamos variables, len estas podemos almacenar tanto números, como texto, como otro tipos de datos.

Anteriormente en la documentación de python mencione la sintaxis de una variable, pero en el caso de c# es un poco mas compleja.

**Su sintaxis es: **

**`TipoDeDato NombreVariable="dato a almacenar"`**

Estos tienen "convertidores" cuya función envés de asegurar un tipo de dato (como se usaba en python) sirve para convertir un dato por ejemplo **de un int a un string**

Los tipos de datos son los siguientes:

| tipo de dato |                          definición                          | convertidor            |
| ------------ | :----------------------------------------------------------: | ---------------------- |
| int          | son los números enteros "de 32 bits" **van desde el -2.147.483.648 hasta el 2.147.483.648 | Convert.ToInt32()      |
| double       | son números decimales **extendidos** (como lo seria "1.111111111") | Convert.ToDouble()     |
| float        | son números decimales cortos (como lo seria el "1.1;1.2;1.3...") | Convert.ToFloat()      |
| string       | son "cadenas de texto" que tienen la capacidad de concadenarse | Convert.ToString()     |
| bool         |   los booleanos pueden ser 2 datos distintos (true/false)    | Convert.ToBolean       |
| const        |     constantes (valores/datos que no se pueden cambiar)      | n/a                    |
| char         | son variables que solo pueden almacenar una variable. como lo seria `a` o otros | variable.tochararray() |

### Métodos de variables

Los métodos son acciones que podemos ejecutar en el código, la sintaxis de estos es `System.Console.Metodo()`pero al haber un **using System;** en el código, podemos saltarnos el "System" y solo escribir `Console.Metodo()` .

 Algunos de estos (las mas usadas) son los siguientes:

| Método              | Definición                                                   |
| ------------------- | ------------------------------------------------------------ |
| ReadKey()           | lee cual y cuando se presiona una tecla                      |
| ReadLine()          | lee como string una linea de texto que ingreses (similar al input de python) |
| WriteLine()         | escribes una linea de texto (luego de esto hace un salto de linea) (similar al print) |
| write()             | escribes una linea de texto (luego de esto se mantiene en la misma linea) |
| Environment.Exit(0) | cierra la consola/terminal                                   |
|                     |                                                              |
|                     |                                                              |
|                     |                                                              |
|                     |                                                              |

Como extra podemos usar `int.MinValue;` o `int.MaxValue;` permiten mostrar el numero mas bajo o el mas alto de un grupo de números int.

### Métodos de string

En estos casos los string también tienen sus propios métodos, su función directa viene al usarlos escribiendo `variableString.Metodo()` y estos son:

| métodos       | definición                                                   |
| ------------- | ------------------------------------------------------------ |
| toupper()     | devuelve el string en mayúscula                              |
| tolower()     | vuelve el string en minuscula                                |
| split("dato") | se divide string donde este el dato ingresado en el parentesis |
| trim          | elimina espacios al inicio y al final del string             |

Para reemplazar strings debemos hacer lo siguiente:

~~~c#
//ejemplo
//declaro la variable
string invierno="hace calor";
//decimos en que dato hacer cambios y añadimos en el parentesis el dato a cambiar y su vercion nueva
string verano=invierno.remplace(frio,calor);
~~~

### Secuencias de escape

Las secuencias de escape son caracteres especiales que requieren de usar en efecto símbolos que ya de por si significan algo para el lenguaje de por si, y algunos de estos son:

| Secuencia de escape | Definición                                                   |
| ------------------- | ------------------------------------------------------------ |
| `\\`                | permite el uso de  una barra inversa `\`                     |
| `\t`                | permite una tabulacion                                       |
| `\"`                | permite generar comillas dobles (" ")                        |
| `\r`                | permite sobrescribir el texto                                |
| `\r\n`              | salto de linea en windows (se puede reemplazar por un Environment.Newline) |
| `\n`                | salto de lineas en (se puede reemplazar por un Environment.Newline)s |
| {{                  | muestra en un string  {{                                     |
| }}                  | muestra en un string  }}                                     |

Para interpolar strings (osea el poder añadir datos sobre un string) debemos seguir la siguiente sintaxis:

`Console.WriteLine($"este es un string{variable}y le añadi una variable")`

y de esa forma se añaden datos al mismo string aun que tambien tenemos la posibilidad de simplemente escribir `"dato 1"` +  `"dato 2"`

---

## Colecciones

**recordatorio, a la hora de trabajar con colecciones debes ingresar en las primeras lineas **

`Using System.Collections.Generic;`

Estos en si son "grupos de datos o variables" que permiten el uso de variables unidas en una variable en particular.

Hay 2 tipos principales de colecciones

### Arrays

Los arrays son "variables" que permiten la agrupación de un tipo de dato en especifico en el mismo, osea que solo puede almacenar o int, strings,float ,etc... pero no todos en el mismo array, cabe recordar que estos no se pueden agrandar tras haberse creado, pero si se pueden sobrescribir.

Su sintaxis es la siguiente:

~~~c#
//declarar un array unidimensional de 5 enteros
variable [] nombreArray = new variable[n° de elementos];
//--------------------ejemplo-real-----------------------
int[] ArrayNumeros = new int[5];
~~~

En este ejemplo creamos un array unidimensional, osea un array donde cualquier elemento es accesible por un indice.

Por otro lado si sabemos los datos que tenemos que ingresar en el array antes de la ejecución del código podemos usar la siguiente sintaxis:

~~~c#
//declarar un array unidimensional donde se su contenido
variable[] nombreArray = new variable[] {datos,del,array};
//SINTAXIS ALTERNATIVA
variable[] nombreArray = {datos,del,array}
//--------------------ejemplo-real-----------------------
int[] arrayNumeros = new int[] {1,2,3,4,5}
//--------------------ejemplo-real-2---------------------
int[] nombreArray = {1,2,3,4,5}
~~~

Este es bastante usado en este caso en los siclos `for` para poder ver el contenido de los mismos por ejemplo:

~~~c#
for(variable lista=0;lista<array.length;lista++)
{
    bloque de codigo
}
~~~

En un ejemplo real y mas claro seria asi

~~~c#
//declaro un array
int[] Array = {1,4,3,7,2};
//tambien puede ser asi dado que no importa en este caso el contenido del mismo
int[] Array = new int[5];

//creamos una variable numbers en el for
//mientras numbers sea menor o igual a el "largo" del array sumale uno a la variable
for(int numbers=0;numbers<=Array.Length;numbers++)
{
	Console.WriteLine(numbers); //bloque de codigo que en este caso muestra los numeros
}
~~~

Pero en este caso lo único que hace es mostrar los números de la variable nueva, por ejemplo en este caso nuestro array tenia 5 dígitos, pero al tener una variable nueva que va del 0 hasta el 5 sera (0,1,2,3,4,5) en lugar de mostrar exactamente los números que tenemos introducidos en el array en si.

Para poder hacer esto ultimo mencionado es mejor usar un foreach:

 ~~~c#
//declaro mi array
int[] Array = {1,4,3,7,2};

//creamos la variable "numbers" y automaticamente se le asigna a los datos en el array
//por cada numbers(datos dentro del array) en el array
foreach(int numbers in Array)
{
    Console.WriteLine(numbers); //imprime en consola la variable numbers
}
 ~~~

en este caso si o si debemos usar un array con sus datos ya especificados por le hecho de que no se imprime algo mediante lo largo del array, sino según lo que tiene en su interior.

Para llamar un dato especifico del array por su "indice" debemos llamar el array y usar corchetes, **cabe recordar que en los arrays su indice va del 0 hasta el numero de datos en el array**.

 ejemplo:

~~~c#
//se declara el array con los datos en su interior
int[] Array = {1,4,3,7,2};

//se imprime en consola el indice del array n°1 (en este caso el indice 1 es el numero 4)
Console.WriteLine(Array[1]);
~~~

Para añadir datos a un array, debemos llamar el array, elegir en que puesto (indice) colocar el objeto y igualarlo al objeto a añadir.

Ejemplo:

~~~c#
Array[0]=1;
//en este caso asignamos a la primera posicion el numero 1
~~~

---

### Arrays multidimensionales

Para hacer arrays multidimensionales debemos usar una sintaxis muy similar a la de los arrays unidimensionales solo que en este caso envés de configurarlo para ser una "linea recta llena de datos" **este debe iniciarse pensando en una cuadricula, ademas de que no se llama por un indice, sino hay que llamar el indice de alto y largo**.

Ejemplo:

~~~c#
//asi declaramos el array multidimensional, pero sin datos en el interior
variable[,] nombreArray = new variable[n°ancho,n°largo];
//--------------------ejemplo-real-----------------------
int[,] numeros = new int[5,5]; //en este caso se crrea un array de 5x5
~~~

Por otro lado si sabemos los datos que tenemos que ingresar en el array unidimensional antes de la ejecución del código podemos usar la siguiente sintaxis:

~~~c#
//asi declaramos el array multidimensional pero junto a los datos del mismo
variable[,] multiArray = { {datos,del,array,ancho}, {dato,del,array,alto} };
//--------------------ejemplo-real-----------------------
int[,] multiArray = {{1,2,3},{1,2,3}}
~~~

Y como es importante, para añadir o llamar datos debemos usar el "indice doble", osea:

~~~c#
//añadir datos "ejemplo"
multiArray[1,0] = datoAañadir;
//llamar datos "ejemplo"
multiArray[1,0];
~~~

---

### Listas

Las listas al igual que los arrays son un conjunto de datos ingresado en una misma variable, solo que en este caso las listas pueden tener dentro varios tipos de datos, desde strings,int,float,etc... y despues de tenerla creada, a diferencia del array este si puede recibir nuevos datos

su sintaxis es la siguiente:

~~~c#
List<variable> nombre = new list<variable>();
//--------------------ejemplo-real-----------------------
List<int> numeros = new List<int>();
~~~

Si por ejemplo queremos usar este en un foreach, lo usaríamos así:

~~~c#
foreach(int nombreNuevo in nombreLista)
{
    
}
//--------------------ejemplo-real-----------------------
foreach(int numero in numero)
{
    Console.WriteLine("numero")//se imprimen los numeros de la lista
}
~~~

---

#### Métodos de lista

Como casi todo en c# puedes interactuar con objetos, variables o datos en general y para eso en caso con las listas debes usar la siguiente sintaxis `lista.Método()`

| Método      | Definición                                                   |
| ----------- | ------------------------------------------------------------ |
| add()       | añade datos en una lista                                     |
| insert()    | inserta datos a la lista, apartando a los mas altos          |
| reverse()   | da la vuelta a la lista                                      |
| toarray()   | devuelve una lista en forma de array                         |
| contains(t) | devuelve un booleano **sirve en if (if lista.contains(dato))** |
| count()     | cuantos datos tiene la lista?                                |
| remove()    | remueve un dato de la lista                                  |
| indexof()   | dice la posición del valor de la lista                       |

---

### Diccionarios

Los diccionarios son como las listas solo que a la hora de interactuar con ellos no se usa solo un indice, sino una clave.

Estos se dividen en (clave y valor) y una de su principal funcionalidad, es que por ejemplo si llamamos la clave de un dato, nos entregara el valor y viceversa.

Ejemplo de sintaxis:

~~~c#
dictionary<var,var>nombre = new dictionary<var,var>();
//--------------------ejemplo-real-----------------------
dictionary<int,int>numeros = new dictionary<int,int>
~~~

Este también se ve afectado por los métodos que aplican en las listas usando:

`diccionario.Metodo(clave,valor)`.

Y su uso en un foreach seria este:

~~~c#
foreach(keyvaluepair<var,var>nombre in variable)
{
    bloque de codigo
}
~~~

---

## Operadores

Los operadores son símbolos que indican el tipo de operación que se le aplicara a los operandos (datos) y de estos, hay 3 tipos.

---

### Operadores aritméticos

Es un tipo de operador que manipula datos de forma matemática, estos datos usualmente son enteros (int), decimales (float) o decimales extendidos (double)

ejemplo: `datoX + datoY` 

| operadores |    definición    |
| :--------: | :--------------: |
|    `+`     |       suma       |
|    `-`     |      resta       |
|    `*`     |  multiplicación  |
|    `**`    |     potencia     |
|    `/`     |     división     |
|    `%`     | modulo (residuo) |
|     ++     |  aumentar en 1   |
|     --     |  disminuir en 1  |

---

### Operadores de asignación

Es un tipo de operador que permite asignar información de un dato a otro, ya sea para editarlos, mostrar que estos son el mismo dato, entre otros tipos de acciones que se pueden hacer con estos operadores

ejemplo: `datoX = datoY` en este caso el "=" es el operador de asignación

| operadores |          definición          |
| :--------: | :--------------------------: |
|    `=`     |   asignar o igualar datos    |
|    `+=`    |      suma en asignación      |
|    `-=`    |     resta en asignación      |
|    `*=`    | multiplicación en asignación |
|    `/=`    |    división en asignación    |
|    `%=`    |     modulo en asignación     |

---

### Operadores lógicos

**Los operadores lógicos se dividen en 4 tipos principales y para verlos los comparare con los mismos operadores pero del lenguaje python aun que también se usan en otros lenguajes de la misma manera.**

#### Conjugación lógica

el operador de conjugación es `&&` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

|  C#  | Conjugación | python |
| :--: | :---------: | :----: |
|  &&  |      y      |  and   |

Este operador se puede mencionar como **multiplicación lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |    &&(*)    |  false(0)   | false(0)  |
|  false(0)   |    &&(*)    |   true(1)   | false(0)  |
|   true(1)   |    &&(*)    |  false(0)   | false(0)  |
|   true(1)   |    &&(*)    |   true(1)   |  true(1)  |

#### Disyunción lógica

El operador de disyunción es `||` y sirve para evaluar si el valor o condición del lado izquierdo **o** el del lado derecho se cumplen.

|  C#  | disyunción |  python  |
| :--: | :--------: | :--: |
| \|\| |     o      |  or  |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |   \|\|(+)   |  false(0)   | false(0)  |
|  false(0)   |   \|\|(+)   |   true(1)   |  true(1)  |
|   true(1)   |   \|\|(+)   |  false(0)   |  true(1)  |
|   true(1)   |   \|\|(+)   |   true(1)   |  true(1)  |

#### Negación lógica

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

|  C#  | Negación |  python  |
| :--: | :------: | :--: |
|  !   |    no    | not  |

Este operador funciona así:

| negación | booleano | resultado |
| :------: | :------: | :-------: |
|    !     |   true   |   false   |
|    !     |  false   |   true    |

En la introducción de los operadores mencione que eran 4 pero el cuarto, los [**Operadores de logica booleana**](#Operadores-de-lógica-booleana) tienen mas que ver con lo que son las condicionales, por eso los preferí poner en esa parte de la documentación

---

## Condicionales

Para hacer programas funcionales debemos comprobar constantemente si ciertas condiciones se cumplen o no, para esto usamos las condicionales.

### Operadores de lógica booleana

Estos operadores son especiales y están hechos para "comparar" datos de una condicional y estos operadores son los siguientes:

| operador |  definición   |
| :------: | :-----------: |
|   `==`   |     igual     |
|   `!=`   |   no igual    |
|   `>`    |   mayor que   |
|   `>`    |   menor que   |
|   `>=`   | mayor o igual |
|   `<=`   | menor o igual |

---

### Condicional if

La condicional `if` (si) se basa en una pregunta bastante fácil tanto de ejecutar como de responder y funciona de la siguiente forma:

~~~c#
#si (condicion) se cumple
if ("ejemplo" == "ejemplo")
{
	Console.WriteLine("algo");   
}
//si no es true, el codigo continua y se salta lo que hay en esta condicional
~~~

Si la condición en si se cumple se ejecuta el código, si no, no se ejecuta y continua con las siguientes lineas, ademas estas condiciones se pueden enlazar/anidar.

Ejemplo:

~~~c#
if (condicion1 == condicion1)
{
    if (condicion2 == condicion2)
    {
        //ejecutar codigo;
	}
}
~~~

---

### Condicional else if

La condicional `elif` una abreviación de`else if` o `si no, si` esta condición actúa cuando la condición if o otra condición `elif` no se cumple.

Ejemplo:

~~~c#
if (condicion)
{
    //esta condicion no se cumple;
}
else if (condicion2)
{
    //esta condicion se cumple y ejecuta codigo;
}
~~~

---

### Condicional else

La condicional `else` o `si no` sirve para ejecutar una acción si ni una de las condiciones antes expuestas es  correcta o se cumple.

Ejemplo:

~~~c#
if (condicion)
{
    //esta condicion no se cumple;
}
else if (condicion2)
{
    //esta condicion no se cumple y no se ejecuta codigo;
}
else
{
    //si no se cumplen las condiciones anteriormente aplicadas se ejecuta esta linea;
}
~~~

---

### Instrucciones de selección condicional

A la hora de usar variables, puede que nosotros queramos que el usuario elija entre un numero especifico de las mismas y para eso usamos el **`switch`**.

Su sintaxis es la siguiente:

~~~ c#
int numero=1
switch(numero)	//se propone el switch y la variable que ocupara
{
    case 1: //en caso que el valor sea 1
        Console.Write("la var es uno");
        break;	//se rompe la cadena
    case 2:	//en caso que el valor sea 2
        Console.Write("la var es uno");
        break;
    default:    // si ni un caso se cumple
        Console.Write("ni un caso ha coinsidido");
        break;
}
~~~

**Cabe recordar que el case usa ":" envés de ;**

---

## Bucles

Los bucles son acciones de código que se repiten mientras una condición sea "true" o hasta llegar a un estado que nosotros determinemos como "el final del bucle".

---

### for

Este bucle tiene la capacidad de determinar "el dato inicial", "condicional" y "la forma en la que cambia" ya sea si es un numero que sube de 1 en 1 o un array que se va consultando de forma constante, el for buscara o ejecutara esa acción  hasta que esa condición pase de ser true a false.

Su sintaxis es la siguiente:

~~~c#
for(inicio/variable; condicional; como cambia)
{
    codigo a ejecutar;
}
~~~

Un ejemplo mas claro del mismo seria:

~~~c#
//luego de darse la variable, se comprueba si numero es menor que 10
//al ser numero menor a 10, se repite la accion hasta que esa condicion sea falsa
//mientras esa condicion sea real, se le sumara 1 a numero
//por cada vez que se repite se mostrara en consola el numero, desde el 0 al 10
for(int numero=0; numero<=10; numero++)
{
    Console.WriteLine(numero);
}
~~~

---

### while

El bucle While (o como es su traducción literal **mientras**) se basa en ejecutar una acción **mientras** esa condición sea true.

Su sintaxis básica es la siguiente:

~~~c#
while (condicion)
{
    codigo que se repite
}
~~~

Cabe recordar añadir la condición con la que cambia la variable y el fin de el bucle (cuando este terminara).

---

### do while

Este bucle se define directamente como un bucle que **ejecuta una acción mientras una condición sea true**.

Su sintaxis es la siguiente:

~~~c#
do 
{
    bloque de codigo //este codigo se ejecuta
}while(condicional) //si esta condicional es true, se repite, si es false se rompe
~~~

Como ejemplo practico seria:

~~~c#
int numero=0;
do
{
    Console.WriteLine(numero);
    numero++
}while(numero<=10)
~~~

En este caso, este funcionara de la misma forma que el ejemplo que tengo del for, aumentara los numeros hasta que este tenga un valor igual a 10.

---

### foreach

Este bucle se define directamente como uno que ejecuta una acción **por cada iterable en una colección (como lo seria por cada variable en un array, lista, entre otros)**.

Ejemplo: 

~~~c#
//daremos un ejemplo que tenemos un array
// numeros = [0][1][2][3][4]
foreach (int num in numeroS)
{
    Console.WriteLine(num)
}
~~~

En este caso se mostrara en consola los números que hay desde el primer array hasta el ultimo y en ese punto, el bucle va a detenerse.

---

### Instrucción break y continue

Estas son instrucciones que nos permiten interactuar con el código en los bucles, en este caso hablaremos de 2 muy importantes:

+ break; (esta instrucción se encarga de que cuando un caso o algo en particular ocurra en el bucle se pueda romper el mismo y se continué con el bloque de código que venga luego)
+ continué; (este detiene el bucle actual, vuelve al inicio de la instrucción y vuelve a empezar por la siguiente iteracion si es que esta existe.
+ goto; (esta instrucción genera la posibilidad de poder ir a una funcion en especifico al cumplirse una parte especifica del código)

---

## Poo

Ya hemos visto lo suficiente de programación general, pero c# funciona de forma muy fuerte basándose en programación orientada a objetos, por lo que para un uso completo del mismo, debemos aprender como funciona este mismo en este lenguaje.

**La programacion orientada a objetos tiene 4 pilares fundamentales y estos son**:

+ Encapsulamiento (Es la capacidad de ocultar datos y o permitir que estos iteren en otros objetos
+ abstraccion (Expresa las caracteristicas especiales de un objeto (y que lo diferencia de otro))
+ herencia (La capacidad de que un objeto "herede" el funcionamiento y datos de otro)
+ polimorfismo (La capacidad de que estos datos "heredados" se puedan editar en el objeto nuevo)

**Ademas la programación orientada a objetos se divide en 2 partes principales**

+ clases: son el "encapsulador principal" o también el "molde o plantilla" de la programación orientada a objetos, dentro de esta van las propiedades y métodos de los objetos, osea los datos con los que trabaja ese objeto y las acciones que ejecuta.
+ atributos (o variables): son los datos que tiene un objeto.
+ métodos (o funciones): son las acciones que genera un objeto.

---

### Clases

Como ya mencionamos, este es el "molde o plantilla" del objeto en si, por eso aquí van las variables y los métodos/funciones del mismo.

Las clases van en la "sección" de `namespace`.

Ejemplo de sintaxis:

~~~c#
namespace nombre_de_programa
{
    class nombre_de_clase
    {
        //Metodos//variables//atributos
    }
}
~~~

Si tengo 2 clases, puedo llamar los datos o funciones de uno dentro de otro, y para hacerlo, debo hacer:

`nombre_clase nombreNuevo = new nombre_clase();`

entonces cuando le llamemos en la nueva clase podemos usar `nombreNuevo.accion/metodo();` ademas de que en estos casos podemos llamar los datos de la clase como las acciones que hay en la misma.

---

### Métodos y funciones

los métodos y funciones en general son lo mismo, pero se pueden aplicar en distintos ámbitos, en programación orientada a objetos, estos sirven para definir la función de el objeto, definiendo el código que cada acción ejecuta.

Estos van dentro de las clases y tienen la siguiente sintaxis:

~~~c#
namespace program
{
    class nombre_clase
    { 
        //aqui iran nuestras variables (usualmente en estado null)
        static void main(string[] args)
        {
            //bloque de codigo de la funcion
        }
    }
}
~~~

en este caso como ejemplo use el método obligatorio que hay en cada código de c#, pero antes de hablar de como hacer los métodos extra veremos en este caso que son.

+ static: esta palabra clave lo que hace es eliminar la necesidad de crear una instancia de objeto a la hora de llamar un método o atributo.

+ void: en este caso donde esta el void, debe ir la variable que se devuelve (ejemplo int,string,bool, etc..)pero en este caso, el que sea void significa que no devolverá datos en si.
+ main: en este caso el main no es algo en especial, solamente el nombre de la función en si.
+ (string[] args): son los parámetros/argumentos de la función 

Ejemplo para crear nueva funcion:

~~~c#
namespace program
{
    class nombre_clase
    {
        static tipoDeDatoReturn funcionNueva()
        {
            //bloque codigo
        }
        static void main(string[] args)
        {
            nombre_clase.funcionNueva();
            //bloque de codigo de la funcion
        }
    }
}
~~~

Recordar que hay que llamarlos usando `nombreClase.NombreFuncion();` y para devolver un dato usamos la instrucción `return`

Ejemplo de uso de return:

~~~c#
namespace program
{
    class nombre_clase
    {
        static void main(string[] args)
        {
            string hola=Saludo("Rodrigo")
            Console.WriteLine(hola)
        }
        static string Saludo(string nombre) //en el parametro puede haber mas de un dato
        {
            string Saludo=($"hola{nombre}¿que tal?");
            return Saludo;
        }
    }
}
~~~

En este caso se mostrara en consola el "saludo" completo.

si pasamos una variable de una función a otra tenemos que agregarle un nuevo nombre, esto se hace de la siguiente forma:

~~~c#
//metodo 1
int num = metodo2();
//metodo 2
int numero=1; //este le entrega el nuevo valor a la variable
return numero; //este devuelve el nuevo valor de la variable a usar
~~~

**cabe recordar que si no se pasa un dato, ese solo sirve en su propio método**.

---

##### Método constructor

Este es un método especial a la hora de trabajar en programación orientada a objetos, a la hora de trabajar con este como ya mencionamos en las clases es donde colocamos nuestros atributos y métodos, pero como mostré en ejemplos anteriores podemos llamar el atributo y otorgarle un dato de inmediato.

*por ejemplo*:

~~~c#
class program
{
    int numero = 3;    
}
~~~

Pero esto es extraño a la hora de mantener un orden, para eso usaremos un `Metodo constructor`.

*su sintaxis es la siguiente*:

~~~c#
class program
{
    //iniciamos la variable en nulo
    private int numero;
    
    //metodo constructor
    void program(){ //el nombre debe ser el mismo que el de la clase
        numero = 3; //le añadimos los datos a la variable ya iniciamos como nula
    }
}
~~~

Cambien podemos en visual studio code escribir dentro de nuestra clase `ctor` y al presionar enter se creara un método constructor en base a nuestra clase principal.

---

### Encapsulamiento

El encapsulamiento como ya lo mencione y de hecho he dado ejemplos durante esta parte de poo es una característica que tiene tanto los métodos como atributos que hay en nuestro código, específicamente:

***Nos permite decidir si se puede acceder o no desde otras clases o incluso otros archivos de c#***

En este caso el encapsulamiento tiene 3 niveles distintos:

+ privado `private` (los métodos y atributos solo se pueden usar en la clase base)(por defecto son priv)
  + un ejemplo seria `private int numero = 3;` esta variable solo se puede llamar desde su clase
+ protegido `protected`(los métodos y atributos se pueden llamar solo cuando hay herencia)
  + un ejemplo seria `protected string nombre = "Rodrigo";` se crea en clase padre y solo lo pueden llamar las clases hijo
+ publico `public` (sus métodos y atributos se pueden llamar desde cualquier otra clase y/o codigo c#)
  + un ejemplo seria `public float temperatura = 16.65;`

Aun que usar uno de estos viene a la elección de el programador y cabe aclarar que **el encapsulamiento solo se puede usar en variables que estén en la clase, si están dentro de una función genera errores**.

---

### Llamar clases externas

Algo que haremos muy constantemente es llamar clases, atributos o métodos desde otros archivos de c# esto podemos hacerlo de distintas formas y que de hecho pueden sernos o no útiles a la hora de trabajar con programación orientada a objetos.

Primero podemos llamar a una clase instanciandola con un nombre, por ejemplo:

~~~c#
//clase main
class program
{
	static void Main(string[] args)
    {
     	//digamos que tenemos una clase secundaria llamada "clase2"
        //para instanciarla debemos usar
        clase2 nuevoNombre = new clase2();
        
        //ahora si por ejemplo queremos llamar un atributo o metodo debemos usar
        nuevoNombre.atributo;
        //o
        nuevoNombre.atributo = algun valor;
        //o
        nuevoNombre.metodo();
        
    }    
}
~~~

aun que también podemos usar la palabra mágica **`static`**.

static nos permite acceder a una variable o función sin necedad de tener que instanciar su función, solo debemos usar:

~~~c#
class clase2
{
	static void funcion 
    {
		Console.WriteLine("Hola como estas");
    }    
}
~~~

Si quisiéramos llamar esa función desde la clase main deberíamos usar:

~~~c#
class program
{
	static void Main(string[] args)
    {
		clase2.funcion();
    }    
}
~~~

Lo mismo ocurre con con los atributos.

---

### Herencia

La herencia es otra parte importantisima de la programación orientada a objetos.

Esta se basa en separar nuestras clases en 2 tipos distintos:

+ Padre (Clase base donde ira nuestro "molde" que otorgara los datos y funciones básicas para funcionar)
+ Hijo (Clase secundaria, donde recibo los datos de la clase padre para funcionar de igual forma)

En general se basa en el compartir código entre un "molde" y un objeto secundario que lo copia para iterar de forma similar aun que de forma mas fácil "es copiar y pegar con algo mas de estilo ;D".

*Este funciona de la siguiente forma*:

~~~c#
//digamos que tenemos una clase padre con el nombre "Padre"
public class hijo : Padre //asi todas las funciones y variables de padre se agregan a hijo
{
    //si la clase Padre tiene una variable llamada Ejercicio la llamamos por su nombre:
    //la llamare en un constructor
    void hijo{
    	Ejercicio = nuevoDato; //no hace falta llamar denuevo el tipo de dato
    }
    //codigo del objeto
}
~~~

Y para que esto sea posible las variables a pasar deben estar o publicas o protegidas pero recomiendo mejor que sean protegidas.

---

#### Polimorfismo

Este es otro punto especial de la programación orientada a objetos pero principalmente una capacidad de la herencia que de hecho es mucho mas fácil de lo que crees y que acabamos de ver y quizá no se han dado cuenta.

El polimorfismo viene de la capacidad de heredar datos de una clase a otra y luego en la clase hija poder editar esos datos.

*por ejemplo:*

~~~c#
//Creamos una clase padre
class padre
{
    //añadimos una variable en null
    protected int numero;
    //le añadimos un valor en un metodo constructor
    void padre()
    {
    	numero = 3;    
    }
    
    //creamos un metodo
    //al crear un metodo tenemos que hacer que se pueda sobreescribir
    //esto se logra con la keyword "virtual" con eso el metodo espera para ser sobrescrito
    public virtual void decirHola()
    {
    	Console.WriteLine("Hola!, ¿como estas?"); 
    }
}
~~~

*luego desde la clase hija si heredamos de la clase padre, podemos hacer lo siguiente*:

~~~c#
//Creamos una clase hija que hereda la clase padre
class hija : padre
{
    /*
    para cambiar el valor de una variable 
    en la clase hija debemos crear un constructor
    y luego de eso cambiar el valor
    */
	void hija()
    {
        numero = 7; //cambiamos el valor de esta variable de forma instantanea
    }
    
    //llamamos el método del padre
    //para sobrescribirlo debemos añadir en el metodo nuevo la keyword "override"
    public override void decirHola()
    {
        Console.WriteLine("Hola!, ¿Bien y tu?"); 
    }
}
~~~

---

## Windows Forms

Windows forms o los el "Creador de formularios de windows" es una "herramienta" de c# aplicada principalmente en los ide como visual studio comunity y rider. 

 Esta nos permite crear ventanas o "apps gráficas" con c# de una forma bastante intuitiva y sencilla.

---

### Coming Soon
