# Rust

**Documentación hecha por: Rodrigo Andres Seguel Nuñez (khalzz).**

Rust es mágico, este es un lenguaje multi-propósito y multi-paradigma que puede tanto funcionar como lenguaje de bajo nivel (interactúa directamente con el hardware) tanto como lenguaje de alto nivel (referente a su depuración).

Este lenguaje salido el 2015 busca el ser un lenguaje con grandes capacidades similar a c o c++ pero con una sintaxis mas sencilla, de hecho este lenguaje lo conocí gracias al ser el numero 1 como la tecnología mas amada por programadores en stack overflow en su encuesta del año 2017, 2018, 2019 y 2020.

Y este al ser un lenguaje complejo como c y c++ ademas de ser multi propósito, nos permite usarlo tanto en **desarrollo de sistemas** (sistemas operativos, programas y apps, juegos ademas de muchos otros "sistemas"), **desarrollo web**, entre otros.

Cabe recalcar que esta documentación la basare en el orden que se puede encontrar en la documentación oficial del lenguaje y otras documentaciones similares.

Ademas esta documentación acepta que algunos conceptos los conoces de forma mínima.

---

## Indice

---

# Programación básica

En esta parte de la documentación veremos lo que se suele aplicar en todos los lenguajes de programación comunes y la forma en la que estos se manejan en este lenguaje aun que algunos se verán mas adelante o se profundizaran mas adelante.

---

## Conceptos básicos

Antes de iniciar con lo básico del lenguaje y lo especial del mismo, veremos cosas basicas del mismo, desde como crear un archivo de rust nuevo hasta como hacer comentarios, entre alguna y otras cosas necesarias para iniciarte en **la magia de rust**.

---

### Crear proyecto nuevo

antes de crear el proyecto de rust tendré que recalcar que yo estaré trabajando con ubuntu 20.04 aun que en realidad en cualquier sistema unix funcionara de forma similar.

Para crear un proyecto necesitamos entrar en la carpeta que queramos tener como almacenador de el mismo, en este mismo debemos llamar la terminal y ingresar el comando `cargo new NombreProjecto` (como creo que es obvio el `NombreProjecto` puede cambiar a preferencia del programador).

Luego de esto existirá una carpeta que tendrá los siguientes archivos de importancia:

+ src (carpeta donde ira nuestros archivos de código)
  + main.rs (archivo principal donde se ejecuta nuestro código fuente)
+ Cargo.toml (archivo donde se almacenaran las dependencias de nuestro código y otros datos)

---

### Hello world

Al hacer lo anteriormente mencionado, se creara en el archivo `main.sr` un hello world o hola mundo que se supone nos muestra algunas cosas muy básicas del mismo lenguaje.

El mismo es de la siguiente forma:

~~~rust
fn main(){
	println!("Hello world")
}
~~~

**cabe recalcar que hay ocasiones en las que los `;` son opcionales pero eso lo veremos mas adelante**.

pero aquí logramos concluir algunas cosas del hola mundo que son los siguientes:

+ nuestro código fuente debe ir en una función con el nombre  `main`.
+ usamos "println!" para 
+ para llamar un `macro o funcion interna` debemos usar `!` esto se profundizara mas adelante.
+ para iniciar una función debemos usar la palabra `fn` seguido de su nombre, parámetros y llaves.

Para correr este archivo Requeriremos otro comando de `cargo` que es `cargo run`, para usarlo nuestra terminal debe tener abierta la carpeta donde esta nuestro proyecto de rust.

Como extra puedo mencionar que los comentarios se hacen al igual que c++,c#,kotlin, entre otros lenguajes que ya trabajamos:

~~~rust
//haciendo asi comentarios de una linea

/*
	y asi comentarios multi-linea
*/
~~~

---

## Hello cargo

Cargo es el administrador de paquetes de rust y se usa para en efecto "administrar paquetes" ademas de dar varias otras funciones y facilitar el desarrollo para el usuario.

de hecho ya vimos una función de cargo que fue usar `cargo new` para crear un proyecto y el usar `cargo run` para ejecutar nuestro código.

Cargo suele ser un archivo con extencion `.toml` o tom's obvious, minimal language y aquí va las características de nuestros paquetes y su sintaxis es la siguiente:

~~~toml
[package]
name = "hello_cargo"
version = "0.1.0"
authors = ["Your Name <you@example.com>"]
edition = "2018"

[dependencies]
~~~

Las lineas entre corchetes son **encabezados de sección** o como podríamos llamar un tipo de "titulo" para cada sección de nuestro código.

Las 4 lineas siguientes dan la "info" de el desarrollador o equipo de desarrollo del proyecto y esta parte se puede hacer mas compleja añadiendo mas información a la misma.

La ultima linea es un encabezado que representa que bajo esa debemos añadir las dependencias de nuestro proyecto y reitero, esto se vera mas adelante.

---

## Variables y constantes

Las variables y constantes, tan necesarias y a la vez algo tan sencillo que a todos nos inicia en el gran mundo de la programación.

Estas se dividen en 2:

+ variables: datos almacenados cuyo valor puede cambiar
+ constantes: datos almacenados cuyo valor es inmutable, no pueden cambiar

### Variables

las variables se crean con la siguiente sintaxis:

~~~rust
let nombreVariable = "dato de la variable";
~~~

También podemos tener variables nulas o sin dato asignado, de la siguiente forma:

~~~rust
let nombreVariable;
~~~

Las variables por defecto tienen una característica especial y que a comparación de otros lenguajes, aquí las variables por defecto son "inmutables" de una forma muy especial, pues este solo puede recibir un nuevo dato en caso que el por defecto sea nulo, pero ese no se puede cambiar luego de asignado.

O como ejemplo directo:

~~~rust
//podemos hacer lo siguiente
let nombre;
//y luego ENTREGARLE un valor
nombre = "Rodrigo";
~~~

Esto es permitido, pero:

~~~rust
//si hacemos lo siguiente
let nombre = "Rodrigo";
//e intentamos cambiar de valor haciendo
nombre = "Javiera";
//nos entregara un error de sintaxis
~~~

para corregir esto hay que transformar la variable en mutable de la siguiente forma:

~~~rust
//hacemos la variable un mutable
let mut nombre = "Rodrigo";
//al cambiar la variable
nombre = "Javiera";
//esto no mostrara errores de sintaxis
~~~

Así es como directamente funcionan las variables.

Cabe resaltar que las variables deben usar CamelCase para declararse.

### Constantes

Las constantes son ya otra historia y son mucho mas fáciles de usar.

Estas no permiten el que se le añada o se cambie su valor, si son de un tipo y valor, se mantendrá por siempre del mismo tipo y valor.

Para crear una constante lo único que debemos hacer es cambiar la palabra `let` por `const` , esta constante generara un error si intentamos usar el `mut` con el mismo pero ademas hay que marcar el tipo de dato como ejemplo directo se hacen de la siguiente forma:

~~~rust
const NUMERO: i32 = 12;
~~~

Y luego podemos iterar con el, pero como dato extra, el nombre de las constantes suele estar totalmente en mayúsculas, si no nos genera una alerta.

---

​	Usualmente a la hora de trabajar con variables y constantes funcionan igual que en otros lenguajes, por ejemplo si queremos usar una variable en una función usaremos:

~~~rust
nombreFuncion(Variable);
~~~

Pero a la hora de imprimir una variable por su nombre tendremos que hacer algo mas complejo, en este caso debemos usar llaves para luego añadir el nombre de variable en el mismo usando `"{}", var_a_usar`.

Por ejemplo:

~~~rust
let nombre = "Rodrigo";
println!("mi nombre es {}", nombre);
~~~

Al imprimir el mensaje se entregara un mensaje que dirá `mi nombre es Rodrigo` , pero si queremos añadir mas de una variable podríamos hacer lo siguiente:

~~~rust
let nombre = "Rodrigo";
let apellido = "Seguel";

//imprimimos los 2 mensajes con
println!("mi nombre es {} y mi apellido es {}", nombre, apellido);
~~~

Y se mostrara el mensaje `mi nombre es Rodrigo y mi apellido es Seguel`.

---

## tipos de datos 

Anteriormente mencionamos el tema de los "tipos de datos" pues es en efecto estos representan que es cada variable, ejemplo si este es una cadena de texto, un numero entero, un numero decimal, una lista, etc...

Estos se especifican escribiendo la variable de la siguiente manera por ejemplo:

 `let nombre: tipoDeDato = valor;` o en su defecto como ejemplo mas claro `let numero: u8 = 4;`

### Tipos de datos numéricos

Los números enteros son los números (sin coma flotante) incluyendo al 0 y los negativos, lo que en otros lenguajes se llaman **integers**  solo que en este caso se dividen en 2 tipos:

+ firmados (tienen la posibilidad de trabajar con signo negativo)
+ no firmados (no nos permite el trabajar con signos)

**Para sacar el numero máximo de cada uno de estos se usa el calculo de (2^numero de bits) *por ejemplo: un i8 va del -128 al 127 y un u8 va del 0 al 255)* esto es así para almacenar con mas presicion los números sin sobrecargar la memoria ram **

| longitud | firmados (-) | no firmados |
| :------: | :----------: | :---------: |
|  8bits   |      i8      |     u8      |
|  16bits  |     i16      |     u16     |
|  32bits  |     i32      |     u32     |
|  64bits  |     i64      |     u64     |
| 128bits  |     i128     |    u128     |
|   arch   |    isize     |    usize    |

**El dato arch varia dependiendo del computador de quien ejecuta el programa, si es un computador de 64 bits sera en efecto 64 bits y en un computador de 32 bits sera 32 bits.**

Tambien podemos escribir otros tipos de datos con estos enteros como lo serian :

+ Decimales (0_01) = (0,01) solo que no sirven ambos, en este caso solo el primero
+ Hexadecimal (0xff)
+ Octal (0o77)
+ Binario (0b1111_0000)
+ Byte (b'A') en este caso solo puede ser u8

---

#### Coma flotante

Como ya sabemos los números decimales son bastante necesarios a la hora de iterar con números en nuestras variables.

En este caso solo hay 2 tipos:

+ `f32` decimales de 32 bits (mayor precisión)
+ `f64` decimales de 64  bits (mayor velocidad)

Por defecto suelen ser de 64 bits.

---

#### Operaciones numéricas

Para operar con números de forma constante requeriremos de hacer operaciones matemáticas, para esto tenemos los siguientes operadores:

| operador |   definición   |
| :------: | :------------: |
|    +     |      suma      |
|    -     |     resta      |
|    *     | multiplicación |
|    /     |    división    |
|    %     |     modulo     |

El modulo suele dar por ejemplo el "sobrante" de una división.

También esta el operador de igualdad `=` este nos permite por ejemplo añadir datos a una variable, aun que en este caso no lo tomaremos como un operador numérico pues no se usa a la hora de hacer operaciones matemáticas en rust.

---

### Tipos de datos booleanos

Los booleanos con el tipo de dato **`bool`**se distinguen por solo tener 2 datos y estos son `true` y `false` o en su defecto verdadero y falso.

Estos también se aplican en los condicionales que son un tema que veremos mas adelante, pero por ahora solo representan un estado u otro `verdadero o falso` `1 o 0` `true or false`.

Una variable booleana se verían así:

~~~rust
let Variable: bool = true;
let Variable2: bool = false;
~~~

También como extra enseñare los tipo de datos char.

Estos tienen la particularidad de que solo pueden contener 1 carácter como seria `A`, `B` o `c` entre muchos otros.

Estos se crean de la siguiente forma:

~~~rust
let variable: char = 'a';
//o tambien pueden ser
let variable = 'a';
~~~

**Recordar que a diferencia de un string este usa comillas simples en lugar de dobles**.

---

### Tipos de datos (colecciones)

Las colecciones como dice su nombre son conjuntos de datos unidos a una variable o constante especifica, estos nos permite iterar entra varios datos en especial y los principales tipos de colecciones son los siguientes:

---

#### Tuplas

Las tuplas son agrupaciones de datos que se caracterizan por ser inmutables, no se pueden añadir datos a una tupla ni puedes eliminar datos del mismo.

Una tupla se crea de la siguiente manera:

~~~rust
let VariableTupla: (tipos,de,datos) = (datos,de,tupla);
//o en su defecto y con un ejemplo mas claro
//let + nombre + (tipo de datos) = (datos segun su tipo)
let VariableTupla: (i8,bool,i16) = (12,true,500);
~~~

Si queremos llamar un especifico de una tupla, debemos primero asignar esos datos a un valor, de la siguiente forma:

~~~rust
//primero determinamos la tupla
let VariableTupla: (i8,i8,i8) = (2,3,4);
//luego determinamos un nuevo "indice" a cada valor
let (a,b,c) = VariableTupla;
/*
lo que hacemos con esta ultima linea es decir que
a = 2
b = 3
c = 4
*/
~~~

Osea que si por ejemplo queremos imprimir en pantalla el numero 3 debemos hacer

~~~rust
println!("{}", b); //esto mostrara el numero del indice llamado (en este caso el 4)
~~~

Aun que también existe un método que es usando `nombreTupla.IndiceDeValor` o como ejemplo lo haríamos de la siguiente forma:

~~~rust
//declaramos una tupla
let tupla: (i8,i8,i8) = (1,2,3);
//si quiero llamar el valor "2" podemos llamarlo usando "tupla.1"
println!("{}",tupla.1);
~~~

Cabe recordar que el indice va desde el 0 en adelante y este siendo el primer dato ademas de que este `tupla.indice` puede añadirse a otra variable o constante y llamarla desde ahí.

---

#### Arrays

Los array son similares a las tuplas pero diferentes en particular, estos se diferencian principalmente que al crearlos debemos usar una sintaxis mas sencilla, todos los datos deben ser del mismo tipo y es mas facil llamar sus datos por un indice.

Su sintaxis es la siguiente:

~~~rust
let nombreArray = [1,2,3,4,5];
~~~

En este caso creamos un array con números (5 específicamente) aun que también podemos crear el array diciendo el tipo de datos que tendrá y la cantidad de los mismos de la siguiente manera:

~~~rust
let nombreArray: [tipoDeDato;cantidadDeDatos] = [datos,del,array];
//o como ejemplo directo
let numeros: [i8;5] = [1,2,3,4,5];
~~~

**Cabe recordar que donde definimos el tipo de datos y a cantidad de datos, lo que los divide es un punto y coma, no solo una coma.**

El array no nos permitirá el ingresar o eliminar datos del mismo y para llamar un dato del mismo por ejemplo en un print podremos hacer lo siguiente:

~~~rust
//definimos un array
let nombreArray [1,2,3,4,5];
//imprimimos el numero 3 del array (el indice 2)
println!("{}", nombreArray[2]);
~~~

Ademas podemos crear "arrays automatizados" de una forma pero el truco es que el dato que le daremos se repetirá el numero de veces que elijamos por ejemplo:

~~~rust
let nombreArray = [dato a repetir; numero de veces a repetir];
//o como ejemplo directo
let nombreArray = [3; 5];
//esto nos creara un array cuyos datos son [3,3,3,3,3]
~~~

---

## Funciones

Las funciones son necesarios en cada lenguaje que repaso y que repasaras, estos nos permite aplicar bloques de código con mas control de lo usual e incluso estructurarlo de forma mas fácil.

Al iniciar un proyecto nuevo en rust se genera una función main con la siguiente sintaxis:

~~~rust
fn main() {
    //aqui va el codigo fuente
}
~~~

Esta función lo que hace es ser siempre la primera en ejecutarse de forma obligatoria y ahi llamaremos las otras funciones que queramos usar.

La sintaxis de una función es la siguiente:

~~~rust
//indicador de funcion + nombre + (parametros) {bloque de codigo}

/*
y que recordar que el nombre de una funcion requiere de guion bajo
no de camelCase como en las variables
*/

fn nombre_funcion() {
    //codigo a usar
}
~~~

Cabe recordar que si no usamos la palabra `fn` nuestra función (vaga la redundancia) no funcionará.

---

Si queremos llamar una función en nuestro main solo debemos escribir el nombre seguido de los parámetros a añadir dentro de paréntesis por ejemplo:

~~~rust
fn main() {
    funcion_secundaria();
}

fn funcion_secundaria() {
    //codigo a usar
}
~~~

---

Los parámetros de una función funcionan como un "Creador de variables para las funciones", este como ejemplo podríamos mostrarlo de la siguiente forma:

~~~rust
fn main(){
    //en este caso añadimos el numero 5 a la variable numero
	funcion_secundaria(5);
}
    
//el prametro se agrega escribiendo (nombreVariable: TipoDeDato)
fn funcion_secundaria(numero: i8)
    println!("el valor de numero es {}", numero);
}
~~~

Pero ademas pueden existir múltiples variables añadidas en los parámetros y solo se deben escribir con una coma entre medio, por ejemplo:

~~~rust
fn main(){
    //en este caso añadimos el numero 5 a la variable numero
	funcion_secundaria(5,10);
}
    
//el prametro se agrega escribiendo (nombreVariable: TipoDeDato)
fn funcion_secundaria(numero: i8,segundoNumero: i8)
    println!("el valor del primer numero es {}", numero);
	println!("el valor del segundo numero es {}", segundoNumero);
}
~~~

---

El retorno de las funciones es la capacidad de devolver un valor al código fuente, por ejemplo si ingresamos un dato y lo queremos editar para trabajar con el mismo en el código fuente, esto en otros lenguajes requiere de la palabra `return` en el caso de rust esto no es necesario siempre pues la mayoría de funciones devuelven la ultima expresión de forma implícita.

Pero para que el retorno funcione debemos usar `->` luego de decir los parámetros de nuestra función ademas de añadir luego el tipo de dato a entregar, por ejemplo:

~~~rust
fn funcion() -> i8 {
    5
}

fn main() {
    let numero = funcion();
    println!("el valor de numero es {}", numero)
}
~~~

 Aun que si queremos devolver un dato anterior al ultimo dado podemos usar la palabra `return`.

---

## Control de flujo

El control de flujos también es esencial en la programación, los if statement, los loops y otros temas son necesarios pues sin estos es casi imposible hacer un programa que tenga algún tipo de "interacción humana" e incluso otros tipos, por lo que mostraremos la función de gran parte de ellos.

---

### Operadores de lógica condicional

A la hora de usar las condicionales requerimos de operadores, para comparar, unir y transformar el resultado de estas condicionales y estas son las siguientes:

| operador  |                         descripción                          |
| :-------: | :----------------------------------------------------------: |
| && (and)  | nos permite preguntar si 2 condicionales son true (condición1 && condición 2) |
| \|\| (or) | nos permite elegir o comparar entre 2 condiciones y ver si una de esas es true usando (condición1 \|\| condición2) |
|  ! (not)  | nos permite transformar una condición en su opuesto (!condiciónTrue = false) |

---

### Condicionales

Las condicionales se dividen en 3 distintos `if`, `else if` y `else` los últimos 2 se complementan entre si y necesitan del if de forma necesaria para funcionar.

Estos funcionan de la siguiente forma:

~~~rust
if condicional { //si esta condicion se cumple
    //ejecuta codigo
} else if condicional { //sino si esta condicion se cumple
    //ejecuta codigo
} else { //sino 
    //ejecuta este codigo
}
~~~

Pero en este caso se puede añadir también a una variable de por ejemplo la siguiente forma:

 ~~~rust
let condicional = if true {5} else {6};
 ~~~

Y si en este caso usamos println para imprimir la variable se mostrara el dato 5 a no ser que ese true cambie, en ese caso se mostrara el valor 6.

---
### Bucles

Los bucles se dividen en principalmente 3 tipos `loops`, `while` y `for`.

Estos tienen como característica principal que mientras nosotros queramos o aveces de forma infinita. se repetirán una y otra vez hasta que su condicional sea falsa o que rompamos el bucle.

---

#### Bucles loop

El bucle loop es un bucle que se repetirá de forma infinita hasta que queramos que este se rompa usando la palabra `break` o presionando `ctrl`+`c`.

La sintaxis es la siguiente:

~~~rust
loop{
    //codigo a repetir infinitamente
}
~~~

Este puede devolver un dato si lo añadimos a una variable usando por ejemplo:

~~~rust
let numero = 3;
let varLoop = loop{
    numero += 1;
}
~~~

La variable sera 3+1 y ira aumentando cada vez que este loop se repita y si por ejemplo queremos terminar este loop podríamos usar un if por ejemplo usando:

~~~rust
let numero = 3;

let mut varLoop = loop{
    numero += 1;
    if numero >= 10 { //si la variable numero sube y es mayor a 10
        break; //rompe el bucle
    }
}
~~~

En este caso lo que ocurrirá es que a la variable numero se le sumara 1 hasta que el resultado sea 10, luego de esto el bucle se romperá.

---

#### Bucle while

El bucle while se identifica por técnicamente por ser un tipo de "condicional" pero cuyo código se repite como un bucle hasta que esa condición se vuelva `false`.

Su sintaxis es la siguiente:

~~~rust
while condicional{
    //codigo
}
~~~

O como ejemplo practico con esto se puede usar así:

~~~rust
let mut numero = 1;

while numero < 10{ //mientras la variable sea menor que 10
    numero += 1; //se suma 1 a la variable
    println!("{}", numero); //se imprime el valor de la variable
}
~~~

En este caso se genera un fin de el bucle y así se trabaja con el bucle while.

---

#### Bucle for

el bucle for a diferencia de los otros bucles este itera con una colección, ya sea viendo los datos en la misma o iterando con el numero de datos en una colección en si.

su sintaxis es la siguiente:

~~~rust
//creamos una coleccion a iterar, en mi caso usare un array
let numeros = [1,2,3,4,5];

//creamos el for
//for variable nueva in coleccion a iterar
for i in numeros.iter() {
    //codigo que se repetira 5 veces
}
~~~

el `.iter()` es una función que nos permite iterar en nuestra colección.

Ademas podríamos hacer un cambio, envés de hacer una colección antes en la que iterar, podemos iterar en un conteo de la siguiente forma:

~~~rust
for i in (1..5).rev(){
    //codigo que se repetira 5 veces
}
~~~

ese 1..5 nos genera un tipo de "lista o colección" que tiene como datos los números desde el 1 hasta el 5 pero esta opción se vera mas a profundidad mas adelante.

---

# La propiedad

La propiedad es un "aspecto" importante de rust, de hecho según la documentación es un tema sencillo pero la verdad es un tema importante y grande a tomar en cuenta en el lenguaje.

Todos los lenguajes tienen que administrar la memoria del dispositivo en el que trabaja mientras este se esta ejecutando, algunos lenguajes cuando dejan de usar memoria ram simplemente arrojan a un "basurero" esos datos sin usar.

Esto usualmente genera problemas de rendimiento en varias ocasiones, lo que Rust hace es usar lo que los creadores llaman un "sistema de propiedad" que administra la memoria del sistema a la hora de la compilación, así sin interrumpir el rendimiento del programa como destruir el rendimiento de la computadora del usuario si esta es de bajos recursos.

---

## Stack y heap

La memoria ram es un tipo de "intermediario" entre disco duro y procesador, esta entrega la información lista para el uso al procesador y así este ultimo puede iterar en esos datos, pero ademas este nos permite almacenar datos por todo el lapso en el que nuestro código se este ejecutando.

Mientras nuestro código se ejecuta, este le pedirá datos constantemente al disco duro y almacenara algunos datos de no tanta importancia en la misma memoria ram, esto ultimo al final puede ser útil, el problema es que cuando hay datos en la memoria ram que ya no utilizamos, esta la seguirá almacenando constantemente y esto generara que esa memoria se sature tarde o temprano generando así problemas de rendimiento e incluso en diversos dispositivos de bajos recursos pueden generar un congelamiento total del mismo.

La memoria ram tiene sus métodos específicos para poder trabajar con estos datos y estos son como `stack` y `heap`.

---

### Stack

El stack o "pila" es una lista estructurada o `Estructura de datos ` que almacena los datos que llegan y salen de la memoria ram, haciendo esto con el método **`LiFo`** o Last in First out (el ultimo que entra es el primero que sale) osea que la información en este caso podemos pensarla como un grupo de platos.

Si pones un plato sobre otro a la hora de querer sacar alguno deberás sacar el ultimo que añadiste, siendo en este y como ejemplo gráfico el de mas arriba, aquí seria algo muy similar.

En este caso añadir datos a esta pila se le llamaría "empujar hacia la pila" y eliminarlos se le conoce como solo "sacar de la pila".

La pila de por si es rápida pues antes de ejecutar el código puede ya asignar ese espacio al mismo, como si invitara a 4 personas a una cena y ya supiera exactamente donde se sentaran todos pues esta seguro de en que sitio ira cada uno, haciendo mas efectiva y fácil el ordenarlos.

---

### Heap

El heap (montón) es otra `Estructura de datos` la cual de por si a diferencia de la pila es mas "desordenada" que el stack aun que esta suele tener un tipo de orden que se crea en la marcha.

Esto se debe a que aquí irán los datos cuyo tamaño no conocemos ademas de los datos que quizá ni siquiera sabemos si su tamaño aumentara o disminuirá mientras se ejecuta el código.

Usando la analogía de la cena, seria como si a esa misma cena solo invitara amigos en general pero no supiera quienes vendrán o si estos vendrán con mas gente, por lo que debería organizar los datos durante la marcha. 

---

## Reglas de la propiedad

Como cada tema nuevo de programación, la propiedad contiene reglas que hay que seguir y en las que preocuparse a la hora de trabajar con este.

Estas reglas son:

+ Cada valor en rust tiene una variable a la cual se le conoce como `el propietario o dueño`.

+ Estos valores solo pueden tener 1 propietario o dueño a la vez.

+ Cuando el propietario sale del alcance, el valor se eliminara.

  + Con alcance podemos referirnos a las llaves que definen todo lo que va dentro de una función `{}`  por ejemplo:

    ~~~rust
    fn main(){
        let variable1 = "Esta variable esta dentro del alcance de la funcion main"
    }
    
    let variable2 = "Esta variable esta fuera del alcance de la funcion main"
    ~~~

    Como ya dijimos la variable 1 al estar entre las llaves `{}` esta dentro del alcance de su función `main` mientras que la variable 2 esta fuera de la misma.

---

l