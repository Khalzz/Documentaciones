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
| String       | Este admite "cadenas de texto" (cabe resaltar que este si o si debe tener la S mayuscula) los datos de este debe estar entre comillas | "Hola" |
| char         | Este admite únicamente carácteres unicode (sólo 1) los datos de este debe estar entre comillas simples | 'A' |

---

## Encapsulamiento

El encapsulamiento es la "proteccion" que el entregamos tanto a nuestras clases, como variables, como funciones.

Y como quizá habrás notado en los ejemplos de las variables utilizamos 2 "keywords" para el encapsulamiento, estos eran:

+ public (permite el acceso de un dato fuera de la clase).
+ private (prohibe el acceso de un dato fuera **de algunas clases**).

Usualmente en java lo recomendado es hacer nuestros datos "privados" para así no generar problemas luego con que alguien por error accede a nuestro dato y terminen ocurriendo notables errores durante la ejecución, por lo que la mayoría de datos en tu programa tendrán que ser privados, para así evitar estos problemas.

Esto es muy necesario a la hora de trabajar con variables, no es muy común en los métodos, pero en algunos casos será necesario.

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

    public Persona(String nombre, String apellido, int edad){ /* El identificador del constructor debe ser el mismo al de la clase y sus parámetros deben tener
    Asignados un tipo de dato y también un nombre, como se muestra arriba.
    La keyword "this" hace referencia directamente a "esta" clase en si, este lo utilizaremos para acceder directamente a los atributos de la clase.
    y por la misma razon añ referenciar solo los datos "nombre, apellido y edad" estos haran referencia a los parametros de la funcion, no a los atributos de la clase.*/
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





