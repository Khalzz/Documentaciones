# JavaScript

**Documentación hecha por Rodrigo Seguel**.

Desde la existencia del Internet siempre se ha buscado "**crear un estándar para el mismo**" y Javascript técnicamente **lo ha logrado**

JavaScript es un lenguaje de programación interpretado, orientado a objetos, basado en prototipos y con un tipado débil pero dinámico.

Usado principalmente para el desarrollo web (**específicamente en el frontend o "lado del cliente"**) este se ha ganado mucho elogio y amor de sus usuarios por ser tanto cómodo como fácil de usar (aun que esto le ha traído criticas principalmente en sus inicios).

este lenguaje de por si es mágico, no es solo uno de los 3 lenguajes de programación mas utilizados en el planeta, sino también uno de los mas flexibles, dado que este mismo puedes usarlo tanto para:

+ programación frontend (javascript vanilla)
+ programación backend (con el framework Node.js)
+ programación desktop (con el framework Electron)
+ programación móvil multi-plataforma (con el framework react native)
+ hasta programación de hardware (con frameworks como Cylon.js)

Desde la web hasta IOT, muchísimas empresas y de hecho la gran mayoría de la web utiliza javascript de alguna u otra manera, simplemente es genial.

Y si no me crees aquí hay una lista de grandes empresas comparando sus lenguajes en el lado del cliente con los que usan en el lado del servidor:

| Página web | Lenguaje de programación del lado del cliente | Lenguaje de programación del lado del servidor               |
| :--------- | :-------------------------------------------- | :----------------------------------------------------------- |
| Google     | JavaScript                                    | C, C++, Go, Java, Python, PHP (HHVM)                         |
| Facebook   | JavaScript                                    | Hack, PHP (HHVM), Python, C++, Java, Erlang, D, XHP, Haskell |
| YouTube    | JavaScript                                    | C, C++, Python, Java, Go                                     |
| Yahoo      | JavaScript                                    | PHP                                                          |
| Amazon     | JavaScript                                    | Java, C++, Perl                                              |
| Wikipedia  | JavaScript                                    | PHP, Hack                                                    |
| Twitter    | JavaScript                                    | C++, Java, Scala, Ruby                                       |

datos sacados de [la siguiente fuente](https://en.wikipedia.org/wiki/Programming_languages_used_in_most_popular_websites).

---

## Indice
+ [Primeros pasos en Javascript](#Primeros-pasos-en-Javascript)

  + [Conocimientos previos](#Conocimientos-previos)
  + [Crear Proyecto](#Crear-Proyecto)
  + [Comentarios](#Comentarios)
  + [Hola mundo](#Hola-mundo)
+ [Variables y tipos de datos](#Variables-y-tipos-de-datos)

  + [Declarar variables](#Declarar-variables)
  + [Tipos de datos](#Tipos de datos)
    + [Tipos de datos (primitivos)](#Tipos-de-datos-(primitivos))

    + [Tipos de datos (objetos)](#Tipos-de-datos-(objetos))
      + [Array](#Array)
      + [Math](#Math)
      + [Funciones](#Funciones)
      + [Objetos](#Objetos)
  + [Métodos o funciones de datos](#Métodos-o-funciones-de-datos)
    + [Funciones de string](#Funciones-de-string)
    + [Funciones de arrays](#Funciones-de-arrays)
  + [Entradas de datos](#Entradas-de-datos)
+ [Operadores](#Operadores)
  + [Operadores aritméticos](#Operadores-aritméticos)
  + [Operadores de asignación](#Operadores-de-asignación)
  + [Operadores de comparación](#Operadores-de-comparación)
  + [Operadores logicos](#Operadores-lógicos)
    + [Conjugación lógica](#Conjugación-lógica)
    + [Disyunción lógica](#Disyunción-lógica)
    + [Negación lógica](#Negación-lógica)
+ []()
  + []()
  + []()
  + []()

+ []()
  + []()
    + []()
  + []()
    + []()
    + []()
  + []()
+ []()

---

# Primeros pasos en Javascript

Javascript es un mundo amplio como ya lo mencionamos, en este caso hay algunos conocimientos "previos" que requerimos para que vayas "**iniciando con JavaScript **".

## Conocimientos previos

Antes de iniciar en javascript debemos saber algunos temas de importancia.

Para poder empezar con esta documentación, recomiendo tener como mínimo:

+ **conocimiento básico de html**.
+ **conocimiento básico de css**.

Dado que todos estos "lenguajes/tecnologías" van de la mano a la hora de hacer nuestro desarrollo web.

Ademas anteriormente mencione:

>JavaScript es un lenguaje de programación interpretado, orientado a objetos, basado en prototipos y con un tipado débil pero dinámico.
>
>-Rodrigo Seguel (aproximadamente 2 minutos antes de escribir esto... hehehe)

Pero para entenderlo primero les haré saber algunos conceptos importantes para la programación en javascript que puede que no sean tan útiles aun, pero luego serán de brutal importancia en algunos casos.

+ **javascript es un lenguaje interpretado** osea que este requiere de un "programa" que transforme el código de maquina con el que nuestro computador pueda trabajar, en este caso ese "programa" es **todo buscador web que lo use como estándar (google chrome, mozila firefox, edge, etc...)**.

  ---

+ **Javascript es un lenguaje orientado a objetos** osea utiliza el sistema de orientación a objetos que es tan usado en otros lenguajes o incluso **indispensable en otros lenguajes** como lo es en C#, Java, C++ y muchos otros (este tema se va a profundizar mas tarde)

+ **Javascript es un lenguaje basado en prototipos** osea, haciendo referencia a el tema anterior, al trabajar con objetos usamos "clases" que definen lo que es un objeto, a la hora de hacer mas objetos en base a ese, no requeriremos de hacer mas clases, simplemente instanciar el objeto ya creado con los datos que usara.

  ---

+ **Javascript es un lenguaje con tipado débil pero dinámico** osea que a diferencia de otros lenguajes, no debemos seleccionar el "tipo de dato" que ocupa una variable (ejemplo en c# `int numero = 1`) aquí solo colocamos unas palabras clave (las veremos mas adelante) y le podemos añadir cualquier tipo de dato a esta variable y esa misma "mutabilidad" es lo que le da el nombre de "dinámico".

  ---

+ **Javascript no es Java** así como suena, ambos son lenguajes de programación creados de distinta forma y para distintas funciones, de hecho el nombre de javascript viene a que el creador quiso apoyarse de el hecho de que java era un lenguaje conocido y lo uso a su favor (maldito genio del marketing, de hecho su lenguaje supero a java en popularidad).

  ---

+ **El `;` es opcional** en muchos lenguajes de programación de requiere de un `;` al finalizar cada linea de código que no sean contenedores (condicionales, bucles, funciones, entre otros...).

  En el caso de javaScript esto es opcional **pero igualmente se recomienda usar el mismo `;` al terminar lineas de código que requieran de este** puesto que esto ayuda a que los buscadores viejos tengan compatibilidad con el JavaScript que hemos escrito.

  *Por ejemplo seria lo mismo escribir:*

  ~~~javascript
  alert("esto es una alerta");
  ~~~

  *A escribir:*

  ~~~javascript
  alert("esto es una alerta")
  ~~~

  Solo que el segundo **es menos probable que se pueda utilizar en buscadores antiguos**.

---

## Crear Proyecto

Para poder empezar a trabajar con el lenguaje debemos como es obvio **crear un archivo donde escribir este código**.

Antes de esto deberemos haber creado nuestro archivo `.html` (en este caso `index.html`) al cual le enlazaremos nuestro archivo de JavaScript

Los archivos de JavaScript utilizan la extensión "`.js`" y **a la hora de añadirlo la carpeta de nuestro proyecto web recomiendo que el nombre del mismo sea `main.js` aun que puede llevar el nombre que a nosotros se nos haga cómodo, este es un estándar similar al `index.html` y al `style.css`**.

Tras esto veremos simplemente un archivo en blanco, para añadirlo a nuestro `index.html` tendremos varias formas:

+ **En linea** este método se basa en añadir el código en la misma etiqueta que queremos generar esa función.

  *por ejemplo*

  ~~~html
  <h1 onclick="alert("este es nuestro javascript")">header de nivel 1</h1>
  <!--En este caso al presionar el h1 se mostrara una alerta con el texto ya escrito-->
  ~~~

  Pero este método es poco ocupado y no recomiendo su uso.

  ---

+ **con la etiqueta `<script>`** este método se basa en el uso de una etiqueta de html que nos permite usar javascript **en el mismo archivo `index.html`** usando la etiqueta `<script></script>`.

  *por ejemplo:*

  ~~~html
  <script>
  	//aqui va nuestro codigo javascript
      alert("esto es una alerta");
  </script>
  ~~~

  Puede ser un poco útil en algunos casos pero igualmente no es la forma que recomiendo usar.

  ---

+ **De forma externa con un archivo `.js`** este método es el mas útil de todos, se basa en "enlazar" el archivo `.js` a nuestro `index.html` con la misma etiqueta `<script>` de una forma algo similar a como lo hacíamos con el `style.css`.

  *por ejemplo:*

  ~~~html
  <head>
      <link rel="stylesheet" href="style.css"> <!--asi enlazamos el css-->
  </head>
  <body>
      <script src="nombreDelCodigo.js"></script> <!--asi enlazamos el javascript-->
  </body>
  ~~~

  Pero antes requerimos en la misma carpeta un archivo javascript **que tenga el mismo nombre al que hacemos referencia con el `src=""`**.

  Algo que debo aclarar, este se añade en el body y al final del mismo, pues según la documentación oficial hecha por "mozilla", **esto permite que el html cargue antes que el javascript y así no tener errores mientras nuestra pagina se ejecute**. 

---

## Comentarios

A la hora de trabajar con cualquier lenguaje debemos seguir unas reglas muy especificas que determina el lenguaje en si (como la sintaxis en si), pero ademas tenemos otras reglas que son principalmente hechas por "la comunidad".

Una de estas "reglas" determina que "**un código bueno es un código legible**" un código que tu puedas entender **con solo leerlo** Pero a veces no podemos hacer esto solo escribiendo "buen código" también requerimos de una ayuda la cual son los comentarios.

Los comentarios son texto **que no afecta la función de nuestro código** y es bastante útil a la hora de documentar el mismo o hacer recordatorios para cuando volvamos a ver el código que ya escribimos.

~~~javascript
//esto es un comentario de una linea

/*
esto es
un comentario
multi-lineas
*/
~~~

y simplemente uniendo esto podemos hacer mas fácil nuestros momentos de escritura como de lectura de nuestro código.

---

## Hola mundo

Otra cosa que debemos hacer (en cada lenguaje que utilizamos) es **la tradición del "Hola mundo"** para así ver algunos temas/funciones básicas del lenguaje y de hecho en JavaScript es mucho mas fácil que en otros lenguajes.

Aquí mostraremos 3 tipos de "Hola Mundo" que me interesan ver y estos serian:

+ **Imprimir mensaje en consola** como dice su nombre, mostraremos un mensaje **en la consola del buscador** usando la función `console.log()`.

  *para esto en nuestro archivo escribimos:*

  ~~~javascript
  console.log("Hola Mundo!!!"); //este texto podemos cambiarlo por lo que queramos
  ~~~

  Para verlo debemos abrir el menú `inspect` (`ctrl` + `shift` + `i` o presionando `f12` en google chrome o chromium)  y ir a la ventana `console` aparte de ver nuestro mensaje podremos jugar con **"el intérprete de javascript"**.

  ---

+ **Mostrar un mensaje de "alerta"** nos permite mostrar una "mini ventana emergente" que nos mostrara un mensaje de alerta esto con la función `alert()`.

  *para esto en nuestro archivo escribimos:*

  ~~~javascript
  alert("Hola Mundo!!!"); //este texto podemos cambiarlo por lo que queramos
  ~~~

  Este es mas fácil de percibir que el anterior ademas de ser algo que "el usuario normal debería ver".
  
+ **Mostrar elemento en el html** nos permite "añadir" un elemento a html usando `document.write()`

  *para esto en nuestro archivo escribimos:*

  ~~~javascript
  document.write("este texto se mostrara como parrafo");
  
  //o tambien podemos hacerlo asi:
  document.write("<h1>esto es un header</h1>") //especificamos la etiqueta a añadir
  ~~~

  

**Otra función bastante útil es `prompt()` que al igual que el `input()` de otros lenguajes nos permite recibir datos de parte de el usuario con una ventana similar a la de "alerta"**.

---

# Variables y tipos de datos

A la hora de programar trabajaremos con muchos datos, desde almacenar el nombre de una persona para mostrarlo en pantalla hasta almacenar el estado de una cuadricula para hacer cálculos en base a eso, las variables nos abren un mundo gigantesco ante nosotros.

*La sintaxis de una variable se divide en tres partes principales:*

+ `Tipo de variable` *son let y const.*
+ `nombre de la variable` *por ejemplo "nombre", "edad", "añoDeNacimiento", etc...*
+ `Dato asignado a la variable` *por ejemplo "rodrigo", 17, 2003, etc...* **este ajusta el tipo de dato de la variable de forma automática**

y estas van en el siguiente orden:

~~~javascript
//tipoDeVariable nombreDeVariable = valorDeLaVariable
let nombre = "Rodrigo";
const edad = 17;
~~~

Aun que podemos también crear varias al mismo tiempo, haciendo:

~~~javascript
let nombre, apellido, edad; //determinamos el nombre de nuestras variables 
nombre = "Rodrigo";
apellido = "Seguel";
edad = 17;

//aun que tambien podemos:
let nombre = "Rodrigo", apellido = "Seguel", edad = 17; //y seria lo mismo
~~~

En otros lenguajes a la hora de trabajar con variables podríamos decir que las variables son **"cajas que almacenan datos"** y estas mismas cajas deben estar "preparadas" para específicos tipos de datos, mientras que aquí, **la caja se "ajusta" al dato que introduciremos en la misma**.

De hecho el tipo de dato que ingresemos puede cambiar  principalmente **cuando declaramos la variable con `let`**.

Otra cosa importante es que el nombre de una variable **no puede tener espacio así que estas requieren de ser escritas con camelCase para hacerlas mas legibles**.

Por ejemplo en vez de escribir `Nombre de usuario` podemos usar `nombreDeUsuario` **poniendo la primera letra en minúscula**.

---

## Declarar variables

Las variables en Javascript funcionan muy distinto a otros lenguajes en los que requerimos seleccionar el tipo de dato que le añadimos a una variable, mientras que aquí solo debemos seleccionar si ese valor cambiara o no en el futuro.

Para eso tenemos **"dos"** palabras claves:

+ `let` nos permite seleccionar una variable, que su valor cambie durante la ejecución **sin importar el tipo de dato del mismo** (puede pasar de number a booleano a string sin problemas).

  *ejempo:*

  ~~~javascript
  let numero = 9; //declaramos la variable como un numero
  
  numero = "nueve"; //cambiamos su valor a una "cadena de texto" string
  ~~~

  ---

+ `const` nos permite declarar una variable con un valor **el cual no va a cambiar** y que de hecho genera un error si intentamos cambiarlo.

  *ejemplo:*

  ~~~javascript
  let numero = 9; //declaramos la variable como numero
  numero = 10; //esto nos generara un error
  ~~~
  
  ---

+ `var` si, se que dije **"dos"** pero este es especial, anteriormente se usaba `var` para declarar variables pero desde la existencia del `let` y `const` el `var` esta obsoleto.

  Aun que el `let` y `const` no es reconocido por buscadores viejos **por lo que recomiendo dejar totalmente de usar el `var`** y pasar nuestro código por **`babel`** (luego hablaremos de eso) para hacerlo compatible con buscadores antiguos.


---
## Tipos de datos

**Los datos pueden ser de distintos tipos**, desde números, a cadenas de texto, hasta listas indexables (arrays), etc...

**Antes de continuar debes saber que puedes saber el tipo de dato de una variable con la función `typeof(dato a comprobar)`** por ejemplo si hacemos `typeof(1)` nos dirá que es un `Number`. 

Pero en general estos se dividen en distintas categorías, como son:

---

### Tipos de datos (primitivos)

Son los "datos originales" que trae el lenguaje por "defecto" y que no requieren de otros para ser creados (por ejemplo: números, texto, booleanos, etc...)

Pero en general lo tipos de datos primitivos son:

+ **String** o cadenas de texto, se diferencian por siempre llevar `"comillas"`  ya sean comillas dobles como en el ejemplo `""`, comillas simples `''` para definir que un dato es un string en si.

  *Ejemplo:*

  ~~~javascript
  let nombre = "Rodrigo"; //este texto es un string por llevar comillas
  ~~~

  *Otro ejemplo bastante útil es:*

  ~~~javascript
  let numero1 = "1";
  let numero2 = "2";
  
  alert(numero1 + numero2); //se crea una alerta que en este caso nos imprime 12
  ~~~

  Esto ocurre por que al ser lineas de texto **no se suman, se concatenan**.
  
  Otra forma de concatenar es con el uso de `${}` y cambiando las comillas `("")` por backticks `(``)`, esto nos permite "insertar" un dato en mitad de un string con el que estemos trabajando.
  
    *por ejemplo:*
  
  ~~~javascript
  let nombre = "Rodrigo";
    
  console.log(`Hola ${nombre}!!! como estas??`); //Hola Rodrigo!!! como estas??  
  //en lugar de hacer "hola" + nombre + "!!! como estas???" tecnicacmente hacen lo mismo
  ~~~
  
  ---
  
+ **Number** o números, son valores numéricos en javascript que en este caso especifico usaran 64 bits de la memoria y sus valores pueden ir desde `-(2^53) + 1` o  (`-9.007.199.254.740.991`) y `(2^53) - 1` o (`9.007.199.254.740.991`).

  Este mismo puede tener distintos tipos de valores:

  + **Números enteros** los **negativos y positivos sin decimales**

    *ejemplo:*

    ~~~javascript
    let numero = 1;
    let suma = 1 + 5; //si imprimimos esto en un alert nos dara 6
    ~~~

    ---

  + **Números decimales** los **negativos y positivos con decimales**

    *ejemplo:*

    ~~~javascript
    let decimal = 0.58;
    let suma = 0.2 + 0.4;
    ~~~

    Los decimales en si nos generan algunos problemas dado que los decimales funcionan de una forma rara por como el lenguaje los interpreta, por ejemplo a la suma que hicimos nos daría como resultado **0.6000000000000001**

    Pero esto lo podemos arreglar aproximando el valor con la función `.toFixed()` de la siguiente forma:

    ~~~javascript
    let suma = (0.2 + 0.4).toFixed(1); //este nos dara 0.60 pero como string
    
    //esto lo arreglamos usando:
    let suma = +(0.2 + 0.4).toFixed(1); //con ese + sabe que hablamos de solo numeros
    ~~~

    ---

  + **Números infinitos** se dividen en: 

    + el valor **negativo mas bajo** `-Infinity`  (lo conseguimos dividiendo cualquier numero que no sea 0 por -0)
    + el valor **positivo mas alto** `Infinity` (lo conseguimos dividiendo cualquier numero que no sea 0 por 0) 

    *ejemplo*

    ~~~javascript
    let infinitoPositivo = Infinity;
    let infinitoNegativo = -Infinity;
    // o tambien
    let infinitoPositivo = 30 / 0; //infinito
    let infinitoNegativo = 21 / -0; //-infinito
    ~~~

    Podemos saber al instante si un numero es infinito o no con la función `isFinite(numero);`.

    ---

  + **NaN** "Not a Number" nos avisa de si hacemos un "calculo invalido" por ejemplo si dividimos "0/0" como resultado nos dará `NaN` y todo calculo que le hagamos al mismo nos dará como resultado otro `NaN`.

    *ejemplo:*
    
    ~~~javascript
    divisionIMposible = 0 / 0; //si imprimimos esto nos mostrara "NaN"
    ~~~
    
    De hecho es muy especial el NaN puesto que si hacemos `NaN == NaN` la consola nos entregara un valor "False" dado que NaN ni siquiera es igual a si mismo, pero podemos ver si un valor es `NaN` con la función `isNaN(valor);` (si el valor es NaN nos devuelve un "True")

  ---

+ **Boolean** los datos de tipo Boolean o "Booleanos" se caracterizan por tener solo dos estados posibles.

  + **true** (Verdadero o 1 si hablamos en binario).
  + **false** (Falso o 0 si hablamos en binario).

  *ejemplo:*

  ~~~javascript
  const booleanoVerdadero = true;
  const booleanoFalso = false;
  
  //tambien podemos hacer
  const booleano = 0 == 0; //al ser esta comparacion verdad nos dará un "true"
  const booleano = 1 == 0; //al ser esta comparacion falsa nos dará un "false"
  ~~~
  
  Ambos son muy comunes en funciones que buscan hacer o comparaciones o "confirmar el estado de algo" por ejemplo las funciones `isFinite()` o `isNaN()` que dependiendo del valor que añadamos nos devuelven un `true` o `false`.
  
  **Cabe aclarar que al hacer "ecuaciones con operadores aritméticos" el false se toma como 0 mientras que el true se toma como un 1**

  ---

+ **Null** o nulo nos permite seleccionar que una variable no tiene un valor aun y que lo añadiremos mas adelante.

  *ejemplo:*

  ~~~javascript
  const variableNula = null;
  
  variableNula = 1 //si queremos luego podemos añadirle un valor a la variable
  ~~~

  ---

+ **Undefined** o "indefinido" es similar al null solo que este significa que el valor de nuestra variable no esta "claro".

  *ejemplo:*

  ~~~javascript
  const numero; //el valor de numero sera undefined
  
  numero = 1 //si queremos luego podemos añadirle un valor a la variable
  ~~~

  Se genera cuando declaramos una variable sin iniciarla (sin igualarla a un valor) o con funciones que no "retornan" un valor **este deberíamos dejar a el mismo javascript asignarlo** dado que lo hace automáticamente.

---

**Algo a tomar en cuenta en torno a el funcionamiento de las variables en javascript es que podemos "unir datos uniendo variables" osea haciendo esto:**

~~~javascript
let numero1 = 1;
let numero2 = numero1;
~~~

Esto funcionara normalmente y en el caso de la primera variable, el valor que este tenga se le otorgara a la segunda variable.

Pero por temas de el funcionamiento de javascript el valor asignado a la segunda variable **si cambiamos el valor de la variable original, este no editara el valor de la segunda variable**.

*por ejemplo:*

~~~javascript
let numero1 = 1;
let numero2 = numero1;

//si cambiamos el valor de la variable "numero1"
numero1++; //numero1 = 2
console.log(numero2); //numero2 = 1
~~~

Esto ocurre por que al "unir las variables" en realidad no se enlazan como en otros lenguajes, sino que el valor se "copia y pega" pero luego cada variable es independiente de la otra.

---

### Tipos de datos (objetos)

En javascript, todo tipo de dato que no es un **tipo de dato primitivo** se le considera objeto, dado que requiere de otros valores para funcionar y que esos valores en su mayoria son **datos primitivos**.

Estos son por ejemplo: arrays, objetos en si, funciones, entre otros tipos de datos.

**Los mas importantes son:**

#### Arrays

Los array (o arreglos) entran en un tipo de dato que podemos llamar "objetos" y es forma en la que podemos unir varios datos en uno mismo, similar a una lista, solo que en este caso podemos acceder a ellos por un indice.

*declarar un array:*

 ~~~javascript
//para crear un array debemos usar corchetes y dentro de el separar los datos con coma
let array = ["dato 1", "dato 2", "dato 3"] //los datos pueden ser de tipo mixto
 ~~~

Y para acceder a esos datos , los seleccionaremos con un "indice" que va desde el 0 hasta el mayor numero de datos que hay en el array.

*por ejemplo:*

~~~javascript
let array = ["manzana", "platano", "pera", "piña"]

alert(array[0]) //en este caso en una alerta veremos el primer dato del array (manzana)
alert(array[1]) //en este caso en una alerta veremos el segundo dato del array (platano)
alert(array[3]) //en este caso en una alerta veremos el cuarto dato del array (piña)
~~~

Ademas podemos hacer otras cosas interesantes como:

~~~javascript
let miArray = ["manzana", "platano", "pera"]

//cambiar datos
miArray[0] = "piña" //(en este caso cambiamos el dato con indice 0 "manzana")
//el array ahora sera = ["piña", "platano", "pera"]

//mostrar el largo de un array
miArray.length //nos dara como resultado (3) dado que ese es el numero de datos del array
let x = miArray.length //en este caso añadimos a la variable el "largo del array" (3)

//----------------------------------------------------------------------------------------

//añadir datos al final de un array
miArray.push("piña") //el array ahora es ["manzana", "platano", "pera", "piña"]

//eliminar el ultimo dato del array
miArray.pop() //el array ahora es ["manzana", "platano", "pera"] el () no hace nada

//----------------------------------------------------------------------------------------

//añadir datos al inicio del array
miArray.unshift("durazno") //el array ahora es ["durazno", "manzana", "platano", "pera"]

//eliminar el primer dato del array
miArray.shift() //el array ahora es ["manzana", "platano", "pera"] el () no hace nada
~~~

Otro tema importante son los **Arrays Asociativos** osea, arrays que en vez de solo ser accesibles por un indice, podemos acceder a ellos de forma similar a los diccionarios en otros lenguajes **haciendo un tipo de "clave" que reverencie ese valor**.

*ejemplo de uso:*

~~~javascript
let componentesPc = {
    //clave: valor;
    procesador: "ryzen",
    ram: "12gb",
    espacio: "500gb"
}; //esto es "tecnicamente" un objeto ademas de que este especifico requiere ; al final

//si llamamos un dato de la siguiente forma por ejemplo:
componentesPc[ram]; //nos dara el valor de la "clave ingresada"
//luego podemos iterar con el dato ingresandolo en un alert o lo que sea
~~~

---

#### Funciones

Las funciones son bloques de código que nos permiten "particionar nuestro código" así ejecutando ciertas lineas en el momento que nosotros lo decidamos, **por ahora este es un tema algo mas avanzado, pero entramos en profundidad a el en [esta parte de la documentación](#Funciones)**

---

#### Objetos

Son todos los "objetos" creados tomando en cuenta el paradigma de **programación orientada a objetos**, este tema es mas avanzado así que **puedes verlo en [esta parte de la documentación](#Programación-orientada-a-objetos)**

---

#### Math

A la hora de "trabajar" con datos que requieran de un procesamiento matemático es muy necesario utilizar algunas funciones y parámetros que nos pueden ser muy útiles.

Ya sea **ver números aleatorios o el valor de pi** hay muchos datos y parámetros que podemos utilizar a la hora de hacer iteraciones matemáticas.

Y su sintaxis de ejemplo seria: `let numero = Math.funcion(propiedades);`

*las funciones que podemos usar para acceder a estos datos son:*

|       función       |                          definición                          |
| :-----------------: | :----------------------------------------------------------: |
|  **`Math.sqrt()`**  | Devuelve la raiz cuadrada positiva del numero añadido en el parámetro |
|  **`Math.cbrt()`**  | Devuelve la raiz cuadrada negativa del numero añadido en el parámetro |
|  **`Math.max()`**   |    Devuelve el valor mas alto de los números que le pasas    |
|  **`Math.min()`**   |  Devuelve el valor mas pequeño de los números que le pasas   |
| **`Math.random()`** |       Devuelve un numero pseudo aleatorio entre 0 y 1        |
| **`Math.round()`**  |     Devuelve un valor "aproximado" al entero mas cercano     |
| **`Math.fround()`** | Devuelve un valor "aproximado" al entero mas cercano de tipo flotante |
| **`Math.floor()`**  | Devuelve el mayor entero, menor que o igual a un numero (redondea hacia abajo) |
| **`Math.trunc()`**  |      Transforma un float (decimal) en un numero entero       |

---

**OJO, si queremos hacer por ejemplo un numero aleatorio del 0 al 100 en lugar de el 0 al 1 debemos hacer lo siguiente:**

~~~javascript
let numeroRandom = Math.random()*100; //al usar el *100 nos da valores entre el 0 y el 100

//pero este sale con muchos decimales, por lo que usamos
numeroRandom = Math.round(numeroRandom); //redondeamos el valor al entero mas cercano
//o
numeroRandom = Math.floor(numeroRandom)
~~~

Este ultimo es el mas util si lo que buscamos es que los valores elegidos no se admitan en el conteo, dado que este va  a aproximar hacia el numero mas bajo, pero ademas podemos hacer:

~~~javascript
let numeroRandom = Math.round(Math.random() * 100))
//en este caso lo hacemos todo en una linea
//pero en caso que no querramos que se muestre el 0 o el 100 debemos hacerlo asi:
let numeroRandom = Math.round(Math.random() * 99) + 1)
~~~

Y como ultimo tema importante, si queremos hacer un numero aleatorio entre 2 valores debemos usar:

~~~javascript
function numeroAleatorio(nMin, nMax) {
  return Math.random() * (nMax - nMin) + nMin;
}

//si la ejecutamos de la siguiente forma
numeroAleatorio(0, 5) //nos dara un numero aleatorio entre el 0 y el 5
//luego solo debemos jugar con las demas formas de hacer numeros aleatorios
~~~

---

**Ademas hay propiedades que equivalen a valores específicos usando la sintaxis `Math.propiedad`**.

*por ejemplo:*

~~~javascript
const numeroPi = Math.PI; //esto le otorga a la constante, el valor de pi (aproximado)
~~~

*y estas propiedades son:*

|     propiedad      |                          definición                          |
| :----------------: | :----------------------------------------------------------: |
|   **`Math.PI`**    |  Nos entrega el valor de pi aproximado (3.141592653589793).  |
|   **`Math.LN2`**   |          **Logaritmo natural de 2** (0.693 aprox).           |
|  **`Math.LN10`**   |          **Logaritmo natural de 10** (2.303 aprox).          |
|  **`Math.LOG2E`**  |         **Logaritmo de E con base 2** (1.443 aprox).         |
| **`Math.LOG10E`**  |           **Logaritmo de E con base 10** (0.434).            |
| **`Math.SQRT1_2`** |           **Raíz cuadrada de 1/2**  (0.707 aprox).           |
|  **`Math.SQRT2`**  |            **Raíz cuadrada de 2** (1.414 aprox).             |
|    **`Math.E`**    | **Constante de Euler** la base de los logaritmos naturales (2.718 aprox) |

---

## Métodos o funciones de datos

Todos los tipos de datos tienen en especifico "funciones" o "métodos" que nos permiten interactuar con los mismos en base a el valor que tienen y como se muestra este.

---

### Funciones de string



Especialmente los string que de por si tienen muchos tipos de interacciones aplicables a ellos y usando la sintaxis **`variableString.funcion(propiedades);`**.

*las principales funciones son:*

| función              |                         descripción                          |
| :------------------- | :----------------------------------------------------------: |
| **`.concat()`**      | nos permite concatenar dos strings que añadamos como propiedad. |
| **`.startWith()`**   | Nos da `true` si el string inicia con el dato que añadamos como propiedad. |
| **`.endsWith()`**    | Nos da `true` si el string termina con el dato que añadamos como propiedad. |
| **`.includes()`**    | Nos da `true` si el string incluye el dato que añadamos como propiedad. |
| **`.indexOf()`**     | nos entrega "el indice numérico" de la primera letra en una palabra (si no se encuentra nos dará -1). |
| **`.lastIndexOf()`** | nos entrega "el indice numérico" de la ultima letra en una palabra (si no se encuentra nos dará -1). |
| **`.padStart()`**    | nos permite seleccionar un valor que se repetirá al inicio hasta que nuestro string tenga cierto largo `(largo, valor a repetir)`. |
| **`.padEnd()`**      | nos permite seleccionar un valor que se repetirá al final hasta que nuestro string tenga cierto largo `(largo, valor a repetir)`. |
| **`.repeat()`**      | repite el string la cantidad de veces que seleccionemos en la misma función. |
| **`.split()`**       | nos permite "separar" el string según el carácter deseado (" " lo separa por espacios). |
| **`.substring()`**   | nos permite seleccionar cuantas letras se mostraran del string ejemplo (0, 3) se mostraran **solo las 4 primeras letras**. |
| **`.toLowerCase()`** | Transforma todas las letras de un string **en minúsculas**.  |
| **`.toUpperCase()`** | Transforma todas las letras de un string **en mayúsculas**.  |
| **`.toString()`**    | Transforma un valor en string (ejemplo transforma un 3 a un "3"). |
| **`.trim()`**        |   Elimina los espacios al inicio y al final de un string.    |
| **`.trimEnd()`**     |         Elimina los espacios al final de un string.          |
| **`.trimStart()`**   |         Elimina los espacios al inicio de un string.         |

---

### Funciones de arrays

Al igual que los strings puede que requieras hacer algunos cambios en los array con alguna función en especifico, estas tienen la misma sintaxis que las funciones de los string, solo que como es obvio **el tipo de dato debe ser si o si un array**

*las principales funciones son:*

|     función      |                         descripción                          |
| :--------------: | :----------------------------------------------------------: |
|   **`.pop()`**   | Elimina el ultimo elemento de un array para luego "retornarlo". |
|  **`.shift()`**  | Elimina el primer elemento de un array para luego "retornarlo". |
|  **`.push()`**   | Añade un elemento al array y lo posiciona al final del mismo. |
| **`.reverse()`** |       Invierte el orden de los datos dentro del array.       |
| **`.unshift()`** | agrega uno o mas elementos al array y nos retorna el largo nuevo del mismo. |
|  **`.sort()`**   | Nos permite "ordenar" los datos de un array según su valor.  |
| **`.splice()`**  | Nos permite eliminar varios elementos consecutivamente (indice Inicial, numero de datos a borrar después de este) aun que **también nos deja añadir datos**. |
|  **`.join()`**   | Une todos los datos de el array en un string con el que podemos luego iterar. |
|  **`.slice()`**  | Nos entrega los elementos que seleccionamos (el numero donde empieza, fin) ojo hay que recordar que el fin no cuenta. |

**Y hay 2 funciones muy especiales a la hora de trabajar con arrays que de hecho funcionan similares a los bucles y son:**

+ `.filter(función)` **por cada elemento de el  array, se ejecuta la funcion que ingresemos en el filter** repitiéndose hasta "repasar" todos los datos del mismo array **y de paso generando un nuevo array**.

  *ejemplo:*

  ~~~javascript
  const array = [1,2,3,4,5,6,7,8,9,10];
  
  //la variable numeros es como al variable asignada en un 'for x in array'
  const num = array.filter(numeros => numeros < 5) //en este caso hay un arrow function
  //la funcion solo retorna los datos que sean menores de 5
  console.log(num) //este imprime esos numeros retornados
  ~~~

  Hay que recordar que en este ejemplo no hace falta poner el `let ` o `const` dado que genera errores y que la función puede ser de cualquier tipo pero por el ejemplo lo hice de tipo flecha pero **requiere de estar unido a una variable o constante pues o sino tampoco funciona**.

  ---

+ `.forEach()` **por cada elemento de el  array, se ejecuta la función que ingresemos en el forEach **repitiéndose hasta "repasar" todos los datos del mismo array **y sin necesidad de crear otro array con el mismo**.

  *ejemplo:*

  ~~~javascript
  const array = [1,2,3,4,5,6,7,8,9,10];
  
  //la variable numeros se asigna a cada valor del array cuando el bucle se repite
  array.forEach(function (numeros){ //en este caso usamos una funcion normal
  	console.log(numeros) //esto se repite por cada dato en el array
  })
  ~~~

  **a la hora de iterar con los datos del mismo es mejor hacerlo desde la misma función y no requiere de `let` o `const`**.

  ---

**OJO, en los array también sirven algunas funciones de strings como `.toString()`, `.indexOf()`, `.lastIndexOf()` y `.includes()`**.

---

## Entradas de datos

A la hora de programar en varias ocasiones vamos a querer iterar con datos **que ingrese el mismo usuario**.

Para eso usamos la función `prompt()` la cual al igual que el `input()` en python nos genera un "campo de texto vacío" el cual usaremos para recibir datos de parte del usuario si la asignamos a una variable.

*por ejemplo:*

~~~javascript
let nombre = prompt()

alert(nombre.toUpperCase()) //esto mostrara una alerta con la variable nombre en mayuscula
~~~

Y como ves en el ejemplo luego nada nos impide aplicar múltiples funciones o iterar de formas distintas con el mismo dato que se pide al usuario.

Pero también podemos añadirle un texto a la barra usando `prompt("escribe tu nombre")`, esto hará el "cuadro de alerta" con el campo de texto pero aparte tendrá un texto que nos dirá que hacer, en este caso que escribas tu nombre.

---

# Operadores

A la hora de trabajar con múltiples datos vamos a querer hacer distintos tipos de "operación" que aplicar a los datos con los que estaremos constantemente trabajando.

En general hay tres tipos de operadores que nos interesan, y son:

---

### Operadores aritméticos

Es un tipo de operador que manipula datos de forma "matemática", estos datos usualmente son de tipo **Number** ya sean enteros o decimales.

*estos son:*

| operadores  |                          definición                          |
| :---------: | :----------------------------------------------------------: |
|     `+`     |                             suma                             |
|     `-`     |                            resta                             |
|     `*`     |                        multiplicación                        |
|    `**`     |            potencia (este no es soportado por IE)            |
|     `/`     |          división (su resultado siempre es decimal)          |
|     `%`     |                       modulo (residuo)                       |
|    `++`     |                        aumentar en 1                         |
|    `--`     |                        disminuir en 1                        |
|    `-x`     |        negación unitaria (da el negativo de un dato)         |
| `+true` (1) | positivo unitario (convierte en Number un dato que no lo sea) |

---

### Operadores de asignación (básicos)

Es un tipo de operador que permite asignar información de un dato a otro, ya sea para editarlos, mostrar que estos son el mismo dato, entre otros tipos de acciones que se pueden hacer con estos operadores

ejemplo: `datoX = datoY` en este caso el "=" es el operador de asignación

| operadores abreviados |          definición          | operadores extendidos |
| :-------------------: | :--------------------------: | :-------------------: |
|        `x = y`        |   asignar o igualar datos    |        `x = y`        |
|       `x += y`        |      suma en asignación      |      `x = x + y`      |
|       `x -= y`        |     resta en asignación      |      `x = x - y`      |
|       `x *= y`        | multiplicación en asignación |      `x = x * y`      |
|       `x /= y`        |    división en asignación    |      `x = x / y`      |
|       `x %= y`        |     modulo en asignación     |      `x = x % y`      |
|       `x **= y`       |   exponente en asignación    |      `x = x**y`       |

---

### Operadores de comparación

Estos nos permiten hacer comparaciones en base a dos datos y que **como resultado nos entrege un true si equivalen lo mismo o un false si no**.

*ejemplo de uso:*

~~~javascript
true == true //si ambos datos tienen el mismo valor nos va a retornar un "true"
true == false //sino nos retornara un "false"

let booleano = 1 == 0;  //tambien podemos asignarlo a una variable
//en este caso el valor de la misma sera "false" dado que 1 no es igual a 0
~~~

Pero hay varios otros operadores que podemos usar para hacer comparaciones.

| operador |  definición   |
| :------: | :-----------: |
|   `==`   |     igual     |
|   `!=`   |   no igual    |
|   `>`    |   mayor que   |
|   `>`    |   menor que   |
|   `>=`   | mayor o igual |
|   `<=`   | menor o igual |

Hay dos operadores muy especiales de los cuales tengo que hacer mención, y son:

| operador |                          definición                          |
| :------: | :----------------------------------------------------------: |
|  `===`   | igualdad estricta (si el valor y tipo de dato son iguales nos da "true") |
|  `!==`   | desigualdad estricta (si el valor y tipo de dato son distintos nos da "true") |

---

### Operadores lógicos 

Cuando trabajemos con condicionales habrán momentos donde querremos hacer "comparaciones" entre dos valores en las mismas condicionales o incluso validar dos al mismo tiempo.

**Los operadores lógicos se dividen en 3 tipos principales y para verlos los comparare con los mismos operadores pero del lenguaje Python aun que también se usan en otros lenguajes de la misma manera.**

#### Conjugación lógica

el operador de conjugación es `and` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

| JavaScript | Conjugación | Python |
| :--------: | :---------: | :----: |
|     &&     |      y      |  and   |

Este operador se puede mencionar como **multiplicación lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |    &&(*)    |  false(0)   | false(0)  |
|  false(0)   |    &&(*)    |   true(1)   | false(0)  |
|   true(1)   |    &&(*)    |  false(0)   | false(0)  |
|   true(1)   |    &&(*)    |   true(1)   |  true(1)  |

#### Disyunción lógica

El operador de disyunción es `or` y sirve para evaluar si la condición del lado izquierdo **o** el del lado derecho se cumplen.

| JavaScript | disyunción | python |
| :--------: | :--------: | :----: |
|    \|\|    |     o      |   or   |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |   \|\|(+)   |  false(0)   | false(0)  |
|  false(0)   |   \|\|(+)   |   true(1)   |  true(1)  |
|   true(1)   |   \|\|(+)   |  false(0)   |  true(1)  |
|   true(1)   |   \|\|(+)   |   true(1)   |  true(1)  |

#### Negación lógica

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

| Javascript | Negación | python |
| :--------: | :------: | :----: |
|     !      |    no    |  not   |

Este operador funciona así:

| negación | booleano | resultado |
| :------: | :------: | :-------: |
|    !     |   true   |   false   |
|    !     |  false   |   true    |

---

# Condicionales

A la hora de ejecutar nuestro código es probable que queramos "comprobar datos" y que dependiendo de esta "comprobación" podamos ejecutar un bloque de código u otro.

Esto lo logramos con las **condicionales**.

Las condicionales son "comprobadores" que en base a ciertas **"condiciones"** ven si ejecutaran el codigo que tendrán entre llaves `{}`.

*su sintaxis es la siguiente*

~~~javascript
//condicional (condicion){
if (numero === 1) { //si se cumple la condicion (nos da como resultado un true)
    //se ejecutara lo que ingresemos aqui
}
~~~

Y hay tres tipos de condicionales:

---

## If

El if es la primera condicional que debemos utilizar siempre (dado que las demás requieren de este para funcionar).

La función de un if seria en base a la frase "**`si` (condición) es verdadera {ejecutar el código aqui}**".

*funciona de la siguiente forma:*

~~~javascript
let numero = 1;

if (numero === 1) { //si la condicional nos da como resultado "true"
    //ejecutar este codigo
} 
~~~

deben recordar que **las condiciones que ingresemos en una condicional deben estar entre parentesis**.

---

## Else if

Este es "una continuación" del anteriormente mencionado así funcionando como un **sino**, mientras que el if se basaba en la frase "**si (una condición se cumple) {ejecutar código}**" el else if continua con la frase **sino, si (otra condición se cumple) {ejecutar código}**.

*funciona de la siguiente forma:*

~~~javascript
let numero = 2;

if (numero === 1) { //en este caso esta condición no se cumple
    //este código no se ejecuta
} else if (numero === 2) { //en este caso la condición si se cumple
    //ejecutar este código
}
~~~

---

## Else

Este de por si es lo que me gusta llamar un tipo de "condicional relajado" dado que este es muchísimo mas fácil que los otros condicionales ya vistos.

Este se basa en intentar hacer un "ultimatum" con la frase **sino {ejecutar código}** así señalando que si ni una condición se cumple, el código continuara con esta condición.

*funciona de la siguiente forma:*

~~~javascript
let numero = 3

if (numero === 1) { //esta condicion es falsa
    //este codigo no se ejecuta
} else if (numero === 2) { //esta condicion es falsa
    //este codigo no se ejecuta
} else { //si ni una de las condiciones es true, este se ejecutara si o si
    //ejecutar codigo
}
~~~

---

# Bucles

Los bucles son similares a las condicionales, solo que en este caso **si la condicional (de algunos) nos da true** va a ejegutar ese codigo de forma infinita **o hasta que hagamos que ese bucle se rompa**.

---

## Bucle while

Este es el mas similar a las condicionales originales, ya que **mientras una condicion se cumpla**, el bloque de código dentro de este se repetira.

*su sintaxis es la siguiente:*

~~~javascript
while (condicion) {
    //codigo a repetir
}
~~~

Recomiendo siempre que usemos el while, buscar llegar al final del mismo con break, rompiendo la condicion u con otras sentencias, dado que los bucles infinitos nos pueden generar problemas de rendimiento.

*un buen ejemplo de uso puede ser:*

~~~javascript
let numero = 0;

while (numero < 20) { //mientras la variable numero sea menor a 20
    numero++; //sumar 1 a la variable numero
    document.write(`<h1>${numero}</h1>`);
}
~~~

En este caso se mostrara un conteo desde el 1 al 20 en el html de la pagina en si.

Una palabra clave que nos ayudara bastante es `break` que nos permite **romper el bucle y continuar con el codigo que hay tras este bucle**.

*un ejemplo de esto seria:*

~~~javascript
let numero = 0;

while (true) { //con while(true) generamos un bucle infinito
    numero++; //sumar 1 a la variable numero
    if (numero == 5){ //podemos anidar condicionales dentro de bucles
        break; //rompemos el bucle
    }
}
//el codigo continua aqui...
~~~

---

#### Do while

El bucle **while** en si tiene un tipo de  "variación", la cual conocemos como "el bucle **do while**".

Este funciona similar al bucle while solo que **primero seleccionamos el bloque a ejecutar y luego vemos si la condición se cumple**.

*su sintaxis es la siguiente:*

~~~javascript
do{
    //este codigo se reproducira 1 vez
} while (condicion) //si esta condicion es true, el bloque de codigo se repite
~~~

*ejemplo de uso:*

~~~javascript
let numero = 0;

do {
    numero++; //sumar 1 a la variable numero
    document.write(`<h1>${numero}</h1>`); //imprimir el dato de la variable 1
} while (numero < 20) //si la variable es menor a 20 volver a repetir
~~~

---

## Bucle for

El bucle for es un tipo de "bucle mas complejo" dado que no requiere solo de una condicional.

Mientras que el while puede ser infinito (dado que podemos simplemente **no romper el bucle**), mientras que el bucle for **debemos seleccionar cuando termina antes que todo lo demás**.

*su sintaxis es la siguiente:*

~~~javascript
for (variableDeclarada; condicional; comoCambiaLaVariable) {
    //bloque de codigo
}
~~~

*un ejemplo de uso podría ser:*

~~~javascript
for (let i = 0; i < 6; i++) { //la variable i  aumentara de 1 en 1 hasta ser mayor a 6
    document.write(i); //este escribira el valor de i cada vez que se repite el código
}
~~~

Otra de las **palabras clave** que nos serviran al trabajar con bucles es el `continue;`, este nos permite "saltarnos" un ciclo del bucle.

*ejemplo de uso:*

~~~javascript
for (let i = 0; i <=5; i++) {
    if (i == 2) { //si i es igual a 2
        continue; //saltarse el ciclo
    }
    alert(i); //en este caso al terminar el bucle se vera impreso "0, 1, 3, 4, 5"
}
~~~

---

### Bucle for in

El bucle `for in` funciona muy diferente a el for normal y de hecho funciona muchisimo mas distinto que en otros lenguajes.

Este aparte de requerir un array en el que iterar, ademas requiere de menos datos que ingresar en el mismo y debemos saber que este **itera sobre el nombre de el dato o el indice del dato**.

*su sintaxis es la siguiente:*

~~~javascript
let miArray = ["manzana", "pera", "platano", "piña", "durazno"]; //creamos array

//for nombreElementos in Array{}
for (let frutas in miArray) {
    //se crea una variable (en este caso con el nombre frutas)
    //cada vez que el bucle se repita este tendra otro indice del array
    //al llegar al ultimo se rompera el bucle
    document.write(frutas); //se mostraran todos los indices del array asi = 01234
}
~~~

---

### Bucle for of

Es similar al bucle `for in` solo que este **en lugar de iterar con el nombre o indice de los datos, itera con el mismo valor del mismo** osea que este funciona como el `for in` de otros lenguajes.

*su sintaxis es la siguiente:*

~~~javascript
let miArray = ["manzana", "pera", "platano", "piña", "durazno"]; //creamos array

//for nombreElementos in Array{}
for (let frutas of miArray) {
    //se crea una variable (en este caso con el nombre frutas)
    //cada vez que el bucle se repita este tendra otro valor del array
    //al llegar al ultimo se rompera el bucle
    document.write(frutas); //se mostraran todos los datos del array
}
~~~

---

## Labeled

Cuando trabajemos con bucles es probable que querramos hacer referencias a un bucle en especifico, ya sea por que queremos romper un bucle anidado o algo asi, referenciar estos bucles puede ser muy util.

El label nos permite añadirle un tipo de "identificador" a nuestros bucles con los que iterar a la hora de usar `continue` o un `break`.

*ejemplo de uso*

~~~javascript
let numero = 0;

labelDeMiBucle: while (numero < 10){
    numero++;
    document.write(numero);
    while (numero == 5) {
        break labelDeMiBucle; //este break rompera el bucle especifico al que referencia
    }
}
~~~

**normalmente el break o continue interactuan con el bucle en el que estan pero luego continuan en su "bucle padre" el `label` nos permite seleccionar por ejemplo en este caso un bucle "padre" para "romperlo"**.

---

# Funciones

**Aquí es donde todo se pone interesante**.

Las funciones son una forma de "encapsular nuestro código" permitiendo guardar porciones  o bloques de código en 1 función que al llamarla ejecutara una acción o el mismo bloque de código que ingresamos en la misma función.

*su sintaxis es la siguiente:*

~~~javascript
function nombreFuncion(){
    //bloque de codigo que ejecutar
}

nombreFuncion(); //para ejecutar la funcion debemos llamarla por su nombre seguido de "()"
~~~

*un ejemplo de uso seria:*

~~~javascript
function decirHola(){ //definimos la funcion
    alert("Hola!!!, como te encuentras amigo???")
}

decirHola() //llamamos la funcion para que funcione
~~~

En este caso se mostrara el mensaje solo al "llamar" la función que ya creaste.

*también podríamos hacer:*

~~~javascript
let suma = function(){ //asignamos la funcion a una variable
    let resultado = 1+2;
    return resultado //para que la asignacion sea exitosa debemos "retornar" un valor
}

suma() //llamamos la funcion

//la variable numeros ahora tiene el valor 3
//tambien lo podriamos hacer asi:

function suma(){ //declaramos la variable
    let resultado = 1+2;
    return resultado
}

let numeros = suma(); //asignamos el valor de la funcion a una variable
~~~

**Cabe aclarar que al igual que podemos anidar condicionales, podemos anidar funciones, ingresando una función dentro de otra**.

----

## Parametros

Los parámetros son una parte un poco mas avanzada de las funciones , a la hora de trabajar con ellas solo podemos usar valores que estén **dentro de la misma función** pero en caso de que los datos se crearan de forma externa a la misma, hay una forma de "introducirlos en la función".

*la sintaxis de una función completa seria la siguiente:*

~~~javascript
function mensaje(nombreNuevoDeVariable){ //aqui van todos los parametros de la funcion
    alert(nombreNuevoDeVariable)
} //si intentamos ejecutar nuestra funcion con solo suma() no se podra

//en este caso deberemos usar
mensaje("hola amigo, como te encuentras"); //esto mostrara el mensaje de forma exitosa
~~~

Lo que aquí podemos ver es que en los paréntesis `()` de la función al declararla va un "parámetro", este sera **el nuevo nombre que tendrá un dato dentro de la función** por lo que solo podremos interactuar con ella dependiendo del nombre que ingresemos en ese paréntesis.

Otra cosa a tomar en cuenta es que hay que ingresar esos datos en la función, por lo que a la hora de "hacerla funcionar" o llamarla debemos añadir el dato original con el que se trabajara **en el ejemplo es `variableFueraDeFuncion`** y dentro de la función la misma se llama `nombreNuevoDeVariable`.

**Tras esto solo debemos jugar con los parámetros y ver el mundo de cosas interesantes que podemos hacer**.

*como:*

~~~javascript
//definimos la funcion y los parametros que usara
function suma(numero, numeroDos){
    alert(numero+numeroDos);
}

//llamamos a la funcion y le entregamos los datos que queremos usar en ella
suma(1,2); //esto nos entregara como resultado el numero 3
~~~

**esto en ciertos casos puede no ser necesario usar parametros dado que en javascript es totalmente valido hacer esto:**

~~~javascript
let nombre = "Rodrigo";

function decirNombre(){
    alert(nombre);
}

decirNombre();
~~~

**específicamente no es necesario usar parámetros cuando no retornamos un valor o iteramos en valores distintos, por ejemplo en este caso solo "mostramos el texto en pantalla" por lo que no es necesario usar parámetros para ingresar los datos**.

---

## Scope

El scope es una "característica" de javascript que se define por **ser el "contexto actual de ejecucion" en el que una variable es declarada y donde esta puede ser tanto accedida como utilizada**

*de por si hay 2 tipos de scope:*

+ **scope global** osea que su valor puede ser accedido desde cualquier parte del código

  *ejemplo:*

  ~~~javascript
  let numero = 2
  
  function numerica(){
      //si llamamos la variable numero
      alert(numero) //este hace referencia a la variable numero y su valor es 2
  }
  
  function numerica2(){
      //si llamamos la variable numero
      alert(numero) //este hace referencia a la misma variable y denuevo es 2
  }
  ~~~

  ---

+ **scope local** osea que su valor puede ser accedido **solo dentro de donde la definamos** y no importa si las declaramos con `let` , `const` o `var`.

  *ejemplo:*

  ~~~javascript
  //estos son scope de funcion
  function frutas(){
      let fruta = "pera"
      //si llamamos la variable fruta
      alert(fruta) //este mostrara el valor pera
  }
  
  function frutas2(){
      let fruta = "manzana"
      //si llamamos la variable fruta
      alert(fruta) //este mostrara el valor manzana
  }
  
  //pero aun asi, el valor de ambos es independiente entre cada funcion
  ~~~

  Aun que el scope local se divide en 2 tipos distintos:

  + **De función** son las variables declaradas dentro de una función que se pueden llamar dentro de la misma, incluso en una función anidada o en un condicional dentro de el mismo pero **no se puede llamar fuera de la función**.

    *ejemplo:*

    ~~~javascript
    //estos son scope de funcion
    function frutas(){
        let fruta = "pera"
        if (fruta == "pera"){
            fruta = "manzana" //podemos llamarla dentro de la funcion
        }
        alert(fruta) //este mostrara el valor manzana dado el orden de ejecución
    }
    
    //si tratamos de llamar el valor "fruta" aqui no podremos acceder al mismo
    ~~~

    ---

  + **De bloque** son las variables declaradas dentro de un bloque, el cual se especifica con las llaves `{}` y **no se puede llamar fuera del mismo bloque**.

    *por ejemplo:*

    ~~~javascript
    function numerica(){
        //si llamamos la variable numerica
        if (true){
            let numero = 3 //creamos una variable (es distinto crearla a llamarla)
            //llamarla seria usar "numero = 3" si existiera la misma
        }
        alert(numero) //al ser local y de bloque el dato no es accesible desde afuera
        //esto ocurre por que estan hechas con let pero con const ocurre igualmente
    } 
    
    //al ejecutar esta funcion nos dara un error
    ~~~


---

## Arrow functions

Las arrow functions son una "forma" de crear funciones la cual nos permite "ahorrarnos lineas de código" dado que este esta sujeto a varias reglas que nos pueden acortar la escritura de la misma.

*su sintaxis básica es la siguiente:*

~~~javascript
const miFuncion = (parametros) => {
    //bloque de codigo
}

//en este caso la llamamos con:
miFuncion(parametros);
~~~

Pero esta esta sujeta a múltiples reglas que nos pueden ser muy útiles, como lo son:

+ **solo si hay un parámetro, los paréntesis en el mismo son opcionales**.

  *ejemplo:*

  ~~~javascript
  const miFuncion = parametros => {
      //bloque de codigo
  }
  ~~~

  ---

+ **si el bloque de codigo que ejecuta la funcion tiene una sola linea podemos dejar toda la funcion en una sola linea de la siguiente forma**:

  ~~~javascript
  const decirHola = () => {alert('Hola!!!, como te encuentras');}
  ~~~

  ---
  
+ **si el mismo código tiene una sola linea, las llaves `{}` son opcionales y podemos acortar mas nuestra linea de código así:**

  ~~~javascript
  const decirHola = () => alert('Hola!!!, como te encuentras');
  ~~~

  ---

+ **Si queremos devolver un valor con un `return`, no hará falta usar esta palabra clave, dado que el `return` se aplica automáticamente**

  *ejemplo:*

  ~~~javascript
  let numero = 1;
  let numero2 = 2;
  
  //ejemplo 1 
  let suma = function(valor1, valor2){
      return valor1 + valor2
  } //la variable suma tiene el valor 3
  alert(suma(numero, numero2)); //llamamos la funcion (su valor es 3) 
  
  //seria lo mismo hacer:
  //ejemplo 2
  const suma = (valor1, valor2) => valor1 + valor2
  alert(suma(numero, numero2)); //llamamos la funcion (su valor es 3)
  ~~~

  Como podemos ver en el ejemplo 1 la función es mucho mas larga que en el ejemplo 2 mientras que en este ultimo nos podemos ahorrar suficiente memoria para hacer que la pagina cargue muchísimo mas rápido.

---

# Programación orientada a objetos

La programación orientada a objetos es un "paradigma" que nos permite particionar nuestro código separándolo en objetos.

**Y en general la POO se define por 4 pilares fundamentales y estos son**:

+ Encapsulamiento (Es la capacidad de ocultar datos y o permitir que estos iteren en otros objetos
+ abstraccion (Expresa las caracteristicas especiales de un objeto (y que lo diferencia de otro))
+ herencia (La capacidad de que un objeto "herede" el funcionamiento y datos de otro)
+ polimorfismo (La capacidad de que estos datos "heredados" se puedan editar en el objeto nuevo)

**Este "paradigma" se conforma principalmente por:**

---

## Clases

A la hora de crear un objeto deberemos definir una clase, la clase es **un molde** en el que los demás objetos que creemos se basaran **y le otorgaran valores según cada objeto requiera**.

*por ejemplo:*

~~~javascript
//creamos un "molde" o clase con el nombre persona
class persona {
    constructor(nombre, edad, altura){ 
        //el constructor sirve para dar el valor de los datos que usaremos en el objeto
        this.nombre = nombre
        this.edad = edad
        this.altura = altura
        //la keyword "this" solo se usa en el constructor
    }
}

//para crear un objeto/instanciar un objeto (en este caso una persona) usamos
let yo = new persona('Rodrigo', 17, 1.78);
~~~

En las primeras lineas creamos un objeto con una **función constructora** que nos permite entregarle valores a nuestro objeto, al terminar el objeto creamos una variable y esta debe:

+ usar la palabra `new` para definir que se esta basando en una clase.
+ mencionar el nombre de la clase a la que se referencia como molde.
+ entregar los datos en los paréntesis de el objeto instanciado.

---

## Métodos

Los Métodos son las funciones que rigen el comportamiento de nuestro objeto, estos se definen como funciones normales pero sin la palabra clave `function` dentro de la clase y **las funciones flecha no funcionan al hacer métodos**.

*por ejemplo:*

~~~javascript
class persona {
    constructor(nombre){ 
        this.nombre = nombre
    }
    decirHola(){
        alert("Hola, como estas?")
    }
}
let yo = new persona('Rodrigo');
//objeto.metodo()
yo.saludar() //esto llama a la funcion saludar de el objeto "yo"
~~~

Hay que recordar que a la hora de crear objetos siempre hay que primero instanciarlos antes de usar sus métodos.

**Cabe resaltar que técnicamente el `constructor` es un método solo que su única y principal función es trabajar con los valores que usara nuestro objeto/clase**.

Otra cosa importante son los **métodos estaticos** que nos permiten "salir de la funcion normal de los metodos en una clase" osea no requerimos crear un objeto para referenciar el método y esto lo logramos anteponiendo la palabra `static` al nombre del método.

*ejemplo:*

 ~~~javascript
class persona {
    constructor(nombre){ 
        this.nombre = nombre
    }
    static decirHola(){
        alert("Hola, como estas?")
    }
}

//para llamar a la funcion decir hola, no debemos "crear un nuevo objeto" solo hacer:
persona.decirHola() //y no nos generara error como lo hacia sin la palabra static
 ~~~

---

## Herencia

La herencia en términos simples es el "separar clases en dos tipos", las clases padre (o `super`) y las clases hijo (o `sub-clases`).

+ **Clases padres o `super`** suele ser la clase en la que definimos la forma mas básica de un objeto.
+ **Clases hijo o sub-clases** son las clases que heredan datos y funciones de una clase **`super`**.

Esto nos sirve para no tener que rehacer constantemente clases con distintas funciones, sino el poder crear una base principal, crear otra que herede esos datos y si queremos hacer cambios simplemente editar lo que sea necesario.

*esto funciona de la siguiente forma:*

~~~javascript
//creamos una clase padre (en este caso haremos una sintaxis basica con una funcion)
class padre {
    constructor(dato1, dato2){
        this.dato1 = "dato1";
        this.dato2 = "dato2";
    }
    mostrarMensaje(){
        alert("este es un mensaje de ejemplo")
    }
}

//si hacemos:
class hijo extends padre { //usamos extends para seleccionar de que padre haremos herencia
    constructor(dato1, dato2, dato3){ //mencionamos los datos de nuestro constructor
        super(dato1, dato2); //con super traemos los datos/variables de la clase padre
        this.dato3 = "dato3"; //este dato solo existe en la clase hijo y no en el padre
    }
    mostrarMensaje(){
        alert(this.dato1);
    }
}

//con solo esto y por ejemplo sin volver a generar una variable podemos hacer 
let claseHijo = new hijo
claseHijo.mostrarMensaje() //incluso sin definir la funcion esta existe
~~~

---

## Polimorfismo

El polimorfismo es la capacidad de que las clases heredadas **puedan cambiar de forma** y así obtener tanto funciones y datos diferentes a los originalmente seleccionados en una clase padre o incluso cambiar estos que ya existían.

De hecho esto es tan simple como **simplemente llamar los datos y funciones y cambiar su valor**

*por ejemplo:*

~~~javascript
class padre {
    constructor(dato1, dato2){
        this.dato1 = "dato1";
        this.dato2 = "dato2";
    }
    mostrarMensaje(){
        alert("este es un mensaje de ejemplo")
    }
}

//si hacemos:
class hijo extends padre {
    constructor(dato1, dato2, dato3){
        super(dato1, dato2);
       	this.dato1 = "dato nuevo" //solo en esta clase, el dato1 tiene un valor nuevo
        //esto podemos aplicarlo a todos los datos que querramos
        //de hecho el dato2 sigue con su valor original
    }
    mostrarMensaje(){ //llamamos denuevo la funcion para cambiar su bloque de codigo
        alert('este es otro mensaje'); //cambiamos el bloque de la misma funcion
    }
}
~~~

---

## Getters y Setters

A la hora de crear el `constructor` de nuestra clase puede ocurrir que querramos **cambiar el valor de las variables con una función** y esto lo hacemos con las "funciones" `set`.

**Los setters son los que se encargan de "cambiar el valor" de los datos que ya definimos ya sea como nulos o como otro tipo de dato**.

*su sintaxis de un setter es:*

~~~javascript
class persona{
    constructor(nombre, edad){
        this.nombre = null; //valor a cambiar (este esta en null pero puede de todo)
        this.edad = null; //valor a cambiar (este esta en null pero puede de todo)
    }
    //este es un setter
    set setNombre(nuevoNombre){
        this.nombre = nuevoNombre; //llamamos la variable y le asignamos el set
    }
    //este es otro setter
    set setEdad(nuevaEdad){
        this.edad = nuevaEdad; //llamamos la variable y le asignamos el set
    }
}

let p = new persona

//los setter pueden parecer a una funcion pero no funcionan como uno
//para cambiar el dato no usamos p.setNombre("dato"), sino:
p.setNombre = "Rodrigo"; //cambiamos el valor de "null" a "Rodrigo"
p.setEdad = 17; //cambiamos el valor de "null" a 17
~~~

**mientras que los getters se encargan de "seleccionar" que datos se "retornaran" en base a la funcion que apliquemos en el mismo**.

*ejemplo de sintaxis:*

~~~javascript
class persona{
    constructor(nombre){
        this.nombre = "Rodrigo";
    }
    //este es un getter
    get getNombre(){
        return this.nombre; //al ejecutar la funcion este hara referencia a el dato
    }
}

//ahora si queremos llamarlo solo debemos hacer:
let p = new persona;
//y interactuamos con el getter, por ejemplo:
document.write(p.getNombre); //esto llamara el valor "Rodrigo"
~~~

---

# La consola

A la hora de codificar puede que requiramos de algún "output" o salida de datos que nos permita ya sea "localizar errores" o simplemente hacer "pruebas" que nos serán muy útiles durante nuestro desarrollo.

La consola nos permite "trabajar con esos datos" y "mostrar mensajes de los mismos" con la idea de mostrarse en un lugar que no interfiera en la experiencia del mismo usuario.

Como ya mencionamos **para abrir la consola en google chrome, chromium o en firefox** debes ya sea **presionar `f12` y seleccionar la pestaña `Console`** o **presionar `ctrl` + `shift` + `i` y luego seleccionar la pestaña `Console`**.

**Al igual que el interprete de python, en este podemos escribir comandos o incluso código en si, pero es mas recomendable hacer esto con ayuda de algún editor de código **.

---

## Métodos de registro

A la hora de trabajar con la consola hay muchos métodos que quizá queramos usar, ya sea para mostrar mensajes o avisar de alguna forma que la pagina esta fallando, siempre hay algúna función que nos pueden facilitar la vida.

**la sintaxis de los métodos que interactúan con la consola es `console.metodo(parametros)`**.

*estos métodos son:*

|     métodos     |                         descripción                          |
| :-------------: | :----------------------------------------------------------: |
|  **`.log()`**   | Nos permite mostrar en consola el mensaje ingresado como parámetro |
| **`.clear()`**  |                      Limpia la consola                       |
| **`.error()`**  | Nos permite mostrar en consola el mensaje ingresado en el parámetro como error |
|  **`.info()`**  | Nos permite mostrar un mensaje informativo en la consola (prefiere usar .log()) |
| **`.table()`**  | Muestra una tabla (en los parámetros debe ir un array o un objeto con index y value) |
|  **`.warn()`**  | Muestra en consola el mensaje ingresado en el parámetro como advertencia |
|   **`dir()`**   | Muestra una lista interactiva de las propiedades del objeto especificado (no estándar) |
| **`.assert()`** | Compara una condición, si es true se ejecuta normalmente, si no lanza error |

**Algo útil, si queremos mostrar un texto en pantalla y queremos cambiar su estilo, podemos añadirle un css de una forma especial usando por ejemplo:**

~~~javascript
console.log("%cMensaje a imprimir", "color:red;background:black;") //y añadimos mas
//para esto simplemente hay que llamar el string y al inicio añadirle "%c"
//luego de escribir el mensaje debemos usar coma y elegir el estilo como si fuera css
~~~

---

## Métodos de conteo

Quizá a la hora de ejecutar alguna función múltiples veces queremos saber cuantas veces se esta ejecutando la misma y así tener un conocimiento mas profundo de el funcionamiento de la misma pagina.

*Para esto tenemos dos métodos:*

+ **`count()`** usualmente  va dentro de una función y **nos permite contar cuantas veces se ejecuta una función en si**.

  *ejemplo de uso:*

  ~~~javascript
  function accion(){
      console.count();
  }
  
  //cada vez que lo ejecutemos habra un contador que se sumara en 1
  accion(); //default: 1
  accion(); //default: 2
  accion(); //default: 3
  accion(); //default: 4
  ~~~

  ---

+ **`countReset()`** si en un punto del conteo queremos que este vuelva a cero debemos usar esta función, cabe aclarar que esta **no suele ir dentro de otra función**.

  *ejemplo de uso:*

  ~~~javascript
  function accion(){
      console.count();
  }
  
  //cada vez que lo ejecutemos habra un contador que se sumara en 1
  accion(); //default: 1
  accion(); //default: 2
  accion(); //default: 3
  accion(); //default: 4
  
  console.countReset(); //reiniciamos el conteo
  
  accion(); //default: 1 (el conteo vuelve al inicio)
  ~~~

---

## Métodos de agrupación

A la hora de escribir código en la consola o simplemente ejecutar mensajes en la misma puede que queramos agrupar todo este código en algo similar a una función que solo se agrupe en la consola.

*esto lo logramos usando:*

|         métodos         |                          definición                          |
| :---------------------: | :----------------------------------------------------------: |
|     **`.group()`**      | Permite crear un grupo (podemos darle un nombre al grupo como parámetro). |
|    **`.groupEnd()`**    | Elimina el grupo que hemos creado, o mejor dicho "salimos de el". |
| **`.groupCollapsed()`** | Permite crear un grupo, pero en este caso el grupo se crea "colapsado". |

---

## Métodos de temporizador

Puede que queramos utilizar nuestra consola como un temporizador, así sabiendo cuanto tarda en ocurrir una función u otras cosas que nos pueden salvar la vida.

*estos métodos son:*

|     métodos      |                          definición                          |
| :--------------: | :----------------------------------------------------------: |
|  **`.time()`**   | Inicia un temporizador que se ejecutara "en segundo plano".  |
| **`.timeLog()`** | Muestra en pantalla el tiempo que ha transcurrido desde el uso de `.time()`. |
| **`timeEnd()`**  | Detiene el temporizador y muestra en pantalla el tiempo que transcurrió. |

---

# DOM

Como ya se ha mencionado, el uso principal de javascript esta en el desarrollo web en si, pero para esto debemos saber un concepto nuevo llamado **DOM** o **Document Object Model** que específicamente nos permite trabajar directamente con lo que es **html** y **css**

El dom en si **es la forma en la que javascript puede acceder a nuestro html** y diciéndolo de forma técnica **representando el documento como un grupo de nodos** así modificando tanto la **estructura**, el **estilo** y el **contenido**.

De hecho el dom puede ser visualizado desde la consola de forma fácil, simplemente intenta escribir `console.log(document)` y veras toda la estructura html de la misma pagina.

*pero antes unos conceptos iniciales:*

+ **nodo** son todos los elementos que estén en el dom, principalmente etiquetas y otros tipos de elementos (**hay que aclarar que todas las etiquetas son nodos, pero no todos los nodos son etiquetas**) y este se compone por:

  ---

  + **Document** es "**el nodo raíz**" osea el que almacena todos los otros nodos.
  + **Element** son los nodos definidos **por etiquetas html**.
  + **Text** es el nodo que representa un texto dentro de el nodo **Element** siendo un hijo de este.
  + **Attribute** son los atributos de las etiquetas que definen nodos. (en javascript no se les ve como nodos, sino como información asociada a los nodos de tipo **Element**).
  + **Comentarios y otros** son los nodos generados por los comentarios en si y otros elementos como las declaraciones **doctype** en la cabecera de nuestro **html**.

---

 ## Métodos de selección de elementos

Para poder trabajar con estos nodos, debemos primero acceder a los mismos y para eso tenemos distintos métodos que nos permiten elegir el elemento con el que vamos a trabajar.

**La sintaxis de estos es: `document.metodo()`**.

*y estos métodos son:*

|           métodos            |                         descripción                          |
| :--------------------------: | :----------------------------------------------------------: |
|   **`.getElementById()`**    | Selecciona un elemento por su id (ademas nos muestra su tipo de objeto) |
| **`.getElementByTagName()`** | Selecciona un elemento por el nombre de su etiqueta (y muestra su tipo) |
|    **`.querySelector()`**    | Selecciona el primer elemento por su selector en css (y muestra su tipo) |
|  **`.querySelectorAll()`**   | Selecciona todos los elementos que coincidan por su selector de css (los une en una lista) |

---

## Métodos de atributos de elementos

También puede que mas que buscar el elemento a utilizar queramos cambiar uno de sus atributos, esto lo logramos con los siguientes métodos:

+ **`.setAttribute("atributoACambiar", "valorNuevo")`** nos permite cambiar el valor de un atributo de html.

  *un ejemplo de uso seria:*

  ~~~html
  <input type="range" class="entrada">
  ~~~

  *Si quisiéramos cambiar su tipo de input con javascript, debemos hacer:*

  ~~~javascript
  const elemento = document.querySelector(".entrada") //el selector es solo de ejemplo
  
  elemento.setAttribute("type", "text") //asi cambiamos de "rango" a un input de "texto"
  ~~~

  ---

+ **`.getAttribute("atributoARecibir")`** nos permite ver el valor de un atributo seleccionado.

  *un ejemplo de uso seria:*

    ~~~html
  <input type="range" class="entrada">
    ~~~

  *Si quisiéramos ver su tipo de input en javascript, debemos hacer:*

    ~~~javascript
  const elemento = document.querySelector(".entrada") //el selector es solo de ejemplo
    
  elemento.getAttribute("type") //asi nos da el tipo de input (en este caso "Range")
    ~~~

  ---

+ **`.removeAttribute()`** nos permite remover un atributo especificado en su parámetro.

  *por ejemplo:*

  ~~~html
  <input type="text" class="entrada">
  ~~~

  Para eliminar en este caso el atributo `type` debemos hacer:

  ~~~javascript
  const elemento = document.querySelector(".entrada") //el selector es solo de ejemplo
    
  elemento.removeAttribute("type") //asi eliminamos el atributo type="text"
  ~~~


---

### Atributos globales

  **Debemos tomar en cuenta que en especial las etiquetas html comparten un conjunto de atributos que podemos editar.**

Para acceder a estos podemos hacerlo de multiples formas, como:

~~~javascript
const elemento = document.querySelector(".input");

//lo llamamos con un ".setAttribute()" y remplazamos su valor
elemento.setAttribute("type", "text")

//o

//llamamos directamente al elemento con su atributo por defecto
elemento.atributo //sin parentesis pues es un atributo, no una función

//o

//en todos podemos hacer
elemento.value = "texto" //y cambiar el valor de el atributo
~~~

**hay que recordar que para acceder a los atributos de cosas como etiquetas o elementos en especial debemos usar el elemento como palabra clave en lugar de `document`**.

*ejemplo:*

~~~javascript
document.write("llamamos al documento");

const elemento = document.querySelector(".input"); //instanciamos el elemento
elemento.value; //llamamos el atributo "value" del mismo
~~~

*y los atributos son:*

  + **`contentEditable`** nos permite editar el texto de la pagina y tiene dos valores:

    + **`true`** **activa la opción de editar el texto**.

    + **`false`** **(valor por defecto) desactiva la opción de editar el texto**.

  + **`dir`** nos permite seleccionar la orientación de un texto o algo similar y sus valores son:

    + **`ltr`** **(valor por defecto) Left To Right/izquierda a derecha**.
    + **`rtl`** **Right To Left/derecha a izquierda**.

  + **`hidden`** nos permite seleccionar si queremos esconder o no un elemento y sus valores son:

    + **`true`** **esconde el elemento**.
    + **`false`** **(valor por defecto) permite que el elemento sea visible**.

  + **`tabindex`** nos permite "marcar el contorno de un texto" como si fuera un input, sus valores son:

    + **`cualquier numero`** **nos permite marcar con el tabulador y el numero significa el orden en el que se vera al presionar tabulador**.
    + **`cualquier valor no numerico`** nos bloquea la opción de **"marcarlo con el tabulador"**.

  + **`title`** nos permite seleccionar el texto que se mostrara en pequeño "titulo" al pasar el ratón por sobre algún elemento, **su valor debe ser un texto de cualquier tipo `"como este"`**.

  + **`style`** nos permite "editar" el estilo de la pagina accediendo al css de el elemento en si.

    De hecho nos permite acceder a todo del css y aplicarle estilo como quisiéramos, solo que en lugar de escribir como en css debemos usar:

    ~~~javascript
    //ejemplo para seleccionar el color
    elemento.style.color = "blue";
    
    //ejemplo para seleccionar el color de fondo
    elemento.style.backgroundColor = "green"; //cambiamos el - de css por camelCase
    ~~~



---

## Atributos de input

Una utilidad muy importante es la de acceder a los **atributos de inputs** para así poder iterar sobre estos datos entregados por el usuario.

la sintaxis de estos atributos es diferente a los anteriormente señalados, dado que no requieren de "selectores de atributos", de hecho funcionan así:

~~~javascript
const elemento = document.querySelector(".input");

//llamamos directamente al elemento con su atributo
elemento.atributo //sin parentesis pues es un atributo, no una función

//en todos podemos hacer
elemento.value = "texto" //y cambiar el valor de el atributo
~~~

**aun que igualmente podemos escribirlos con los métodos de selección ya vistos**.

*estos atributos son:*

|      atributo      |                         descripción                          |
| :----------------: | :----------------------------------------------------------: |
|  **`.className`**  | nos permite acceder al nombre de la clase del elemento html. |
|    **`.value`**    | nos permite acceder al valor del input (podemos igualarlo a un dato por defecto). |
|    **`.type`**     | nos permite seleccionar el tipo de input, por ejemplo (`elemento.type = "range"`). |
|   **`.accept`**    | nos permite seleccionar el tipo de archivo a subir ("image/png", "image/gif", ) |
|    **`.form`**     | nos permite seleccionar a que formulario pertenece por id (si este esta fuera). |
|  **`.minLength`**  | nos permite seleccionar el largo mínimo de texto a ingresar en un input. |
| **`.placeHolder`** | nos permite escribir un texto dentro de el input del estilo "ingresa tu nombre". |
|  **`.required`**   | nos permite seleccionar si requiere de algún imput (de ser así usar `= " "`) |

---

## Clases, ClassList y sus métodos

Las clases son uno de los principales identificadores que utilizaremos en el desarrollo web, no por que sean los mejores sino por que es la forma mas cómoda de hacerlo.

A la hora de trabajar con estas tendremos algunas funciones que nos permiten acceder a esta propiedad y asi hacer cambios en base a la clase  del mismo elemento.

*Su sintaxis es:*

~~~javascript
const elemento = document.querySelector(".elementoPrueba"); //llamamos el elemento

elemento.classList.add("ejemplo") //asi llamamos un metodo de classList
~~~

*específicamente los métodos son:*

|      método       |                         descripción                          |
| :---------------: | :----------------------------------------------------------: |
|   **`.add()`**    | nos permite añadir una clase al elemento con el nombre ingresado en su parámetro. |
|  **`.remove()`**  | nos permite remover la clase del elemento con el mismo nombre que su parámetro. |
|   **`.item()`**   | nos permite acceder a una clase por un indice numérico ingresado en el parámetro. |
| **`.contains()`** | revisa si nuestro elemento posee la clase ingresada en el parámetro (y da true o false). |
|  **`.toggle()`**  | revisa si nuestro elemento posee una clase (si es así la elimina, si no la crea). |
| **`.replace()`**  | nos permite remplazar una clase por otra ("claseVieja", "claseNueva") |

---

## Obtención y modificación de elementos

También puede que requiramos de acceder directamente al elemento y no sus parámetros, así accediendo por ejemplo al texto de un párrafo en lugar de el color del mismo.

*La sintaxis de estos atributos es:*

~~~javascript
const elemento = document.querySelector(".elemento-Prueba"); //instanciamos el elemento

const texto = elemento.textContent //llamamos el contenido del elemento
~~~

*y específicamente sus atributos pueden ser:*

|     atributos      |                         descripción                          |
| :----------------: | :----------------------------------------------------------: |
| **`.textContent`** | nos permite acceder al contenido (especialmente de texto) de un elemento pero sin considerar las etiquetas que hay dentro de nuestro elemento principal. |
|  **`.innerHTML`**  | nos permite acceder al texto del elemento (incluyendo el contenido html mostrando incluso las etiquetas dentro de este pero **ignorando las del mismo elemento**). |
|  **`.outerHTML`**  | nos permite acceder al texto por completo (incluyendo su código html y mostrando tanto **las etiquetas dentro del elemento como las del elemento mismo**) |

---

## Creación de elementos

También como es obvio puede que queramos crear varios elementos los cuales irán en nuestro html en medio de la ejecución de nuestra pagina **y estos se añaden principalmente al document mas que a un elemento**.

Para esto tenemos varios métodos los cuales son:

+ **`.createElement()`** Nos permite crear un elemento con el nombre de la etiqueta que ingresemos en sus parametros **estos siempre deben ir todo en mayúsculas o todo en minúsculas**.

  *ejemplo:*

  ~~~javascript
  const divisor = document.createElement("DIV") //asi creamos el elemento <div></div>
  ~~~

  ---

+ **`.createTextNode()`** nos permite crear un nodo de texto dentro de unas etiquetas o elemento en si.

  *ejemplo:*

  ~~~javascript
  const divisor = document.createElement("DIV"); //asi creamos el elemento <div></div>
  
  const textoDiv = document.createTextNode("Hola amigos!!!"); //creamos el text element
  
  divisor.appendChild(textoDiv); //añadimos como un elemento como hijo al elemento padre
  //en este caso el elemento padre es el "divisor" y el hijo es "textoDiv"
  //el método "appendChild()" lo veremos un poco mas adelante
  ~~~

  *quedaría algo similar a esto en html:*

  ~~~html
  <div>
  	Hola amigos!!!
  </div>
  ~~~

  ---

+ **`.createDocumentFragment()`** nos permite crear lo que se conoce como "fragmentos" osea piezas de nuestro nuevas de nuestro html con tanto datos nuevos como simplemente de distintos tipos.

  **Esto por ejemplo se suele usar bastante en casos como notepads donde para ver una lista de las notas que vamos creando debe cada una ser un fragmento nuevo con datos nuevos**.

  *ejemplo de uso:*

  ~~~javascript
  //supongamos que tenemos una lista en html con el nombre de clase "lista"
  const miLista = document.querySelector(".lista"); //llamamos nuestro elemento padre
  const fragmento = document.createDocumentFragment(); //creamos nuestro fragmento padre
  
  let item = document.createElement("li"); //creamos un elemento (hijo del fragmento)
  
  item.textContent = "item 1 de la lista"; //como extra le damos un texto al mismo
  
  fragmento.appendChild(item); //añadimos el elemento hijo a su fragmento
  miLista.appendChild(fragmento); //añadimos nuestro fragmento padre al elemento padre
  ~~~

  Osea en general creamos el fragmento y los objetos que irán en su interior, tras esto añadimos estos objetos dentro del fragmento, y el mismo fragmento dentro de su contenedor.

---

## Childs y Parents

A la hora de trabajar con elementos tenemos que separarlos en 2 tipos distintos:

+ **padres** (o parents) los elementos que contienen algún elemento en su interior
+ **hijos** (o childs) los elementos que están al interior de un elemento padre
+ **hermanos** (o siblings)el conjunto de elementos que están al mismo nivel de parentesco

*ejemplo:*

~~~html
<div> <!--este elemento es un padre-->
    <div> <!--este elemento es hijo del div principal pero padre del parrafo--> 
        <p>este parrafo es hijo del segundo div y hermano del segundo parrafo</p>
        <p>este parrafo es hermano del primer parrafo y hijo del segundo div</p>
    </div>
</div>
~~~

En este caso hay muchos parámetros y métodos que se aplican directamente a los **childs** y que nos permiten tanto acceder a estos, como hacer cambios en los mismos.

---

### Parámetros de los hijos

*estos parámetros pueden ser:*

+ **`.firstChild`** y **`.lastChild`** (no lo recomiendo) nos permiten acceder **a el primer o ultimo hijo de un elemento respectivamente** ya sea elemento o no.

  *pero antes debemos tomar algo en cuenta:*

  ~~~html
  <div class="padre">
  	<p>Esto es un parrafo hijo</p>
  </div>
  ~~~

  Si llamamos uno de estos parámetros (en un **`console.log`**), nos mostrara un mensaje del "tipo de dato" `#text` **esto es por que cuenta el espacio que hay entre el `<div>` y el `<p>`**.

  *Para arreglar debemos hacer lo siguiente:*

  ~~~html
  <div class="padre"><p>Esto es un parrafo hijo</p>
  </div>
  <!--o-->
  <div class="padre">
      <p>Esto es un parrafo hijo</p></div>
  ~~~

  **Ahí mostrara el mensaje correctamente** `<p>Esto es un parrafo hijo</p>`.

  ---

+ **`.firstElementChild`** y **`.lastElementChild`** nos permiten acceder **al primer elemento que sea hijo de un elemento padre** osea que no contará el elemento que no tenga etiqueta.

  *por ejemplo:*

  ~~~html
  <div class="padre">
      Este texto no se tomará en cuenta por no tener etiquetas
  	<p>Este parrafo si se tomara en cuenta por usar etiquetas</p>
  </div>
  ~~~

  ---

+ **`.childNodes`** nos permite acceder a **todos los nodos que sean hijos de un elemento** organizándolos en un **`NodeList`** incluyendo por ejemplo "el texto dentro de una etiqueta" u otros contenidos.

  ---

+ **`children`** nos permite acceder a **todos los elementos hijo de un elemento padre** organizándolos en un **`NodeList`** pero solo mostrando la etiqueta y no el contenido de la misma.

---

### Métodos para los hijos

*estos métodos son:*

+ **`.appendChild()`** nos permite añadir un elemento como hijo de otro, especialmente al que le apliquemos la función.

  *ejemplo:*

  ~~~javascript
  //supongamos que en html tenemos <div class="divisor"></div>
  const padre = document.querySelector(".divisor"); //llamamos nuestro elemento padre
  let item = document.createElement("p"); //creamos el elemento hijo
  
  //padre.appendChild(hijo);
  padre.appendChild(item); //añadimos a nuestro padre su elemento hijo
  ~~~

  *nuestro html quedaría así:*

  ~~~html
  <div class="divisor">
      <p></p>
  </div>
  ~~~

  ---

+ **`.replaceChild()`** nos permite reemplazar un elemento hijo de su respectivo padre.

  *un ejemplo de uso seria:*

  ~~~javascript
  //supongamos que tenemos los mismos elementos anteriormente mencionados
  //pero el parrafo lo tenemos añadido en html directamente
  const padre = document.querySelector(".divisor"); //llamamos nuestro elemento padre
  const hijo = document.querySelector(".hijoP"); //llamamos el elemento hijo (parrafo)
  
  let nuevoHijo = document.createElement("h1"); //creamos el nuevo elemento
  
  //padre.replaceChild(hijoNuevo, hijoViejo);
  padre.replaceChild(nuevoHijo, hijo); //hacemos el remplazo
  ~~~

  **Esto lo que hace seria:**

  ~~~html
  <!--pasar de esto-->
  <div>
      <p></p>
  </div>
  
  <!--a esto-->
  <div>
      <h1></h1>
  </div>
  ~~~

  ---

+ **`.removeChild()`** nos permite eliminar un elemento hijo de su respectivo padre.

  *un ejemplo de uso seria:*

  ~~~javascript
  const padre = document.querySelector(".divisor"); //llamamos nuestro elemento padre
  const hijo = document.querySelector(".hijoP"); //llamamos el elemento hijo (parrafo)
  
  //el ejemplo de sintaxis no es necesario
  padre.removeChild(hijo); //eliminamos el elemento hijo de su padre
  ~~~

  **Al final de esto nos quedaría:**

  ~~~html
  <div>
  </div>
  ~~~

  ---

+ **`.hasChildNodes()`** nos devuelve true o false dependiendo de **si un elemento tiene un hijo o no**.

  *ejemplo:*

  ~~~javascript
  const elementoSinHijos = document.querySelector(".divisor1"); //llamamos un elemento
  const padreConHijos = document.querySelector(".divisor2"); //llamamos un padre
  
  //suponiendo que la constante "elementoSinHijos" en efecto NO tiene hijos
  let prueba1 = elementoSinHijos.hasChildNodes(); //esto nos retornara un false
  
  //suponiendo que la vonstante "padreConHijos" SI tiene hijos
  let prueba2 = padreConHijos.hasChildNodes(); //esto nos retornara un true 
  ~~~

---

### Parámetros de los padres

*en este caso son muchos, pero los principales que utilizaremos son:*

+  **`.parentElement`** busca y muestra **el elemento padre** de un elemento (**busca las etiquetas html**) y su sintaxis es **`hijo.parentElement`**
+ **`.parentNode`** busca y muestra **el nodo padre** de un elemento (**sin importar si es o no una etiqueta html**) y su sintaxis es **`hijo.parentNode`**

**Entre estos dos recomiendo usar principalmente el primero dado que en muy pocas ocasiones un elemento tiene como algo que no sea una etiqueta html**

---

### Parámetros de los hermanos

*como en los padres e hijos, los hermanos también tienen parámetros y estos son:*

+ **`.nextSibling`** busca y muestra **el nodo hermano que viene después del hijo al que le aplicamos el parametro** (**incluyendo los nodos**) y su sintaxis es **`hijo.nextSibling`**

  ---

+ **`.previousSibling`** busca y muestra **el nodo hermano que viene antes del hijo al que le aplicamos el parametro** (**incluyendo los nodos**) y su sintaxis es **`hijo.previousSibling`**

  ---

+ **`.nextElementSibling`** busca y muestra **el elemento hermano que viene después del hijo al que le aplicamos el parámetro** (**solo los que tengan etiquetas**) y su sintaxis es **`hijo.nextElementSibling`**

  ---

+ **`.previousElementSibling`** busca y muestra **el elemento hermano que viene antes del hijo al que le aplicamos el parámetro** (**solo los que tengan etiquetas**) y su sintaxis es **`hijo.previousElementSibling`**

---

## Closets

Esta función es relativamente especial, se aplica a los nodos principalmente y nos permite "seleccionar" **el "padre" mas cercano si estos comparten una clase**.

*por ejemplo:*

~~~html
<div class="div">
    DIV 1
    <div class="div">
        DIV 2
        <div class="div">
            DIV 3
            <p class="hijo">parrafo hijo</p>
        </div>
    </div>
</div>
~~~

*si ahora hacemos:*

~~~javascript
const hijo = querySelector(".hijo"); //llamamos nuestro elemento hijo (el parrafo)

console.log(hijo.closets(".div")) //muestra el primer "padre" con la clase "div"
~~~

**En este caso el div que llamara sera  el que tiene escrito** `DIV 3` dado que es el padre mas cercano.

---

# Window

A la hora de trabajar en nuestras paginas puede que en lugar de interactuar con los elementos de la pagina (como lo hace el **DOM**) queramos interactuar con la pagina en si **o con otras paginas ya existentes** mediante el código.

Para esto usaremos el objeto **`window`** y de hecho este no solo contiene los elementos ya mencionados, también posee el historial y el elemento **`document`** (o el **`DOM`**) en su interior.

**Técnicamente, entre todos los objetos de javascript el objeto window es el con mayor jerarquía.**

---

## Métodos de Window

Al igual que el **DOM** y otros objetos de Javascript, el "Window" en si posee muchos métodos/funciones, no haremos una revisión completa a estos, sino veremos los mas importantes y que quizá, mas llegues a usar.

**Debes recordar que en el caso de este objeto sus métodos se escriben `window.método()`** de forma similar al DOM.

---

### Open

Puede que en algun momento de nuestro desarrollo necesitemos que nuestro usuario abra otras paginas, ya sea para por ejemplo, ser enviado a otra pagina como a nuestro GitHub u otras muchas paginas extra que ya existan de por si.

esto podemos hacerlo con un hipervínculo en html, pero este recomiendo sea llamado por medio de Javascript.

*Lo podemos usar de las siguientes formas:*

~~~javascript
window.open("https://estaPaginaEsTotalmenteFalsa.com"); 
// esto abrira la pagina en una nueva ventana
~~~

*O también:*

~~~javascript
window.open("https://estaPaginaEsTotalmenteFalsa.com", "_self");
// esto abrira la pagina en la misma ventana
~~~

Ademas podemos usar el **`window.open()`** para referirnos a otra "Window" de la siguiente forma:

~~~javascript
let ventana = window.open("https://estaPaginaEsTotalmenteFalsa.com");
// ahora la variable "ventana" hace referencia a una "window" especifica
// esto la abre al mismo tiempo que crea la variable
~~~

---

### Close 

También puede que necesitemos cerrar una ventana en si, esto lo logramos con el método **`close()`**.

*Su sintaxis es la siguiente:*

~~~javascript
window.close(); // esto cerrara la ventana actual
~~~

Ademas podemos usar la variable **`closed`** que nos permite verificar por medio de un booleano si la ventana esta cerrada o no.

*Su sintaxis es la siguiente:*

~~~javascript
window.closed; // si la pagina esta abierta devolvera false, de lo contrario dara true
~~~

**Si queremos usar estas en otras ventanas podemos referenciarlas con el método `open()` como mostramos en el ejemplo anterior y usar esa "referencia" junto a estas**

*ejemplo:*

~~~javascript
let ventana = window.open("https://estaPaginaEsTotalmenteFalsa.com");
// ahora la variable "ventana" hace referencia a una "window" especifica

ventana.close(); // cierra la pagina especificamente mencionada
ventana.closed; // segun el ejemplo deberia dar true
~~~

---

### Stop

El stop nos permite "**parar la carga de la pagina**" y así dejar a la misma sin cargar al 100% y a nivel mas especifico, simula que presionamos el botón "detener la carga" mientras la pagina se esta cargando.

*Su sintaxis es la siguiente:*

~~~javascript
window.stop(); //detenemos la carga de la pagina
~~~

---

### Alert

Si queremos mostrar una "alerta" en nuestra pagina web podemos usar el método **`alert()`**.

Anteriormente este se usaba de la siguiente manera:

~~~javascript
window.alert("texto de la alerta");
~~~

Pero actualmente no es necesario referenciar al "window", de hecho hoy en día se usa principalmente:

~~~javascript
alert("texto de alerta");
~~~

De hecho otro tema importante **si el método a usar no requiere de hace referencia a otra ventana, podemos directamente usar solo el nombre del método, sin necesidad de llamar el objeto `window`**.

---

### print

Este abre la  "ventana de **imprimir**" que como dice su nombre, nos permite imprimir el contenido de la pagina en si.

*su sintaxis es la siguiente:*

~~~javascript
print(); //abre la ventana de imprimir
~~~

---

### prompt

Con **`prompt`** generamos una "alerta" similar al método "alert" solo que en este caso este tendremos un espacio donde podremos ingresar texto.

*su sintaxis es la siguiente:*

~~~javascript
prompt("texto que ira en el prompt");
~~~

---

### Confirm

Este nos permite abrir un cuadro de dialogo similar al **`alert` y `prompt`** solo qeu en este caso nos dara 2 botones uno de **aceptar** y otro de **cancelar**.

*su sintaxis es la siguiente:*

~~~javascript
confirm("texto que ira en el confirm");
~~~

---

## Screen y Scroll 

A la hora de trabajar con JavaScript puede que necesitemos hacer algunos calculos, por ejemplo: **la posicion del scroll** o **la posicion del navegador en la pantalla**.

---

### ScreenLeft & ScreenTop

ScreenLeft y ScreenTop son "funciones/métodos" que nos retornaran el espacio que hay entre el borde de la ventana y el borde de la pantalla (dependiendo de si es top o left)

*Sus sintaxis son las siguientes:*

~~~javascript
window.screenLeft(); // da el espacio entre el borde izquierdo de la ventana y de la pantalla

window.screenTop(); // da el espacio entre el borde superior de la ventana y de la pantalla
~~~

**Si la ventana esta maximizada ambos nos retornaran `0`.**

---

### ScrollX & ScrollY 

Estos nos devolverá el valor actual del scroll aplicado en la pagina ya sea en el eje X como en el eje Y dependiendo en el que utilicemos.

*Sus sintaxis son las siguientes:*

~~~javascript
window.scrollX(); // nos da el scroll aplicado al eje x
window.scrollY(); // nos da el scroll aplicado al eje y
~~~

---

### Scroll

Esta es una función/método que nos permite efectuar un scroll en base a unas coordenadas que le ingresemos **(estas siendo en pixeles)**.

*Ejemplo:*

~~~javascript
// su sintaxis es: window.scroll(x,y);
window.scroll(0,100); // la pragina hará scroll hacia el pixel 100 en el eje y
~~~

---

### Location

Las variables y función que contienen "Location" en si mismas nos devuelven la localización de el elemento que estemos buscando dependiendo de el que utilicemos.

*Ejemplo:*

~~~javascript
window.location.href; // nos devuelve donde esta localizado el archivo en nuestro ordenador
window.location.hostname; // nos devuelve el nombre de dominio del servidor
window.location.pathname; // nos devuelve en la parte del dominio que nos encontramos
window.location.protocol; // nos devuelve el protocolo de la pagina (http o https)

window.location.assign(); // nos permite cargar un nuevo documento
// si hacemos
window.location.assign("https://youtube.com"); // va a cargar la pagina de youtube
~~~

**Pero hay algo interesante que podemos hacer con `window.location.href;` y es lo siguiente**.

Si en nuestro html por ejemplo tenemos un elemento con un id como `id = "identificador"` podemos hacer un hipervinculo que hara scroll hasta ese elemento especifico en la pagina.

*Lo hacemos de la siguiente manera:*

~~~javascript
window.location.href = "#identificador" // esto buscara el elemento con ese id
// luego hará scroll hasta ese elemento
~~~

---

# Chrome Developer Tools

A la hora de desarrollar nuestro codigo puede que tengamos varios recursos que medir.

+ Los elementos html y css
+ El funcionamiento del codigo javascript
+ El rendimiento de la pagina
+ La seguridad de nuestra web
+ ETC...

Por suerte Chrome nos permite acceder a estos datos **y no solo chrome** de hecho tanto **Chrome, Chromium y Firefox** tienen estas opciones y estos son los mas usados para el desarrollo web (ademas de ser de los buscadores web mas usados).

**Cabe resaltar que estos buscadores son los que yo se que tienen estas opciones, dado que hay muchos buscadores que igualmente poseen estas opciones, solo que son menos utilizados**.

Y recuerden, aun que mencione **Chrome Developer Tools** estas "herramientas" se encuentran en varios buscadores, yo solo estoy generalizando con las herramientas que se encuentran en **Google Chrome** y **Chromium**.

---

## ¿Como accedo a estas herramientas?

De hecho el entrar a estas es algo que ya mencione al inicio de esta documentación, con tal de dar clic derecho en cualquier  parte de la pagina y seleccionar la opción **`inspect`** o **`inspeccionar`**, lo mismo lo logras presionando **`F12`** o **`ctrl`** + **`shift`** + **`i`**.

Cuando se abra la ventana de "herramientas" veras en la parte superior muchas "opciones" y estas son:

+ **Elements**

  Es la opción que se abre por defecto al acceder a las opciones de desarrollador, aqui se ven tanto los elementos html junto a los de css.

  **También podemos editar estos elementos, pero volverán a la normalidad al recargar la **

  **pagina**.

  ---

+ **Console**

  Es la segunda opción en la lista y nos permite acceder a la consola de desarrollador de Javascript y hacer pruebas de código o incluso hacer pruebas de forma muy básica.

  ---

+ **Resources**

  Abreviada con el nombre "Sources" nos permite acceder a los archivos de la pagina, sus archivos html, los estilos en css o el código en javascript, todo a nuestro alcance y de hecho nos permite editar estos mismos archivos y también nos sirve para aplicar/guardar los cambios que apliquemos a estos mismos archivos.

  **Técnicamente funciona como un editor de código integrado en el navegador (al menos en la pestaña "page")**

  También posee una pestaña llamada "snippets" la cual nos permite "guardar" lineas de código a las que podremos acceder y ejecutar **especialmente importante a la hora de hacer pruebas**.

  ---

+ **Network**

  Esta nos permite acceder a información bastante útil a la hora de  probar el rendimiento de nuestra pagina, especialmente referente a la conexión.

  **Debo mencionar que para que esta pestaña muestre elementos debe estar abierta antes del inicio de la pagina o recargar la pagina tras su apertura**.

  *En esta pestaña podemos ver los siguientes datos:*

  + Nombre de elemento (Name).
  + Tipo de elemento (Type).
  + El archivo/documento que inicia este elemento (Initiator).
  + El tamaño del elemento (Size).
  + El tiempo que tardo en cargarse (Time).

  Junto a una linea de tiempo que nos permite ver cuanto y en que momento de la carga se inicia cada elemento.

  **Arriba de esta misma linea de tiempo nos permiten seleccionar los "tipos" archivos que queramos revisar**.

  ---

+ **Preformance**

  Es la pestaña que nos permite ver el funcionamiento de la pagina y tomando en cuenta los recursos que utiliza la misma, específicamente los recursos que la misma pagina ocupa mientras la pagina funciona.

  Para esto esa pestaña nos entrega 2 opciones:

  + Empezar a grabar (recopila el rendimiento de la pagina desde que inicia la grabación, hasta que pares la misma grabación).
  + Re-cargar y empezar a grabar (recopila el rendimiento de la pagina desde que esta empieza a cargar hasta que la misma carga finaliza).

  En ambos casos nos mostrara varios gráficos mostrando el uso de recursos de nuestro computador.

---

# Eventos

Los eventos son las acciones que constantemente ocurren dentro de el sistema programado.

Desde dar clic, hacer scroll o interactuar de cualquier forma en la misma pagina, todo esto cuenta como diferentes eventos.

Estos de por si solos son inútiles, pero su utilidad se presenta cuando estos eventos accionan algún efecto seleccionado/programado por nosotros.

*Un ejemplo directo podría ser:* **Dar clic en un botón (evento) envía un mensaje que dice "hola" (acción)** .

---

## On Event Handler 

Como ya mencionamos anteriormente un evento es una "acción" que de por si sola no es muy útil, pero que esto cambia si la misma nos da una reacción en nuestro sistema.

Un ejemplo de esto se muestra desde nuestro html y es de hecho algo que utilizaremos muy constantemente.

*Ejemplo:*

~~~html
<p onclick="accion();" class="p">este es un párrafo</p>
~~~

En este caso vemos tres cosas en las que hay que enfocarse:

+ Tenemos un párrafo con el texto "*este es un párrafo*" con un nombre de clase el cual es "p".
+ Esperamos a un evento **este siendo dar clic en el párrafo**.
+ Este evento acciona la función de Javascript, esta siendo: **`Accion();`**.

En si los **On Event Handler** son "manejadores" de eventos que inician con la palabra **On** y especialmente se escriben: **`On` + `Event`** como ya mostramos en este ejemplo con el: **`onclick`**. 

**Aun que actualmente se recomienda utilizar otro método para acceder a estos eventos y son los:**

---

## Listeners

Los listeners son otra forma de esperar por eventos solo que directamente se aplican desde el archivo de Javascript.

*su sintaxis es la siguiente:*

~~~javascript
// para hacer el ejemplo mas fácil accederemos al mismo párrafo antes creado.
const parrafo = document.querySelector(".p");

//en este caso debemos suponer que tenemos una función llamada "saludar"
function saludar() {
    alert("Hola");
}

// elelmento.addEveltListener("evento a escuchar", funcionParaEjecutar)
parrafo.addEventListener("click", saludar);
~~~

**Importante aclarar que al llamar  a una función, esta no puede ser una función flecha, debe ser una común dado que las funciones flecha no se ejecutaran con un `eventListener`**.

Otra cosa que podemos hacer para "utilizar una función flecha en un eventListener" es lo siguiente:

~~~javascript
parrafo.addEventListener("click", (e) => { // se le suele añadir "e" como "evento"
    //aqui ingresamos nuestra función
});
~~~

También podemos eliminar un "EventListener" por medio de nuestro código haciéndolo de la siguiente manera:

~~~javascript
parrafo.removeEventListener("click", saludar); // asi eliminamos la función de su evento
~~~

---

## Flujo de eventos

A la hora de trabajar con eventos puede que ocurra algo como lo siguiente:

~~~html
<div>
    <button></button>
</div>
~~~

Si queremos aplicar eventos tanto en el divisor como en el botón, no presentaremos mayor problema si accionamos solo el contenedor, pero esto si afectara cuando intentemos presionar el botón.

Al hacer esto lo que ocurrirá es que se ejecutara la acción del botón y luego se ejecutara la acción del contenedor dado y esto es generado por el flujo de eventos.

El flujo de eventos se divide en 2:

+ Event bubbling (se ejecutara primero el elemento hijo (el botón dentro del div) y luego el contenedor (el div)) **por defecto**.

+ Event Capturing (Se ejecutara primero el elemento padre para luego ser ejecutado el elemento hijo)

  *para esto configuramos nuestro "EventListener" de la siguiente manera:*

  ~~~javascript
  elemento.addEventListener("evento",función,true); // añadimos un true al final
  // esto debe aplicarse en el contenedor padre que querramos ejecutar primero
  ~~~

**y para que esto no se "propague" o no se ejecute luego otros elementos debemos en efecto "parar la propagación"**.

Esto lo logramos añadiendo `stopPropagation();` a la función flecha que accione nuestro EventListener de la siguiente manera:

~~~javascript
elemento.addEventListener("evento", (e)=>{
    e.stopPropagation(); // accedemos a nuestro evento y paramos la propagación
});
~~~

---

## Eventos del mouse

Como ya vimos, los eventos pueden ser múltiples interacciones del usuario y de hecho muchas de estas se suelen ejecutar con el mismo mouse.

De hecho ya vimos un evento de mouse que utilizaremos gran parte del tiempo, específicamente el evento **`click`** que lee cuando damos en efecto un clic sobre el elemento especifico.

Aun que hay muchos otros eventos de mouse, como por ejemplo:

| Evento      | Definición                                                   |
| ----------- | ------------------------------------------------------------ |
| click       | Lee cuando el usuario da clic izquierdo sobre un elemento    |
| bdlclick    | Lee cuando el usuario da doble clic sobre un elemento        |
| mouseover   | Lee cuando el usuario posiciona el cursor sobre el elemento o uno de sus hijos |
| mouseout    | Lee cuando el usuario mueve el cursor fuera del elemento o uno de sus hijos |
| contextmenu | Lee cuando damos clic derecho sombre un elemento             |
| mousemove   | Lee cuando el mouse se mueve mientras esta sobre un elemento |
| mouseleave  | Lee cuando el mouse se mueve fuera de un elemento (la ejecución de este se repite) |
| mousedown   | Lee cuando presionas el clic sobre un elemento (solo cuando el botón baja) |
| mouseup     | Lee cuando se suelta el clic sobre un elemento (solo cuando el botón sube) |

---

## Eventos de teclado

Similar a los eventos de mouse, puede que para alguno de nuestros desarrollos necesitemos de "leer eventos del teclado".

*Los eventos de teclado mas usados son:*

| Eventos  | Definición                                                |
| -------- | --------------------------------------------------------- |
| keydown  | Lee cuando se presiona una tecla.                         |
| keypress | Lee cuando se presiona una tecla y luego esta es soltada. |
| keyup    | Lee cuando se suelta una tecla.                           |

**Estos funcionan principalmente en un espacio de escritura de texto como un "input"**.

**Para ver las características del evento podemos hacer lo siguiente:**

~~~javascript
elemento.addEventListener("keydown",(e)=>{
    console.log(e); 
   	// mostramos toda la información del evento y buscamos con que trabajar
});
~~~

---

## Eventos de interfaz

También como es obvio, hay eventos que dependen enteramente de lo que ocurre en la interfaz, desde la carga de un elemento, hasta un error cuando esto no se logra concretar junto a estos hay muchos otros eventos que ocurren enteramente en esta misma.

*Estos eventos son:*

| Evento       | Definición                                                   |
| ------------ | ------------------------------------------------------------ |
| error        | Lee cuando un elemento multimedia no carga correctamente.    |
| load         | Lee cuando un elemento carga de forma exitosa.               |
| beforeunload | Lee el momento antes de que un elemento se descargue.        |
| unload       | Lee el momento en el que la pagina se descarga.              |
| resize       | Lee cuando se cambia el tamaño de vista del documento.       |
| scroll       | Lee cuando se hace scroll en un elemento que lo permita.     |
| select       | Lee cuando el usuario selecciona algun texto de tipo input o text area. |

**Estos pueden funcionar de 2 maneras distintas:**

+ **Seleccionando el elemento**:

  ~~~javascript
  const elemento = querySelector(".elemento");
  
  elemento.addEventListener("load",()=>{
      console.log("el evento se ha cargado exitosamente");
      // en este caso leemos cuando "el elemento especificado" se carga exitosamente
  });
  ~~~

  ---

+ **Elemento general (el document)**

  ~~~javascript
  addEventListener("load", ()=>{
  	console.log("la pagina se ha cargado exitosamente");
      // este lee cuando el "document" o la pagina entera se ha cargado exitosamente
  });
  ~~~

---

# Temporizadores

En mas de algún momento me ha ocurrido que quiero hacer un "conteo" en javascript para por ejemplo **esperar antes de ejecutar alguna acción**.

Esto lo logramos con los temporizadores, estos son funciones que nos permiten llamar a otras funciones (o hacer estas dentro del mismo) y que tienen como tema principal que estas ocurren tras un tiempo especifico o usan el tiempo de distintas formas para ejecutar esta acción.

*Los temporizadores pueden ser:*

+ **setTimeout();**

  Nos permite crear un temporizador que hará un conteo y cuando el mismo llegue a 0 ejecutara una función.

  *Su sintaxis es la siguiente:*

  ~~~javascript
  // setTimeOut(función,tiempo);
  // y se puede escribir de 2 formas distintas
  
  // forma 1 (con una función ya existente)
  const saludar = ()=>{
      console.log("Hola, como estas?");
  }
  
  setTimeout(saludar, 2000); //la función se ejecuta despues de 2 segundos.
  // la función no requiere de parentesis y el tiempo va en milisegundos
  //------------------------------------------------------------------------------------
  // forma 2 (creando la función directamente)
  setTimeout(()=>{
      console.log("Hola, como estas?");
  }, 2000);
  ~~~

  **Ambas formas hacen lo mismo**.

  ---

+ **clearTimeout();**

  Nos permite "eliminar" el temporizador ya aplicado si es que este esta "anclado" a una variable o constante.

  *Ejemplo:*

  ~~~javascript
  const temporizador = setTimeout(saludar, 2000);
  
  clearTimeout(temporizador);
  // tanto el temporizador como la función nunca se ejecutaran.
  ~~~

  ---

+ **setInterval();**

  Este nos permite **repetir una acción dejando una "pestaña de tiempo" entre cada intervalo**.

  *Su sintaxis es la siguiente:*

  ~~~javascript
  // setInterval(funcion, tiempo)
  // este puede funciónar de las 2 mismas maneras que el setTimeout();
  setInterval(()=>{
      console.log("Hola");
  }, 2000);
  // esto mostrara el mensaje "Hola" cada 2 segundos en un bucle infinito
  ~~~

  ---

+ **clearInterval();**

  Este nos permite **eliminar el intervalo ya creado** o mejor dicho "cortar" el bucle del mismo y funciona de igual manera que el **`clearTimeout();`**.

  *Ejemplo:*

  ~~~javascript
  const intervalo = setInterval(saludar, 2000);
  
  clearInterval(intervalo); // esto "rompe el bucle/intervalo"
  ~~~

---

# Control de flujo y manejo de errores

  A la hora de escribir código **hay muchas cosas que pueden salir mal** una gran cantidad de errores pueden surgir de nuestro sistema sea cual sea nuestro nivel de conocimiento.

  El saber encontrar y "manejar" estos errores es algo importante y lo podemos conseguir de distintas formas.

---

  ## Control de flujo

  El control de flujo es lo que nos permiten "seleccionar" el orden en el que estas acciones se "ejecutaran" y hay distintos tipos de **"declaraciones"** que nos permiten mantener un buen control de flujos.

  *Estos son:*

  + **Declaraciones de bloque**:

    Estos son los mas básicos y se caracterizan por usualmente tener la acción a ejecutar entre 2 llaves de la siguiente manera:

    ~~~javascript
    {
        let numero = 1;
        console.log(numero);
    }
    ~~~

    Y esto nos permite hacer coasas como:

    ~~~javascript
    let numero = 1
    {
        let numero = 2;
        console.log(numero) // este nos dara el numero = 2
    }
    console.log(numero); // este nos dara el numero = 1
    ~~~

    Y esto ocurre gracias a un concepto anteriormente visto el [scope](#scope) o alcance que permite que según su alcance podamos hacer 2 variables con el mismo nombre pero que sean considerados como valores distintos y sean aplicables solo o principalmente a los elementos que estén a su alcance.
    
    De hecho si hacemos lo siguiente por ejemplo:
    
    ~~~javascript
    let numero = 1
    let numero = 2
    ~~~
    
    Si no los separamos teniendo uno dentro de llaves nos generara un error, dado que **no se puede "crear 2 veces la misma variable"**, si quisiéramos cambiar su valor deberíamos no usar el keyword `let`.
    
    ---
    
+ 
