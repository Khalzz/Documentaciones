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
	$fruits = ["Manzana", "Platano", "Naranja"]; // array
	$valorNulo = null;
?>
~~~

*Como recordatorio, puedes hacer concatenación básica con el `variable . variable`*.

También existen tipos de datos como las clases, pero los veremos mas adelante.

---

## Constantes

Otro tema importante para el manejo de memoria en PHP es el conocer como funcionan las constantes, estos son un tipo de variable cuyo valor **no puede cambiar**, esto usualmente se utiliza en datos que utilizamos como convención, datos como:

* Transformación de pies a metros.
* Valor de un dólar en peso chileno.
* Velocidad equivalente a 1 mph en k/h.

En si existen 2 formas de instanciar una constante:

~~~php
// el define nos permite setear constantes fuera de una clase
// si intentamos usarlos dentro de una clase tendremos un error
define("NOMBRE_VARIABLE", "valor");
define("VALOR_DOLAR_EN_PESO", 826.08);

// el const funciona dentro y fuera de las clases
// pero es usualmente utilizado dentro de las mismas
const UN_MPH_EN_KH = 1.60934;
const UN_PIE_EN_METROS = 0.3048;
~~~

De cierta  forma el funcionamiento de las constantes nos permite generar datos con menos memoria, eliminando esta mutabilidad.

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
$frutas = ["manzana","pera","platano","durazno","naranja"];

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
$frutas = ["manzana","pera","platano","durazno","naranja"];

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
$frutas = ["manzana","pera","platano","durazno","naranja"];

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

# Clases

Las "clases" u "objetos" son una metodología programática que nos permite "almacenar datos de una forma mas clara" en base a un "molde" el cual contiene **Métodos**(funciones) y **Propiedades**(variables) que definen no solo que es un objeto, si no también que puede hacer el mismo.

Imagina que tenemos una clase con el nombre "persona", esta se instancia con nombre y edad, y posee un método que al ser ejecutado, te permite saludar a alguien y mostrar los datos del mismo.

Este se veria de la siguiente forma:

~~~php
class Persona {
    public $nombre;
    public $edad;

    // esta funcion se encargara de permitirnos crear una nueva persona (esta se crea por defecto)
    public function __construct($nombre, $edad) { 
        $this->nombre = $nombre;
        $this->edad = $edad;
    }

    public function saludar() {
        echo "Hola!, mi nombre es " . $this->nombre . " y mi edad es: " . $this->edad;
    }
}
~~~

Con esto ya tendríamos la base, ahora simplemente instanciamos el objeto y después llamamos su método:

~~~php
$persona1 = new Persona("Rodrigo Seguel", 20);
$persona1->saludar();
~~~

Esto nos retornara un texto como el siguiente: `Hola!, mi nombre es Rodrigo Seguel y mi edad es: 20`.

Recuerda que a diferencia de en otros lenguajes, cuando queremos llamar el método de una clase creada, debemos usar `->` en lugar de un punto.

+ Método en C#: `Persona.saludar();`.
+ Método en PHP: `Persona->saludar();`.

---

## Herencia

La herencia es la capacidad de una clase de "clonar una clase base" para poder utilizar sus métodos y propiedades solo que editándolas o agregando mas.

Siguiendo el ejemplo anterior, puede que queramos hacer una clase "mascota", los animales en si también tienen nombres y edad por lo que podríamos mantener los datos anteriores y agregar otros, por ejemplo:

~~~php
class Mascota extends Persona {
    // ahora tenemos todas las variables de persona incluyendo los datos nuevos como es "patas"
    public $patas;

    public function __construct($nombre, $patas) {
        $this->nombre = $nombre;
        $this->patas = $patas;
    }

    // si quisieramos que el mensaje fuera exactamente el mismo no haria falta agregarlo aqui
    // pero como lo vamos a cambiar lo instanciamos, esto se llama "polimorfismo"
    public function saludar() {
        echo "Mi nombre es " . $this->nombre . "y tengo" . $this->patas . "patas";
    }
}
~~~

zAhora simplemente puedes instanciar el nuevo objeto de la siguiente forma:

~~~php
$mascota1 = new Mascota("Cachulo", 4);
$mascota1->saludar();
~~~

El resultado de esto seria el texto: `Mi nombre es Cachulo y tengo 4 patas`.

Listo, con esto ya podríamos trabajar con objetos.

---

# Manejo de errores

Otra de las funcionalidades presentes en todos (o la mayoría de lenguajes de programación) es el "manejo de errores por medio de `try...catch`".

La función de este es permitirnos **"intentar(try)" ejecutar un bloque de código** y en caso de que algo falle y nos lance un error, **atraparemos(catch)** el mismo y ejecutaremos otro bloque en base a esto.

Un ejemplo seria lo siguiente:

~~~php
try {
    // aqui ejecutaremos un codigo
} catch (Exception $e) { // si el codigo falla aqui guardaremos el error
    echo 'Algo ha salido mal: ' . $e->getMessage(); // y lo retornare como un "echo"
}
~~~

Esto es útil ya que el correcto uso de los `try...catch` nos permite responder a los errores que pueden crashear nuestro sistema.

Cabe aclarar que en caso de que no se ejecute lo que escribas en el try, los cambios hechos en el mismo no se van a aplicar, por lo que si por ejemplo falla el try, hicimos una suma y falla el proceso de subir a la base de datos, la suma se desacera y recibiremos el mensaje de error.

---

# Interacciones con HTML

Como es obvio, PHP al ser un lenguaje de BackEnd hay ciertos elementos que debemos tomar en cuenta como es por ejemplo, traer datos de una base de datos directamente desde nuestro servidor.

Esto lo logramos directamente utilizando el tag `<?php?>` de por ejemplo la siguiente forma:

~~~php
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Document</title>
    </head>
    <body>
        <ul>
            <?php
                $frutas = ["Manzana", "Banana", "Pera", "Naranja"];
                foreach ($frutas as $fruta) {
                    echo "<li>".$fruta."</li>";
                }
            ?>
        </ul>
    </body>
</html>
~~~

Con esto ya estaríamos sirviendo desde nuestra base de datos los elementos de esta lista en si.

Aun que hay un elemento importante a tomar en cuenta, siendo este.

## Include

El "include" es una parte útil de las etiquetas de PHP, este nos permite acceder a código PHP que se encuentre en otros archivos y nos será vital para la forma en la que organizamos nuestro proyecto.

Para hacer una prueba similar haremos lo siguiente:

Crea un archivo llamado `frutas.php` y agrega lo siguiente:

~~~php
<?php
    $frutas = ["Manzana", "Banana", "Pera", "Naranja"];
    foreach ($frutas as $fruta) {
        echo "<li>".$fruta."</li>";
    }
?>
~~~

Con esto listo, podemos ir a nuestro `index.html` e ingresaremos lo siguiente:

~~~php
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <ul>
		<?php include 'frutas.php' ?>
	</ul>
</body>
</html>
~~~

Con el `<?php include 'frutas.php'?>` estamos diciendo que se ejecute lo que haya en el archivo llamado `frutas.php`.

---

# Post y Get

Unas de las funcionalidades mas útiles en el desarrollo web es el "enviar y recibir" valores desde nuestra pagina, con el uso de formularios `POST` y `GET`.

## Get

Empezaremos con la función "GET", este nos permite **traer** valores de nuestro backend, y nuestro formulario se veria de la siguiente forma:

~~~php
<form action="get.php" method="GET">
  <label for="inputNombre">Name:</label>
  <input type="text" name="nombre">
  <button type="submit">Submit</button>
</form>
~~~

Debes fijarte que el valor que enviamos tenga un `name` para que así podamos acceder al mismo desde el PHP.

Asegúrate de crear el archivo `get.php` y de tener seleccionado el método especifico `GET` en el formulario, en el archivo recién creado agregaremos el siguiente código:

~~~php
<?php
    $nombre = $_GET["nombre"]; // el $_GET[] nos permite acceder a los valores segun su "name"
    echo $nombre; // finalmente solo retornamos el elemento recibido
?>
~~~

Aun que a parte de esto también podríamos acceder a datos que se encuentren en una base de datos, pero esto se vera mas adelante. 

Recuerda que si tienes el formulario en tipo `GET`, los datos se enviaran desde el enlace, por lo que al presionar `submit`, tendremos un enlace como el siguiente: `http://localhost/hello-php/get.php?nombre=Rodrigo`, por lo que no es muy seguro si necesitamos hacer algo como un inicio de sesión.

---

## Post

El otro método utilizado en los formularios es `POST`, este nos permite enviar datos a la base de datos de una forma mas segura, ya que los mismos no son enviados por el enlace.

De nuestro formulario lo único que cambiaríamos seria lo siguiente:

~~~php
<!--Creamos un archivo llamado post.php y cambiamos el metodo a POST-->
<form action="post.php" method="POST">
~~~

Con este cambio listo, desde nuestro `post.php` agregamos lo siguiente:

~~~php
<?php
    $nombre = $_POST["nombre"];
    echo $nombre
?>
~~~

Ahora veras que el enlace simplemente es: `http://localhost/hello-php/post.php` cuando hacemos el submit.

---

# MySQL

Aprovechando que estamos utilizando Xampp, aprovecharemos de crear directamente la conexión con esta base de datos.

Por lo que directamente entenderé daré por hecho que sabes lo básico de la utilización de MySql.

Para empezar directamente abre Xampp y presiona el botón `start` en la opción de **MySql**, tras esto podrás presionar en `admin` y abrirás el administrador de base de datos, donde crearas una base de datos (yo la llamare `test`) y directamente podremos empezar a trabajar.

Para ello simplemente presiona en `Nueva` y te abrirá una pagina donde podrás definir el nombre de la base de datos.

Luego ve a la seccion de `sql` y ejecutas el siguiente código:

~~~sql
CREATE TABLE fruits (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO fruits (name) VALUES ('Manzana');
INSERT INTO fruits (name) VALUES ('Platano');
INSERT INTO fruits (name) VALUES ('Naranja');
~~~

Con esto crearemos una tabla llamada `frutas` con un id auto-incremental y un valor `nombre` que es un string.

Con esto listo simplemente podemos empezar una conexión a MySql.

Para esta parte de la documentación seguiremos un poco una nueva estructura de código:

+ controllers
  + frutas
    + `get.php`: aquí ingresaremos el código para llamar a todos los elementos de la base de datos
    + `post.php`: aquí ingresamos el código para agregar datos a la base de datos.
+ configuration
  + `db.php`
+ `index.php`: aquí ingresamos el código base de la pagina.

Empezaremos definiendo los datos de nuestra base de datos en `configuration/db.php`, aquí ingresaremos lo siguiente:

~~~php
<?php
    // here i will set the configuration of teh database
    $host = 'localhost';
    $user = 'root';
    $password = '';
    $database = 'test';
    $conn = mysqli_connect($host, $user, $password, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
        echo "Ok: ";
    }
?>
~~~

Ahora simplemente al inicio de cada elemento que se conecte a la base de datos tendrás que ingresar la siguiente lineal:

~~~php
require_once(dirname(__FILE__) .'/../../configuration/db.php');
~~~

Con esto listo, en nuestro `index.php` agregamos lo siguiente:

~~~php
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <ul> <!--En esta lista pondremos todos los valores traidos desde la basae de datos-->
		<?php include './controllers/frutas/get.php' ?>
	</ul>
</body>
</html>
~~~

Mientras que en nuestro `get.php` agregaremos el siguiente código:

~~~php
<?php
    require_once(dirname(__FILE__) .'/../../configuration/db.php');

    $sql = "SELECT * FROM fruits"; // aqui ingresamos el codigo de sql a ejecutar
    $result = mysqli_query($conn, $sql);

    while ($row = mysqli_fetch_assoc($result)) {
        echo "<li>".$row["name"]."</li>";
    }

    mysqli_close($conn);
?>
~~~

Listo, básicamente esto es todo, el proceso de "llamado de datos desde PHP a una base de datos MySql", ahora para el caso del "POST" podemos hacer algo similar pero un poco diferente.

Primero en nuestro `index.php` agregamos lo siguiente:

~~~php
<form action="./controllers/frutas/post.php" method="POST">
      <label for="inputFruta">ingresa una fruta nueva:</label>
      <input type="text" name="fruta">
      <button type="submit">Submit</button>
</form>
~~~

Y en nuestro `post.php` agregamos lo siguiente:

~~~php
<?php
    $fruta = $_POST["fruta"];

    require_once(dirname(__FILE__) .'/../../configuration/db.php');

	// aqui ingresamos el codigo de sql a ejecutar
    $sql = "INSERT INTO fruits (name) VALUES ('$fruta');"; 
    
    // manejamos los errores
    if (mysqli_query($conn, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
      
    mysqli_close($conn);
?>
~~~

OJO: **Hay un problema importante en este código a resaltar y tiene que ver con seguridad**, el problema que podríamos recibir se conoce como **Sql Injection**

Esto ocurre por ejemplo si el usuario en lugar de efectivamente escribir en el input algo como `Pera`, ingresa algo como un código de SQL que pueda romper nuestra base de datos.

Para solucionar este problema utilizamos algo llamado **Prepared Statements**, esto nos permitirá "preparar" nuestro código antes de ejecutarlo, así de cierta forma evitando que se ejecute código no deseado que llegue a nuestra base de datos.

Para arreglar esto debes hacer algo como lo siguiente:

~~~php
<?php
    $fruta = $_POST["fruta"];
    require_once(dirname(__FILE__) .'/../../configuration/db.php');
    
    // preparamos nuestro "statement (stmt)"
    $stmt = $conn->prepare("INSERT INTO fruits (name) VALUES (?)");
    $stmt->bind_param("s", $fruta); // con esto asignamos el $name a nuestro stmt

    // Ejecutamos el statement
    if ($stmt->execute()) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $stmt->error;
    }
  
    // cerramos el statement y la conexion
    $stmt->close();
    $conn->close();
?>
~~~

En caso de que nuestra tabla tenga varios valores, podemos hacer algo como lo siguiente:

~~~php
$stmt = $conn->prepare("INSERT INTO users (name, surname, age) VALUES (?, ?)");
$stmt->bind_param("ssi", $name, $surname, $age);
~~~

El `bind_params()` nos permite setear los datos al "statement", por ello mencionamos en un string la inicial; de los tipos de datos de nuestros valores ("ssi" = string, string, integer).

Con esto ya podrá funcionar nuestro código sin problemas de los conocidos SQL Ijection.

Algo similar podemos hacer con nuestro `get.php` y lo haremos simplemente para mantener consistencia en nuestro código.

~~~php
// get.php
<?php
    require_once(dirname(__FILE__) .'/../../configuration/db.php');

    $sql = "SELECT * FROM fruits"; // aqui ingresamos el codigo de sql a ejecutar
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<li>".$row["name"]."</li>";
        }
    } else {
        echo "Something went wrong";
    }

    $conn->close();
?>
~~~

Listo, ahora sabemos lo básico para trabajar con MySql.

**Ojo**: recuerden siempre cerrar la conexión o los `stmt` ya que no hacerlo puede llevar a **memory leaks**, esa es la razón principal por la que lo hacemos.

---

# Ajax

Hasta ahora hemos visto simplemente la conexión que podemos conseguir entre PHP y HTML, esta siendo una conexión directa por lo que no podremos hacer cosas como validación de datos en JavaScript antes de enviarlos, al menos no sin utilizar AJAX.

Ajax es una técnica para crear sitios web interactivos utilizando datos en forma de XML o Json, dicho mas fácil, es simplemente una forma de hacer Fetching de datos a PHP desde nuestro JavaScript.

El funcionamiento del mismo podríamos resumirlo de la siguiente forma.

Volvamos al formulario que ya teníamos, a este le eliminaremos el `action` que tenia y dejaremos lo siguiente:

~~~php
<form id="my-form" method="POST"> <!--Simplemente agregamos un id-->
    <label for="inputNombre">ingresa una fruta nueva:</label>
    <input type="text" name="fruta">
    <button type="submit">Submit</button>
</form>
<script src="main.js"></script> <!--Recuerda llamar el archivo de js-->
~~~

Luego desde un archivo JavaScript (el cual llame `main.js` y posicione en la carpeta raíz del proyecto) , en este agregaremos el siguiente codigo:

~~~javascript
const form = document.getElementById("my-form");

form.onsubmit = (e) => {
    e.preventDefault(); // evitamos que se recargue la pagina al presionar submit
    
    // traemos los datos del formulario
    const data = new FormData(form);
    const fruta = data.get("fruta");
    
    // revisamos que el valor traido tenga un largo mayor a 0
    if (fruta.length > 0) {
        // hacemos la llamada a php
        fetch('./controllers/frutas/post.php', {
            method: "POST",
            body: "fruta=" + fruta,
            headers: {
              "Content-type": "application/x-www-form-urlencoded"
            }
          })
          .then(response => response.text())
          .then(data => alert(data))
          .catch(error => console.error(error));
    }
}
~~~

Simplemente hacemos un fetching de datos  y en base a los datos obtenidos recibiremos una respuesta, recuerda que al hacer esto, los datos que se retornen con un `echo` se devolverán como un string, por lo que podemos mostrar una alerta con los datos retornados.

**Algo a tomar en cuenta**: es que en el código de Javascript que hicimos hacemos la validación de un dato, esto al estar en el front-end también tendríamos que hacer algo similar desde nuestro código de PHP, como lo siguiente:

~~~php
// definicion de variables
if (strlen($fruta) < 1 || empty($fruta)) {
	echo "Error, the data with more than 1 letter";
	exit();
}
// conexion base de datos y subida de datos
~~~

Este código obviamente va antes de los métodos de subidas de datos, ya que así cancelamos todo y enviamos el mensaje de error si es que el usuario ingresa un valor que posea menos de 1  letra o esta vacío.

Otro tema a comentar es que al presionar submit, la pagina no se actualiza automáticamente, por lo que deberás subir un "valor nuevo desde javascript" el cual se cargara cuando recargues la pagina.

Pero eso queda como una tarea para ti.

---

# Sessions

Un concepto útil para el desarrollo de plataformas mas completas en PHP son las `SESSIONS`, estas nos permiten almacenar datos en nuestro backend y así mantener datos en las distintas ventanas que estén conectadas a la sesión, por ejemplo su uso mas común, es para guardar datos del usuario cuando inicie sesión.

Su utilización es simple, y se basan en 2 funcionalidades principales:

* **Almacenar datos en una sesión**:

  El almacenar datos en una sesión es relativamente fácil y no requiere mayor explicación:

  ~~~php
  session_start(); // iniciamos la sesion (se debe iniciar en cada archivo que lo utilice)
  
  $username = "Rodrigo Seguel"; // creamos un username (este puede traerse desde un POST)
  
  $_SESSION['username'] = $username; // agregamos el valor a nuestra sesion
  ~~~

  ---

* **Acceder a datos de una sesión**:

  Este proceso es igual de sencillo y simplemente requiere de:

  ~~~php
  session_start(); // iniciamos la sesion (se debe iniciar en cada archivo que lo utilice)
  
  $username = $_SESSION['username'];
  ~~~

  ---

* **Salir de una sesión**:

  Para salir de una sesión (por ejemplo si cierras sesión en una pagina) debes seguir el siguiente procedimiento:

  ~~~php
  // Iniciamos la sesion
  session_start();
  
  // Eliminamos las variables de sesion
  $_SESSION = array();
  
  // Destruimos la sesion
  session_destroy();
  ~~~

  Cabe aclarar que el `session_destroy()` elimina los datos de sesión del servidor, pero no los valores que se encuentran en la variable `$_SESSION`, por lo que técnicamente aun son accesibles, utilizo `$_SESSION = array();` para eliminar todos los datos de aquí también y después `session_destroy()` elimina los datos del servidor.

---

