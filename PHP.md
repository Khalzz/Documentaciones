# PHP

**Documentación hecha por Rodrigo Seguel**

PHP es un lenguaje **open source** dedicado principalmente al desarrollo backend de **paginas web dinámicas** y **Web Applications**.

Creado por Rasmus Lerdorf el año 1994, actualmente en su versión 8, PHP se ha convertido en uno de los lenguajes mas utilizados junto a Java, siguiendo una idea similar, que quizá sin ser el lenguaje mas amado, sigue funcionando bien en sus ultimas versiones.

Y siendo utilizado por Wordpress, Slack y Tumblr podemos saber que no es una herramienta a dejar de lado especialmente en el área laboral.

---

## Empezando en PHP

Empezaremos con la creación de un proyecto en PHP, y cabe resaltar que como mínimo debes ya tener conocimientos de desarrollo web con HTML y Javascript.

Para empezar a trabajar con PHP simplemente necesitaremos lo siguiente:

+ Un editor de código (en mi caso es Visual Studio Code).
+ Un método para correr nuestro servidor Apache y base de datos MySql (en mi caso utilizare Xampp)

Con esto listo podremos efectivamente a trabajar con PHP.

Primero crearemos una carpeta en la que agregaremos nuestro proyecto, en mi caso la llamare `Test` y tendremos que posicionarla en una pagina especifica de el archivo de instalación de nuestro Xampp.

Esto por que en efecto nuestro proyecto funciona desde el lado del servidor, por lo que si intentamos ejecutar sin Xampp, el código no funcionara directamente.

**la carpeta `test` tendrás que llevarla a `[pagina de instalacion de xampp]/htdoc` con esto listo simplemente podemos abrir Xampp, activar el servidor apache y empezar a escribir nuestro código**.

---

## Hola Mundo

Como ya mencione, PHP tiene ciertas similitudes a HTML por lo que para hacer nuestro hola mundo tendríamos 2 métodos distintos.

Creamos un archivo `index.php` dentro de `/test` y hacemos uno de los siguientes:

1. HTML en PHP:

   Simplemente escribe `html:5` y da enter en visual studio code, así tendrás una pagina básica de HTML en la que podrás hacer lo siguiente:

   ~~~php
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <title>Document</title>
   </head>
   <body>
       Hola mundo
   </body>
   </html>
   ~~~

   ---

2. ECHO:

   La forma mas clásica de utilizar PHP es por medio de una funcionalidad del mismo de "retornar elementos de HTML" de la siguiente forma:

   ~~~php
   <?php
       echo "Hola Mundo";
   ?>
   ~~~

Asegúrate de haber presionado `start` en el servidor apache de Xampp y ingresa a `localhost/test` desde nuestro buscador (recuerda que el `/test` es el nombre de la carpeta que posicionamos en `htdocs`), al hacerlo veremos el resultado de nuestro código.

Primero debes ser consiente de que PHP técnicamente es leído como HTML, pero con funcionalidades extra, siendo principalmente la etiqueta `<?php?>` la que nos entregara gran parte de la funcionalidad del mismo, por lo que de cierta forma puedes tener HTML y este componente de PHP en un mismo archivo.

Por otro lado el  `echo` funciona como el `return()` de un componente de React, ya que el mismo lo utilizaremos para enviar datos de vuelta a nuestra pagina.

Y recuerda que PHP es un lenguaje de los que requieren `;` al final de cada linea.

---

## Variables y tipos de datos

`Como todos los lenguajes de programacion, tenemos variables que utilizaremos para guardar datos de forma temporal.

En PHP los guardamos de una forma similar a lenguajes como Python o Javascript aun que con su cambio especifico como es:

~~~php
<?php
    $nombre = "Rodrigo Seguel";
    $edad = 20;
    echo "Hola, mi nombre es: " . $nombre . " y mi edad es: " . $edad . " años";
?>
~~~

Utilizamos `$nombreVariable = valor;` para definir la misma.

Sobre los tipos de datos, tenemos varios tipos comunes en otros lenguajes por ejemplo:

~~~php
<?php
	$nombre = "John Doe"; // string
	$edad = 30; // int
	$precioEnDolares = 10.99; // float
	$activo = true; // booleano
	$fruits = array("Manzana", "Platano", "Naranja"); // array
	$valorNulo = null;
?>
~~~

*Como recordatorio, puedes hacer concatenación básica con el `variable . variable`*.

También existen tipos de datos como las clases, pero los veremos mas adelante.

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
|       `x .= y`        | Concatenación en asignación  |      `x = x . y`      |

---

### Operadores de comparación

Estos nos permiten hacer comparaciones en base a dos datos y que **como resultado nos entregue un true si equivalen lo mismo o un false si no**.

*ejemplo de uso:*

~~~php
true == true //si ambos datos tienen el mismo valor nos va a retornar un "true"
true == false //sino nos retornara un "false"

$booleano = 1 == 0;  //tambien podemos asignarlo a una variable
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

| PHP  | Conjugación | Python |
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

El operador de disyunción es `or` y sirve para evaluar si la condición del lado izquierdo **o** el del lado derecho se cumplen.

| PHP  | disyunción | python |
| :--: | :--------: | :----: |
| \|\| |     o      |   or   |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |   \|\|(+)   |  false(0)   | false(0)  |
|  false(0)   |   \|\|(+)   |   true(1)   |  true(1)  |
|   true(1)   |   \|\|(+)   |  false(0)   |  true(1)  |
|   true(1)   |   \|\|(+)   |   true(1)   |  true(1)  |

#### Negación lógica

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

| PHP  | Negación | python |
| :--: | :------: | :----: |
|  !   |    no    |  not   |

Este operador funciona así:

| negación | booleano | resultado |
| :------: | :------: | :-------: |
|    !     |   true   |   false   |
|    !     |  false   |   true    |

---

# Condicionales

A la hora de ejecutar nuestro código es probable que queramos "comprobar datos" y que dependiendo de esta "comprobación" podamos ejecutar un bloque de código u otro.

Esto lo logramos con las **condicionales**.

Las condicionales son "comprobadores" que en base a ciertas **"condiciones"** ven si ejecutaran el código que tendrán entre llaves `{}`.

*su sintaxis es la siguiente*

~~~php
//condicional (condicion){
if ($numero === 1) { //si se cumple la condicion (nos da como resultado un true)
    //se ejecutara lo que ingresemos aqui
}
~~~

Y hay tres tipos de condicionales:

---

## If

El if es la primera condicional que debemos utilizar siempre (dado que las demás requieren de este para funcionar).

La función de un if seria en base a la frase "**`si` (condición) es verdadera {ejecutar el código aquí}**".

*funciona de la siguiente forma:*

~~~php
$numero = 1;

if ($numero === 1) { //si la condicional nos da como resultado "true"
    //ejecutar este codigo
} 
~~~

deben recordar que **las condiciones que ingresemos en una condicional deben estar entre parentesis**.

---

## Else if

Este es "una continuación" del anteriormente mencionado así funcionando como un **sino**, mientras que el if se basaba en la frase "**si (una condición se cumple) {ejecutar código}**" el else if continua con la frase **sino, si (otra condición se cumple) {ejecutar código}**.

*funciona de la siguiente forma:*

~~~php
$numero = 2;

if ($numero === 1) { //en este caso esta condición no se cumple
    //este código no se ejecuta
} elseif ($numero === 2) { //en este caso la condición si se cumple
    //ejecutar este código
}
~~~

---

## Else

Este de por si es lo que me gusta llamar un tipo de "condicional relajado" dado que este es muchísimo mas fácil que los otros condicionales ya vistos.

Este se basa en intentar hacer un "ultimatum" con la frase **sino {ejecutar código}** así señalando que si ni una condición se cumple, el código continuara con esta condición.

*funciona de la siguiente forma:*

~~~php
$numero = 3;

if ($numero === 1) { //esta condicion es falsa
    //este codigo no se ejecuta
} elseif ($numero === 2) { //esta condicion es falsa
    //este codigo no se ejecuta
} else { //si ni una de las condiciones es true, este se ejecutara si o si
    //ejecutar codigo
}
~~~

---

## Switch

El otro tipo de condicional existente se aleja de los comunes `if`, `elseif` y `else`, el funcionamiento de este se basa directamente en "revisar un valor" y en caso de que sea de algún valor ya definido, tendremos la posibilidad de retornar una respuesta.

~~~php
$colorFavorito = "Verde"

switch ($colorFavorito) {
  case "Verde":
    // Ejecutamos este codigo si el valor es "Verde"
    break;
  case "Rojo":
    // Ejecutamos este codigo si el valor es "Rojo"
    break;
  default:
    // Code to execute if variable does not equal any of the values
}
~~~

---

# Bucles

Cuando nos toca hablar de eficiencia hay ciertos procesos que requerirán de cierta repetición, ya sea listar los valores de una lista o simplemente hacer un conteo, los bucles nos ayudan a ahorrar código y trabajo a la hora de desarrollar estas tareas.

Existen varios tipos de bucles, siendo estos:

## While

Nos permite crear un bucle que se dejara de ejecutar cuando se deje de cumplir una condicion, por ejemplo:

~~~php
$i = 1;
while ($i <= 5) {
  echo $i;
  $i++;
}

// el resultado es 12345
// si usamos while (true) {} crearemos un bucle infinito
~~~

---

## Do while

nos permite ejecutar un bloque de código antes de hacer la comparación de valores.

~~~php
$i = 1;
do {
  echo $i;
  $i++;
} while ($i <= 5);
// el resultado es 12345
~~~

---

## For

El bucle for nos permite hacer un conteo mas "personalizado", así dejándonos mas libertad de hacer conteos sin estar amarrados a condiciones especificas o listas, por ejemplo:

~~~php
for ($i = 1; $i <= 5; $i++) {
  echo $i;
}
// el resultado es el mismo de los anteriores 12345
~~~

---

## For-each

Este bucle se caracteriza por permitirnos ejercer un conteo en base a los elementos encontrados dentro de una lista en particular, por ejemplo:

~~~php
// imagina que tenemos la sigueinte lista:
$frutas = array("manzana","pera","platano","durazno","naranja");

// ahora podriamos mostrarlos en pantalla de la sigueinte forma
foreach($frutas as $fruta) {
    echo $fruta
}
~~~

En base a esto, cada vez que se haga el `echo`, enviaremos la siguiente fruta en la lista.

---

## Break y continue

A estos bucles le agregamos 2 utilidades necesarias de entender, siendo estas **Break** y **Continue**.

El `break` se encarga de "salir del bucle", por ejemplo si encontramos un valor necesario y no queremos revisar lo que queda de la lista simplemente podemos hacer:

~~~php
$frutas = array("manzana","pera","platano","durazno","naranja");

foreach($frutas as $fruta) {
    if ($fruta == "durazno") {
        break
    }
    echo $fruta
}

// el output de esto sera todas las frutas, menos durazno y naranja
// ya que cuando encuentre durazno saldremos del bucle
~~~

Por otro lado el `continue`, sirve para saltarnos un punto del bucle, por ejemplo:

~~~php
$frutas = array("manzana","pera","platano","durazno","naranja");

foreach($frutas as $fruta) {
    if ($fruta == "durazno") {
        continue
    }
    echo $fruta
}

// el output en este caso seran todas las frutas, menos el durazno
// ya que cuando se encuentre ese valor, saltaremos al siguiente antes de mostrarlo en pantalla
~~~

---

# Funciones

Las funciones trabajan de forma similar a la gran parte de los lenguajes anteriormente utilizados.

En si son una forma de "encapsular código con un nombre" el cual al ser llamado nos permitirá efectivamente ejecutar el código que hemos ingresado en el mismo.

Un ejemplo seria:

~~~php
function suma($num1, $num2) {
  $resultado = $num1 + $num2;
  return $resultado;
}

// ahora podriamos ejecutar
$total = suma(10, 10);
echo $total; // esto nos retornara 20
~~~

Ahora y siguiendo el ejemplo, cada vez que queramos hacer una suma, simplemente usas `suma(valor1, valor2)`.

---

