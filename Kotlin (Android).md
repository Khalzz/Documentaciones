# Kotlin (Android)

**Documentación hecha por Rodrigo Seguel**

kotlin es un lenguaje de programación basado en java orientado a dispositivos android, google lleva mucho tiempo buscando un lenguaje ideal solo orientado para android (el swift para android) y finalmente kotlin se volvió en efecto **el lenguaje oficial para desarrollo en android**.

google busca abandonar java en el desarrollo móvil, pues kotlin (por ejemplo) en lugar de ser tan complejo como java es una unión entre lo que  a mi experiencia seria c# y python (lenguajes que yo manejo aun que se que podría haber mejores).

Este mismo al estar basado en java puede aplicarse en código de este mismo, o también viceversa (incluir java en un código kotlin).

kotlin de por si es un lenguaje simple que nos permite trabajar tanto en celulares, dispositivos "vestibles"(relojes inteligentes), vehículos inteligentes, entre otros.

Ya con esta base podemos iniciar con el aprendizaje de kotlin, recuerda que esta  documentación esta pensada como un "recordatorio del lenguaje" pero también se puede usar como una guía para novatos en el lenguaje.

Kotlin al ser un lenguaje enfocado a android su ide específicamente es **Android Studio** pero también podemos trabajar con el por medio de **intelliJ idea** de hecho android studio es un **fork** de este mismo

---

## Indice

+ [Comentarios](#Comentarios)
+ [Hola Mundo](#Hola-Mundo)
+ [Constantes y variables](#Constantes-y-variables)

  + [Tipos de datos](#Tipos--de-datos)
+ [Operadores](#Operadores)
  + [Operadores aritméticos](#Operadores-aritméticos)
  + [Operadores de asignación](#Operadores-de-asignación)
  + [Operadores lógicos](#Operadores-lógicos)
    + [Conjugación lógica](#Conjugación-lógica)
    + [Disyunción lógica](#Disyuncion-lógica)
    + [Negación Lógica](#Negación-lógica)
+ [Condicionales](#Condicionales)
  + [Operadores de lógica booleana](#Operadores-de-lógica-booleana)
  + [when](#when)

+ [Colecciones](#Colecciones)
  + [Arrays](#Arrays)
  + [Maps](#Maps)
+ [Bucles](#Bucles)
  + [Bucle for](#Bucle-for)
  + [Bucle while](#Bucle-while)
+ [NULL safety](#NULL-safety)

+ [Poo](#Poo)
  + [Funciones](#Funciones)
  + [Clases](#Clases)
+ [Interfaces gráficas](#Interfaces-gráficas)
  + [Hola diseño](#Hola-Diseño)
  + [Layouts](#Layouts)
  + [Widgets](#Widgets)
    + [Botones](#Botones)
    + [Campos de texto](#Campos-de-texto)
  + [Intent](#Intent)
  + [Mensaje de alerta](#Mensaje-de-alerta)

---

## Comentarios

Todos los lenguajes tienen este aspecto que nos permite escribir lineas en nuestro código que no afecten el mismo así mejor llamados **comentarios**.

estos son tanto útiles para documentar el código/proyecto o para dejar "explicaciones" de la función de cierta porción de código.

como ya dije haré comparaciones directas con C# y python, pero de hecho el modo de como hacer comentarios es exactamente igual al método de c#, java, c++, entre otros lenguajes de programación similares.

~~~kotlin
//este es un comentario de una sola linea

/*
este es	
un comentario 
multi linea
*/
~~~

de hecho, durante esta documentación se vera bastante las lineas comentadas, para explicar porciones de código, pero ya con esto podemos iniciar la base de el código 

---

## Hola Mundo

Como ya es común, iniciaremos con un hola mundo, para explicar tanto la base del código de kotlin como alguna función básica.

Para esto tomaremos en cuenta que el archivo lo estas haciendo en intelliJ por lo que el método de para iniciar un nuevo código es:

+ seleccionar un nuevo provecto o crear uno
+ al tener el proyecto abierto se nos creara en el visualizador de archivos una carpeta llamada `src`
+ damos clic derecho en la misma y seleccionamos `new` y elegimos la opción `kotlin file/class`
+ le damos un nombre a el archivo y damos enter

tras eso se nos generara un archivo vacío y en el hacemos lo siguiente:

~~~kotlin
//creamos una funcion con el nombre main
fun main(){
    //aqui va nuestro codigo
    print("Hola mundo")
}
~~~

Para correr este código por lo menos en intelliJ usamos el shortcut `alt`+`shift` +`f10`

Esto es un hola mundo en consola, por lo menos por ahora veremos nuestros ejemplos de esta forma, pero al terminar con la parte del código, veremos como hacer una aplicación de forma gráfica para android.

Cabe recalcar que kotlin permite el paradigma de programación orientada a objetos, por lo que es casi 100% necesario tener una función "main" a la hora de trabajar.

---

## Constantes y variables

Las variables y constantes son datos de la aplicación que se guardan en la memoria de la misma, las variables siendo como su nombre dice, de tipo variable (su dato puede cambiar) y las constantes manteniendo su dato sin dar la posibilidad de cambiar el mismo.

Para  hacer una variable o constante debemos usar las siguiente sintaxis:

~~~kotlin
var miVariable = "esto es un string en una variable"
//----------------------------------------------------------------------------------------
val miConstante = "esto es un string en una constante"
~~~

Si queremos hacer algo como cambiar el dato de una variable, solo debemos escribir el nombre de la variable y asignarle un valor nuevo.

Y por ejemplo si queremos mostrar en consola una variable debemos usar `println(nombreVariable)`.

**Recuerden que el nombre de una variable debe escribirse en camelCase y la primera letra debe ser minúscula.**

También podemos interpolar strings o otros datos, un ejemplo directo de esto seria hacer algo como lo siguiente:

~~~kotlin
val nombre = Rodrigo
println("Hola, mi nombre es $nombre") //usando el $ interpolamos variables y constantes
~~~



---

### Tipos de datos 

Todas las variables y constantes tienen algún tipo de dato anclado, ya sea numero, texto, dato booleano, etc...

Estos nos sirven para "limitar" la posibilidad de datos que pueden ir en una variable o constante, en este caso no es 100% necesario mencionarlo a la hora de hacer o declarar variables y constantes, pero si es util saber que tipo de datos podemos usar en cada variable.

Pero si quieres declarar a que tipo de datos pertenece una variable, debes usar la siguiente sintaxis de ejemplo

~~~kotlin
var nombreVariable: String = "Hola Mundo"
~~~

también podemos iniciar una variable con un valor nulo o con un valor que podamos añadir luego

~~~kotlin
var nombreVariable: String
nombreVariable = "Hola Mundo"
~~~

pero también podemos usar kotlin como un lenguaje de tipado dinámico como python o otros haciendo

~~~kotlin
var miVariable = "hola mundo"
//las variables escritas asi no permiten declararlas con un "Dato nulo"
~~~

lo mismo si quisiéramos hacer una constante, pero en general algunos tipos de datos básicos serian los siguientes:

| tipo de dato | definición                                  |
| ------------ | ------------------------------------------- |
| integer      | número enteros de 32 bits                   |
| long         | números enteros de 64 bits                  |
| short        | números enteros de 16 bits                  |
| byte         | números enteros de 8 bits                   |
| float        | decimales de hasta 32 bits                  |
| double       | números decimales de hasta 64 bits          |
| char         | caracteres de forma individual (a; b; c...) |
| boolean      | datos lógicos (true/false)           |
| string       | cadenas de texto                            |
|  arrays	   | colección/lista de datos |

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

|  kotlin  | Conjugación | python |
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

|  kotlin  | disyunción |  python  |
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

|  kotlin  | Negación |  python  |
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

Como ya sabemos, las condicionales son parte importante en cualquier programa o app **y no me cansare de repetirlo!!!**.

Estos se dividen en 3 principales

+ `if` (si se cumple una condición, ejecuta código)
+ `else if` (sino si se cumple esta otra condición, ejecuta código)
+ `else` (sino, ejecutar código)

Y de por si la sintaxis de estos son la siguiente:

~~~kotlin
if (condicional){ //si esta condicion se cumple, ejecuta el codigo
    /*
    bloque de codigo
    */
}else if (condicional 2){ //sino, si esta funcion se cumple, ejecuta el codigo
    /*
    bloque de codigo
    */
}else{ //si ni una condicional se cumple, ejecuta este codigo
    /*
    bloque de codigo
    */
}
~~~

La sintaxis de una condicional es la siguiente `(dato1 operador-de-logica-Booleana dato2)` o por ejemplo `(1 == 1)`.

En este caso hicimos una condición que pregunta si 1 es igual a 1, esto al ser cierto (true) se ejecutaría un código si estuviera en una condicional.

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

Estos se encargan de comprobar condiciones de forma constante, si una condición se cumple, se ejecuta el código dentro de la misma, si es falso se continua con el código.

### when

la sentencia when es una especial, en este caso no aparece en otros lenguajes comúnmente con ese nombre, pero los que hemos usado otros lenguajes antes de kotlin lo podemos comparar con el switch de otros lenguajes.

Su función principal es entregarnos un tipo de "condicional" con múltiples opciones a elección y cada una de estas esta enlazada a una acción en particular.

un ejemplo de su sintaxis seria el siguiente:

~~~kotlin
//determinamos una variable o constante en la que trabajar
val pais = "Chile"

//usamos el when y le asignamos la constante o variable a trabajar
when(pais){
    //si la constante pais es igual a U.S.A 
    "U.S.A" ->{
        //IMPRIME EN CONSOLA
        println("el idioma es ingles")
    //si la constante es igual a Brazil    
    } "Brazil" ->{
        //IMPRIME EN CONSOLA
        println("el idioma es portugues")
    //si la constante es igual a Chile
    } "Chile" ->{
        //IMPRIME EN CONSOLA
        println("el idioma es español")
    }
}
~~~

En este caso, como la variable equivale a "Chile" se mostrara en la consola el mensaje `el idioma es español`, pero ademas podemos añadir mas datos a una respuesta, por ejemplo

~~~kotlin
//determinamos una variable o constante en la que trabajar
val pais = "Chile"

//usamos el when y le asignamos la constante o variable a trabajar
when(pais){
    //si la constante es igual a Chile, españa o argentina
    "Chile","españa","argentina" ->{
        //IMPRIME EN CONSOLA
        println("el idioma es español")
    }
}
~~~

En este caso siendo la variable cualquiera de las tres opciones se mostrara el mismo mensaje, pero también podemos escribir algo como rangos de números, por ejemplo:

~~~kotlin
//determinamos una variable o constante en la que trabajar
val edad = 17

//usamos el when y le asignamos la constante o variable a trabajar
when(edad){
    //si tu edad esta entre estas opciones
    1,2,3,4,5,6,7,8,9, ->{
        //eres un niño
        println("eres un niño")
    //si tu edad esta entre el 10 y el 17
    } 10..17 ->{
        //eres un adolescente
        println("eres un adolescente")
    //si tu edad esta entre el 18 y el 100    
    } 18..100 ->{
        //eres un adulto
        println("Eres un adulto")
    } else ->{
        //este codigo se ejecutara, si es que no se cumplen las otras opciones
    }
}
    
~~~

---
## Colecciones
Las colecciones son "datos" o algunos tipos de variables y constantes que nos permiten almacenar en los mismos, mas de un dato y los principales son los siguientes.
### Arrays

Los arrays (arreglos o vectores) son un tipo de "colección" que nos permite añadir un numero de datos a una variable como si por ejemplo fuera una lista con un nombre especifico, esto nos deja el acceder a estos datos de forma general aun mas fácil que si quisiéramos hacerlo **dato por dato**.

Para crear un array debemos seguir los siguientes pasos:

~~~kotlin
//determinamos las variables o constantes a trabajar en el array
var nombre = "Rodrigo"
var apellido = "Seguel"
var edad = "17"

//creamos el array vacio
var nombreArray = arrayListOf<String>()
/*
los arrays tienen su tipo de dato entre los signos "<>" y esto especifica solo el dato especifico que puede tener cada uno, por ejemplo en estre caso los datos del array solo podran ser string pero podemos hacer lo mismo con int, float, booleanos, etc...
*/

//añadir datos al array
nombreArray.add(nombre)
nombreArray.add(apellido)
nombreArray.add(edad) //si la edad fuera solo un numero daria error
~~~

En este caso, si imprimiéramos nuestro array en la consola se vería de la siguiente manera:

`[Rodrigo, Seguel, 17]`

algunas cosas extra de los arrays son las siguientes:

+ también podemos añadir mas de una vez los datos que están en el array y no generara error, en su defecto estos funcionaran de forma correcta y se mostrara nuevamente el dato repetido en el array.
+ También podemos añadir mas de un dato a el array usando: `nombreArray.addAll(listOf("hola","buenos dias"))`
+ Ademas podemos usar la función add para añadir un dato directo envés de una variable o constante
+ Para llamar un dato especifico debemos hacerlo por su indice, por ejemplo si queremos imprimir un dato debemos crear una variable o constante que este igualada a `nombreArray[indice]` el indice va desde el 0 hasta el numero de datos que tengamos en el mismo.
+ Para modificar un dato de el array debemos usar `nombreArray(indiceElemento,"dato nuevo")`
+ Para remover un dato de el array debemos usar `nombreArray.removeAt(indiceElemento)`
+ Para ver todas las acciones que podemos hacer con el array debemos escribir `nombreArray.` y tras eso se abrirá una "ventana" con todo lo que podemos hacer con el mismo.

---

### Maps

Los maps (o también llamados diccionarios) son otro tipo de colección, estos funcionan de forma especial ya que no guardan los datos de forma "ordenada" osea que no puedes acceder a sus datos por un "indice" como pasaba con los array, en este caso los diccionarios se dividen en 2 datos.

Estos datos son `clave:valor` con la particularidad de que como ya dijimos, no se puede acceder a un dato usando un indice, sino llamándolo por su clave o por el valor

Un ejemplo de sintaxis básica es el siguiente:

~~~kotlin
//iniciamos nuestro map como variable o constante (recomendado variable)
//los tipos de datos pueden ser casi cualquiera
var miMapa: Map<TipoDeDatoClave,TipoDeDatoValor> = mapOf()

//ejemplo
var miMapa: Map<String,String> = mapOf()

//para añadir dato usamos
nombreMap = mapOf("clave" to "valor")

//si queremos añadir mas de un dato usamos
nombreMap = mapOf("clave" to "valor", "clave2" to "valor2")

//para añadir solo un dato podemos hacer lo siguiente
nombreMap["clave"] = "valor"
//o
nombreMap.put("clave","valor")
//estos nos permiten tambien actualizar datos ya existentes
~~~

Cabe recalcar que las claves no se pueden repetir, no pueden haber 2 claves iguales pero los valores se pueden repetir cuantas veces se quiera.

Para eliminar un dato usamos:

~~~kotlin
nombreMap.remove("clave")
~~~

**Para acceder a un dato del map podemos usar la sintaxis `println(nombreMapa["clave"])`**.

---

## Bucles 

Los bucles son un tipo de "condicionales especiales" que repiten una acción hasta que una condición sea falsa o en efecto se diga que ese bucle se "rompa".

### Bucle for

El bucle for lo que hace es aplicar un nombre a el conjunto de datos dentro de un map o array y dependiendo del numero de los mismos ejecuta una acción el mismo numero de veces que el numero de datos que hay en una de estas colecciones.

Un ejemplo directo de esto seria:

~~~kotlin
//usamos un array ya creado en este caso
var nombreArray<String> = arrayListOf<String>("Rodrigo","Ailin","Javiera")

//creamos el bucle
//ahora todos los datos dentro del array se asocian a la variable "datos"
for (datos in nombreArray){
    //imprime la variable datos por cada dato en el array
    println(datos)
}
~~~

En este caso el output de esto seria:

~~~
>>Rodrigo
>>Ailin
>>Javiera
~~~

En este caso no recomiendo hacer la misma acción con un diccionario.

También, envés de necesitar de alguna colección, podemos hacer un recorrido entre números escribiendo `0..10` por ejemplo para que la acción se repita 10 veces

(si queremos hacer el mismo conteo debemos usar `10 downTo 0`)

Pues por cada dato en el array se imprime un dato nuevo dentro de este, aun que podríamos ejecutar muchas acciones con este bucle.

---

### Bucle while

El bucle while funciona como lo haría su traducción directa de "mientras" osea que **mientras una condición sea cierta, se repite el bucle**.

Por ejemplo:

~~~kotlin
var x = 0

//mientras x sea menor a 10
while (x<10){
    //se suma 1 a x y se imprime el resultado
    print(x++)
}
~~~

Su forma de funcionar es mas fácil, pero nos permite incluso acceder a cosas mas complejas que el mismo bucle for.

---

## NULL safety

El lenguaje de Java tiene una característica muy reconocida por otros programadores del mismo, y es el clásico error de nulos, en efecto no es algo bonito, kotlin al ser un lenguaje en base a java nos permite tener una seguridad mas alta ante estos datos **NULL**

+ para evitar este problema, a la hora de hacer una variable no podemos asignarle el dato **null**, pero para hacer esto debemos hacerlo como en el siguiente ejemplo

~~~kotlin
var datoNulo: String? = null

//en este caso si quisieramos imprimir el dato deberiamos usar lo siguiente
println(datoNulo?)
//en este caso si el valor de la variable es nulo, en consola se mostrara el texto "null"
//de lo contrario, se mostrara todo otro dato que no sea un nulo de forma correcta 
~~~

## Poo

como ya dije, kotlin nos permite trabajar con lo que es la programación orientada a objetos, (esta aun que ya es de conocimiento notable si es que has visto una de mis documentaciones anteriores) es bastante útil a la hora de programar, pues nos permite mantener un código mas "ordenado" separando cada cosa o parte del código separada en "clases" y "métodos" los cuales al unirse crean un objeto.

---

### Funciones

En la programación orientada a objetos a las funciones se les llama métodos y sirven para darle funcionalidad a los mismos, pero también sirven para hacer otras funcionalidades en el mismo codigo perse

Estas mismas son parte **importante!!** de el código, nos permiten hacer acciones de forma mas compleja incluso mas si los unimos con todo lo antes ya visto.

la sintaxis e una función es la siguiente:

~~~kotlin
fun nombreFuncion(){
    //aqui va nuestro codigo
}
~~~

una parte necesaria de kotlin (pormenor a la hora de programar en intelliJ), es que para usar este código requerimos constantemente de una "función main"que debemos crear la cual es nuestra "función principal" y donde estará el código que usaremos ademas de el llamado de otras funciones.

~~~kotlin
fun main(){
    //codigo principal
    //sin esta funcion nuestro codigo no funcionara
}
~~~

Para llamar esa función y ejecutar lo que hay dentro de si misma, debemos escribir la siguiente linea en nuestra función principal:

~~~kotlin
fun main(){
    nombreFuncion()
}
~~~

Y entre el paréntesis van los parámetros de la misma, osea los datos que espera la función que sean devueltos a la hora de usar la misma.

Un ejemplo directo de esto es el siguiente:

~~~kotlin
fun main(){
    diMiNombre("Rodrigo") //llamamos la funcion y le damos el parametro rodrigo
}
fun diMiNombre(nombre:String){ //el parametro rodrigo se une a la variable "nombre"
    println("hola, mi nombre es $nombre") //imprime el texto junto a la variable nombre
}
~~~

también podemos agregar mas parámetros a una función separándolos por una coma ademas de cambiar ese "String" por otro ya que este es solo el tipo de dato que vamos a retornar.

también usaremos la linea "return" que sirve para terminar una función ademas de devolver un valor de por ejemplo algún calculo o acción hecha en la misma función, un ejemplo seria el siguiente:

~~~kotlin
fun main(){
    val resultado = suma(1, 4)
    println(resultado)
}
fun suma(numero1: Int, numero2: Int){
    val suma = numero1 + numero2
    return suma
}
~~~

El print nos entregara el resultado de la suma dado la funcionalidad de devolvernos los datos con el "return".

Una opción extra de las funciones es poder transformar cualquier dato en uno que elijamos, por ejemplo si tenemos una función con el nombre "numero" y que nos entregue un numero como string debemos usar `numero().toString`

---

### Clases

Las clases son como un tipo de "almacenador" es una especie de caja en la que guardaremos tanto los "datos" o constantes y variables del objeto ademas de las funciones/métodos que especificaran la funcionalidad del mismo.

 En el caso que estén trabajando en android studio se darán cuenta que al crear un nuevo proyecto este tendrá una clase, la cual sera

~~~kotlin
class MainActivity : AppCompatActivity(){
    //aqui va nuestra funcion main y nuestros datos a usar en el codigo
}
~~~

Como vemos hay una clase principal llamada main activity donde esta toda la función directa de nuestra actividad principal/pagina principal.

pero aparte de esa misma podemos crear otras, estas deben ser creadas en la misma carpeta de el codigo principal.

1. damos clic derecho en la carpeta donde estaba nuestro codigo
2. elegimos la opción `new`
3. seleccionamos la opción `kotlin file/class`
4. seleccionamos `class` y le damos un nombre a la clase

Luego de eso se creara un archivo nuevo con esto escrito en el mismo, una clase nueva.

~~~kotlin
class NombreClase{
	//codigo de la clase
}
~~~

pero este tiene una particularidad diferente a los otros lenguajes y es que envez de poner las variables en la clase, para poner esos datos debemos abrir parentesis luego del nombre de la clase y ahi poner todo, por ejemplo:

~~~kotlin
class NombreClase(dato: String){ //en este caso guardamos un dato string llamado dato
    //estas propiedades pueden ser de cualquier otro tipo de dato incluso array<dataType>
}
~~~

para instanciarlo en nuestra función main debemos añadirlo a una variable o constante

~~~kotlin
val clase = nombreClase("datos que añadir a las propiedades")
//si hacemos esto, los datos solo podran ser usados dentro de su clase
//si estas propiedades no les damos un dato quedaran como nulo o sin dato
~~~

Para que estos datos se puedan usar fuera, debemos hacerlo de la siguiente manera:

~~~kotlin
class NombreClase(var dato: String){
    //ahora podemos usar el dato en en codigo main
}
~~~

Luego podemos llamar una variable directa para cambiar su valor haciendo esto:

~~~kotlin
//instanciamos el objeto
val clase = NombreClase("dato que añadir a las propiedades")

//llamamos el dato especifico
clase.dato = "dato nuevo que aplicar a este mismo"
~~~

De esta forma tambien podemos llamar una funcion que este dentro de esta clase.

~~~kotlin
class Persona{
	fun saludo(){
        println("hola a todos!!!")
    }
}
~~~

luego en la función main escribimos

~~~kotlin
//instanciamos el objeto
val sujeto = Persona()

//llamamos la funcion o dato del mismo
sujeto.saludo()
~~~

---

## Interfaces gráficas 

Kotlin es un lenguaje que como ya dijimos funciona principalmente en android y puede anclarse a java, pero estos en efecto para poder mostrar la aplicación perse siendo esta la "interfaz gráfica"

esto se logra con un lenguaje llamado **XML** (lenguaje de marcado extendido) que al igual a html nos permite añadir datos y otras cosas a nuestras aplicaciones, ademas de permitirnos el elegir donde y de que forma ingresaremos estas partes/datos en nuestra interfaz

Al crear nuestro proyecto con una "empty activity" en la carpeta **>res >layout** se creara un archivo con nombre **`activity_main.xml`** aquí irán las cosas  dentro de nuestra "pantalla principal" ya sean botones, texto, el color del fondo, etc. pero ademas hay otros del mismo que nos permiten ingresar cosas como lo serian por ejemplo el archivo **`AndroidManifest.xml`** dentro de la carpeta `manifests` aquí van las opciones de el programa de por si, por ejemplo la opción de si queremos la barra superior que muestra el titulo de la app entre otras opciones bastante útiles.

---

### Hola Diseño

Al iniciar un proyecto vacío como ya dije se generan varios archivos xml, el principal es el archivo **`activity_main.xml`** donde irán los componentes "útiles" en nuestra app.

La estructura del archivo es el siguiente:

~~~xml
     <?xml version="1.0" encoding="utf-8"?>
<android.support.constraint.ConstraintLayout    
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello World!"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintTop_toTopOf="parent" />

</android.support.constraint.ConstraintLayout>
<!--este funciona similarmente a html por lo que asi son los comentarios-->
~~~

En este caso al crear una "Actividad vacía" se creara la pantalla principal con un texto que dice "hello world" que podemos diferenciar en el código por tener la etiqueta **`<TextView/>`** pero antes de ver eso, veremos algo mas básico.

---

### Layouts 

los layouts son elementos no visuales de la aplicación que se encargan de almacenar, ordenar y transformar los "widgets" que añadiremos a la misma aplicación.

Los layouts principales son los siguientes:

+ frame layout (este se encarga de "ajustar" los widgets alineados con su esquina superior izquierda posicionándolos uno sobre otro.

  este **no toma en cuenta o no requiere la propiedad `orientation` **y su etiqueta es:

  ~~~xml
  <FrameLayout aqui van las "opciones" de nuestra pantalla/>
  	<!--aqui van nuestros widgets-->
  </FrameLayout>
  ~~~

+ linear layout (este ajusta los "widgets" de forma horizontal o vertical dependiendo de como lo elijamos en la propiedad `orientarion=""`)

  su etiqueta es:

  ~~~xml
  <LinearLayout 
      android:orientation=""
      aqui van las "opciones" de nuestra pantalla>
  	<!--aqui van nuestros widgets-->
  </LinearLayout>
  ~~~

  si la propiedad `orientation=""` le aplicamos la opción `"horizontal"`  los widgets se armaran de forma horizontal de izquierda a derecha, pero si seleccionamos la opción `"vertical"` al igual que html, los widgets se pondrán desde arriba hacia abajo.

+ relative layout (este nos permite añadir elementos/wigets y ordenarlos tomando en cuenta otros elementos del mismo, este de por si es el mas fácil pues poner nuevos widgets y ordenarlos consta solo de "arrastrar y soltar los elementos" en el lugar de la pantalla que queramos para los mismos)

  su etiqueta es:

  ~~~xml
  <RelativeLayout aqui van las "opciones" de nuestra pantalla>
  	<!--aqui van nuestros widgets-->
  </RelativeLayout>
  ~~~

+ table layout (este nos permite agrupar componentes en `filas` y `columnas` en el mismo antes hay que elegir su alto y ancho para poder ordenar mejor nuestra "tabla")

  su etiqueta es:

  ~~~xml
  <TableLayout 
      aqui van las "opciones" de nuestra pantalla>
      
  	<!--aqui van nuestros widgets-->
      
  </TableLayout>
  ~~~

+ grid layout (este es similar al table, pues nos permite organizar nuestros widgets por filas y columnas, excepto que en este caso debemos definir la fila y columna de cada uno y el tamaño del layout de por si definiendo cuantas filas y columnas tendrá y distribuyendo estas en la misma )

  su etiqueta es la siguiente:

  ~~~xml
  <GridLayout
  	android:rowCount=""
      android:columnCount=""
      aqui van las "opciones" de nuestra pantalla>
      
  	<!--aqui van nuestros widgets-->
      
  </GridLayout>
  ~~~

+ constraint layout (este es el mejor de todos, este es similar a el relative layout pero este nos permite el poder editar directamente con el "editor de diseño" que viene con nuestro ide android studio para poder poner y cambiar nuestros widgets de forma mas fácil y hasta efectiva)

  este mismo viene por defecto cada vez que abrimos un nuevo proyecto, pero funciona casi igual que los demás a la hora de "Añadir sus opciones de pantalla"

  su etiqueta es:

  ~~~xml
  <android.support.constraint.ConstraintLayout aqui van las "opciones" de nuestra pantalla>
      
  	<!--aqui van nuestros widgets-->
      
  </android.support.constraint.ConstraintLayout>
  ~~~

---

 ###  Widgets

Los widgets son las características gráficas de nuestra aplicación perse, entre estos están los "botones, cuadros de texto, listas, etc".

---

#### Botones

El atributo botón como es obvio es principalmente un tipo de "imagen presionáble" que genera una acción instantánea al ser presionado.

Hay 3 tipos y son 

+ botón normal
+ flat button (botón sin bordes)
+ floating action button (botón circular que se suele usar para "Añadir cosas a nuestra pagina principal")

Pero ahora nos fijaremos en el primero principalmente.

Su etiqueta es **`<button />`** y en el espacio del mismo, van las propiedades del mismo y unas de estas son:

| Atributo             | Descripción                                                  |
| :------------------- | :----------------------------------------------------------- |
| `android:text`       | Permite cambiar el texto de un botón                         |
| `android:background` | Se usa para cambiar el fondo del botón. Puedes usar un recurso del archivo `colors.xml` o un *drawable* ademas de solo ingresar el color en hexadecimal. |
| `android:enabled`    | Determinar si el botón está habilitado ante los eventos del usuario. Usa `true `(valor por defecto) para habilitarlo y `false` en caso contrario. |
| `android:gravity`    | Asigna una posición al texto con respecto a los ejes x o y dependiendo de la orientación deseada.*Por ejemplo*: Si usas `top`, el texto se alineará hacia el borde superior. |
| `android:id`         | Representa al identificador del botón para diferenciar su existencia de otros views. |
| `android:onClick`    | Almacena la referencia de un método que se ejecutará al momento de presionar el botón. |
| `android:textColor`  | Determina el color del texto en el botón                     |
| `android:drawable*`  | Determina un drawable que será dibujado en la orientación establecida.  *por ejemplo*: Si usas el atributo `android:drawableBottom`, el drawable será dibujado debajo del texto. |

Aun que muchos de estos atributos se pueden editar luego en el mismo android studio.

Otra cosa muy importante es el entregarle una acción a los botones o mejor dicho darles una **función**, para esto debemos editar el id de nuestro botón, por ejemplo en nuestro botón le añadimos un id el cual en este caso será **`android:id="@+id/boton"`**.

Luego de esto en nuestra función principal de nuestro código debemos añadir lo que se ve abajo:

~~~kotlin
//esta es nuestra clase principal/main
class MainActivity : AppCompatActivity() {
    
    //esta es nuestra clase principal
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        //idBoton.funcion que lee/escucha cuando se presiona el boton
        boton.setOnClickListener(){
            //codigo que ejecutara el presionar el boton
        }
    }
}
~~~

Ahí podemos poner tanto codigos que cambien el texto de un dato, o muchísimas otras cosas que nos permiten interactuar con nuestra aplicación.

---

#### Campos de texto

Los campos de texto son texto que en ocasiones dependiendo del mismo se podrán editar y o ingresar como datos del mismo.

Su etiqueta es **`<TextView/>`** para textos planos in editables que solo deberían ser vistos y **`<EditText/>`** para entradas de texto con las que se puede interactuar y sus opciones funcionan igual que los botones , directamente nos centraremos en este ultimo.

Los atributos importantes del mismo son:

| **Atributo**                    | **Descripción**                                              |
| ------------------------------- | ------------------------------------------------------------ |
| android:hint="texto"            | nos permite dejar un texto de ejemplo en el atributo *por ejemplo:* email, contraseña, nombre, entre otros... |
| android:maxLength="numero"      | nos permite declarar el largo máximo de el "EditText" de cuantos caracteres puede haber en el mismo |
| androir:singleLine="true/false" | nos permite declarar si queremos que nuestro EditText soporte solo texto de una linea o multi linea (por defecto viene en `False` pero si usas un TextInput es `True`) |
| android:digits="caracteres"     | nos permite elegir los datos/números únicos que se podrán escribir por el teclado, ejemplo si le asignamos "1234567890" solo nos dejara ingresar esos números |
| android:enabled="true/false"    | nos permite ver cuando esta habilitado o deshabilitado la "casilla de entrada de texto" |
| android:inputType="constante"   | nos permite elegir que dato entregaremos en la entrada de texto y nos configura el teclado de acuerdo a ello |
| android:textSize=""             | nos permite elegir el tamaño de las letras en un texto como lo seria en un "TextView" y este se anota en sp (10sp, 20sp, 40sp, etc...) |

Las constantes pertenecientes al ultimo de estos son las siguientes:

| Constante           | Descripción                                              |
| :------------------ | :------------------------------------------------------- |
| `text`              | Recibe texto plano simple                                |
| `textPersonName`    | Texto correspondiente al nombre de una persona           |
| `textPassword`      | Protege los caracteres que se van escribiendo con puntos |
| `numberPassword`    | Contraseña de solo números enmascarada con puntos        |
| `textEmailAddress`  | Texto que será usado en un campo para emails             |
| `phone`             | Texto asociado a un número de teléfono                   |
| `textPostalAddress` | Para ingresar textos asociados a una dirección postal    |
| `textMultiLine`     | Permite múltiples líneas en el campo de texto            |
| `time`              | Texto para determinar la hora                            |
| `date`              | Texto para determinar la fecha                           |
| `number`            | Texto con caracteres numéricos                           |
| `numberSigned`      | Permite números con signo                                |
| `numberDecimal`     | Para ingresar números decimales                          |

Para cambiar el texto que hay dentro de este en kotlin debemos usar la siguiente función:

~~~kotlin
//el idTexto lo debemos definir en el xml del texto que hicimos
idTexto.setText("texto nuevo para el mismo")
~~~

---

### Intent

Como componente extra muy importante añadiré el valor del componente **Intent**.

Este es un componente traído de java que podemos usar en kotlin y su uso principal y para lo que mas usaremos este sera para interactuar con otras "actividades" o "pantallas" de la misma aplicación, desde cambiar entre actividades, hasta enviar datos entre ellas, el intent sirve para unificar nuestras pantallas de forma funcional.

Primero debemos asegurarnos de tener la librería añadida en el código y esta es:

~~~kotlin
import android.content.Intent //esta nos permite usar el comando Intent
~~~

ademas lo podemos añadir cuando iniciamos este componente, este mismo se debe iniciar con una constante en el código de nuestra actividad principal y la sintaxis de esta es la siguiente:

~~~kotlin
/*
1) determinamos nombre a la variable
2) la igualamos a la funcion instant
3) en la funcion instant añadimos 2 parametros (this (esta actividad) y la actividad 2)
4) marcamos que es una clase de java con (::class.java)
*/
val nombreInstant = Instant(this,actividad2::class.java)
~~~

Este paso es fundamental para poder llamar o mejor dicho "interactuar entre 2 actividades" y como ejemplo mas claro y necesario.

Para abrir una segunda actividad o pantalla usamos en este caso:

~~~kotlin
//esto debe ir dentro del boton que vamos a presionar
startActivity(nombreIntent)
~~~

Y para poder pasar datos de una actividad a otra podemos usar el intent de esta forma:

~~~kotlin
//activity 1

//definimos nuestro intent
val nombreIntent = intent(this, activity2::class.java)

//iniciamos variable a enviar
var nombre = Rodrigo

//enviamos el dato
nombreIntent.putExtra("nombreNuevo", nombre)
~~~

En la ultima linea implementamos en el putExtra un ("nuevo nombre de variable",  variableQuePasar) y en la activity 2 añadimos

~~~kotlin
//activity 2

//iniciamos una variable en esta actividad y la igualamos a la variable de la activity 1
val nombreActivity2 = intent.getStringExtra("nombreNuevo")
~~~

Cabe recordar que ese ".getStringExtra" se puede cambiar por ".getIntExtra" o otros tipos de datos.

---

### Mensaje de alerta

En nuestras apps pueden haber "mensajes de seguridad" "mensajes de error"  entre otros tipos, estos se llaman "cuadros de dialogo" o "mensajes de alerta", en mi caso el método para hacer estas requiere de código java aun que reitero, este sera el método que usare pues es el que conozco.

Para esto necesitamos la función `AlertDialog` junto a otros datos que están en la función main.

Como paso 1 debemos crear una variable constructora para "crear" ese mensaje de alerta.

~~~kotlin
val constructor = AlertDialog.Builder(this)
~~~

Como paso 2 añadimos el titulo y texto de este

~~~kotlin
constructor.setTitle("Este es el titulo de la alerta")
constructor.setMessage("este es el texto de la alerta")
~~~

Como paso 3 definimos los botones que tendrá este y su función

~~~kotlin
constructor.setPositiveButton("Comprendo",{dialogInterface, i ->
	//aqui va la funcion del boton
})
~~~

Por defecto este botón al presionarlo, hace que el mensaje de alerta se cierre, pero también podemos agregar otros 2 botones, cambiando esto y escribiendo `setNegativeButton` y `setNeutralButton` este ultimo siendo un botón que usualmente **no genera cambios**.

Y como ultimo paso, debemos usar la función `constructor.show()` , este va dentro de alguna función para hacer aparecer este mensaje aun que podemos ponerlo en la función main directamente y se iniciara el mensaje cada vez que se abre la misma.