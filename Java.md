# Java

**Documentación escrita por Rodrigo Seguel**

Uno de los lenguajes mas conocidos en el mundo, uno de los mas usados y a la vez, uno de los mas demandados y el lenguaje en el que se ha creado una de las creaciones y obras maestras de la ingeniería mas grandes de nuestro mundo moderno, exacto estoy hablando de Minecraft.

Creado el año 1991 por Sun Microsystems y posteriormente adquirido por Oracle, este lenguaje orientado a objetos, de tipado fuerte y estático es un lenguaje de un nivel intermedio-alto, esto dado que el lenguaje no corre directamente sobre el hardware de nuestro dispositivo, sino que al menos en computadores, este corre sobre un "virtual machine" o sea un computador virtual que ejecuta nuestro código, por lo que este mismo es completamente portable entre distintos sistemas (mientras estos soporten esta virtual machine).

Java a demás es uno de los 2 lenguajes principales para el desarrollo nativo en Android, por lo que junto a Kotlin podremos usarlo para hacer desarrollo móvil, aun que este lenguaje también es muy usado en el desarrollo backend.

---

## Indice

+ 
---
# Primeros pasos en java

Java es un mundo tan extenso como complejo, por lo que obviamente debemos empezar desde el inicio.

---

## Crear un nuevo proyecto

En nuestro caso voy a recordar que el IDE que estaré utilizando es **Intellij idea**, por lo que cosas como la creación de nuevos proyectos y otros temas que dependan del IDE serán mostrados en torno a este.

Y como es obvio vamos a iniciar desde el principio, como crear y abrir un proyecto, en el caso de Intellij idea debemos hacer clic en ´File > New > Project...´, tras esto se abrirá una pantalla con el titulo **New Project**, en este seleccionamos la versión del SDK y continuamos dando en el botón **Next**, luego seleccionamos la casilla **Create proyect from template** y cliqueamos en **Command Line App**, así tendremos un programa con un "Hello World" en el que podremos empezar a trabajar.

Finalmente elegimos el nombre del proyecto, La localización del mismo y el nombre del paquete base, por defecto este es com.company, pero puedes ponerle el nombre que tu prefieras (**profundizare en esto mas adelante**).

Por ahora solo damos en el botón ´**Finish**´ y así se abrirá nuestro proyecto.

Para abrirlo solo debemos ir a ´open´, seleccionar la carpeta del proyecto a abrir y simplemente esperar a que este cargue.

---

## La estructura de nuestros proyectos

Cuando nuestro proyecto se haya creado con éxito se nos abrirá un "Hello world", pero a parte de esto hay varias otras cosas que debemos tomar en cuenta, primero lo primero. ¿Como se ordenan nuestras carpetas?

Pues en este caso las carpetas tienen el siguiente orden:

+ **`NombreDelProyecto`** (La Carpeta de nuestro proyecto).

  + **`.idea`** (Carpeta contenedora para las configuraciones especificas del editor en nuestro proyecto (nada importante por ahora)).
  + **`src`** (Carpeta contenedora de nuestro código fuente).
    + **`packages`** (Carpeta contenedora de nuestros paquetes).
      + **`com.company`** (Paquete por defecto, sirve para almacenar nuestras clases).
        + **`Main.java`** (Clase Main, es nuestro "Código maestro", el cual se ejecutara principalmente).
  + `NombreDelProyecto.iml`

Los paquetes es una de la parte mas importantes de esta estructura, los paquetes contienen nuestras clases y nos servirán para **"separar nuestro código en distintas clases"**, por lo que los utilizaremos en diversas ocasiones.

Cabe recordar que cuando creamos una nueva clase, o la creamos dentro de el paquete principal, o creamos otro paquete para ese código, de ambas formas podremos acceder a este desde nuestro main, pero igualmente debes priorizar tanto la facilidad en la lectura de nuestro código, como en el control de nuestros archivos

---

## Hola Mundo

Ahora finalmente veremos algo de código, el Hola mundo como es clásico, es nuestra "introducción al lenguaje" y nos permitirá saber algunas bases de como este funciona.

*El Hola mundo en java se ve de la siguiente forma:*

~~~java
package com.company; // este es el paquete al que nuestra clase pertenece

public class Main { // esta es nuestra clase principal la cual es publica

    public static void main(String[] args) { // esta es nuestra funcion main
	// todo el codigo que se escriba aqui se ejecutara
        System.out.println("Hola Mundo"); // este codigo muestra un mensaje en pantalla
    }
}
~~~

En este caso el código autogenerado por nuestro IDE no trae el `System.out.println();` y este debemos ingresarlo nosotros al menos para hacer que el mensaje aparezca en pantalla.

De este ejemplo podemos sacar lo siguiente:

+ Antes de todo debemos llamar el paquete al que esta clase pertenece (e importar los otros que utilizaremos, esto lo veremos mas adelante).
+ El lenguaje por defecto requiere llevar una estructura orientada a objetos, dividido en clases que contienen métodos y atributos.
+ En nuestros archivos hay una función/método "maestro" (main) la cual ejecuta nuestro código
+ Para mostrar un mensaje en la consola utilizamos la función `System.out.println();`
+ Java al igual que muchos otros lenguajes, requiere de un `;` al final de cada línea, con obvias excepciones como son las clases, funciones, condicionales, bucles, entre otros.
+ Para hacer comentarios usamos `//` para los de una lineal y `/**/` para comentarios multilínea.

---

# Variables y tipos de datos

Las variables son una de las partes mas esenciales de la programación en si, el almacenar datos es parte importante para el código que deseemos generar.

Se pueden definir como "cajas que permiten almacenar ciertos contenidos" y que Java al ser un lenguaje de tipado estatico, requiere que seleccionemos el tipo de dato con anterioridad, al igual que en lenguajes como c#, c++, entre otros.

La sintaxis básica de una variable es la siguiente:

~~~java
//privacidad tipoDeDato nombreVariable = dato;

//ejemplo:
public String nombre = "Rodrigo"; // a pesar de hacer esto, se recomienda que todas nuestras variables sean private
private int edad = 18;
private boolean estaVivoPorDentro = false;
~~~

También están las constantes, que son en si datos **cuyo valor no cambia durante la ejecución del programa**, para esto tenemos que escribirlo de la siguiente forma:

~~~java
int metro = 1000; // en este caso seria una variable
int METRO = 1000; // en este caso seria una constante
~~~

Estos pueden estar dentro o fuera de nuestro main, pero si es adentro del mismo no pueden tener encapsulamiento (si son private o public) y si los hacekmos fuera del main debemos si o si agregar el private o public (preferiblemente private) 

## Tipos de datos

La parte mas necesaria de entender para las variables son los tipos de datos, es "el grupo al que pertenece un dato", ya sea un numero entero, números decimales, texto o booleanos, saber las propiedades de cada uno es bastante necesario para poder trabajar normalmente con las variables en si.

Los tipos de datos son:

| Tipo de dato | Descripción                                                  | Ejemplo |
| ------------ | ------------------------------------------------------------ | ------- |
| boolean      | Este tiene solo admite 2 estados (true y false)              | true    |
| byte         | Este admite valores numéricos enteros de 8bits               | 25      |
| short        | Este admite valores numéricos enteros de 16bits              | 3500    |
| int          | Este admite valores numéricos enteros de 32bits              | 10000   |
| long         | Este admite valores numéricos enteros de 64bits              | 1000000 |
| float        | Este tipo de datos admite números decimales de 32bits        | 25.3    |
| double       | Este tipo de datos admite números decimales de 64bits        | 53034.255 |
| String       | Este admite "cadenas de texto" (este si o si debe tener la S mayuscula) los datos de este debe estar entre comillas | "Hola" |
| char         | Este admite únicamente caracteres Unicode (sólo 1) los datos de este debe estar entre comillas simples | 'A' |
|class|Este admite "clases", por ejemplo si tenemos una clase llamada `C` podemos hacer:|C class = new C():|

Con los booleanos podemos hacer algo llamado "operador terciario" que nos permite referenciar un string o dato dependiendo de si un booleano es verdadero o falso, por ejemplo:

~~~java
((booleano)? "es verdadero":"es falso");
// este booleano tambien puede ser una condicional
((1 == 1)? "es verdadero":"es falso"); // en este caso se da el dato "es verdadero"
((1 == 0)? "es verdadero":"es falso"); // en este caso se da el dato "es falso"

// otra cosa que podemos hacer por ejemplo en una funcion usar:
return ((estoyVivo)? "si", "no") + "estoy vivo";
// asi retornamos un string dependiendo de un dato en especifico
~~~

---

## Encapsulamiento

El encapsulamiento es la "proteccion" que el entregamos tanto a nuestras clases, como variables, como funciones.

Y como quizá habrás notado en los ejemplos de las variables utilizamos 2 "keywords" para el encapsulamiento, estos eran:

+ public (permite el acceso de un dato fuera de la clase).
+ private (prohibe el acceso de un dato fuera **de algunas clases**).

Usualmente en java lo recomendado es hacer nuestros datos "privados" para así no generar problemas luego con que alguien por error accede a nuestro dato y terminen ocurriendo notables errores durante la ejecución, por lo que la mayoría de datos en tu programa tendrán que ser privados, para así evitar estos problemas.

Esto es muy necesario a la hora de trabajar con variables, no es muy común en los métodos, pero en algunos casos será necesario.

---

# Colecciones

Las colecciones en si como concepto son otro tipo de dato pero uno bastante especial en si.

Las colecciones son un tipo de dato que nos permite almacenar otros datos en su interior dado que estos funcionan así como "listas de elementos" en los que podemos iterar.

Estos pueden ser de 2 tipos:

+ Arreglos (listas o colecciones de datos donde su longitud es fija, o sea que no puede aumentar o disminuir en cantidad).
+ Colecciones (listas o colecciones de datos donde su longitud puede variar dependiendo de si queremos añadir o eliminar datos de la misma).

En general se utiliza la nomenclatura **`ArrayList<T>`** para referenciar que una colección o arreglo (**aun que este ultimo solo puede ser de un tipo de dato**) contiene solo elementos con el mismo tipo de dato.

En si hay distintos tipos de colecciones, pero en las que nos fijaremos son las siguientes:

## List

Las listas son un conjunto de elementos ordenados en una secuencia en particular accesibles por medio de un indice ordenado el cual permite valores duplicados, hay distintos tipos de lista y algunos de estos son:

+ ArrayList
+ Vector
+ LinkedList
+ Etc...

---

## Set

Es otra lista de datos ordenados, solo que esta no permite tener datos duplicados, por lo que si detecta que el dato que se esta añadiendo al set ya existe dentro de el mismo, este no se agrega.

---

## Queue

Las "Colas" son otro tipo de lista de elementos ordenados cuya particularidad es la forma en la que ingresan y salen los datos de la misma además de permitir datos duplicados.

Existen 2 tipos:

+ LIFO: "Last input, first output" El primer dato en entrar es el ultimo en salir.
+ FIFO: "First input, first output" el primer dato en entrar es el primero en salir.

---

## Maps

Los mapas son colecciones de datos que se centran en la coneccion entre una "clave" y su "valor" osea su identificador dentreo del mapa y el dato que este representa, este en si no permite datos repetidos dado que pueden interferir con el sistema "clave-valor" que contiene el mismo.

Hay de distintos tipos, como:

* HashMaps.
* HashTables.
* LinkedHashMaps.
* TreeMaps.

---

## Listas de tipo unico

En si nosotros nos centraremos en las listas, específicamente en las ya mencionadas "`ArrayList<T>`" que como ya hice mención, son arreglos o colecciones en las que la **T** representa el tipo de datos que esta contendrá, por ejemplo si solo contiene int, Strings, floats u otros.

Antes de continuar, deben recordar que necesitamos "importar" la funcionalidad de hacer arrayList y listas a java, para eso en la parte superior de nuestro codigo debemos agregar:

~~~java
import java.util.ArrayList;
import java.util.List;
~~~

Los ArrayList siguen la siguiente sintaxis:

~~~java
// primero declaramos el arrayList
//List<TipoDeDato> nombreLista;
// luego creamos el arrayList
//nombreLista = new ArrayList<TipoDeDato>();

// osea podemos hacer esto
List<int> listaDeNumeros;
listaDeNumeros = new ArrayList<int>();

// o lo siguiente
List<int> listaDeNumeros = new ArrayList<int>();

// para agregar datos a la lista debemos usar la funcion "add" de la siguiente forma
listaDeNumeros.add(1);
listaDeNumeros.add(5);
listaDeNumeros.add(2);
// terminaremos con una lista similar a la siguiente (1,5,2)
~~~

De esta forma hacemos una lista de tipo genérico, o sea que todos los datos dentro de la misma son del mismo tipo, pero también hay otro tipo los cuales son los **No genéricos**.

Estos se caracterizan por permitir el ingreso de cualquier dato en si misma, sin importar el tipo de dato mezclándolos sin importar si estos son int, String, float o hasta clases, esto en si es poco recomendable dado que no hay muchas aplicaciones a almacenar tantos datos de distinta utilidad juntos.

La sintaxis de estos es la siguiente:

~~~java
List listaNoGenerica = new ArrayList(); // como veras, en este caso no definimos el tipo de dato de los valores en la lista

// esta al ser no generica podriamos hacer lo siguiente:
listaNoGenerica.add("Rodrigo");
listaNoGenerica.add(18);
listaNoGenerica.add(persona); // en este ejemplo estoy almacenando una clase por si acaso
~~~

---

### Métodos de una lista

Los array list al igual que los tipos de datos tienen diversas funciones y metodos que nos permiten iteractuar de diversas formas con estos.

Las funciones que utilizaremos mas comúnmente son los siguientes:

| Función    | Definición                                                   |
| ---------- | ------------------------------------------------------------ |
| add()      | Nos permiten agregar datos a una lista.                      |
| clear()    | Nos permite eliminar todos los datos de una lista.           |
| contains() | Devuelve true o false dependiendo de si la lista contiene un elemento especificado. |
| get()      | Devuelve el elemento con el índice especificado (el índice de elementos de una lista siempre inicia desde el 0). |
| indexOf()  | Devuelve el índice de la primera aparición del dato especificado. |
| remove()   | nos permite eliminar un dato especifico dentro de la lista.  |
| size()     | nos devuelve el tamaño de la lista.                          |

---

## ArrayList

El ArrayList es una lista "sin orden aparente" donde podemos agregar objetos u datos de un tipo de dato general, por ejemnplo podemos anidarle un objeto base y agregar en el mismo otros objetos que hereden de este, por ejemplo

Imagina que tenemos 1 clase llamada animal, a demás de varios animales que heredan de este, entre perros, gatos, pajaros, etc...

~~~java
// Si queremos hacer una lista por ejemplo de solo perros debemos hacer:
List<Perro> listaDePerros = new ArrayList<Perro>();

// Si queremos hacer una lista por ejemplo de solo gatos debemos hacer:
List<Gato> listaDeGatos = new ArrayList<Gato>();

// por otro lado si queremos hacer una lista que agregue todos estos animales TENEMOS que usar el ArrayList
ArrayList<Object> listaDeAnimales = new ArrayList();
// en este podemos referenciar cualquier dato en si MIENTRAS QUE ESTE SEA UN OBJETO
~~~

Otro tema a tomar en cuenta es que al referenciar un objeto llegaremos a sus datos facilmente, pero nos mostrara errores si intentamos acceder a uno de sus datos de forma directa, por ejemplo:

~~~java
for (Object animales: listaDeAnimales) {
	System.out.println(animales.GetNombre()) // en este caso nos daria un error    
}
~~~

Esto ocuyrre por que en realidad en los arrayList podemos agregar **cualquier dato que sea un objeto** sin importar los datos que tenga en su interior, para poder ejecutar los datos que hay en su interior primero tendremos que "revisar" si los datos que requerimos son los necesarios, utilizando un comparador de instancias, por ejemplo:

Imagina que tenemos una lista de objetos con los siguientes en su interior: (perro, gato, caballo, misilBalisticoIntercontinental).

Suponiendo que tanto perro, gato y caballo heredan de animal, deberiamos poder acceder a ellos haciendo lo siguiente:

~~~java
for (Object animales: listaDeAnimales) {
	if (animales instanceof Animal) {
        Animal anim = (Animal)animales;  // ClaseOriginal nombreNuevo = (ClaseOriginal)datoDelFor
        // tambien podemos llamar datos por ejemplo accediendo a (Animal)animales.getNombre();
        
        anim.getNombre() // para acceder a los datos del mismo utilizamos el "nombre nuevo"
    } 
}
~~~

Por ejemplo si tenemos una lista como: (perro, puddle, gato, caballo, misilBalisticoIntercontinental) si suponemos que puddle es una subclase de perro podemos hacer lo siguiente:

~~~java
for (Object animales: listaDeAnimales) {
	if (animales instanceof perro) {
        animales anim = (perro)animales;  // datoDelFor nombreNuevo = (ClaseOriginal)datoDelFor
        anim.getNombre() // para acceder a los datos del mismo utilizamos el "nombre nuevo" 
    } 
}
~~~

En este caso se mostraran tanto el objeto base en si (perro) como la subclase del mismo (puddle) y descartando los que no lo son (gato, caballo y misil balístico intercontinental).

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

---

## Operadores de asignación

Estos nos permiten "asignar" valores a una variable mientras los editamos de cierta forma.

| Operador |         Descripción          |
| :------: | :--------------------------: |
|    =     |  Asignar un dato a un valor  |
|    +=    |      Suma en asignación      |
|    -=    |     Resta en asignación      |
|    *=    | Multiplicación en asignación |
|    /=    |    División en asignación    |
|    %=    |     Modulo en asignación     |

Todos estos funcionan cuando queremos operar sobre el mismo elemento, por ejemplo:

~~~java
 public static void main(String[] args) {
    int numero = 0; // si quisieramos sumarle 1 a la variable podriamos hacer numero = numero + 1, o tambien:
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

| Java | Conjugación | Python |
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

| Java | disyunción | python |
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

| Java | Negación | python |
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

---

# Bucles

Los bucles son muy similares a las condicionales, solo que como su nombre lo indica pueden repetirse una cantidad de ocasiones especificada (o infinitamente hasta que el programa se detenga), este se suele utilizar para repetir acciones o para iterar sobre listas y otras colecciones que utilicemos aun que tiene otros muchísimos usos.

---

## Bucle for

El bucle for nos permite iterar en grupos de datos, ya sea una colección de datos, una cadena de caracteres, etc...

Podemos utilizarlos como base para un conteo controlado de la siguiente forma:

~~~java
// for (tipoDeDato variableIniciada; condicion; tipoDeAumento)
for (int i = 1; i <= 5; i++) {
    System.out.println(i);
}

// en este caso, el output es el siguiente:
/*
1
2
3
4
5
*/
~~~

En este caso la condición sirve para mencionar que **"mientras la misma sea true, el bucle se repetirá"**.

Para iterar sobre una colección debemos hacer lo siguiente:

~~~java
// supongamos que tenemos una coleccion con tres nombres "Rodrigo", "Jenni", "Alexis"
List<String> nombres = new ArrayList<String>();
nombres.add("Rodrigo");
nombres.add("Jenni");
nombres.add("Alexis");

// for (tipoDeDato identificadorDentroDelBucle : coleccion)
for (String n : nombres) {
    System.out.println(n); // en este caso la "n" representa un valor nuevo dentro de la coleccion cada vez que el bucle se ejecuta
}

// esto nos mostrara en pantalla el output:
/*
Rodrigo
Jenni
Alexis
*/
~~~

Técnicamente el `for` de esta ultima forma funciona similar al `for in` de python.

---

# Poo

Para los que ya tengan experiencia en programacion orientada a objetos, no se les sera muy complejo adaptarse a java, dado que muchas partes de esto se ven reflejadas en este.

Aun que la separacion entre los paquetes añade un poco de dificultad a la mezcla, esta no es difícil de entender y de hecho es lo primero que tratare de enseñar en esta documentación.

## Sistema de paquetes

Los paquetes en si sirven de una forma u otra para "separar archivos que requieran estar separados" y dividir otros archivos pero buscando un mayor orden en el proyecto, a que voy con esto, pues si tenemos lo siguiente:

+ paquete1
  + Main.java
  + ClaseNueva.java

Técnicamente podemos considerar que tenemos 1 archivo grande en el que tenemos 2 clases, dado que java no interpreta esto como archivos distintos, sino que cada archivo es considerado como una clase nueva dentro del mismo "paquete" o archivo gigante, depende de como lo quieras ver (cabe recordar que esto es una forma de verlo).

Por otro lado si tenemos lo siguiente:

+ paquete1
  + Main.java
+ paquete2
  + ClaseNueva.java

En este caso debemos "importar" los nuevos paquetes y clases a nuestro Main.java de la siguiente manera (tomando en cuenta el ejemplo):

~~~java
package paquete1;

import paquete2.ClaseNueva; // asi se importa una nueva clase desde otro paquete
import paquete2.*

public class Main {

    public static void main(String[] args) {
        System.out.println("Hola Mundo"); // ojo que esto no debemos utilizarlo fuera de un método main
        // esto es por que las clases no deben acceder a métodos que sean externos a la misma
    }
}
~~~

Ya con esto entendido podemos continuar con lo que nos concierne.

---

## Clases y atributos

Las clases son "el molde de nuestro objeto" y estos se conforman por los Métodos(**las acciones que puede ejecutar ese objeto**) y sus atributos(**variables que definen los datos de el objeto**).

Estos suelen tener el siguiente orden:

~~~java
public class Persona{
    // estos son sus atributos
    private String nombre;
    private String apellido;
    private int edad;
}
~~~

Aquí ya tenemos una clase con ciertos atributos base pero ahora debemos aprender como funcionan los métodos.

---

## Métodos

En si estos son "funciones" o sea, un bloque de código el cual esta asignado a un "nombre", el cual al ser llamado ejecutara el mismo bloque anteriormente mencionado, o sea que en una clase se vería de la siguiente forma:

~~~java
public class Persona{
    
    private int peso = 10;
    private boolean estaCaminando = false;
    
    public void Caminar(){ // en este caso al ser una funcion "void" esta no requiere de un return para un correcto funcionamiento
    	estaCaminando = true;
        
        // si queremos llamar un dato del objeto aqui debemos usar la siguiente sintaxis:
        this.peso--;
    }
}
~~~

Pero también hay un tipo especial de método, mejor conocido como "**Método constructor**".

---

## Método constructor y instanciando entidades

Si mal no recuerdas, ya creamos una clase con atributos, pero estos no tenían valor, para permitir añadir valores posteriormente por la nueva instancia cada vez que el objeto nuevo sea creado, utilizaremos el método constructor de la siguiente forma:

~~~java
public class Persona{
    // estos son sus atributos
    public String nombre;
    public String apellido;
    public int edad;
    // tambien podemos añadirle un valor por defecto a cada uno por ejemplo si directamente añadimos el (= 20;) a la edad

    public Persona(String nombre, String apellido, int edad){ 
    // el nombre de la funcion debe ser exactamente el mismo que de la clase
    // los parametros pueden tener el nombre que deseemos pero deben tener el mismo tipo de dato que la variable que referencian
    // la keyword "this" referencia la clase en si, por lo que el this.nombreDato referencia el nombre del atributo de la clase
   	// en este mismo caso y por el scope del método, los datos nombre, apellido y edad referencian los parametros de la función
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }
}

// ahora desde otra clase podemos hacer lo siguiente:
public class Main {

    public static void main(String[] args) {
        //NombreClase nombreInstancia = new NombreClase(dato1, dato2, dato3...);
        Persona p1 = new persona("Rodrigo", "Seguel", 18);
        Persona p2 = new persona("Juan", "Perez", 51);
        Persona p3 = new persona("Simon", "Silva", 200);
        // instanciamos los objetos con los datos añadidos (estos deben ir en el mismo orden impuesto en el constructor)
        
        // y ya si queremos llamar un dato o una accion del objeto podemos hacer por ejemplo:
        System.out.println(p1.nombre); // mostramos el dato de la variable nombre
        p1.nombre = "juan" // editamos el dato
        p1.Caminar(); // ejecutamos el metodo "Caminar" (suponiendo que este existe)
    }
}
~~~

Como ya vimos, los métodos constructores se requieren para "inicializar los datos de nuestro objeto", pero si no los utilizamos, por ejemplo si solo usamos getters y setters no es necesario añadirlo de forma explicita (a no ser que requieras inicializar datos, en ese caso obviamente vas a necesitarlo).

**Esto es por que las clases por defecto contienen un constructor el cual es generado de forma automática si no lo añadimos explícitamente**.

Otro tema que puede ser de ayuda es el saber que signi9fica o representa un "super".

Un **super** en programación orientada a objetos sirve para directamente "referenciar a la clase de la cual heredamos datos y funciones", por ejemplo en el caso de un constructor a parte de lo anteriormente visto, podemos hacer lo siguiente:

~~~java
public class PersonaNueva extends PersonaVieja{ // supongamos que heredamos el nombre y apellido de la clase "persona vieja"
    
    public int edad; // en esta clase tenemos solo 1 dato, "edad"

    public Persona(int edad, String nombre, String apellido){  // aqui referenciamos los datos que ingresaran en nuestro constructor
        super(nombre, apellido); // aqui van los datos que "extraemos de la otra clase" (asi nos ahorramos los constructores anteriores)
        this.edad = edad; // este es el dato que creamos en esta clase
    }
}
~~~

**Por si acaso: si aun no sabes que es el extends y a que me refiero con la herencia, continua un poco y luego vuelve**.

Como quizá habrás notado, por el bien de la fácil enseñanza de esta documentación he preferido hacer los datos de nuestra clase públicos, pero debo recordar que como vimos en la sección de encapsulamiento **esto no esta del todo correcto**, dado que las variables deben ser la mayoría de las veces generadas de forma privada y permitir su acceso utilizando:

---

## Getters y Setters

Los Getters y Setters son 2 tipos de métodos que nos permiten comunicar una clase con otra y **traspasar o permitir el uso de datos privados dentro de esta misma**, por lo que son vitales al usar java de forma ideológica, para evitar el uso excesivo de variables publicas.

Estos se dividen en 2:

+ **Setters** ("set" del verbo establecer) Son funciones o métodos que nos permiten acceder a estas variables privadas **solo para editarlas** desde otra clase.
+ **Getters** ("get" del verbo obtener) Son funciones o métodos que nos permiten **solo acceder al valor** de estas variables privadas desde otra clase.

Estos funcionan de la siguiente forma:

~~~java
public class Persona{
    private int edad = 20;
    
    public void setEdad(int varEdad){ // este es un setter que nos dejara editar el valor de "edad"
        // los setter son métodos que SIEMPRE deben estar publicos y no debe retornar un valor
        this.edad = varEdad;
    }
    
    public int getEdad(){ // este es un getter, este nos permite acceder al valor de la variable
        // los getters siempre deben retornar el valor de la variable en si, por lo que no pueden ser void
        return this.edad;
    }
}

// ahora desde otra clase podemos hacer lo siguiente:
public class Main {
    public static void main(String[] args) {
        Persona p1 = new persona();
        
        // el setter lo usariamos de la siguiente forma por ejemplo:
        p1.setEdad(21); // asi cambiariamos la edad de 20 a 21
        
        // el getter lo usariamos de la siguiente forma por ejemplo:
        System.out.println(p1.getEdad()); // como la funcion retorna el valor de la edad este lo podemos usar para acceder al mismo
    }
}
~~~

---

## Herencia y Abstract

La programacion orientada a ojbjetos tiene multiples propiedades distintas, entre estas estan:

+ Encapsulamiento (la capacidad de una clase, atributo o método de ser accesible a todos "public" o con acceso prohibitivo "private").
+ Abstracción (es la capacidad que tiene una clase de diferenciarse de otras dado sus "características" especiales y  lo que las diferencia entre si).
+ Herencia y Polimorfismo (la posibilidad de "heredar atributos y métodos de otras clases a demás de editar la funcionalidad y datos de estas).

En especial nos centraremos en esta ultima.

La herencia como ya hice mención es **la habilidad de una clase de "copiar y pegar" las funciones y datos de otra clase como si fueran pertenecientes de la misma**, hagamos un ejemplo:

imagina que tienes una clase "humano"

~~~java
// el abstract representa que este es una clase "padre" el cual no sera instanciado, por lo que solo podremos acceder a sus hijos
public abstract class Humano {
    private String nombre; // este posee nombre
    private int edad; // y edad
    
    // para aplicar la herencia siempre debemos tener nuestro metodo constructor
    public Humano(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
    
    // getters y setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }
    
    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getEdad() {
        return edad;
    }
    // getters y setters
    
    // funcion custom (en este caso com la funcion es abstracta esto no seria 100% correcto dado queno vamos a acceder a este dato)
    public void Caminar() {
        System.out.println("este humano camina :o");
    }
    
    // la forma correcta de hacerlo seria:
    public abstract void Caminar(); // asi nos ahorramos codigo innecesario
}
~~~

Si queremos hacer una clase estudiante sin necesidad de "copiar cada elemento dentro de nuestra clase padre" deberíamos hacer lo siguiente:

~~~java
class Estudiante extends Humano {
    /* ahora por defecto en la clase estudiante tenemos:
    	+ variables (nombre y edad)
    	+ getters y setters
    	+ funcion caminar
       pero antes de continuar nos faltan unos pasos importantes*/
    
    // agreguemos mas atributos
    private float promedio;
    private int curso;
    
    // a la hora de hacer el constructor debemos agregar los atributos de la clase padre
    public Estudiante(float promedio, int curso, String nombre, int edad) {
        // estos atributos existen dentro de la clase, solo que son "invisibles"
        this.notas = notas;
        this.curso = curso;
        this.nombre = nombre;
        this.edad = edad;
    }
    
   	// al momento de hacer nuestros getters y setters solo debemos hacerlos para los datos nuevos que en este caso son notas y curso
    public void setNota(float promedio) {
        this.promedio = promedio;
    }

    public float getPromedio() {
        return promedio;
    }
    
    public void setCurso(int curso) {
        this.curso = curso;
    }

    public float getCurso() {
        return curso;
    }
    
    // vamos a cambiar la funcion original
    public void Caminar() {
        System.out.println("Ese estudiante camina mas rapida, dado que esta apurado");
    }
}
~~~

Ahora como resultado tenemos una clase completa, con datos heredados desde su clase padre (nombre y edad) a demas de sus nuevos datos (promedio y curso).

Pero a demás hicimos algo nuevo, editamos lo que hace una función, esto se llama **Polimorfismo** y es el "editar el funcionamiento o datos originales de una clase padre en su clase hija", o sea editar los datos de una clase heredada.

Como resultado ahora si ejecutamos `Humano.Caminar();` nos mostrara el mensaje: "este humano camina :o" (**recuerda que como esta clase es abstracta no podríamos hacerlo, pero como ejemplo me sirve**), por otro lado si hacemos lo mismo con la clase estudiante, o sea `Estudiante.Caminar();` nos mostrara el mensaje: "Ese estudiante camina mas rápida, dado que esta apurado".

Ahora para finalizar, debemos inicializar nuestra clase Estudiante, esto lo hacemos siguiendo los ejemplos anteriores y el orden de datos de su constructor, a demás debo recordarles que si queremos llamar los datos nombre y edad de nuestra clase Estudiante, solo debemos hacerlo por sus getters y setters, dado que estos ya existen gracias a la herencia.

---

## Métodos abstractos

Quizá en algún momento hayas escuchado a alguien hacer mención a estos, no te preocupes son mas simples de lo que crees, un método abstracto no es mas que **un método "base" que se crea ya sea en una clase abstracta o en una interfaz (esto lo veremos mas adelante) las cuales están "vacías de por si" y no poseen utilidad de forma directa** estas sirven como un "molde" para que así **las clases que hereden estos métodos abstractos sean quienes se encarguen de darle una función en particular**.

*Por ejemplo:*

~~~java
// ahora como ejemplo voy a hacer una clase abstracta y una clase hijo que herede de este un metodo

// CLASE 1 PADRE
public abstract class padre {
    public void saludar{} // dado que la clase padre es abstracta este metodo tambien lo sera (el mismo no posee una funcion)
    // al ser una clase que no se instanciara, incluso aun que le agreguemos una funcion esta no hara nada hasta ser heredada y editada
}

// CLASE 2 (HIJO)
public final class hijo extends padre {
    public void saludar { // llamamos a la clase abstracta y le agregamos una funcion, tecnicamente deja de ser una clase abstracta
        System.out.println("holaaaas!!!!");
    }
    
    // este metodo no se considera abstracto ya que su funcion esta definida de inmediato y no es usada comno "base" para otra
    public void caminar { 
        System.out.println("estoy caminando!!!!");
    }
}
~~~

---

## Clases finales

Si anteriormente utilizábamos el abstract para "referenciar que habrá herencia", utilizaremos la keyword `final`, esta nos permite "marcar" las clases finales de una herencia, como recordaremos puedes hacer herencia sobre una clase con datosa ya heredados y asi hacer una cadena infinita, pero que puede tener un final

este lo marcaremos agregando `final` en la clase que hayamos creado como si de un "abstract" se tratara, por ejemplo:

~~~java
public abstract class a {} // creamos nuestra clase inicial

public final class b extends a {} // creamos una clase que hereda de a, pero es la final

public class c extends b {} // estp nos generara un error dado qeu la clase b es final

~~~

Este error no se presentaría si la clase b fuera una clase sin el "final".

---

## Interfaces

Seguro te estas preguntando, **"como que las interfaces no son entes gráficos con los que interactuamos con las aplicaciones?????"** es normal, a mi también me ocurrió la primera vez que escuche del concepto, pero fuera de esa creencia, puedo mencionar que las interfaces son un tema bastante util para potenciar nuestra programación orientada a objetos.

Las interfaces son como una **"clase especial"** en la que principalmente podremos agregar:

+ Constantes: datos que mantienen un valor durante todo el tiempo de ejecución (imagínate como una variable que no puede cambiar de valor).
+ Métodos abstractos: métodos sin "volumen" cuya función será agregada en una clase que herede a esta.

Esta no sirve para definir clases u objetos, esta en si esta hecha para definir "**datos y funciones generales**" que cualquier clase, sin importar su tipo puedan hacer referencia a estos.

Para hacerlos debemos entrar al paquete en el que queramos crearlos y obviamente según nuestro ide, crear una nueva interfaz (como tema extra, **usualmente las interfaces tienen un nombre definido por "I" + "nombre" como "Icomun"**), luego en este definimos nuestros métodos abstractos y constantes.

*Ejemplo:*

~~~java
package PaqueteActual; // este debe estar agregado en un paquete como cualquier otra clase

public interface Icomun { // el Icomun es el nombre del archivo
    
    // aqui agregamos nuestras constantes como:
    int SEGUNDOSENMINUTO = 60; // por si no estas seguro siempre hay 60 segundos en un minuto, solo por si acaso... :b
    
    // aqui agregamos nuestros metodos abstractos como:
    int CalcularSuma(int x, int y); // como este es un metodo abstracto, no hace falta definir su funcion en particular
}
~~~

Para **"implementar"** las interfaces en nuestra clase, lo que tenemos que hacer es referenciarla en la clase especifica que queremos, aun que también **podemos ponerlo en una clase padre para ahorrar algo de coodigo**.

Para hacer esto seguimos el siguiente ejemplo:

~~~java
// imagina que tenemos hecho ya la interfaz anteriormente creada "Icomun" y tenemos una clase llamada "hermano"
public class hermano implements Icomun { // debemos usar "implements + nombre de la interfaz"
    
    // luego de esto es posible que nos salga un error dado que debemos "sobreescribir nuestras funciones escritas en la interfaz"
    @Override
    public int CalcularSuma(int x, int y) { // si lo hacemos automaticamente nos saldra esto
        throw new UnsupportedOperationException("Not supported yet."); // esto se nos mostrara por defecto pero podemos cambiarlo
    }
    
    // para el ejemplo yo lo dejare de la siguiente forma:
    @Override
    public int CalcularSuma(int x, int y) {
        return x + y
    }
}
~~~

En el caso de netbeans nosotros podemos automáticamente "sobrescribir estos métodos", ya sea presionando la "bombilla" al lado del nombre de nuestra clase (donde nos saldrá el error) y seleccionando "**implement all abstract methods**", o también seleccionando "**insert code**" y luego ir a la opción "**implement method**" (para acceder fácil a esta opción recuerda que puedes hacerlo con clic derecho o con `ALT` + `INSERT`) para finalmente seleccionar todos los métodos que se desean implementar.

Listo, ahora sabes que es una interfaz.

---

# Try & Catch

Las sentencias **Try y Catch** nos permiten **Generar o reaccionar a errores de forma controlada**, evitando que nuestro programa se cierre cuando se encuentre un error para el que no estamos preparados.

Su sintaxis es la siguiente:

~~~java
try {
  //  Codigo a intentar (que puede tener un error)
}
catch(Exception e) {
  //  Codigo que se ejecuta en caso que el error especificado se presente
}
~~~

Es bastante posible que en varias partes de nuestro código nos aparezcan errores a pesar de que nuestro código este bien escrito, estos usualmente son "excepciones" que genera nuestro código cuando un bloque puede o no concluir eficazmente, en el caso de netbeans, este nos avisara y permitirá hacer un try-catch automático.

## Excepciones

Las excepciones son en si un tipo de "mensaje" que lanza el programa cuando se detecta algún caso que para nosotros generara error, que un dato este en blanco, que no se retorne lo que nosotros deseemos etc.

Este nos puede funcionar de gran forma en algunos casos que se pueda generar un error pero que esto no afecte el funcionamiento del programa, ósea que este no se pare o interrumpa.

Una de las funciones mas útiles de estas por ejemplo es "evitar que un campo quede vacío al ser ingresado en una clase" especialmente si utilizamos una interfaz con la que entregamos esos datos.

esto lo hacemos de la siguiente forma:

~~~java
// suponiendo queo tendremos nuestros datos segun los setters comprobaremos el dato "nombre"
public void setNombre(String nombre) throws Exception { // el throws Exception indica que esta funcion puede lanzar una excepcion
    if (!nombre.isEmpty() && !nombre.isBlank()) { // asi comparamos que el dato no este vacio o en blanco
        this.nombre = nombre;
    } else {
        throw new Exception("El nombre no puede estar vacio")
    }
}
~~~

---

# Java Forms

Nuestro IDE para java, ya sea NetBeans, Eclipse o Intellij Idea nos van a permitir una notable capacidad de java y es el **crear interfaces o formularios** osea que podemos hacer programas funcionales en una ventana gracias a lo que llamamos "**Java Forms**".

Para poder interactuar con estos primero debemos saber el como se añaden a nuestro proyecto.

Antes de iniciar en el proceso de "hacer el formulario debemos seguir unos pasos":

1. Debemos crear un nuevo paquete en el que ingresaremos nuestro archivo de creación del formulario (preferiblemente llama este paquete "vistas").

2. Debemos crear nuestro formulario, para eso vamos a dar clic derecho en nuestro paquete y seleccionamos `New > Jframe Form`.

3. Seleccionamos el nombre de la clase y lo importamos en nuestra clase main de forma común:

   ~~~java
   import paquete.claseFormulario;
   ~~~

4. Iniciamos la clase del formulario y hacemos que este se muestre en pantalla:

   ~~~java
   claseFormulario cf = new claseFormulario();
   cf.setVisible(true);
   ~~~

Con esto ya hecho ahora podemos iniciar a trabajar en nuestro formulario, este nos permite editarlo de 2 formas, 1 es en su diseño (en la ventana diseño) mientras que en el otro editamos directamente el código de este formulario.

Cuando agreguemos nuevas partes a nuestro formulario en el área de diseño nuestro código también será editado, aun que también podemos hacer ediciones di9rectas desde este si así es necesario.

Cada vez que hagamos algo con una funcionalidad en si, como añadir un botón, campo de texto, pestana de selección, etc, se creara una función con el nombre de nuestro objeto (mas "ActionPerformed") además de una variable con este mismo nombre, la variable nos permite interactuar sobre el elemento en si, mientras que la funcion ActionPerformed, nos permite ejecutar cualquier código que queramos al ejecutar la función del objeto en si.

ejemplo:

Supongamos que añadimos un botón en nuestra interfaz, a este le damos el nombre "botonDePrueba", por lo que si queremos cambiar el texto al presionar el mismo, debemos hacer lo siguiente:

~~~java
// buscamos la funcion que ejecuta la accion del boton:
botonDePruebaActionPerformed(java.awt.event.ActionEvent evt){
    // aqui va todo el codigo que se ejecutara al presionar el boton
    botonDePrueba.setText("este es el nuevo texto en el boton"); // esta funcion nos permite editar un dato del elemento.
}
~~~

Todos los elemento s instanciados en el formulario se pueden contar como objetos, por lo que cada uno de estos tiene distintas funciones que editan la forma en la que podemos trabajar en cada uno de estos.

**Si por alguna razón queremos que nuestro código tome nuestro formulario como clase principal por ejemplo si queremos hacer una prueba de conexiones simple con una base de datos, debemos hacer cierta configuración en el proyecto:**

1. Damos clic derecho en el nombre del proyecto y presionamos en "propiedades"
2. Buscamos y cliqueamos la opción "run".
3. Buscamos nuestras clases en el botón "browse" y seleccionamos la clase que pensamos en usar como principal

---

## Inicializador de una clase form

Al trabajar con un formulario, debemos recordar que este es una clase, por lo que debe ser inicializado como cualquier clase, esto se hace por medio de la siguiente lineal en nuestro código:

~~~java
public ClaseInterfaz() {
	initComponents();
	// si vamos a escribir codigo aqui, debe ser debajo del "initComponents()"
}
~~~

Es muy común hacerlo al revés y tener errores, pro lo que es fundamental recordar que en nuestro programa debemos dejar el `initComponents()` al principio de nuestro inicializador.

---

## Crear alertas

A la hora de utilizar nuestro programa puede que nuestros usuarios requieran de cierto feedback, este lo podemos conseguir por medio de "mensajes" que se muestran al ejecutar una acción especifica. 

Para esto utilizamos:

~~~java
// JOptionPane.showMessageDialog(null, "mensaje general", "titulo", numeroTipoDeMensaje)
JOptionPane.showMessageDialog(null, "Usuario Agregado", "Informacion", 1); // esto mostrara un mensaje con un logo de alerta
JOptionPane.showMessageDialog(null, "Usuario no agregado", "Error", 0); // esto mostrara un mensaje con un logo de error
~~~

---

## Elementos comunes de formularios

+ Button: son botones que ejecutan una acción al ser presionados
+ Text Field: son espacios en los que podemos ingresar texto.
+ Text Area: son espacios en los que podemos mostrar textos.
+ Label: son espacios en los que podemos escribir texto.

---

# Util

Si hacemos un ToString con el netbeans de forma similar a los getters y setters, este de por si nos generara un método que nos permitirá mostrar los datos de la clase.

---

# Bases de datos

Aun que se comente muy poco el tema al inicio del estudio de la programacion, el conectar un programa a una base de datos es una de las herramientas mas utiles para nuestro proceso de desarrollo y nos puede salvar si es que nuestro proyecto requiere del almacenamiento de datos masivos de distintas formas.

Esto lo lograremos por medio de distintos factores, datos y codigos qeu veras en este capitulo de la documentacion.

Pero antes de iniciar con esto tenemos que recaer a una herramienta fundamental.

## XAMPP

Xampp es una herramienta que nos permite gestionar bases de datos y hacer "conecciones" a distintos tipos de servicios de varias formas, este lo utilizaremos para conectar nuestro codigo a una base de datos.

este lo podemos instalar desde [la siguiente pagina](https://www.apachefriends.org/es/index.html), su instalación es simple, similar a cualquier otro programa.

Primero antes de proceder tenemos uqe "activar todo" primero.

1. Activamos el servidor Apache (presionando en el boton "start" al lado de este) **Debe aparecer un color verde ya activado**.
2. Activamos el gestor de bases de datos MySql (presionando en el boton "start" al lado de este) **Debe aparecer un color verde ya activado**.
3. Abrimos la pagina de administracion del MySql presionando el boton "admin" que se encuentra al lado del mismo

Ahora podemos crear nuestra base de datos, para esto nos vamos a la pestania "Nueva" a la izquierda de la pantalla, al entrar en ella tendremos que rellenar 2 campos:

1. Campo de nombre: aquí ingresamos el nombre/identificador de nuestra base de datos.
2. Tipografía definida: aquí elegimos los caracteres aceptados dentro de la base de datos (cambiamos "utf8bm4_general_ci" por ""utf8bm4_general_ci"")
3. Finalmente tenemos el boton crear el que utilizaremos para en efecto finalizar la creacion de nuestra base de datos.

Al terminar esto tenemos que crear tablas agregando los tipos de datos que iran en este, para eso seleccionamos los datos de la misma especificamente:

1. El nombre de la tabla
2. la cantidad de columnas que tendra

Dependiendo de este ultimo sera nuestra libertad para agregar datos, trasa esto se agregaran en la pantalla las columnas que agregaremos, para seleccionar el nombre de las mismsas, tipoos de datos que contienen, su inidice, etc...

En general los datos que traen cada una de estas columnas que nos importan son:

1. nombre
2. tipo de dato (int, string, float, etc...)
3. valor o longitud (el valor del mismo, puede ser por ejemplo un numnero o un texto entre otros muchisimos datos)
4. valor predeterminadoi (por ejemplo si no hay un dato podemos hacer que este se muestre como nulo)
5. Nulo: si es que queremmos que este se muestre o no como nulo
6. Indice: si queremos que una coluimna por ejemplo sea una clave primaria

Ya al editar estos y presionar "guardar" se creara nuestra hbase de datos con las tablas ya creadas en si, pero sin datos en ella.

---

## Conectándonos a la base de datos

Este proceso se debe hacer lo antes posible cuando creamos el proyecto, para asi evitar problemas lo mas posible.

A la hora de hacer esto primero tenemos que importar una libreria que nos permite comunicar java con sql pero puede que esta no funcione, para eso importaremos la que a nosotros nos parezca conveniente.

Para proceder debes ingresar el siguiente código en una clase que tu crees (en mi caso la llamare Conexión) y preferible que este en otro paquete (en este caso lo llamare Modelo):

~~~java
import java.sql.Connection; // importamos la libreria que agregamos anteriormente
import java.sql.DriverManager; // importamos la libreria que agregamos anteriormente
import java.swing.JOptionPane; // importamos la libreria que agregamos anteriormente

public class Conexion {
    // este codigo es siempre igual
    Connection conectar=null;
    String servidor = "127.0.0.1"; // ip local dado que nuestra coneccion es local (localhost)
    String baseDatos = "registro"; // este lo debemos cambiar por el nombre de nuestra base de datos
    String usuario = "root"; // el usuario debe ser distinto a root SOLO CUANDO LA BASE DE DATOS REQUIERE DE UN USUARIO
    String password = ""; // esto permanece vacio hasta que la base de datos requiera una contraseña
    public Connection conectar(){
       try {
          Class.forName("com.mysql.jdbc.Driver");
          //conectar=DriverManager.getConnection("jdbc:mysql:"
          //          + "//localhost/productos", "root","");
          conectar=DriverManager.getConnection("jdbc:mysql:"
                    + "//"+ servidor + "/" + baseDatos, usuario, password);
       } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e.getMessage());
           // si queremos podemos hacer JOptionPane.showMessageDialog(null,"Conexion fallida" + e.getMessage(), "ERROR", 0);
           // asi mostraremos un mensaje de error mas "personalizado"
       }
       return conectar;
    }
} 
~~~

Luego de hacer esto en otra clase vamos a llamar esta clase para así poder comprobar la conexión de forma efectiva, en mi caso esto lo hare en un formulario dentro de un paquete distinto, este es solo una pestaña con un botón que dice "comprobar".

Cuando tengamos eso hecho nos metemos en su código y hacemos lo siguiente:

~~~java
// primero importamos las clases que necesitamos y en este caso son:
import Modelo.Conexion;
import java.sql.Connection;

// despues buscamos la funcion en la que se ejecuta la funcion de nuestro boton y hacemos lo siguiente:
private void jButton1ActionPreformed(java.awt.event.ActionEvent evt) {
    Conexion db = new Conexion(); // instanciamos la clase que creamos
    Connection con = db.conectar(); // creamos la conexion a la base de datos
    
    if (con != null) {
        try {
        	JOptionPane.showMessageDialog(null, "Conexion establecida", "Correcto!", 1);
        	con.close(); 
   // tenemos que cerrar la conexion por que si esta no se cierra en otro tipo de servidor no permitira a mas equipos acceder a este			            
        } catch (SQLExeption ex) {
            Logger.getLogger(CheckConexion.class.getName()).log(level.SEVERE, null, ex);
        }
    }
}
~~~

Utilizamos un try & catch al final por que esta parte del codigo es propensa a fallos y de otra forma no se ejecutaria correctamente, de hecho no nos dejaria ejecutar el codigo ya quenos marcaria todo como error, un tip para hacerlo mas rapido es escribiendo solo el:

~~~java
if (con != null) {
    JOptionPane.showMessageDialog(null, "Conexion establecida", "Correcto!", 1);
    con.close();
}
~~~

Y luego con la "bombilla" que nos aparece al lado izquierdo de nuestro código seleccionamos la opción "Surround block with try-catch" y así se concreta automáticamente.

Con esto listo ya deberíamos ser capaces de ejecutar el formulario que nos comprueba la conexión a la base de datos. 

---

## Utilizando la base de datos

Ya habiendo comprobado la conexión y asegurándonos de que esta se llevo a cabo correctamente podemos empezar a trabajar en la misma, agregando información a la base de datos.

Primero debemos ser concientes de los datos que podemos agregar a nuestras tablas, imagina que nuestra base de datos con el nombre **BaseDeDatos**, tiene 1 tabla llamada **Usuario** y que en su interior tiene 2 datos **USERNAME** y **PASSWORD**, siendo ambos varchar, tecnicamente en temas de jerarquia esto se veria de la siguiente forma:

+ BaseDeDatos (la base de datos en si)
  + Usuario (la tabla donde almacenaremos nuestros usuarios)
    + USERNAME (el dato que llama el nombre de usuario) **Esta es clave primaria** [VARCHAR]
    + PASSWORD (el dato que llama la contraseña del usuario) [VARCHAR]

Para iniciar con nuestro "traspaso de datos" vamos a traducir un poco la tabla a una clase, así para obtener primero los datos que querremos traspasar a la misma.

Esta clase debe estar en el; mismo paquete que nuestra "conexión" solo por temas de comodidad.

~~~java
// empezaremos creando una clase basica con el nombre de nuestra tabla
public class Usuario {
    String username; // varchar = String
    String password; // carchar = String
    
    public Usuario() {
        
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password
    }
}
~~~

Ahora simplemente busca una forma de darle los valores a estos datos, puede ser directamente por medio del constructor o por medio de un formulario usando getters y setters, yo prefiero personalmente esta ultima.

Simplemente creamos nuestro formulario con 2 textfield, uno para username y otro para password a demás de un botón que nos permita "enviar" estos datos, para ello en la función del botón debemos "instanciar la clase usuario" y enviar los datos obtenidos por este formulario:

~~~java
private void jButton1ActionPreformed(java.awt.event.ActionEvent evt) {
	Usuario usr = new Usuario(); // instanciamos la clase

	// pasamos los datos del formulario a la clase
	usr.setUsername(txtusername.getText());
	usr.setPassword(txtPassword.getText());
}
~~~

## DAO

Se le conoce como "DAO" a la "capa" en la que directamente interactuaremos con la base de datos (capa de acceso a datos), en si es un paquete en el que nosotros por defecto iterac tuaremos con la base de datos desde java

Este concepto se hace importante ya que por temas de orden es la mejor forma en la que podemos iteractuar siguiendo el sistema en el que hemos estado trabajando, en otros casos puede ser distinto, pero en este es la mejor forma en la que podemos trabajar.

Entonces para trabajar con este lo unico que debemos hacer es crear un paquete el cual vamos a llamar "DAO".

Con esto ya hecho vamos a crear una clase para cada tabla que existe en la base de datos, si por ejemplo tenemos la tabla alumno y profesor tendremos que hacer una clase para alumno y profesor, que por temas de "orden" preferiblemente lo mejor seria escribirlos como "**AlumnoDao**" & "**ProfesorDAO**", en el caso del ejemplo anterior tendremos que crear un **UsusarioDAO**.

Tras esto crearemos una interfaz en la que agregaremos las funciones que queremos usar en nuestra "clase Usuario" y asi predefinimos nuestro "CRUD" (CREATE, READ, UPDATE, DELETE).

Entonces en nuestra interfaz (en mi caso lo ingreso en el mismo paquete que nuestra conexión y la clase usuario) agregaremos nuestras funciones de la siguiente forma:

~~~java
public interface IOperacionesUsuario {
    //CRUD// 
    boolean Create(Usuario u); // funcion con la que creamos un usuario
    ArrayList<Usuario[]> Read(); // nos permite leer un arreglo de usuarios
    boolean Update(Usuario u); // funcion con la que actualizamos el usuario
    boolean Delete(Usuario u); // funcion con la que eliminamos un usuario
}
~~~

Luego simplemente implementamos esta interfaz en nuestro DAO para el usuario y pasando a este. 

Deberíamos hacer lo siguiente:

~~~java
// primero importamos las librerias necesarias:
import java.util.ArrayList;
import java.sql.ResultSet; // este lo ocupamos cuando traemos datos desde la base de datos
import java.sql.PreparedStatement; // este lo ocupamos cuando enviamos datos a la base de datos
import java.sql.Connection;

public class UsuarioDAO implements IOperacionesUsuario {
    Conexion db = new Conexion(); // primero "generamos la conexion"
    ResultSet rs; // instanciamos el objeto ResultSet
    PreparedStatement pst; // instanciamos el objeto PreparedStatement
    
    // ahora empezxamos con nuestras funciones
    
}
~~~

---

### Create

Ya habiendo concreto esto nos centraremos en una de las funciones que debemos hacer nos centraremos en "crear usuarios", para esto en la clase "UsuarioDAO" haremos lo siguiente:

~~~java
public boolean Create(Usuario u) { // llamamos la funcion que ya creamos en la interfaz
        try {
            Conection con = db.conectar(); // creamos la conexion a la base de datos

            String query = "INSERT INTO `usuarios`(`USERNAME`, `PASSWORD`) VALUES ('?','?')"; // 1.
            pst = con.prepareStatement(query); // ejecutamos el query escrito anteriormente
            
            // 2.
            pst.setString(1, u.getUsername);
            pst.setString(2, u.getPassword);
            
            int resultado = pst.executeUpdate(); // 3.
            if (resultado >= 1) { // el resultado puede obtener mas valores a parte de 1 pero 0 siempre significa que fallo
                con.close(); // recuerda cerrar la consulta
                return true
            }
            con.close(); // recuerda cerrar la consulta
            return false
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(level.SEVERE, null, ex);
            return false
        }
    }
~~~

De este codgo hay varias cosas a mencionar:

1. Como habrás visto en la variable "query" tenemos un string que en si es un insert into de sql, para facilitar nuestra vida podemos acceder a este **por medio de nuestro local host**, para esto tenemos que seleccionar nuestra tabla, luego seleccionar "sql", ahi veremos un espacio de texto y varios botones, segun el que seleccionemos nos entregara un query con la sintaxis de mySql nosotros elegimos el boton "insert" en este caso y nos da el String:

    `"INSERT INTO `usuarios`(`USERNAME`, `PASSWORD`) VALUES ('[value-1]','[value-2]')"` y cambiamos el "[value-1]" y "[value-2]" por un `?` 

   ---

2. En el código usamos `pst.setString(1, u.getUsername);`, la función de este es enviar los datos a la tabla en si según la posición del parámetro ingresado en la función, en este caso al primer parámetro (USERNAME) y el segundo parámetro es el valor que le enviaremos al mismo, el nombre "setString()" varia dependiendo del tipo de dato que enviaremos, si es un integer por ejemplo se transformara en un "setInt()".

   ---

3. En el código utilizamos el `pst.executeUpdate();` para "actualizar" la tabla en si, este lo usamos únicamente para los INSERT, UPDATE y DELETE.

Y finalmente volvemos a la clase de nuestro formulario para hacer lo siguiente:

~~~java
private void jButton1ActionPreformed(java.awt.event.ActionEvent evt) {
    try { // primero agregamos todo dentro de un try-catch
        Usuario usr = new Usuario();
        usr.setUsername(txtusername.getText());
        usr.setPassword(txtPassword.getText());

        // agregamos:
        UsuarioDAO uDAO = new UsuarioDAO(); // instanciamos nuestro DAO
        boolean res = uDAO.Create(usr); // creamos un usuario segun el objeto user y su return lo almacenamos en la variable "res"
        if (res) { // si nuestra creacion nos devuelve un true y aqui conseguimos un feedback del mismo
            JOptionPane.showMessageDialog(null, "Usuario agregado", "Informacion", 1);
        } else {
            JOptionPane.showMessageDialog(null, "Error al guardar", "Error", 0);
        }  
    } catch (Exception ex) {
        Logger.getLogger(UsuarioDAO.class.getName()).log(level.SEVERE, null, ex);
        JOptionPane.showMessageDialog(null, "Error " + ex.getMessage(), "Error", 0);
        // por eleccion personal quiero que en este caso se muestre el mensaje de error igualmente
    }
}
~~~

Si se siguieron todos los pasos correctamente esto debería generarnos solo 1 error al por ejemplo agregar un usuario que ya exista, pero eso no es problema, de hecho esta bien que ocurra.

Pero puede haber un error que no notemos fácilmente, el que creemos un usuario sin USERNAME y sin PASSWORD, esto lo arreglamos validando esto en la clase usuario con una excepción, exactamente como lo muestro [aquí](#Excepciones).

---

**Ya finalmente podemos exportar nuestra base de datos como archivo sql y ahí ya podríamos trabajar con el mismo desde otro gestor si así lo necesitamos**.



## Extra 

Para hacer esto debemos ir a la pestania de librerias en el netbeans, dar clic derecho en la misma y seleccionamos la opcion "Add Library", en esta seleccionamos la opcion "Create", ahi le agregaremos el nombre a nuestra libreria (en este caso "LibSql") y lo seleccionamos como "class library", finalmente damos en el boton "Add Jar Folder" y seleccionas el archivo java de tu libreria, por ultimo simplemente bguscas esta libreria en el selector de librerias y le das en "add library".

## CRUD

+ create
+ read
+ update
+ delete
