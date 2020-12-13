# Python 3

**Documentación por Rodrigo Andres Seguel Nuñez**

Python es un lenguaje de programación interpretado y multiparadigma ademas de ser uno de los mas conocidos a día de hoy y también uno de los mas usados en ámbitos generales gracias a su gran numero de utilidades que tiene en campos de la tecnología, ya sea programación básica en consola, aplicaciones gráficas, programación web con Django, machine Learning y inteligencia artificial entre muchos otros campos.

Esta documentación no esta guiada a enseñar python al 100%, sino a ser de ayuda a la hora de repasar los datos en busca de contenido no recordado, por eso esta misma quizá no enseñe mas allá que lo que sabe el mismo escritor

---

## Indice

1. [**Conocimientos previos**](#Conocimientos-previos)
2. [**Comentarios**](#Comentarios)
   + [**Recomendaciones a la hora de comentar el código**](#Recomendaciones-a-la-hora-de-comentar-el-código)
3. [**Hello World**](#Hello-World)
4. [**Variables y tipos de datos**](#Variables-y-tipos-de-datos)
   + [**Tipos de datos (básicos)**](#Tipos-de-datos-(básicos))
   + [**Transformas/asegurar datos**](#Transformar/asegurar-datos)
   + [**Funciones de variables**](#Funciones-de-variables)
5. [**Operadores**](#Operadores)
   + [**Operadores aritméticos**](#Operadores-aritméticos)
   + [**Operadores de asignación**](#Operadores-de-asignación)
   + [**Operadores lógicos**](#Operadores-lógicos)
     + [**Conjugación lógica**](#Conjugación-lógica)
     + [**Disyunción lógica**](#Disyunción-lógica)
     + [**Negación lógica**](#Negación-lógica)
6. [**Condicionales**](#Condicionales)
   + [**Operadores de logica booleana**](#Operadores-de-lógica-booleana)
   + [**Condicional if**](#Condicional-if)
   + [**Condicional elif**](#Condicional-elif)
   + [**Condicional else**](#Condicional-else)
7. [**Colecciones**](#Colecciones)
   + [**Listas**](#Listas)
   + [**Tuplas**](#Tuplas)
   + [**Conjuntos**](#Conjuntos)
   + [**Diccionarios**](#Diccionarios)
8. [**Bucles**](#Bucles)
   + [**Bucle while**](#Bucle-while)
   + [**Bucle for**](#Bucle-for)
9. [**Funciones**](#Funciones)
10. [**Módulos**](#Módulos)
11. [**Paquetes**](#Paquetes)
12. [**Archivos externos**](#Archivos-externos)
13. [**Programación orientada a objetos**](#Programación-orientada-a-objetos)
    + [**Clases**](#Clases)
    + [**Métodos**](#Métodos)
      + [**Método constructor**](#Método-constructor)
    + [**Encapsulamiento**](#Encapsulamiento)
    + [**Herencia**](#Herencia)
    + [**Polimorfismo**](#Polimorfismo)
14. [**Tkinter**](#Tkinter)
    + [**Raíz**](#Raíz)
    + [**Frame**](#Frame)
    + [**Widgets**](#Widgets)
      + [**Label**](#Label)
      + [**Entry**](#Entry)
      + [**Text**](#Text)
      + [**Button**](#Button)

---

## Conocimientos previos

+ **Lenguaje de programación multiparadigma**: significa que un lenguaje soporta múltiples formas de programar, pero ojo, con "formas" me refiero a que puedes hacer tanto programación orientada a objetos como programación **funcional**, **imperativa**, y la menos usada por programadores (sarcasmo) **orientada a objetos**, esta ultima se enseñara mas adelante.

  

+ **Lenguaje de programación interpretado**: existen 2 tipos de lenguajes de programación **interpretados** y **compilados**, este ultimo funciona como un tipo de código que dice que hacer a la computadora en si, pero el interpretado dice que hacer a la aplicación misma.

  

+ **IDE**: o integrated development environment es como dice su nombre un entorno integrado de desarrollo, es un tipo de programa o editor de código que viene junto a muchas herramientas para el desarrollo de aplicaciones del mismo código, usualmente estos suelen estar preparados para sus propios lenguajes y algunos de ellos son.

  + Pycharm: entorno de desarrollo preparado para python-

  + Visual studio: entorno de desarrollo preparado para c# y otras tecnologías .net  aun que también. soporta otros lenguajes como lo son c++, javascript, python, etc (no confundirlo con visual studio code dado que ese es un editor de código envés de un IDE).

  + Android studio: entorno de desarrollo preparado para java enfocado a android y kotlin.

  + E.T.C.

    

+ **Editor de código**: el editor de código es la plataforma que se debe usar como programador para en efecto escribir y editar en ese lenguaje de programación, la diferencia principal entre este y los IDE es que los editores de código no vienen ideados para funcionar con un lenguaje especifico o una tecnología en especifico, sino puedes hacerlos funcionar con todos o casi todos los lenguajes, frameworks y otras tecnologías existentes, algunos de estos son.

  + Visual studio code (**el que estaré usando para esta "documentación/guía"**)

  + Vim

  + Atom

  + Sublime text

  + E.T.C.

    

+ **framework**: los frameworks son "estructuras conceptuales" que están compuestos por artefactos o módulos (los módulos los veremos mas adelante)  de software que pueden servir de base para desarrollar o programar software de distintas formas, algunos de ellos son.

  + Django (programación web en python)
  
+ Angular (creación y mantenimiento de aplicaciones web)
  
  + .net (programación de software nativo para windows en c#)
  
+ E.T.C.

---

## Comentarios

Cada vez que tienes que escribir un nuevo código necesitas documentarlo pues este puede ser bastante diferente al de los demás, por lo que el uso de comentarios ya sea en trabajos en equipo o trabajos propios es **muy necesario**.

Usualmente a la hora de escribir código la mayor parte del tiempo estarás leyendo código viejo y la menor parte se basa en escribir (pormenor en los casos de la gente que ya sabe programar o conoce como funciona algo del código) así que recuerda que a la hora de programar, pasaras mas tiempo leyendo que escribiendo el código en si, dado que en muchos casos olvidaras como se escribe algo y de hecho hasta los profesionales googlean partes de su lenguaje que no recuerden a la perfección.

Pero, puedes evitar romperte la cabeza buscando cosas demás si sabes comentar tu código, a lo que voy con esto es que si haces algo nuevo en tu código que buscaste en Internet, por ejemplo escribir digamos tu hola mundo, deberás comentar que hiciste, como lo hiciste, para que sirve y que sintaxis tiene de una forma bastante fácil de recordar y resumida de forma general.

~~~python
#esta es una linea comentada y se usa escribiendo un "#" antes del comentario

"""
esto es un comentario multi linea,
bastante util en caso que envez de solo querer comentar una linea,
quieras comentar algo en especifico de tu codigo como una explicacion de que hace
"""
~~~

Cabe recordar que los comentarios no afectan al código por lo que puedes escribirlos en casi cualquier lado sin afectar al mismo.

---

### Recomendaciones a la hora de comentar el código

+ **Comentarios con sentido**: a la hora de comentar tu código, procura que este comentario tenga algún tipo de sentido con lo que trata tu código, los códigos son para informar, no para hablar de tu perro y como te llevo a la idea de que seria genial hacer una app de audio-libros en idioma escoces traducidos a un tipo de braile basado en vibraciones, a no ser que eso lo pongas al inicio de tu código dado que la idea de esos comentarios es usualmente decir por que y para que esta hecho tu programa.

  

+ **No comentes cada linea M@&$%a**: por favor, comentar cada linea es algo **idiota** y  de hecho diría que incluso mas, pues es distinto hace algo así:

  ~~~python
  #la variable saludo tiene asignado el dato "holiiii"
  saludo = "holiiii"
  
  #defino una funcion que al ser llamada, imprime en pantalla la variable saludo
  def hola():
      print(saludo)
      
  #llamar a funcion
  hola()  
  ~~~

  A hacer lo siguiente: 

  ~~~python
  #la palabra oli esta asignada a una variable llamada saludo 
  saludo = "holiiii"
  
  def hola():"""defino como se llamara la variable/accion la cual se llama escribiendo el nombre de lavariable junto al parentesis que aparece al lado del nombre de la variable"""
      print(saludo)"""la accion que tiene esta funcion es imprimir en pantalla un mensaje el cual pertenece a la variable saludo el cual tiene como dato la palabra/string holiiii"""
  
  hola()"""el hola junto al parentesis o "hola()" llama a la variable para poder ejecutar la accion que tiene que en este caso es el print(saludo) osea que muestra en pantalla el saludo o la variable saludo cullo dato es holiiii"""
  ~~~

  Como verán el primero es mas claro y explica quizá algo que no conocen aun de una forma relativamente clara y precisa, mientras que la segunda simplemente me dan ganas de vomitar, asi que si van a comentar su código, háganlo bien por que no saben cuando tendrán que volver a el para poder recordar esa parte de código que hace mucho que no hacen.

  

+ **si compartirás tu código, ponle comentarios**: lo repetiré una vez mas, si tu código se escribe en equipo o tendrás que repasarlo a futuro, no hay mejor forma de facilitar la lectura que escribiendo comentarios útiles.

  

---

## Hello World

El "hello world" o "hola mundo" es una **"tradición"** en el mundo de la programación, esta se basa en que cuando aprendes un lenguaje de programación nuevo o mejor dicho cuando estés **aprendiendo** ese lenguaje, el primer código que hagas con ese lenguaje nuevo que sea uno que imprima en pantalla el mensaje de "hola mundo" o "Hello World" como es común dado el uso de ingles constante a la hora de programar.

En este caso en python usamos la función :

~~~  python
#imprimir en pantalla (variable o dato a imprimir)
print()
~~~

Pero, como la uso para escribir mi "hola mundo"???

Para escribir tu hola mundo con la función print() debes de escribir el dato entre los paréntesis y entre comillas dobles:

~~~python
print("Hola Mundo")
~~~

Esto mismo te mostrara un mensaje de "hola mundo" en la consola de visual studio code.

---

## Variables y tipos de datos

Las variables son hablando de forma para nada técnica, datos almacenados en la memoria de de la aplicación, que pueden estar asignados a un "nombre" o "acortador", el mismo sirve para (vaga la redundancia) acortar el código y hacerlo un poco mas legible o incluso mas fácil a la hora de programar el mismo.

Los mismos tienen la siguiente sintaxis:

~~~python
#nombre de variable = dato
nombre = "Rodrigo Seguel"	#string
edad = 17	#integer
altura = 1.78	#float

"""si vas a hacer una variable con un nombre largo no puedes usar espacios, debes usar o "_" o "CamelCase", osea puede ser: """
Vida_Jugador = 3
# o 
VidaJugador = 3
~~~

Usando este ejemplo podemos envés de usar:

~~~python
print("Rodrigo Seguel")
~~~

Usar:

~~~python
nombre = "Rodrigo Seguel"
print(nombre)
~~~

El primer ejemplo podemos ver que no se usa una variable, sino se ingresa el dato de forma inmediata, mientras que en el segundo el dato se arregla desde antes y a la hora de imprimirlo en consola se imprime el nombre (dato que puedes cambiar incluso asignándolo a un "input").

Estas variables necesitan/requieren que les asignes un tipo de dato y de estos hay muchos, en caso que quieras asegurar o transformar una variable estos a la hora de usarlos hay que usar su "abreviación".

---

### Tipos de datos (básicos)

| tipo de dato | abreviación | ejemplos       | descripción                                                  |
| :----------- | :---------- | :------------- | ------------------------------------------------------------ |
| string       | str         | "hola mundo"   | los string son cadenas de texto y se crean escribiendo algo entre comillas |
| integer      | int         | 1-2-3-4...     | los integer son los números enteros, números sin coma y desde el 0 hasta el  +infinito o el -infinito (esto de infinito puede variar, hasta ahora no se cual es el limite de un int) |
| float        | float       | 1.0,1.1,1.2... | los float o numero de coma flotante son números decimales, que a la hora de abarcar enteros los mostrara como decimal ejemplo un 1 lo mostrara como 1.0 |
| boolean      | n/a         | true/false     | los booleanos solo aceptan 2 datos, 1 y 0 donde 1 significa true y el 0 significa false (estos se usan mas en condicionales, tema que veremos mas adelante) |

---

### Transformar/asegurar datos

El transformar o asegurar variables se usa para que una **variable** tenga si o si un tipo de dato especifico a nuestra elección o pasar un dato de un tipo a otro, en casos específicos, por ejemplo en el caso que quieras concadenar números envés de sumarlos o otras cosas.

Una suma de números normal se podría hacer de la siguiente forma:

~~~python
#variables
NumeroStr1 = 1
NumeroStr2 = 2

#suma
print(NumeroStr1 + NumeroStr2) #el resultado de la suma es "3"
~~~

Si hacemos lo mismo pero transformando o asegurando las variables como string, la misma funcionaria así:

~~~python
#NumeroString = "transformador/asegurador"(variable)
NumeroString1 = str(1)
NumeroString2 = str(2)

#la suma se transforma en concatenacion
print(NumeroStr1 + NumeroStr2) #el resultado de la concatenacion es "12"
~~~

También se pueden asegurar o transformar para hacer union de variables que de otro caso no se podrian concretar, como ejemplo:

**Este no es valido:**

~~~python
#variables
Nombre = "Rodrigo"
Edad = 17

#accion
print("Hola!, soy " + nombre + "y tengo " + edad )
#esto daria un error de sintaxis dado que no se pueden sumar strings con numeros enteros
~~~

**Este si es valido:**

~~~python
#variables
Nombre = "Rodrigo"
Edad = str(17)

#accion
print("Hola!, soy " + nombre + "y tengo " + edad )
#este si podria concretarse dado que envez de sumar string + int, se suma string + string
~~~

***Extra:***

+ **Algunos transformadores especiales pueden ser los siguientes:**

~~~python
#transformador de binario
bin("dato")	#transforma dato en binario
int("dato en binario",2)	#transforma en este caso un dato binario en hexadecimal

#transformador de hexadecimal
hex("dato")	#transforma dato en hexadecimal
int("dato en hexadecimal",16)	#transforma en este caso un dato hexadecimal en un int
~~~

+ **Las funciones dobles tienen la siguiente sintaxis:**

  ~~~python
  #(variable1, variable2 = dato1, dato2)
  nombre, apellido = "Rodrigo","Seguel"
  ~~~

  

---

### Funciones de variables

Las funciones son "acciones" compuestas por lineas de código que pueden ser llamadas por su nombre, no seré muy técnico con ellas todavía pero en este caso veremos las funciones de variables y nos limitaremos a ver las que pueden aplicarse a estas mismas.

La sintaxis de las funciones aplicadas a las variables es asi:

~~~ python
#asignacion de variable
nombre = "rodrigo"

#mostrar en pantalla variable con funcion (en este caso la funcion "upper()")
print(nombre.upper()) 
~~~



Algunas de estas funciones de variables son: 

|          sintaxis          |                   definición                    |
| :------------------------: | :---------------------------------------------: |
|          upper()           |      transforma la variable en mayúsculas       |
|          lower()           |       transforma la variable en minúscula       |
|         swapcase()         |        mayúscula a minúscula y viceversa        |
|        capitalize()        |  la primera letra de la variable en mayúscula   |
|        replace(x,y)        |      reemplaza el dato "x" por el dato "y"      |
|  count(carácter o letra)   | cuenta cuantas veces se ve ese carácter o letra |
| startwith(palabra o letra) |     ¿empieza por esa palabra? True o False      |
| endswith(palabra o letra)  |     ¿termina por esa palabra? True o False      |
|          split()           |       separa texto por espacio o carácter       |
|          len(var)          |           longitud del 0 al infinito            |
|          index()           |                busca por indice                 |
|        isnumeric()         |           ¿es un numero? True o False           |
|         isalpha()          |             ¿es texto? True o False             |
|         type(var)          |     muestra que tipo de dato es la variable     |
|          dir(var)          |      muestra las funciones de la variable       |

---

## Operadores

Los operadores son símbolos que indican el tipo de operación que se le aplicara a los operandos (datos) y de estos, hay 3 tipos.

---

### Operadores aritméticos

Es un tipo de operador que manipula datos de forma matemática, estos datos usualmente son enteros (int) o decimales (float)

ejemplo: `datoX + datoY` 

| operadores |    definición    |
| :--------: | :--------------: |
|    `+`     |       suma       |
|    `-`     |      resta       |
|    `*`     |  multiplicación  |
|    `**`    |     potencia     |
|    `/`     |     división     |
|    `//`    | resultado entero |
|    `%`     | modulo (residuo) |

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

**Los operadores lógicos se dividen en 3 tipos principales y para verlos los comparare con los mismos operadores pero del lenguaje c# aun que también se usan en otros lenguajes de la misma manera.**

#### Conjugación lógica

el operador de conjugación es `and` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

| Python | Conjugación |  C#  |
| :----: | :---------: | :--: |
|  and   |      y      |  &&  |

Este operador se puede mencionar como **multiplicación lógica**.

| condición 1 | conjugación| condición 2| resultado|
| :---------: | :---------:| :---------:| :-------:|
|  false(0)   |   and(*)   |  false(0)  | false(0) |
|  false(0)   |   and(*)   |   true(1)  | false(0) |
|   true(1)   |   and(*)   |  false(0)  | false(0) |
|   true(1)   |   and(*)   |   true(1)  |  true(1) |

#### Disyunción lógica

El operador de disyunción es `or` y sirve para evaluar si el valor o condición del lado izquierdo **o** el del lado derecho se cumplen.

| Python | disyunción |  C#  |
| :----: | :--------: | :--: |
|   or   |     o      | \|\| |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado|
| :---------: | :---------: | :---------: | :-------:|
|  false(0)   |   and(+)    |  false(0)   | false(0) |
|  false(0)   |   and(+)    |   true(1)   | true(1)  |
|   true(1)   |   and(+)    |  false(0)   | true(1)  |
|   true(1)   |   and(+)    |   true(1)   |  true(1) |

#### Negación lógica

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

| Python | Negación |  C#  |
| :----: | :------: | :--: |
|  not   |    no    |  \!  |

Este operador funciona así:

| negación |  booleano  |  resultado  |
| :------: |  :------:  |  :-------:  |
|   not    |    true    |    false    |
|   not    |   false    |    true     |

En la introducción de los operadores mencione que eran 4 pero el cuarto, los [**Operadores de logica booleana**](#Operadores-de-lógica-booleana) tienen mas que ver con lo que son las condicionales, por eso los preferí poner en esa parte de la documentación

---

## Condicionales

Para hacer programas "funcionales" debemos comprobar constantemente si ciertas condiciones se cumplen o no, para esto usamos las condicionales.

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

~~~python
#si (condicion) se cumple
if 1 == 1: #verdad/true
    #ejecutar codigo
    print("algo")
#-----------------------------------------------------------------------------------------
#si (condicion) no se cumple
if 1 == 2: #falso/false
    #no ejecuta este codigo si es falso
    print("algo")
~~~

Si la condición en si se cumple se ejecuta el código, si no, no se ejecuta y continua con las siguientes lineas, ademas estas condiciones se pueden enlazar/anidar.

Ejemplo:

~~~python
if condicion1 == condicion1:
    if condicion2 != condicion1:
        #ejecuta este codigo
~~~

Cabe aclarar que en algunos casos y lenguajes hace falta usar "{}" para marcar cual es el código que ira en la condicional, en el caso de python se usa una tabulacion que se crea automáticamente al añadir los ":" al final de la condicional como se ve en los ejemplos anteriormente mostrados.

---

### Condicional elif

La condicional `elif` una abreviación de`else if` o `si no, si` esta condición actúa cuando la condición if o otra condición `elif` no se cumple.

Ejemplo:

~~~python
#primera condicion
if condicion1: #si esta condicion no se cumple, continua con la condicional siguiente
    codigo()
    
#segunda condicion    
elif (condicion2): #si el if no se cumple pero esta condicion si lo hace, ejecuta codigo
    print("esta condicion se cumple")
~~~

Al igual que el `if`, este puede anidarse para generar mas `if ` o `elif` dentro del mismo.

---

### Condicional else

La condicional `else` o `si no` sirve para ejecutar una acción si ni una de las condiciones antes expuestas es  correcta o se cumple

Ejemplo:

~~~python
#primeta condicion
if condicion1: #si esta condicion no se cumple, continua con la condicional siguiente
    codigo()
    
#segunda condicion    
elif (condicion2): #si esta condicion no se cumple, continua con la condicional siguiente
    codigo()   
    
else: #si ni una condicion se cumple, ejecuta la accion de esta condicional
    codigo()
~~~

Este al igual que todos, se puede anidar 

---

## Colecciones 

Aveces al almacenar datos en variables, queremos meter mas de un dato en una variable general,para esto usamos las colecciones, una colección permite agrupar varios elementos en una misma variable, estos se dividen en 4 distintos tipos.

---

### Listas

Son **Conjunto ordenado de elementos**, estos tienen la opción de añadir datos al mismo y se crean usando los corchetes `[]`

Ejemplo:

~~~python
Lista = ["dato1", 2, 3.0, [1, 2, 3, 4]]
~~~

Y como se muestra en el ejemplo se pueden meter en las listas tanto **strings**, **integers**, **floats**, **otras "colecciones"**, entre otros datos y variables.

Para llamar un dato de la lista por su numero de indice se usa `nombreLista[indice de dato a llamar]`.

Las listas tienen distintos **métodos** que sirven para editar la lista en si, su sintaxis al ser funciones es `lista.funcion(dato)` y estos son:

| métodos   | descripción                                                  |
| :-------- | ------------------------------------------------------------ |
| append()  | nos permite añadir/ingresar datos a la lista, estos pueden ser distintos tipos de datos y/o distintas colecciones entre otros datos (al agregar esta lista se añadirá la lista entre corchetes`[]`) **en el paréntesis va (el dato a añadir**). |
| extend()  | al igual que el `append` nos permite añadir datos a la lista, pero a la hora de añadir una lista, no se añadirá con los corchetes, sino cada dato por separado se añade de una lista a otra **en el paréntesis va el (dato a añadir **). |
| insert()  | al igual que el `append`  o el `extend` permite añadir datos a la lista, pero en este caso, te permite añadir el dato en un espacio determinado **en el paracentesis va (el numero del indice  donde añadir el dato, el dato a añadir**). |
| remove()  | nos permite remover o eliminar un dato de la lista **en el paréntesis va (el dato a remover de la lista**). |
| pop()     | nos al igual que el `remove` permite eliminar un dato, pero este es eliminado tomando en cuenta su numero de indice (si no se agrega un indice se elimina solo el ultimo dato). |
| clear()   | **vaciar lista**.                                            |
| index()   | devuelve el numero de indice del dato ingresado.             |
| count()   | devuelve cuantas veces se repite un elemento, letra, palabra o dato en general (también cuentan los espacios). |
| sort()    | ordena los datos de la lista (de A a Z) (si en el paréntesis escribimos `reverse=true` se ordena de Z a A). |
| reverse() | invierte los datos en la lista.                              |

---

### Tuplas

Las tuplas son como las listas, solo que contienen una diferencia principal **estos son inmutables o no editables** y su sintaxis básica se inicia usando paréntesis `()`.

Ejemplo: 

~~~python
tupla = ("dato1", 2, [1,2], (3,4))
~~~

Al igual que la lista pueden tener distintos tipos de datos ademas de otras colecciones, incluyendo otras tuplas.

Ademas estas también pueden llamarse por su numero de indice usando `tupla[numero de indice]`.

Sus métodos no son tantos como serian los de las lista de por si, pero los métodos que sirven aquí son: 

| métodos | descripción                                                  |
| ------- | ------------------------------------------------------------ |
| count() | devuelve cuantas veces se repite un elemento, letra, palabra o dato en general (también cuentan los espacios). |
| index() | devuelve el numero de indice del dato ingresado.             |

---

### Conjuntos

Son una colección en la que **su orden no importa**, al igual que las listas y tuplas, puede tener distintos tipos de datos dentro de la misma y esta se inicia usando llaves `{}`. 

Ejemplo:

~~~python
set = {"dato1", 2, 3.0, [4,5], (6,7)}
~~~

Estos pueden transformarse en listas usando la siguiente sintaxis:

~~~python
list({"dato1", 2, 3.0, [4,5], (6,7)}) #de set a lista
~~~

O puede convertirse una lista en un conjunto usando la siguiente:

~~~python
set(["dato1", 2, 3.0, [4,5], (6,7)]) #de lista a set
~~~

Esta colección no sirve con muchos de los métodos que contienen las listas y tuplas, así que para editarlas usamos los siguientes métodos con la sintaxis `set.metodo(accion)`:

| métodos   | descripción                |
| --------- | -------------------------- |
| add()     | añade datos al conjunto    |
| discard() | elimina datos del conjunto |
| clear()   | vacía el conjunto          |

#### operaciones de conjuntos

Los conjuntos o sets pueden " interactuar " de varias formas entre ellos mismos y que pueden facilitar nuestro uso de los mismos, **hay 4 tipos distintos de operaciones** y son:

1. Unión: se realiza con el carácter `|` y nos entrega **todos los datos que están en ambos conjuntos pero de forma unificada**.

   Ejemplo:

   ~~~python
   a = {1, 2, 3}
   b = {3, 4, 5}
   a | b
   >>> {1, 2, 3, 4, 5}
   ~~~

2. Intersección: se realiza con el carácter `&` y nos entrega solo **el o los datos que ambos conjuntos comparten**.

   Ejemplo:

   ~~~python
   a = {1, 2, 3}
   b = {3, 4, 6}
   a & b
   >>> {3}
   ~~~

3. Diferencia: se realiza con el carácter `-` y nos entrega **los datos que están en un conjunto pero no en el otro**

   Ejemplo: 

   ~~~python
   a = {1, 2, 3}
   b = {3, 4, 5}
   a - b
   >>> {1, 2}
   ~~~

4. Diferencia simétrica: se realiza con el carácter `^` y nos entrega los datos que están en un conjunto y en el otro, pero no en ambos

   Ejemplo:

   ~~~python
   a = {1, 2, 3}
   b = {3, 4, 5}
   a ^ b
   >>> {1, 2, 4, 5}
   ~~~

---

### Diccionarios

Los diccionarios son colecciones que se dividen en 2 datos **clave y valor**, se inicia con las llaves `{}` al igual que los conjuntos  y su sintaxis es la siguiente.

~~~python
diccionario = {"nombre":"Rodrigo", "edad":17, "lenguajes":["python", "c#", "javascript"]}
~~~

Un ejemplo de su uso, es que **si imprimo la clave se mostrara el valor y viceversa**.

~~~python
print diccionario["nombre"]
>>> Rodrigo
~~~

**para añadir o eliminar datos** usamos lo siguiente:

~~~python
#agrega elemento
diccionario["clave"] = "valor"

#elimina elemento
del(diccionario["clave"])
~~~

**para acceder a un dato dentro de una colección dentro del mismo diccionario** debemos usar la siguiente "función": 

~~~python
#en este caso usaremos un print
print diccionario["lista"][index de dato de lista "0"]
~~~

---

## Bucles

Los bucles son bastante similares a las condicionales, mientras se cumpla una función, se ejecuta un código todas  las veces que sea posible, hasta que esa misma condición deje de cumplirse.

---

### Bucle while

El bucle `while`  o `mientras`entre los 2 es el mas similar a las condicionales, pues la función de este se basa en que **mientras se cumpla una función** se ejecute una acción o el código que este en el bucle y de hecho este se traduciría casi exactamente así.

Ejemplo:

~~~python
#mientras la condicion sea true
while (condicion == true):
    #ejecuta el codigo que este aqui
    codigo()
~~~

el `código()` se ejecutara una y otra vez hasta que la condición sea False, cuando eso se cumpla, el bucle parara y el código dejara de repetirse y ejecutarse.

---

### Bucle for

El bucle `for` o `por ` es mas distinto a las condicionales, su funcionamiento principal se basa en **por cada "elemento" en "iterables"** ejecuta un código, (**los iterables son listas o  colecciones en general que permiten el recorrer sus elementos.

 la idea es que este bucle a comparación del `while` no puede o es muy difícil que sea infinito dado que este si o si tiene que tener un dato final el cual siendo una lista o otras colecciones o variables evita que este bucle se mantenga repitiéndose de forma constante e infinita

Ejemplo con una lista:

~~~python
#asignar variable a la lista
nums = [1, 2, 3, 4]

for n in nums: #por cada "dato" en la lista nums
    print(n) #imprime en pantalla un numero de la lista

#------------------------(esto se mostrara en la terminal)--------------------------------
>> 1
>> 2
>> 3
>> 4
~~~

En este caso el `print(n)̣` se ejecutara por cada dato en la lista, al haber 4 datos en la misma, esta se ejecutara 4 veces.

---

## Funciones

Con los conocimientos ya adquiridos hasta este punto de la documentación podemos proceder a algo muy útil del mismo código y de hecho, cuando descubras lo útil que es, no pararas de usarlo.

La función de (vaga la redundancia) las funciones principal mente es **similar a las variables** envés de guardar datos, **guardan código o acciones**.

Se crean usando la siguiente sintaxis:

~~~python
def nombreFuncion(parametros):
    #codigo
~~~

Estas funciones se llaman usando `nombreFuncion(parametros a añadir o nada)`.

Un ejemplo de el uso de parámetros es el siguiente:

~~~python
def suma(num1,num2): #en el parametro se proponen que datos tendra la funcion
    print(num1 + num2)
    
suma(2,5) #en el parametro se asigna "num1 = 2" y el "num2 = 5"

>>>7
~~~

Como extra, los parámetros pueden ser de varios tipos: **strings, integers, listas, tuplas, etc...** 

---

## Módulos

Son archivos `.py` o `.pyc` (python compilado) o un archivo escrito en c (para cpython) que posee su propio espacio de nombres y que pueden contener **variables, funciones, clases** e incluso **otros módulos**  y se usan para **organizar** y **reutilizar el código**.

Estos se crean de la siguiente forma:

1. Se crea un archivo `.py` y dentro del mismo se añaden las "funciones" del modulo.
2. Entras al código (**en el que quieres usar el modulo**) y importas el modulo con uno de los siguientes métodos:
   + Básico: usando `import nombreMetodo` y llamar lo con `nombreMetodo.funcion(parametros)`.
     + Complejo: usando `from nombreMetodo import * `(ese * se puede cambiar por la función especifica que quieres añadir a tu có		digo)  y llamarlo con `funcion(parametros)`.

---

## Paquetes

Son directorios o carpetas donde se guardan **módulos que están relacionados entre si** y su utilidad es **organizar** y **reutilizar código** 

Estos se crean de la siguiente manera:

1. Se debe crear una carpeta y meter un archivo dentro con el nombre `__init__.py` y ahí se meten los módulos creados.
2. Se añaden usando `from carpetaPaquete.modulo import claseAañadir`.

---

**paquetes distribuirles**

Son paquetes normales, solo que nos permite poder distribuir los mismos entre otros dispositivos dado que los paquetes normales no permiten hacer eso.

Estos se crean de la siguiente manera:

1. Se crea un archivo llamado `setup.py`en la carpeta raíz del paquete.

2. En el escribimos:

   ~~~python
   from setuptools import setup
   
   setup(
   esas opciones son
   name = "nombre de paquete"
   version = "1,0 por ejemplo"
   descripcion = ""
   author = ""
   author_email = ""
   url = ""
   packages =["nombre del paquete"]
   )
   ~~~

3. Se abre la carpeta donde esta el `setup.py` en terminal y se escribe `python3 setup.py sdist` **se generara una carpeta llamada`dist` y dentro del mismo estará el extraible `.zip` del paquete a distribuir.

**Y los paquetes se instalan escribiendo en la terminal `pip3 install nombrePaquete`**.

**si quieres desinstalar el paquete debes escribir en terminal `pip3 uninstall nombrePaquete`**.

---

## Archivos externos

Aprovechando que ya sabemos sobre módulos y paquetes hoy nos adentraremos en nuestro primer modulo extra `io` **crear, editar y controlar archivos externos** son una de las funciones mas usadas en este modulo por lo que sera lo que haremos hoy, esto es tanto útil para guardar información importante para nuestro programa, pero como dato importante, deben saber que este método **nunca debe ser usado para almacenar contraseñas y otra información importante de el usuario en archivos de texto simples** dado que ingresar a esta información es tan fácil como entrar en una carpeta  y buscar por los datos que necesitamos, si quieren hacer eso deberán hacerlo con bases de datos, pero eso ya lo veremos mas adelante

Mientras tanto, ¿cual es su uso principal?

+ guardar datos en archivos
+ guardar datos en base de datos

En este caso las carpetas se dividen en algo que llamamos **fases del manejo de archivo estos son 4:**

1. **creación**
2. **apertura**
3. **manipulación**
4. **cierre**

### ¿como usar el método `io`?

Como primer paso al igual que cualquier modulo, debemos importarlo usando:

~~~python
import io
#tambien podemos usar
from io import *
#ambos son validos pero en este caso usaremos el primero por ser el mas simple
~~~

Tras esto tendremos a nuestra disposición una buena cantidad de nuevas funciones en nuestro programa esperando a ser usadas.

Para crear el archivo debemos usar la siguiente sintaxis:

~~~python
nameCarpeta = open("rutaDeArchivo/nombreArchivo.formato", "modoDeApertura") 
#recordar que tanto la ruta com el metodo de apertura son "strings"
~~~

Así es como se crea una carpeta, pero nos falta hablar del método de apertura **este es la "Seguridad" del mismo archivo**, refiriéndome al hecho de los permisos que tiene el código para ejecutar el mismo archivo

**modos de apertura**

| modo de apertura | definición                                                   | ubicación del puntero                                        |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `r`              | Solo lectura                                                 | Al inicio del archivo                                        |
| `rb`             | Solo lectura en modo binario                                 | Al inicio del archivo                                        |
| `r+`             | Lectura y escritura                                          | al inicio del archivo                                        |
| `rb+`            | Lectura y escritura en modo binario                          | Al inicio del archivo                                        |
| `w`              | Solo escritura (sobrescribe el archivo si existe y Crea el archivo si no existe) | Al inicio del archivo                                        |
| `wb`             | Solo escritura en modo binario (sobrescribe el archivo si existe y Crea el archivo si no existe) | Al inicio del archivo                                        |
| `w+`             | Escritura y lectura (sobrescribe el archivo si existe y Crea el archivo si no existe) | Al inicio del archivo                                        |
| `wb+`            | Escritura y lectura en modo binario (sobrescribe el archivo si existe y Crea el archivo si no existe) | Al inicio del archivo                                        |
| `a`              | Añadido / append  (agrega contenido y crea el archivo si este no existe) | si el archivo existe, al final de este/si el archivo no existe, al inicio del mismo |
|`ab`|Añadido en modo binario (agrega contenido y crea el archivo si este no existe)|si el archivo existe, al final de este/si el archivo no existe, al inicio del mismo|
|`a+`|Añadido y lectura (agrega contenido y crea el archivo si este no existe)|si el archivo existe, al final de este/si el archivo no existe, al inicio del mismo|
|`ab+`|Añadido y lectura en modo binario (agrega contenido y crea el archivo si este no existe)|si el archivo existe, al final de este/si el archivo no existe, al inicio del mismo|

### Métodos de archivo

Aquí los métodos funcionan exactamente igual que cualquier otro metodo 

| métodos    | descripción                                                  |
| ---------- | ------------------------------------------------------------ |
| write()    | Escribir dato en el texto, este dato va dentro de comillas en el paréntesis |
| close()    | Cierra el archivo, recomendado después de iterar con el archivo |
| read()     | lee que hay en el archivo                                    |
| readline() | separa lineas de texto como listas                           |
| seek()     | puede tener 2 valores en el paréntesis, 0 y 1 **el 0 deja el cursor al final de los datos y el 1   los deja al inicio de los datos** |



---

## Programación orientada a objetos

Ya visto algunas cosas esenciales de python, podemos entrar en lo que seria un poco de python mas completo, y iniciaremos esta parte con **Programación orientada  a objetos**, pero

¿**Que es la programación orientada a objetos**? 

La programación orientada a objetos es un **paradigma de programación** o para lectores que no sepan del tema **es una forma de programar** que nos permite separar el código en lo que llamamos objetos, en estos definimos los datos de un objeto en variables y las acciones de los mismos, para ello separamos un objeto en 2 partes distintas, las cuales son **clases** y **métodos** 

+ Clase: **molde o plantilla** es donde se almacenan los **atributos (datos) y métodos (acciones)** del mismo objeto
+ Método: va dentro de la clase y en ellos se definen las acciones del mismo objeto usando **funciones**

---

### Clases

Las clases como ya dijimos es como una caja general, donde van tantos los datos en forma de variables ademas de las acciones del mismo objeto (pero estas van dentro de otras cajas o mejor dicho **funciones**)

Su sintaxis es la siguiente

~~~python
class NombreClase:
    pass #aqui van los datos, variables, colecciones y acciones/funciones del objeto

"""en este caso uso el pass como una palabra clave que me premite dejar una funcion o clase vacia sin afectar al codigo de por si"""
~~~

Ejemplo:

~~~python
class auto:
    largoChasis = 250
    anchoChasis = 120
    ruedas = 4
    enmarcha = false
~~~

---

### Métodos

Los métodos, como ya los mencionamos, se pueden resumir como cajas que van dentro de las cajas mas grandes (clases) y en estas **se ingresa el código de la acción que ejecutara cada objeto**

Su sintaxis junto a una clase es la siguiente:

~~~python
class nombreClase:
    def funcion(self):
        pass #aqui va el codigo/accion que ejecuta el objeto
~~~

Ejemplo de uso:

~~~python 
def arrancar(self):
    self.enmarcha = true
    #el self es una forma de acortar el codigo, seria lo mismo usar arrancar.enmarcha=true
   
~~~

Luego de hacer esto hay que instanciar el objeto, cosa que se hace de la siguiente manera:

~~~python
nombreObjeto = ClaseDeLaQueTomaPropiedades()
#luego, cuando querramos llamar el objeto para aplicar un cambio o actuar sobre el hay que llamarlo por el "nombreObjeto"
~~~

Para llamar el método o la función de un objeto para que se ejecute hay que usar 

~~~python
nombreObjeto.nombreFuncion()
~~~

Para llamar las propiedades de una clase **sus atributos** mas específicamente, no debemos llamarlo como una función o una acción del mismo objeto, sino hay que hacerlo así: 

~~~python
nombreObjeto.atributo #no lleva parentesis
~~~

Este ultimo caso para dar un ejemplo mas general nos permite por ejemplo si es algo que queremos el **llamarlo solo las variables, datos o colecciones que generan los mismos atributos del objeto**.

#### Método constructor

Este es un método especial, en este no se ingresan acciones como lo son en los métodos tradicionales, sino lo que serian los **atributos** principales del objeto, este método tiene la característica principal de ser el primero en ejecutarse a la hora de instanciar un objeto, ademas nos permite tener un código mas limpio al no tener las variables y datos en general de la clase sueltas por ahí y usando la metodología de las cajas, **tener esos atributos dentro de cajas que los organicen**.

Se crean con la siguiente sintaxis:

~~~python
def __init__(self): #ese self se puede acompañar de los parametros de la funcion
    pass #este pass se puede cambiar por el codigo que ejecute la accion de la funcion
~~~

Como recordatorio:

+ Al crear datos, estos se ejecutan de inmediato
+ Este método no retorna datos (`return`)
+ es opcional, pero es común declararlo y usarlo para iniciar los atributos del objeto

---

### Encapsulamiento

El Encapsulamiento es una característica especial de la programación orientada a objetos, esta nos permite definir el **nivel de acceso a los atributos y métodos** para así definir que partes del código tienen permiso para iterar o interactuar con el objeto o las partes que componen el mismo.

Estos se dividen en 3 tipos distintos

+ Publico: **se puede acceder desde cualquier parte del código** en el caso de python no hace falta decir cuando una clase o método es publico, dado que estos con solo existir ya lo son, a diferencia de otros lenguajes que requieren el uso de una palabra clave `public` para definir cuando uno de estos lo es. 

+ Protegido: **se puede acceder a las clases y métodos solo desde su clase y sub-clases**, para que una clase o método sean **protegidos** requiere usar la siguiente sintaxis:

  ~~~python
  class Ejemplo:
      _ejemplo = "soy un atributo protegido"
  ~~~

  Y en métodos:

  ~~~python
  def _Ejemplo():
      pass
  ~~~

+ Privado: **solo se puede acceder desde la clase que se define**, para que una clase o método sea **privada** requiere usar la siguiente sintaxis:

  ~~~python
  class Ejemplo:
      __ejemplo = "soy un atributo privado" #usa doble "_"
  ~~~

  Y en métodos:

  ~~~python
  def __Ejemplo():
      pass
  ~~~

---

### Herencia 

La herencia es otra característica especial de la programación orientada a objetos, esta nos permite **reutilizar código o compartir características entre objetos**, lo podemos definir mejor con la metodología de padre e hijo.

**Hay 2 clases, una que es padre, quien genera esa información y acciones tanto como una clase "hijo" que se encarga de recibir esa información y acciones y adaptarla para ellos mismos**

Ejemplo: 

~~~python
#clase padre
class padre:
    def__init__(self):
        #self.datos
    def accion(self):
        #self.acciones
        
#clase hijo
class hijo(padre): #en el parentesis va la "clase padre"
    codigo 
    #dado que heredo metodos y datos de la clase padre, no tengo que reescribirlos aqui
    #si quiero añadir datos nuevos y metodos nuevos, solo debo agregarlos en la clase hijo
~~~

---

### Polimorfismo 

El polimorfismo (para variar) es otra característica especial de la programación orientada a objetos, mas que nada es algo especifico de esta misma, el polimorfismo ocurre cuando un objeto **dependiendo del contexto** puede cambiar de forma y comportamiento

De hecho es exactamente algo que mencionamos en la parte de la "herencia"

Ejemplo:

~~~python
#clase padre
class padre:
    def__init__(self):
        #self.datos
    def accion(self):
        #self.acciones
        
#clase hijo
class hijo(padre):
    def estudiar(self):
        pass
"""lo que acaba de pasar es que hice una clase padre e hijo, pero en la clase hijo aplique polimorfismo por el hecho de que mantuve los datos y metodos PERO!!! añadi un metodo mas (el metodo estudiar) y el que esto pueda ocurrir es una muestra del polimorfismo"""
~~~

---

## TKinter

Tkinter es un "modulo" de python que nos permite la creación de interfaces gráficas en python, **lamentablemente no debes esperarte muchos diseños hermosos** dado que este modulo esta hecho solo para implementar estos "menús" pero no necesariamente hacerlos de forma estética.

Los interfaces se dividen en 2 partes:

+ CLI: interfaz en linea de comandos.
+ GUI: interfaz gráfica.

En Windows se instalan por defecto, pero en mi caso de Ubuntu 20.04 debo instalarlo usando: 

`sudo apt-get install python3-TK`

Para importar el modulo,  lo llamamos como un modulo común, pero hay 2 formas.

~~~pyhton
#forma 1
import tkinter
#en este caso para usar las funciones debemos usar "tkinter.funcion()"

#forma 2
from tkinter import *
#en este caso para usar las funciones debemos usar solo funcion()
~~~

**En este caso usaremos la segunda forma y el programa a la hora de abrirse en windows por lo menos al mismo tiempo que se abre, abre una consola, para evitar eso cambiamos la intención del programa, de `.py` a `.pyw`**.

---

### Raíz

La raíz es la ventana de por si, donde aparece el nombre de la misma, las opciones como **minimizar, agrandar/achicar ventana y cerrar ventana**.

En este tipo de "contenedor" se ingresan tanto los **frames** como los **widgets.**

~~~python
#se crean asi
root=Tk()	#se le atorga un "acotrador o variable" a lafuncion de raiz
root.funciones()
root.mainloop()	#sin esto, la ventana no se mantendra abierta
~~~

**Funciones de raíz**

| función     | definición                                                   |
| ----------- | ------------------------------------------------------------ |
| title()     | le agregas un titulo a la ventana                            |
| resizable() | se puede cambiar el tamaño? (x,y) puede ser 0 o 1            |
| geometry()  | tamaño en ("XxY")                                            |
| destroy()   | cierra la ventana                                            |
| config()    | te permite añadir otras opciones como **bg="blue"** entre otros tipos de configuraciones. este ademas sirve en frames |

---

### Frame

Este es un "contenedor" que va dentro de la raíz, y en la misma se suelen ingresar los Widgets, aun que la raíz también puede almacenar o tener dentro suyo widgets.

~~~python
#se crean asi
myFrame=Frame(root) en el parentesis van el "padre/maestro "
myFrame.funciones()
myFrame.empaquetado(opciones de empaquetado) #este al igual que el mainloop es necesario!
~~~

El empaquetado antes mencionado puede ser de 3 formas distintas.

+ pack() **este es el empaquetado simple y en el paréntesis van las opciones de empaquetado.**

+ place() **este empaquetado te permite decir las coordenadas del frame** ejemplo: (x=10,y=10).

+ grid() este empaquetado nos permite ubicar el frame en una "cuadricula" que se ajusta de forma automática al tamaño de la ventana, esta se divide en "row = filas" y "column = columna".

  ~~~python
  #ejemplo de uso:
  myFrame.grid(row=1,column=1) #las filas y columnas empiezan desde el 0
  
  #puedes junto al row y column agregar un stcky, esto debes igualarlo a la letra que represente un punto cardinal, ejemplo west(w) para apegar el objeto del grid a esa parte del mismo (por defecto es "center")
  ~~~
  
  Los grid pueden compartir un widget como un botón y para eso hay que usar la opción `columnspan=numero de columnas que comparten ese objeto`.

---

### Widgets

Estos son "aditamentos o accionadores" que se añade en el frame o la raíz, algunos de ellos son:

+ button (botones)
+ entry (entradas de texto)
+ label (texto)
+ checkbutton (botón de chequeo "true or false")
+ menu ()
+ message ()
+ radiobutton (botón de chequeo circular)
+ scrollbar (barra de "scroll")
+ text (como entry pero preparado para textos largos)

---

#### Label

Sirve para mostrar texto o imagenes y este texto no se puede editar o interactuar con el.

sintaxis

~~~python
varLabel=Label(frame,otras opciones) #primero va el maestro/padre y luego las opciones
varLabel.empaquetado()
~~~

---

**opciones de label**

estas no son funciones, por lo que su sintaxis no es la de una, para usar estos en un label se escriben (opción=eleccion).

| opción | definición                                                   |
| ------ | ------------------------------------------------------------ |
| text   | texto que se muestra en el label                             |
| anchor | controla la posición del texto si hay espacio para el mismo (center por defecto) |
| bg     | color de fondo                                               |
| bitmap | mapa de bits que se mostrara como gráfico                    |
| bd     | grosor de borde (2px por defecto)                            |
| font   | tipo de fuente                                               |
| fg     | color de la fuente                                           |
| width  | ancho (en caracteres)                                        |
| height | altura (en caracteres)                                       |
|image|muestra imagen en lugar de texto|
|justify|el cursor del texto (right\|) (\|left)|

**¿como se añaden las imágenes?**

`miFoto=photoImage(file="ruta/de/la/imagen")` esto se puede meter en un label

---

#### Entry

Son cuadros para introducir texto.

sintaxis:

~~~python
varEntry=Entry(frame,otras opciones)
varEntry.empaquetado()
~~~

otras opciones son:

+ padx=**numero** (separación en px en eje x -)
+ pady=numero (separación en px en eje y |)

**El .config también sirve en este.**

**Con `show="datoEJEMPLO"` el dato escrito en el mismo se mostrara por cada letra escrita (como si de una contraseña se tratase).**

---

#### Text

el text es un entry capacitado para poder tener largos textos introducidos en el mismo.

sintaxis:

~~~python
varTexto=Text(frame,otras opciones)
varTexto.empaquetado()
~~~

**extra: ¿como hacer un scroll-bar??**

~~~python
varScroll=Scrollbar(varTexto,command=varText.yview)
varscroll.grid(row=x,column=y,sticky=nsew)
#el sticky=nsew hace que la barra de scroll se adapte al widget
varScroll.config(yscrollcommand=scrollvert.set)
~~~

---

#### Button

sintaxis

~~~python
varBoton=Button(frame, command=funcion(), otras opciones)
varBoton.empaquetado()
~~~

el command en las opciones del botón, sirve para llamar la función que ejecuta el botón en si.

**ejemplo aplicar acción a botón.**

en este caso lo que haremos sera escribir un texto en un entry (al presionar el boton)

~~~python
#se importa la libreria tkinter
from tkinter import *

#se crea la raiz
root=Tk()
root.resizable(0,0)

#se defien variable y se le otorga un string de variables
variableHola=StringVar()

#luego a nuestro entry se le aplica esta variable con la opcion "textvariable"
#ademas se le agrega el justify para que el texto salga de derecha a izquierda 
miEntry=Entry(root,justify=RIGHT, textvariable=variableHola)
miEntry.grid(row=1, column=1)

#se crea la funcion que escribe el texto en el entry
def hola():
    variableHola.set("holiiiii")

#se crea el boton y se le asigna esa funcion
botonHola=Button(root, text="presioname", command=hola)
botonHola.grid(row=2,column=1)

#se mantiene la raiz abierta
root.mainloop()
~~~

---
