# Rust

**Documentación hecha por Rodrigo Seguel**

La fuerza de **C++** junto a la belleza de **JavaScript** pasando por la facilidad de **Python** con un pequeño toque de amor proveniente de un delicioso pie recién hecho por tu madre, **Rust** es un lenguaje difícil de explicar, es una comunión notable de distintos elementos que pueden hacerte pasar por emociones como confianza, duda y hasta horror pero tranquilo, es mas fácil de lo que crees.

Creado el 2010 este se ha denotado como **"El lenguaje mas amado por programadores"** según las encuestas hechas por **Stack Overflow** los años **2017, 2018, 2019, 2020 y 2021** por razones notables y las que te harán amarlo también.

La mejor parte de este lenguaje es su funcionalidad, imagínate un lenguaje tan fácil como es **Python** o **JavaScript** pero con la potencia de **C++** hasta el punto de permitirte hacer incluso **sistemas operativos** con el mismo, tanto otros trabajos complejos como el **desarrollo de videojuegos**.

---

# Primeros pasos

Como es obvio iniciaremos por el principio, en esta sección repasaremos cosas como la creación de proyectos, la arquitectura de los mismos, un hola mundo entre otros que nos ayudaran a iniciarnos con el lenguaje en si.

---

## Instalando Rust

Para instalar **Rust**, tenemos que adentrarnos en una aventura épica pasando por valles derruidos que poseen peligros inimaginables.

Ahora hablando en serio para instalar **Rust** debes ingresar en la [siguiente pagina](https://www.rust-lang.org/learn/get-started) y simplemente seguir la guía de instalación según tu sistema, **para instalarlo en Windows** simplemente presiona el botón de instalar (32-bit o 64-bit) y al instalar simplemente selecciona "instalación común".

Listo, ya tienes **Rust** instalado!!!.

---

## Creando un proyecto

Para obviamente empezar a trabajar en un proyecto debemos crear el mismo, primero abriremos una terminal, vamos a la carpeta donde deseemos tener el mismo y ejecutaremos el comando **`cargo new nombre-del-proyecto`**, esto creara una carpeta con ese nombre en el que estará almacenado nuestro proyecto.

Al terminar la creación del proyecto podremos ejecutar el proyecto con **`cargo run`**, pero ten cuidado, si te sale un error debes **comprobar que estes dentro de la carpeta del proyecto para ejecutarlo** no en la carpeta donde creaste este mismo.

Mas que el **`cargo run`** tendremos mas formas de ejecutar el código pero por ahora utilizaremos esta forma de trabajo, con un editor y la terminal abiertos al mismo tiempo.

---

## La arquitectura de nuestros proyectos

Al crear un proyecto veremos los siguientes componentes:

+ **src**:  Esta carpeta posee todos los elementos que conforman la parte funcional de nuestro programa (aquí va nuestro código).
  + **main.rs**: Este es el archivo creado como base de nuestro proyecto, donde se encuentra nuestro "Hola mundo" y donde empezaremos a escribir código.
+ **target**: Esta carpeta se encuentra llena de elementos relevantes al debugging de nuestro proyecto, builds, pruebas entre otros muchos otros.
+ **cargo.lock**: En este archivo almacenamos los paquetes que funcionaran y harán efecto en nuestro proyecto cuando los necesitemos.
+ **cargo.toml**: Este archivo nos permite almacenar ciertos datos de nuestro proyecto como el nombre, la versión, la "edición" y las dependencias del mismo.

Aun que a pesar de todo los archivos de importancia real son **src** y **cargo.toml** y conociendo estos ya tendremos lo básico para comenzar.

---

## Hello World

Al crear nuestro proyecto entraremos en **main.rs**, este archivo se presentara ante nosotros como "el archivo básico" en el que escribiremos nuestro código y nos recibirá de la siguiente forma:

~~~rust
fn main() {
    println!("Hello, world!"); // este codigo no requiere de un ; pero por eleccion esta puesto (este es opcional)
}
~~~

Como veras, este "programa inicial" es muy complejo y nos permite sacar las siguientes conclusiones:

- nuestro código fuente debe ir en una función con el nombre `main`.
- usamos "println!" para **imprimir texto en pantalla**
- para llamar un `macro o funcion interna` debemos usar `!` esto se profundizara mas adelante.
- para iniciar una función debemos usar la palabra `fn` seguido de su nombre, parámetros y llaves.

### Comentarios

Los comentarios son una parte fundamental para el desarrollo, ya sea educar o simplemente como un recordatorio, la necesidad de estos supera a cualquier otro elemento pero para utilizarlos obviamente debes saber como funcionan.

Los comentarios en si son en efecto comentarios, no generan cambios en la funcionalidad del código y el posicionamiento de los mismos no genera problemas:

~~~rust
// asi podemos hacer un comentario de una linea
// tendremos que usar eñ "//" por cada linea de comentario
// cuando escribes esta clase de comentarios deben estructurarse como "// comentario" con un espacio entre las barras y el mensaje

/*
	asi podemos hacer un comentario multi linea, este no requiere algo por cada linea escrita,
	todo lo que se encuentre aqui sera un comentario,
	y la estructura del mismo se basa en iniciar el bloque y el mensaje va con una tabulacion
*/
~~~

Es cosa tuya elegir cual y cuando usarlo, tanto como si quieres usarlo o no.

---

## Println!

Todos los lenguajes de programación tienen su propio "**`println()`**" una función que te permita mostrar elementos, datos o mensajes en la terminal puede ser de mucha utilidad para encontrar errores o simplemente para hacer programas básicos con los que probar nuestras habilidades.

En python tenemos **`print()`**, en JavaScript tenemos **`console.log()`** y aquí en Rust tenemos el **`println!()`** este lo debemos utilizar de la siguiente forma:

~~~rust
// en caso que queramos hacer un mensaje plano hacemos:
println!("Hola, este mensaje puedes editarlo");

// en otro caso si queremos agregar variables al mensaje podemos hacer una de las siguientes opciones:
// agregamos el mensaje y en orden entregamos los datos que iran en las llaves
println!("Hola, mi nombre es {} y tengo {} años", nombre, edad); 

// agregamos el mensaje y ingresamos directamente donde iran los datos de las variables entre las llaves
println!("Hola, mi nombre es {nombre} y tengo {edad} años");
~~~

Ahora solo se creativo y utilízalo para hacer pruebas, para recibir errores o simplemente haz locuras, diviértete, para eso sirve esta pequeña funcion.

---

# Variables y constantes

Las variables son la piedra angular de todo lenguaje de programación, **nos permiten almacenar datos en la memoria ram** mientras este se ejecuta y nos entregan la capacidad de poder trabajar sobre estos, cambiándolos, mezclándolos entre otras muchas operaciones variables que veremos en esta sección.

Pero antes de continuar daré un espacio para poder diferenciar entre todos estos:

+ **Variables**: son datos almacenados en memoria que **dependiendo de su mutabilidad** pueden o no cambiar su valor predefinido (**`let`**).
+ **Constantes**: son datos almacenados en memoria que por defecto **no pueden cambiar su valor predefinido** (**`const`**).

## Variables mutables e inmutables

Las variables como ya mencione, **permiten o no que su valor cambie según su mutabilidad** dado a que al crear estas variables tendremos 2 opciones para hacerlas:

1. **Variables inmutables**: son las **variables creadas por defecto** se crean con la palabra clave **`let`** y no pueden cambiar su valor básico, por ejemplo:

   ~~~rust
   let a = 5;
   a = 10; // esto nos generara un error dado que en efecto, no se puede cambiar el valor de una variable inmutable
   ~~~

2. **Variables mutables**: son las **variables creadas por defecto** se crean con la palabra clave **`let`** + **`mut`**y estas si pueden cambiar su valor por defecto, por ejemplo:

   ~~~rust
   let b = 5;
   b = 10; // esto funcionara correctamente
   ~~~

Al declarar variables debes saber 2 cosas, podemos limitar el tipo de dato pero esto no es obligatorio (indagaremos en esto mas adelante) a demás de que **no podemos definir el nombre de una variable con mayúsculas** ósea técnicamente podemos, pero no es recomendable, es mas nuestro editor lo marcara como una "**advertencia**".

*por ejemplo:*

~~~rust
let PI = 3.14; // esto nos genera errores
let pi = 3.14 // esto funcionara totalmente
~~~

---

## Constantes

Las constantes como ya mencione son datos almacenados en memoria que por defecto **no pueden reasignar su valor**, estas requieren de un tipo de dato estatico ya que al no cambiar su valor debemos estar seguro de para que lo utilizaremos, este usualmente se utiliza para cosas como datos especificos que se mantendran constantes.

*por ejemplo:*

~~~rust
const PI: f64 = 3.14159265359; // las constantes por comodidad se recomiendan ser nombradas totalmente en mayusculas
~~~

Seguro notaras que son muy iguales a las **variables inmutables** y de forma externa lo son, pero hay una gran diferencia que nos pueden hacer decidirnos por las constantes, siendo este el **scope** del programa.

Indagaremos mas adelante en esto pero el "**scope**" de una **condicional**, **función**, **clase**, **bucle**, **etc...** se define por las llaves del mismo, osea:

~~~rust
// el scope global es lo que se define difectamente fuera de cualquier funcion, condicion, clase, bucle etc
const PI: f64 = 3.14159265359; // esta constante se encuentra en el scope global

fn main() { // el scope de esta funcion empieza aqui
    
    let nombre = "Rodrigo"; // esta variable se encuentra en el scope de la funcion main
    
    if (1 == 1) {// el scope de esta condicional empieza aqui
        println!("mi nombre es {nombre}"); // podemos acceder a la variable en cualquier scope interno dentro de nuestra funcion
    } // el scope de la condicional termina aqui
} // el scope de esta funcion termina aqui

// si creamos una variable dentro de un scope como es "nombre", no podemos referenciarlo fuera del mismo.
~~~

Pero como decía, las constantes pueden ser creadas en el scope global, para ser referenciadas en todo el proyecto.

---
# Tipos de datos

Los tipos de datos son un concepto muy apegado a las variables y constantes, ya que nos permiten teóricamente y directamente definir que ira en los datos, definiendo la naturaleza de estos datos, seleccionando tanto si son **números enteros**, **números con coma flotante**, **cadenas de texto**, **entre otros...**

Aun que la función de esto es mas que solo definir si nuestro dato será o no un numero, una mas importante aun es administrar la utilización de memoria para mejorar el rendimiento de nuestro programa llegando a permitirnos incluso la cantidad de bytes a los que nuestras variables podrán acceder.

Pero antes de proceder tenemos que entender un poco de teoria.

---

## Los datos en su interior

Los computadores funcionan con electricidad que nos puede entregar 2 datos distintos según el paso de esta, los míticos **1** y **0** tan representados en el mundo a la hora de hablar de informática, representando el **1** como el paso de energía mientras que el **0** representa lo contrario respectivamente **este sistema de 1 y 0 lo aplicamos a un valor el cual llamamos bit**.

En si los bits representan **el paso y no paso de la electricidad**, pero para transformar esto en **datos** los unimos **en grupos de 8**, creando así lo que conocemos como **Bytes**

Los **Bytes** son la unión de datos análogos (**bits**) para transformarlos en información digital, de una forma que es tanto legible para nuestros computadores a demás de utilizable por el usuario final.

Al ser un sistema principalmente basado en bits hay veces que pueden haber ciertas confusiones en temas de por ejemplo velocidades de descarga, o simplemente de conocimiento en informática, por ejemplo **que un dato utilice 4 Bytes significa que es un dato de 32 bits**.

*Un dato importante, hay que saber distinguir Bytes de bits, usualmente los Bytes se referencian con la B mayúscula y representan la información de nuestro ordenador, mientras que los bits se representan con la b minúscula, de hecho es uno de los métodos que suelen usar las compañías de wifi para engañarte vendiéndote Mb (Megabits) en lugar de MB (MegaBytes)*.

De esta forma podemos definir valores numéricos de la siguiente forma.

```
00000001 esto seria equivalente a 1 (esto es 1Byte = 8bits)
00000010 esto seria equivalente a 2
00000100 esto seria equivalente a 4

00000000 00000001 esto seria equivalente a 1 (esto es 2Bytes = 16bits)
00000000 00000000 00000001 esto seria equivalente a 1 (esto es 3Bytes = 24bits)
00000000 00000000 00000000 00000001 esto seria equivalente a 1 (esto es 4Bytes = 32bits)
```

Y como ya mencione, en base a la cantidad de bits se define el rango de números posibles.

---

## Tipos de datos numéricos

Los números enteros son los números (sin coma flotante) incluyendo al 0 y los negativos, lo que en otros lenguajes se llaman **integers** solo que en este caso se dividen en 2 tipos:

- **firmados** (tienen la posibilidad de trabajar con signo negativo), utiliza el ultimo bit del dato para seleccionar si tiene un signo o no.

  *ejemplos:*

  + **10000001 = -1**
  + **00010001 = 17**
  + **01111111 = 127** 

- **no firmados** (no nos permite el trabajar con signos), estos en lugar de utilizar el ultimo bit para seleccionar el signo lo usa para numeros

  *ejemplos:*

  + **10000001 = 129**
  + **00000011 = 3**
  + **11111111 = 255**

En si podemos obtener estos valores basándonos en la cantidad de bits que obtendremos de la siguiente tabla

| longitud | firmados (-) | valores firmados                                             | sin firmar | valores sin firmar                    |
| -------- | ------------ | ------------------------------------------------------------ | ---------- | ------------------------------------- |
| 8bits    | i8           | Min(-128) - Max(127)                                         | u8         | Min(0) - Max(255)                     |
| 16bits   | i16          | Min(-32.768) - Max(32.767)                                   | u16        | Min(0) - Max(65,535)                  |
| 32bits   | i32          | Min(-2.147.483.648) - Max(2.147.483.647)                     | u32        | Min(0) - Max(4.294.967.295)           |
| 64bits   | i64          | Min(-9,223,372,036,854,775,808) - Max(9,223,372,036,854,775,807) | u64        | Min(0) - Max((2^64)-1)                |
| 128bits  | i128         | (2^128)−1 para obtener el valor                              | u128       | (2^128)−1 para obtener el valor       |
| arch     | isize        | Definido según los bits del ordenador                        | usize      | Definido según los bits del ordenador |

**El dato arch varia dependiendo del computador de quien ejecuta el programa, si es un computador de 64 bits sera en efecto 64 bits y en un computador de 32 bits sera 32 bits.**

También podemos escribir otros tipos de datos con estos enteros como lo serian :

- Decimales (0_01) = (0,01) solo que no sirven ambos, en este caso solo el primero
- Hexadecimal (0xff)
- Octal (0o77)
- Binario (0b1111_0000)
- Byte (b'A') en este caso solo puede ser u8

---

### Coma flotante

Como ya sabemos los números decimales son bastante necesarios a la hora de iterar con números en nuestras variables.

En este caso solo hay 2 tipos:

- `f32` decimales de 32 bits (mayor precisión)
- `f64` decimales de 64 bits (mayor velocidad)

Por defecto suelen ser de 64 bits.

---

### Operaciones numéricas

Para operar con números de forma constante requeriremos de hacer operaciones matemáticas, para esto tenemos los siguientes operadores:

| operador | definición     |
| -------- | -------------- |
| +        | suma           |
| -        | resta          |
| *        | multiplicación |
| /        | división       |
| %        | modulo         |

También esta el operador de igualdad `=` este nos permite por ejemplo añadir datos a una variable, aun que en este caso no lo tomaremos como un operador numérico pues no se usa a la hora de hacer operaciones matemáticas en rust.

---

## Tipos de datos booleanos

Los booleanos con el tipo de dato **`bool`**se distinguen por solo tener 2 datos y estos son `true` y `false` o en su defecto verdadero y falso.

Estos también se aplican en los condicionales que son un tema que veremos mas adelante, pero por ahora solo representan un estado u otro `verdadero o falso` `1 o 0` `true or false`.

Una variable booleana se verían así:

```rust
let Variable: bool = true;
let Variable2: bool = false;
```

**como extra encontramos los char**.

Estos tienen la particularidad de que solo pueden contener 1 carácter como seria `A`, `B` o `c` entre muchos otros.

Estos se crean de la siguiente forma:

```rust
let variable: char = 'a';
//o tambien pueden ser
let variable = 'a';
```

**Recordar que a diferencia de un string este usa comillas simples en lugar de dobles**.

---

## Tipos de datos compuestos

Estos tipos de datos (como su nombre lo menciona), son aquellos cuya base esta conformada por otros tipos de datos, ya sean numericos o escalares.

Hay varios tipos de datos que cuentan como "compuestos" y estos son los siguientes:

---

### Tuplas

Las tuplas son agrupaciones de datos que se caracterizan por ser inmutables, no se pueden añadir datos a una tupla ni puedes eliminar datos del mismo.

Una tupla se crea de la siguiente manera:

```rust
let VariableTupla: (tipos,de,datos) = (datos,de,tupla);
//o en su defecto y con un ejemplo mas claro
//let + nombre + (tipo de datos) = (datos segun su tipo)
let VariableTupla: (i8,bool,i16) = (12,true,500);
```

Si queremos llamar un especifico de una tupla, debemos primero asignar esos datos a un valor, de la siguiente forma:

```rust
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
```

O sea que si por ejemplo queremos imprimir en pantalla el numero 3 debemos hacer

```rust
println!("{}", b); //esto mostrara el numero del indice llamado (en este caso el 4)
```

Aun que también existe un método que es usando `nombreTupla.IndiceDeValor` o como ejemplo lo haríamos de la siguiente forma:

```rust
//declaramos una tupla
let tupla: (i8,i8,i8) = (1,2,3);
//si quiero llamar el valor "2" podemos llamarlo usando "tupla.1"
println!("{}",tupla.1);
```

Cabe recordar que el índice va desde el 0 en adelante y este siendo el primer dato además de que este `tupla.indice` puede añadirse a otra variable o constante y llamarla desde ahí.

---

### Arrays

Los array son similares a las tuplas pero diferentes en particular, estos se diferencian principalmente que al crearlos debemos usar una sintaxis mas sencilla, todos los datos deben ser del mismo tipo y es mas fácil llamar sus datos por un índice.

Su sintaxis es la siguiente:

```rust
let nombreArray = [1,2,3,4,5];
```

En este caso creamos un array con números (5 específicamente) aun que también podemos crear el array diciendo el tipo de datos que tendrá y la cantidad de los mismos de la siguiente manera:

```rust
let nombreArray: [tipoDeDato;cantidadDeDatos] = [datos,del,array];
//o como ejemplo directo
let numeros: [i8;5] = [1,2,3,4,5];
```

**Cabe recordar que donde definimos el tipo de datos y a cantidad de datos, lo que los divide es un punto y coma, no solo una coma.**

El array no nos permitirá el ingresar o eliminar datos del mismo y para llamar un dato del mismo por ejemplo en un print podremos hacer lo siguiente:

```rust
//definimos un array
let nombreArray [1,2,3,4,5];
//imprimimos el numero 3 del array (el indice 2)
println!("{}", nombreArray[2]);
```

Además podemos crear "arrays automatizados" de una forma pero el truco es que el dato que le daremos se repetirá el numero de veces que elijamos por ejemplo:

```rust
let nombreArray = [dato a repetir; numero de veces a repetir];
//o como ejemplo directo
let nombreArray = [3; 5];
//esto nos creara un array cuyos datos son [3,3,3,3,3]
```

---

# Operadores

A la hora de trabajar con múltiples datos vamos a querer hacer distintos tipos de "operación" que aplicar a los datos con los que estaremos constantemente trabajando.

En general hay tres tipos de operadores que nos interesan, y son:

------

## Operadores aritméticos

Es un tipo de operador que manipula datos de forma "matemática", estos datos usualmente son de tipo **Number** ya sean enteros o decimales.

*estos son:*

| operadores  | definición                                                   |
| ----------- | ------------------------------------------------------------ |
| `+`         | suma                                                         |
| `-`         | resta                                                        |
| `*`         | multiplicación                                               |
| `**`        | potencia (este no es soportado por IE)                       |
| `/`         | división (su resultado siempre es decimal)                   |
| `%`         | modulo (residuo)                                             |
| `++`        | aumentar en 1                                                |
| `--`        | disminuir en 1                                               |
| `-x`        | negación unitaria (da el negativo de un dato)                |
| `+true` (1) | positivo unitario (convierte en Number un dato que no lo sea) |

------

## Operadores de asignación (básicos)

Es un tipo de operador que permite asignar información de un dato a otro, ya sea para editarlos, mostrar que estos son el mismo dato, entre otros tipos de acciones que se pueden hacer con estos operadores

ejemplo: `datoX = datoY` en este caso el "=" es el operador de asignación

| operadores abreviados | definición                   | operadores extendidos |
| --------------------- | ---------------------------- | --------------------- |
| `x = y`               | asignar o igualar datos      | `x = y`               |
| `x += y`              | suma en asignación           | `x = x + y`           |
| `x -= y`              | resta en asignación          | `x = x - y`           |
| `x *= y`              | multiplicación en asignación | `x = x * y`           |
| `x /= y`              | división en asignación       | `x = x / y`           |
| `x %= y`              | modulo en asignación         | `x = x % y`           |
| `x **= y`             | exponente en asignación      | `x = x**y`            |

------

## Operadores de comparación

Estos nos permiten hacer comparaciones en base a dos datos y que **como resultado nos entregue un true si equivalen lo mismo o un false si no**.

*ejemplo de uso:*

```rust
true == true //si ambos datos tienen el mismo valor nos va a retornar un "true"
true == false //sino nos retornara un "false"

let booleano = 1 == 0;  //tambien podemos asignarlo a una variable
//en este caso el valor de la misma sera "false" dado que 1 no es igual a 0
```

Pero hay varios otros operadores que podemos usar para hacer comparaciones.

| operador | definición    |
| -------- | ------------- |
| `==`     | igual         |
| `!=`     | no igual      |
| `>`      | mayor que     |
| `>`      | menor que     |
| `>=`     | mayor o igual |
| `<=`     | menor o igual |

---

## Operadores lógicos

Cuando trabajemos con condicionales habrán momentos donde querremos hacer "comparaciones" entre dos valores en las mismas condicionales o incluso validar dos al mismo tiempo.

**Los operadores lógicos se dividen en 3 tipos principales y para verlos los comparare con los mismos operadores pero del lenguaje Python aun que también se usan en otros lenguajes de la misma manera.**

### Conjugación lógica

el operador de conjugación es `and` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

| Rust | Conjugación | Python |
| ---- | ----------- | ------ |
| &&   | y           | and    |

Este operador se puede mencionar como **multiplicación lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| ----------- | ----------- | ----------- | --------- |
| false(0)    | &&(*)       | false(0)    | false(0)  |
| false(0)    | &&(*)       | true(1)     | false(0)  |
| true(1)     | &&(*)       | false(0)    | false(0)  |
| true(1)     | &&(*)       | true(1)     | true(1)   |

### Disyunción lógica

El operador de disyunción es `or` y sirve para evaluar si la condición del lado izquierdo **o** el del lado derecho se cumplen.

| Rust | disyunción | python |
| ---- | ---------- | ------ |
| \|\| | o          | or     |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| ----------- | ----------- | ----------- | --------- |
| false(0)    | \|\|(+)     | false(0)    | false(0)  |
| false(0)    | \|\|(+)     | true(1)     | true(1)   |
| true(1)     | \|\|(+)     | false(0)    | true(1)   |
| true(1)     | \|\|(+)     | true(1)     | true(1)   |

### Negación lógica

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

| Rust | Negación | python |
| ---- | -------- | ------ |
| !    | no       | not    |

Este operador funciona así:

| negación | booleano | resultado |
| -------- | -------- | --------- |
| !        | true     | false     |
| !        | false    | true      |

------

# Condicionales

A la hora de ejecutar nuestro código es probable que queramos "comprobar datos" y que dependiendo de esta "comprobación" podamos ejecutar un bloque de código u otro.

Esto lo logramos con las **condicionales**.

Las condicionales son "comprobadores" que en base a ciertas **"condiciones"** ven si ejecutaran el código que tendrán entre llaves `{}`.

*su sintaxis es la siguiente*

```rust
//condicional (condicion){
if (numero === 1) { //si se cumple la condicion (nos da como resultado un true)
    //se ejecutara lo que ingresemos aqui
}
```

Y hay tres tipos de condicionales:

------

## If

El if es la primera condicional que debemos utilizar siempre (dado que las demás requieren de este para funcionar).

La función de un if seria en base a la frase "**`si` (condición) es verdadera {ejecutar el código aquí}**".

*funciona de la siguiente forma:*

```rust
let numero = 1;

if (numero === 1) { //si la condicional nos da como resultado "true"
    //ejecutar este codigo
} 
```

deben recordar que **las condiciones que ingresemos en una condicional deben estar entre paréntesis**.

------

## Else if

Este es "una continuación" del anteriormente mencionado así funcionando como un **sino**, mientras que el if se basaba en la frase "**si (una condición se cumple) {ejecutar código}**" el else if continua con la frase **sino, si (otra condición se cumple) {ejecutar código}**.

*funciona de la siguiente forma:*

```rust
let numero = 2;

if (numero === 1) { //en este caso esta condición no se cumple
    //este código no se ejecuta
} else if (numero === 2) { //en este caso la condición si se cumple
    //ejecutar este código
}
```

------

## Else

Este de por si es lo que me gusta llamar un tipo de "condicional relajado" dado que este es muchísimo mas fácil que los otros condicionales ya vistos.

Este se basa en intentar hacer un "ultimatum" con la frase **sino {ejecutar código}** así señalando que si ni una condición se cumple, el código continuara con esta condición.

*funciona de la siguiente forma:*

```rust
let numero = 3;

if (numero === 1) { //esta condicion es falsa
    //este codigo no se ejecuta
} else if (numero === 2) { //esta condicion es falsa
    //este codigo no se ejecuta
} else { //si ni una de las condiciones es true, este se ejecutara si o si
    //ejecutar codigo
}
```

---

# Bucles

Los bucles se dividen en principalmente 3 tipos `loops`, `while` y `for`.

Estos tienen como característica principal que mientras nosotros queramos o a veces de forma infinita. se repetirán una y otra vez hasta que su condicional sea falsa o que rompamos el bucle.

------

## Bucles loop

El bucle loop es un bucle que se repetirá de forma infinita hasta que queramos que este se rompa usando la palabra `break` o presionando `ctrl`+`c`.

La sintaxis es la siguiente:

```rust
loop{
    //codigo a repetir infinitamente
}
```

Este puede devolver un dato si lo añadimos a una variable usando por ejemplo:

```rust
let numero = 3;
let varLoop = loop{
    numero += 1;
}
```

La variable será 3+1 y ira aumentando cada vez que este loop se repita y si por ejemplo queremos terminar este loop podríamos usar un if por ejemplo usando:

```rust
let numero = 3;

let mut varLoop = loop{
    numero += 1;
    if numero >= 10 { //si la variable numero sube y es mayor a 10
        break; //rompe el bucle
    }
}
```

En este caso lo que ocurrirá es que a la variable numero se le sumara 1 hasta que el resultado sea 10, luego de esto el bucle se romperá.

------

## Bucle while

El bucle while se identifica por técnicamente por ser un tipo de "condicional" pero cuyo código se repite como un bucle hasta que esa condición se vuelva `false`.

Su sintaxis es la siguiente:

```rust
while condicional{
    //codigo
}
```

O como ejemplo practico con esto se puede usar así:

```rust
let mut numero = 1;

while numero < 10{ //mientras la variable sea menor que 10
    numero += 1; //se suma 1 a la variable
    println!("{}", numero); //se imprime el valor de la variable
}
```

En este caso se genera un fin de el bucle y así se trabaja con el bucle while.

------

## Bucle for

el bucle for a diferencia de los otros bucles este itera con una colección, ya sea viendo los datos en la misma o iterando con el numero de datos en una colección en si.

su sintaxis es la siguiente:

```rust
//creamos una coleccion a iterar, en mi caso usare un array
let numeros = [1,2,3,4,5];

//creamos el for
//for variable nueva in coleccion a iterar
for i in numeros.iter() {
    //codigo que se repetira 5 veces
}
```



el `.iter()` es una función que nos permite iterar en nuestra colección.

Además podríamos hacer un cambio, envés de hacer una colección antes en la que iterar, podemos iterar en un conteo de la siguiente forma:

```rust
for i in (1..5).rev(){
    //codigo que se repetira 5 veces
}
```

ese 1..5 nos genera un tipo de "lista o colección" que tiene como datos los números desde el 1 hasta el 5 pero esta opción se vera mas a profundidad mas adelante.

---

# Funciones

Las funciones son "bloques de código" que podemos ejecutar en una "llamada posterior", la idea de los mismos es dejar una parte de nuestro código sin ejecutar hasta que sea pertinente, para editar datos o generar efectos diversos en los que ya tenemos.

La sintaxis de una función es la siguiente:

~~~rust
fn NombreDeLaFuncion() {
    // aqui va el codigo a ejecutar
}
~~~

Esa es una función en su expresión mas básica y para ejecutar el código que se encuentra en su interior debemos llamarlo con **`NombreDeLaFuncion()`** donde lo deseemos llamar, ya sea dentro del main, de una condicional, un bucle u otra funcion.

---

## Parámetros

Los parámetros de una función no son mas que datos que le entregamos al mismo para trabajar, estos se presentan como la clase de "datos" que ingresamos entre los paréntesis para hacer una función... funcionar.

Un ejemplo de estos seria el siguiente:

~~~rust
fn main() {
    suma(5, 10); // al llamar la funcion le pasamos los valores segun lo que agreguemos en los parametros
}

fn sma(a: i8, b: i8) { // creamos nuestra funcion con los datos "a" y "b" ambos como integers de 8 bits
    println!("{}", a+b); // y ejecutamos algo para mostrarlos
}
~~~

Entonces **al agregar parámetros a una función debemos agregar el nombre de la misma junto a su tipo de dato**.

---

## Retorno de datos

Una opción que nos entregan las funciones es servir mas que solo un "ejecutado de acciones" sino que también como un dato, a lo que me refiero es a lo siguiente:

~~~rust
fn main() {
    println!("{}", suma(5,10)); // aqui podemos llamar la funcion como un dato
}

fn suma(a:i8, b:i8) -> i8 { // creamos la funcion y le entregamos 2 datos a demas de seleccionar que retornaremos un int de 8 bits
    return a+b // aqui ingresamos el dato a retornar (no es necesario agregar un return pero lo hago por legibilidad)
}

// segun este ejemplo podriamos incluso hacer algo como:
let mut total_suma = suma(5,10); // el valor de esta variable sera lo que nos devuelva la funcion
~~~

---

# Ownership

**Rust** contiene una característica especifica que lo diferencia a muchos otros lenguajes, siendo esta el concepto de **Ownership**.

Mientras otros lenguajes tienen algo conocido como un **Garbage collector** encargado de analizar y eliminar los datos que no se utilizan, Rust utiliza como alternativa esta forma mas **segura** de trabajar con valores sin uso.

Entregándole enteramente al programador la posibilidad de elegir que se va a hacer con cada dato que se crea, administrando la memoria a la hora de la compilación, y no interrumpir el rendimiento del programa, a diferencia de otros lenguajes que lo hacen en tiempo de ejecución.

---

## Stack y heap

La memoria ram es un tipo de "intermediario" entre disco duro y procesador, esta prepara la información para que así el procesador logre iterar sobre esos datos, pero además este nos permite almacenar datos por todo el lapso en el que nuestro código se este ejecutando.

Mientras nuestro código se ejecute, pedirá constantemente datos a la memoria, dejando estos datos almacenados hasta que el mismo programa deje de funcionar, el problema esta cuando dejamos de necesitar datos **en el tiempo de desarrollo**.

En otros lenguajes estos serán almacenados en lo que se conoce como "**garbage collector**" o basurero, donde se guardaran los datos que ya no se están utilizando, otros lenguajes directamente te entregan todo el poder y la información seguirá utilizando memoria hasta que el programa se cierre, generando de forma temprana esos problemas de rendimiento o crasheos en otros casos.

La memoria ram tiene sus métodos específicos para poder trabajar con estos datos y estos son como `stack` y `heap`.

---

### Stack

El stack o "pila" es una **lista estructurada** o **Estructura de datos** que almacena los datos en la memoria ram, los datos se mueven por ella con el método **LiFo** o **Last in First out** (ultimo en entrar, primero en salir).

O sea que para entenderlo mejor podemos verlo como un conjunto de platos, a la hora de hacer una fila de platos, siempre que colocas uno en la cima, será el primero en ser sacado, ya que por comodidad no es eficiente el eliminar los platos que se encuentren al fondo.

**El stack es donde Rust almacena los datos cuyo valor en temas de bits es conocido y se mantiene durante el tiempo de ejecucion**, datos como: **numeros enteros**, **numeros con comas flotantes**, **datos booleanos** o **chars**, esto por que son en si datos que dependen enteramente de su tamaño en la memoria.

Con un **i32** por ejemplo, este se guarda en **el stack** ya que:

1. **Tiene un tamaño fijo durante la ejecución.**
2. **Tiene un tamaño de 32 bits.**
3. **La variable y su valor serán almacenados en el stack.**

---

### Heap

El heap o "montón" es otra **Estructura de datos** la cual de por si a diferencia de la pila es mas "**desordenada**" que el stack, aun que esta suele tener un tipo de orden que se crea en la marcha.

Esto debido a que el heap es un lugar donde se almacenaran datos mutables o sea que **su tamaño no es conocido** o **que su tamaño puede mutar en tiempo de ejecución**, siendo estos datos como: **arrays**, **tuplas** o **strings**.

Con un **Vector** por ejemplo, este seria guardado en el **el heap** ya que:

1. Los vectores son mutables, ya que la cantidad de elementos en ellos pueden cambiar.
2. Su tamaño puede variar durante la ejecución (por ejemplo al pasarle un dato con **`array.push(4);`**).
3. La **representación de la variable** y **un pointer** estarán almacenados en el heap, este pointer referenciara una posición de memoria en el stack, aquí es donde se almacenara nuestra información interna del vector.
4. En caso de que eliminemos el vector con **`drop(vector);`** se borraran tanto los datos en el Heap como los que están en el Stack.

*Un pointer no es mas que una referencia a la "dirección de memoria" en la que un dato se almacena.*

---

## Reglas del "ownership"

El concepto de **"ownership"** a demás, posee múltiples reglas que nos permiten saber o conocer mejor el comportamiento del mismo.

Estas reglas son:

+ **Cada valor** en Rust **tiene una variable a la cual se le conoce como "el propietario" o "owner"`**.

+ Estos valores **solo pueden tener 1 propietario o owner a la vez**.

+ Cuando el propietario sale del alcance, el valor se eliminara.

  + Con alcance podemos referirnos a las llaves que definen todo lo que va dentro de una función `{}`  por ejemplo:

    ~~~rust
    fn main(){
        let variable1 = "Esta variable esta dentro del alcance de la funcion main"
    } // al llegar aqui el valor se elimina y la variable desaparece
    
    let variable2 = "Esta variable esta fuera del alcance de la funcion main"
    ~~~

    Como ya dijimos la variable 1 al estar entre las llaves `{}` esta dentro del alcance de su función `main` mientras que la variable 2 esta fuera de la misma.

O mejor visto en código:

~~~rust
let mut saludo = String::from("hola");
let saludo2 = saludo; // al hacer esto no creamos un nuevo espacio en memoria para la variable 2

// de ahora en adelante no existe [variable1, "este valor esta apegado a un dueño"] en la memoria
// de ahora en adelante solo existe [variable2, "este valor esta apegado a un dueño"] en la memoria
~~~

Esto por que los datos en si intercambiaron "**propiedad**" y como la variable 1 dejo de ser "**dueño**" de su valor, será eliminado del heap, por lo tanto si por ejemplo intentamos luego hacer lo siguiente:

~~~rust
println!("{}",saludo); // notaremos que no nos sera permitido y nos dara un error
~~~

Y así es como nos encargamos de muchos problemas de memoria en Rust.

---

# Borrowing

Otra de las características importantes de **Rust** es el "**Borrowing**.

Esta característica se define como la capacidad de "Adquirir" el valor de otra variable **sin necesidad de adquirir su ownership** así permitiendo la existencia de ambas variables.

Como ya vimos en la sección anterior si intentamos hacer algo como lo siguiente:

~~~rust
let mut saludo = String::from("hola");
let saludo2 = saludo; // al hacer esto no creamos un nuevo espacio en memoria para la variable 2

print!("{}", saludo)
~~~

Nos encontraremos con un error, ya que actualmente el valor de **"Hola"** dejo de pertenecer a la variable **"saludo"**, para solucionar esto tendríamos que **entregar una copia del valor de "saludo" a "saludo2"**

*Para esto simplemente tenemos que hacer lo siguiente:*

~~~rust
let mut saludo = String::from("hola");
let saludo2 = saludo.clone();
// al hacer esto clonamos los valores, osea que saludo y saludo2 tendran ambos distintos espacios en memoria
// osea si eliminamos la primera variable la segunda seguira funcionando y viceversa

print!("{}", saludo) // por lo que esto seguiria siendo valido
~~~

A pesar del **`clone()`** en el ejemplo anterior, el **Borrowing** no es tanto "**clonar valores**" sino el **referenciar su posición en la memoria por medio de pointers** por lo que por ejemplo también podemos acceder a estos "valores referenciados" con el símbolo "**`&`**" funcionando de la siguiente forma:

~~~rust
let mut saludo = String::from("hola");
let saludo2 = &saludo;
// al hacer esto estamos referenciando exactamente la misma posicion de memoria que esta utilizando el saludo original.
// asi no utilizamos mas memoria, simplemente llamamos el valor ya existente en memoria por medio de un "alias"
print!("{}", saludo) // por lo que esto seguiria siendo valido
~~~

La diferencia entre utilizar el **`.clone()`** y el símbolo **`&`** es que el clone en efecto crea otro espacio en la memoria con una nueva variable y un nuevo valor (a pesar de que este sea el mismo a la variable anterior) por lo que cada cambio generado será independiente a la otra variable.

Mientras que el símbolo **`&`** hace referencia al lugar de la memoria en la que se almacena el valor anterior, por lo que simplemente guardamos el nombre de la variable, el valor del mismo ocupa el mismo sitio en ambas y el cambio en una variable se presentara en la otra.

---

# Structs

Un **Struct** o **Estructura**, es un tipo de dato customizado que te permite **empaquetar datos y nombrarlos según una relación que los unifique** y así entregarle un "significado" a este conjunto de datos. 

En si los **Structs** son como una clase en la que **solo definiríamos los atributos de la misma**, ya que un **Struct** esta hecho simplemente **para almacenar valores en forma de variables** mas no funcionalidades como los **métodos** de una clase convencional.

---

## Definiendo e instanciando Structs

Para definir un **Struct** empezaras entregando directamente los valores que lo compondrán especificando el tipo de dato de cada uno.

*Por ejemplo:*

~~~Rust
struct Jugador {
   	nombre: String,
    vidas: u8,
    estaVivo: bool,
}
~~~

Ya al haber creado esta base podremos instanciarlo de la siguiente forma:

~~~rust
fn main() {
        let mut jugador1 = Jugador { // al ser mutable podemos editar todos los valores del mismo
        nombre: String::from("Rodrigo"),
        vidas: 3,
        estaVivo: true,
    };
    // podemos interactuar con los datos escribiendo "instancia.dato"
    print!("{}", jugador1.nombre);
    
    // gracias al mut podemos cambiar el valor de un dato
    jugador1.nombre = String::from("Ariel");
}
~~~

También tenemos otra forma de instanciar estos **Structs** gracias a algo que llamaremos "**Instancias Funcionales**" siendo estas funciones a las que se le entregaran los datos a rellenar y retornara el **Struct** especificado de la siguiente forma:

~~~rust
struct Jugador { // creamos el struct base
   	nombre: String,
    vidas: u8,
    estaVivo: bool,
}

fn construir_jugador(nombre:String, vidas:u8) -> Jugador { // creamos la funcion constructora que cambiasra el nombre y las vidas
    Jugador {
        nombre:nombre,
        vidas:vidas,
        estaVivo:true,
    }
}
~~~

En este caso creamos una función que al ser ejecutada le entregaremos el nombre y la cantidad de vidas de nuestro jugador, así instanciando un nuevo jugador con estos elementos.

---

## Métodos (impl)

Los métodos son **funciones implementados dentro de una estructura como una clase o como un struct** su utilidad es entregar funcionamientos que **interactúen con los datos de la misma estructura** tomando esta estructura como los anteriormente mencionados **clases y structs**.

Para poder hacer estos métodos tendremos que **crear una implementación de la estructura** en la que agregaremos estas funciones o métodos.

*La sintaxis de un método (para un struct) es el siguiente:*

~~~rust
// creamos un struct
struct Jugador {
    nombre: String,
    vidas: U8,
}

// creamos una "implementacion" del struct
impl Jugador {
    // creamos un metodo que nos entrega el nombre y vidas del jugador 
    fn mostrar_datos(&self) -> String { 
        // usamos la funcion format para concatenar un string con un int
        // recuerda que al retornar un string debemos retornar un clon del mismo
        return format!("nombre:{}, vidas:{}", self.nombre.clone(), self.vidas) 
    }
}

fn main() {
    let jugador1 = Jugador { // creamos nuestra instancia del jugador
        nombre: String::from("Rodrigo"), // le entregamos un nombre
        vidas: 3, // y una cantidad de vidas
    };

    // al llamar esta funcion, recibiremos los datos segun el return de nuestro metodo
    print!("{}", jugador1.mostrar_datos()); 
}
~~~

En los métodos podemos llevar a cabo cualquier otra capacidad que tengan las funciones ya que en su esencia **un método es una función**.

---

# Enums

Los Enums son **otra estructura de datos** definidos como una lista de valores posibles de cierto elemento, continuaremos con el ejemplo del jugador para mostrar un resumen de sus funcionalidades.

La sintaxis de un enum es simple ya que en terminos basicos funcionan como listas implementados de la siguiente forma:

~~~rust
// este enum hara referencia a las direcciones posibles a las que podra moverse nuestro jugador
enum Direcciones { 
	// las posibilidades del mismo enum serian:
    Arriba,
    Abajo,
    Izquierda,
    Derecha,
}

// ahora creamos un struct donde un valor de "direccion" definira hacia donde se esta moviendo
struct Jugador {
    direccion: Direcciones
}

fn main() {
    let Jugador1 = Jugador{direccion: Direcciones::Arriba}; // ahora creamos nuestro jugador con el valor de direccion "Arriba"
    
    match Jugador1.direccion {
        Direcciones::Arriba => print!("Estas viendo arriba"),
        Direcciones::Abajo => print!("Estas viendo abajo"),
        Direcciones::Izquierda => print!("Estas viendo a la izquierda"),
        Direcciones::Derecha => print!("Estas viendo a la derecha"),
    }
}
~~~

En este ejemplo utilizamos un struct por comodidad, pero en caso de que quieras hacer el dato como una función única también es posible.

---

## Control de posibilidades

Al utilizar el Enum como una "**lista de posibilidades**" debemos tener una forma de acceder a estos valores para entregar una funcionalidad en cada una de estas posibilidades.

Por ello podemos acceder a la palabra clave **match**, esta nos permite revisar los las variaciones de un dato que este anclado a el **enum** y según cada posibilidad nos permitirá ejecutar un bloque de código.

*Por ejemplo:*

~~~rust
fn main() {
    let Jugador1 = Jugador{direccion: Direcciones::Arriba}; // continuando con el ejemplo anterior
    
    match Jugador1.direccion { // creamos un match que revisara por la direccion del jugador 1
        // en caso de que la direccion sea "arriba" imprimir mensaje
        Direcciones::Arriba => print!("Estas viendo arriba"), 
     	// si quieres usar un bloque de codigo, debes utilizar "({}),"   
        Direcciones::Abajo => {
        	print!("Estas viendo abajo")   
        },
        Direcciones::Izquierda => print!("Estas viendo a la izquierda"),
        Direcciones::Derecha => print!("Estas viendo a la derecha"),
    }
}
~~~

---

# Manejando proyectos en crecimiento

A la hora de crear proyectos "**reales**" puede que estos crezcan de una forma incontrolable, haciendo necesario el separar en módulos nuestro código, dividiendo funcionalidades así haciendo mas fácil no solo la funcionalidad de nuestro código sino también su legibilidad.

Por eso Rust entrega una gran cantidad de elementos específicamente diseñados para facilitar esto.

Todo esto se presenta permitiendonos acceder a los siguientes conceptos:

- **Packages:** Una característica de **Cargo** que te permite construir, probar y compartir **Crates**
- **Crates:** Un "árbol de módulos" que produce una librería o ejecutable (**con árbol me refiero a su estructura de carpetas dentro de carpetas**).
- **Modules** y **use:** Te permiten controlar la **organización**, el **scope** y **la privacidad de los "paths"** 
- **Paths:** Es una forma de "nombrar" un elemento como a los **structs**, **funciones** o **módulos** (este nombre es al que accederás desde otros elementos).

---

## Packages y Crates

El sistema de "paquetes y cajas" de **Cargo** es el que se encargara de modularizar nuestro codigo.

Un **package** es un conjunto de **crates** que entregan ciertas funcionalidades y cada paquete contiene un archivo **Cargo.toml** el cual define como se construira este paquete.

Un **crate** se puede dividir en **crates simples** o **crates librerías** u en términos simples un **crate simple** no es mas que que un código compilable que posee una función **`main()`** definiendo lo que ocurrirá cuando se ejecute este **crate**.

Por otro lado un **crate librería** es un código **no compilable** ya que no posee una función **`main()`**, la función de estos usualmente es entregar métodos, funciones y otros elementos accesibles desde nuestros **crates** un ejemplo seria un archivo lleno de funciones encargadas de hacer cálculos matemáticos.

En términos simples, **un package es un proyecto de Rust** creado con **`cargo new proyecto`**, mientras que **un crate es un archivo de código de Rust**.

