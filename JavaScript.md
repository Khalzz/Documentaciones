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

+ **Javascript es un lenguaje basado en prototipos** osea, haciendo referencia a el tema anterior, al trabajar con objetos usamos "clases" que definen lo que es un objeto, esto no es necesario en javascript, haciendo el código mas fácil de escribir y de leer.

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

+ **String** o cadenas de texto, se diferencian por siempre llevar `"comillas"` para definir que un dato es un string en si.

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

### Arrays

Los array (o arreglos) son un tipo de dato (no primitivo/objeto) forma en la que podemos unir varios datos en uno mismo, similar a una lista, solo que en este caso podemos acceder a ellos por un indice.

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

# Arrays (arreglos)

Los array son un tipo de dato (no primitivo o mejor llamado **objeto**) que 

