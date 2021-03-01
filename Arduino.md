# Arduino

Arduino, la magia para todos los amantes de la robótica y programación, una placa arduino es un micro controlador programable que nos permite conectarlo a distintos tipos de sensores y generar circuitos eléctricos programados en el mismo.

Este podemos aplicarlo en proyectos de robótica, estilo de vida, mecánica, etc... y parece que el numero de proyectos no tiene fin.

Cabe recordar que dijimos que es programable, de hecho tiene un lenguaje de programación "propio", digo propio entre comillas por el hecho de que ese lenguaje es técnicamente c++ solo que principalmente adaptado a lo que es la programación de como es obvio este mismo, envés de ir 100% orientado a la programación de software

----

## Indice

+ [Hardware](#Hardware)
  + [¿Micro controladores y micro procesadores?](#¿micro-controladores-y-micro-procesadores?)
  + [La placa](#La-placa)
  + [Pines de alimentación eléctrica](#Pines-de-alimentación-eléctrica)
  + [Pines análogos](#Pines-análogos)
  + [Pines digitales](#Pines-digitales)
+ [Lenguaje Arduino](#Lenguaje-Arduino)
  + [Sintaxis básica](#Sintaxis-básica)
  + [Hello world](#Hello-world)
  + [Variables y tipos de datos](#Variables-y-tipos-de-datos)
    + [Tipos de datos básicos](#Tipos-de-datos-básicos)
    + [Constantes](#Constantes)
  + [Operadores](#Operadores)
    + [Operadores aritméticos](#Operadores-aritméticos)
    + [Operadores de asignación](#Operadores-de-asignación)
    + [Operadores lógicos](#Operadores-lógicos)
      + [Conjugación lógica](#Conjugación-lógica)
      + [Disyunción lógica](#Disyunción-lógica)
      + [Negación lógica](#Negación-lógica)
    + [Condicionales](#Condicionales)
      + [Operadores de lógica booleana](#Operadores-de-lógica-booleana)
      + [Condicional if](#Condicional-if)
      + [Condicional else if](#Condicional-else-if)
      + [Condicional else](#Condicional-else)
      + [Instrucciones de selección condicional](#Instrucciones-de-selección-condicional)
    + [Bucles](#Bucles)
      + [for](#for)
      + [while](#while)
      + [do while](#do-while)
      + [Instrucción break y continue](#Instrucción-break-y-continue)
    + [Librerías](#Librerias)
    + [Funciones](#Funciones)
      + [Funciones especiales](#Funciones-especiales)
        + [Funciones Digital I/O](#Funciones-Digital-I/O)
        + [Funciones Analog I/O](#Funciones-Analog-I/O)

---
## Hardware

Arduino Se separa en 2 partes principales, la parte del Hardware (la placa en si y sus componentes electrónicos) ademas del software (la parte intangible del arduino, en este caso el código/ lenguaje arduino)

En esta parte hablare algo sobre esta parte del arduino, específicamente la parte técnica del hardware, tanto de como funciona y de otros datos teóricos.

---
### ¿micro controladores y micro procesadores?

 Una duda bastante común es la de **en que se diferencian los micro controladores y microprocesadores**??.

pues es realmente muy simple, un micro controlador(arduino) es un computador de forma lógica pero este va simplemente dirigido a hacer proyectos de robótica y electrónica, principalmente por ejemplo un arduino lo usaras con servo motores, botones, leds, etc...

mientras que un micro procesador (como ejemplo un raspberry pi) son en su defecto computadores completos (casi).

Dado que estos son igual placas, solo que principalmente esta dirigido a usarse como un computador de verdad, con mouse, teclado, pantalla, entre otros ademas de poder servir como un servidor.

Por ahora esto sera todo lo que hablaremos de los micro procesadores dado que su uso es muy común considerándolo un computador simple y por ultimo pero no menos importante **no tengo uno :,D**.

---

### La placa

El arduino se divide en varias partes, el pcb, los conectores, los pines, el microchip, entre otros componentes necesarios, pero aquí veremos los principales y de forma mas especifica, lo que usaremos de forma básica con el arduino:

+ conexion a usb (permite conectar un arduino al pc o a la corriente por medio del mismo).
+ conexion a la luz (nos permite hacer una conexión directa a un enchufe o batería).
+ pines de alimentación eléctrica (nos permiten ejercer varias acciones pero las mas importantes son, entregar energía al arduino, sacar energía del arduino a una protoboard o similares, reiniciar el arduino, entre otras cosas).
+ pines de entrada y salida de datos análogos y digitales (sirven para proporcionar energía a lo que deseemos controlar, ya sea prender una luz cuando queremos o apagarlo cuando ya no nos sea necesario o incluso mover un motor, entre otras cosas que ya veremos mas adelante).
  + entrada análoga: estas entradas pueden tener datos graduales, como lo seria calcular si una fuerza eléctrica es baja,media,alta de forma precisa.
  + entrada digital: estas entradas se caracterizan por ser binarias, 1/0, energía/no energía prendido/apagado, etc...
+ botón de reinicio (nos permite reiniciar el funcionamiento del arduino con solo presionarlo, en caso de que nuestro arduino no tenga uno solo debemos conectar el cable de tierra a el pin de reset y el arduino se reiniciara).

en general esto es lo principal pero también hay otras características que cambian dependiendo del modelo, por ejemplo el arduino nano solo tiene entrada mini usb pero los pines son menos, o el arduino leonardo que es similar a un arduino uno solo que cambia su puerto de usb y el de conexión a corriente por solo un micro usb, entre otras cosas que pueden diferenciar distintos tipos de "Arduino", cabe recalcar que esta documentación va **preferiblemente pensada para arduino uno** por lo que luego de esta te veras en la capacidad de aplicar todo esto a otros modelos de arduino compatibles u oficiales.

---

### Pines de alimentación eléctrica

Estos son fáciles de encontrar, en el caso del arduino uno estos están en la esquina inferior izquierda del mismo, bastante cerca del enchufe de electricidad directa.

Estos pines se conforman principalmente de los siguientes:

+ reset (al conectar tierra o - en el mismo, el arduino se reinicia).
+ 3.3v (este saca energía del arduino equivalente a 3.3v).
+ 5v (este saca energía del arduino equivalente a 5v).
+ GND (son 2 puertos específicamente para hacer conexión a negativo/tierra (ground)).
+ VIN (entrada de electricidad, podemos ingresar un cable con carga positiva para alimentar el arduino).

---

### Pines análogos

Estos se encuentran a la derecha de los pines de alimentación, en el caso del arduino uno son 5 pines enumerados **desde A0 hasta A5** y ambos permiten la entrada de datos analógicos como lo serian:

+ entrada: stick análogo, gatillo de joystick, sensor de presión, entre otros.
+ salida: nivel de luz de un led, cuanto mover un servomotor, entre otros.

---

### Pines digitales

Estos se encuentran en la parte superior de el arduino y se caracterizan por que solo recibe energía de forma "binaria" 0-1 reciben o no reciben energía.

De por si esa es la función de los pines digitales de forma normal, pero también hay otro tipo de pin digital y son los pines digitales (**PWM~**)

Este tiene la capacidad de recibir información de forma análoga y entregarla como digital.

Aparte como pines especiales podemos marcar 2 como muy útiles y estos son los pines **TX y RX**.

Estos pines nos permiten enviar y recibir datos entre dispositivos,por ejemplo enviarlos de un arduino a otro. de un raspberry pi al arduino, etc...

cabe recalcar que el pin **TX = salida de datos** y **RX = entrada de datos**.

A todo esto se agrega un pin especial y necesario, el pin de **GND** o ground o tierra-.

---

## Lenguaje Arduino

Como ya dijimos, el código de arduino toma mucho de sus bases desde lo que es el lenguaje de c++ solo que el mismo tiene algunos cambios, pero lo básico de este lo veremos ahora mismo.

La documentación de este mismo lo distribuiré igual que todas las otras documentaciones que hice anteriormente.

---

### Sintaxis básica

Al abrir el arduino ide debería aparecernos la sintaxis básica pero en caso que no, es la siguiente:

~~~c++
//asi se crea un comentario en c++
/*este es un comentario
en bloque*/

//aqui tambien van las librerias a incluir
//aqui van las variables con las que trabajaremos

void setup() { 
    //esta funcion es la basica, se configuran los pines, componentes y las variables
}

void loop(){
    //esta funcion se repetira constantemente
    //ya sea comprobando un estado o leyendo lo que escriba nuestro input
}
~~~

---

### Hello world

En este caso y a diferencia de otros lenguajes, no nos aplicaremos en el factor de necesitar mostrar un mensaje en pantalla, sino lo que haremos sera hacer un led parpadear de forma continua, así ver cosas básicas del mismo.

El hola mundo es el siguiente:

Primero recordar que debemos conectar un led en el pin GND (-) y en el pin 13 (+).

~~~c++
int pinLed = 13; //esta variable la usaremos como el numero del pin donde tenemos el led

void setup() { 
	pinMode(pinLed,OUTPUT); //configuramoms el pin 13 como salida de datos
}

void loop(){
    digitalWrite(pinled,HIGH);	//la energia del pin 13 es alta o 1 (pasa energia)
    delay(1000); //esperar 1 segundo antes de continuar con la sig linea
    digitalWrite(pinled,LOW); //la energia del pin 13 es baja o 0 (deja de pasar energia)
    delay(1000); //esperar 1 segundo antes de reiniciar la funcion
    cout << "este es un mensaje en consola"
}
~~~

Pues en este caso es una de las cosas mas básicas que podemos hacer con la programación de arduino, así que ahora continuamos con lo indispensable.

---

### Variables y tipos de datos

como ya sabemos, cada lenguaje tiene sus tipos de datos con los que trabajar, en caso de este lenguaje no cambia nada, por eso debemos saber que las variables y tipos de datos son muy similares a como funcionan en otros lenguajes con tipado estático, osea que antes de iniciar una variable, debemos decir que tipo de dato sera.

---

#### Tipos de datos básicos

| tipo de dato  | instanciador  |   ejemplos    |                         descripción                          |
| :-----------: | :-----------: | :-----------: | :----------------------------------------------------------: |
|   boleanos    |    boolean    | true / false  | los datos boleanos se caracterizan por tener solo 2 estados, true y false (1 y 0) |
|     char      |     char      |  a; b; c...   | los datos char se caracterizan por solo almacenar un carácter como lo seria A; B; C... (el carácter va entre '') |
|     byte      |     byte      |      132      |     este tipo de dato almacena números desde el 0 al 255     |
|    enteros    |      int      |     13245     | este tipo de dato almacena números desde el -32768 hasta el 32768 |
|     word      |     word      |     65100     |    este tipo de dato almacena números desde el 0 al 65535    |
|     short     |     short     |    -13245     |                  funciona igual que los int                  |
|     long      |     long      |  -2.100.965   | este tipo de dato almacena números desde el -2.147.483.648 al 2.147.483.648 |
| unsigned long | unsigned long | 2.342.168.321 | este tipo de dato almacena números desde el 0 hasta el 4.294.967.295 |
|     float     |     float     |     1,234     |     este tipo de dato almacena números con coma flotante     |

ya con esto podemos asegurar que la forma en la que se inicia la variable es con la siguiente sintaxis:

`tipoDeDato nombreVariable = datoEnLaVariable; `

---

#### Constantes

Las constantes son como las variables, excepto que estas no pueden cambiarse mientras el código corre, funcionan igual que las variables normales pero usan la siguiente sintaxis:

`const tipoDeDato nombreConstante = datoEnLaConstante;`

---

### Operadores

Los operadores son símbolos que indican el tipo de operación que se le aplicara a los operandos (datos) y de estos, hay 3 tipos.

---

#### Operadores aritméticos

Es un tipo de operador que manipula datos de forma matemática, estos datos usualmente son enteros (int) o decimales (float)

ejemplo: `datoX + datoY` 

| operadores |    definición    |
| :--------: | :--------------: |
|    `+`     |       suma       |
|    `**`    |     potencia     |
|    `-`     |      resta       |
|    `*`     |  multiplicación  |
|    `/`     |     división     |
|    `//`    | resultado entero |
|    `%`     | modulo (residuo) |

---

#### Operadores de asignación

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

#### Operadores lógicos

Cuando trabajemos con condicionales habrán momentos donde querremos hacer "comparaciones" entre dos valores en las mismas condicionales o incluso validar dos al mismo tiempo.

**Los operadores lógicos se dividen en 3 tipos principales y para verlos los comparare con los mismos operadores pero del lenguaje Python aun que también se usan en otros lenguajes de la misma manera.**

##### Conjugación lógica

el operador de conjugación es `and` y sirve para evaluar si el valor o condición del lado izquierdo **y** el del lado derecho se cumplen.

| C++  | Conjugación | Python |
| :--: | :---------: | :----: |
|  &&  |      y      |  and   |

Este operador se puede mencionar como **multiplicación lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |    &&(*)    |  false(0)   | false(0)  |
|  false(0)   |    &&(*)    |   true(1)   | false(0)  |
|   true(1)   |    &&(*)    |  false(0)   | false(0)  |
|   true(1)   |    &&(*)    |   true(1)   |  true(1)  |

##### Disyunción lógica

El operador de disyunción es `or` y sirve para evaluar si el valor o condición del lado izquierdo **o** el del lado derecho se cumplen.

| C++  | disyunción | python |
| :--: | :--------: | :----: |
| \|\| |     o      |   or   |

Este operador se puede mencionar como **unión o suma lógica**.

| condición 1 | conjugación | condición 2 | resultado |
| :---------: | :---------: | :---------: | :-------: |
|  false(0)   |   \|\|(+)   |  false(0)   | false(0)  |
|  false(0)   |   \|\|(+)   |   true(1)   |  true(1)  |
|   true(1)   |   \|\|(+)   |  false(0)   |  true(1)  |
|   true(1)   |   \|\|(+)   |   true(1)   |  true(1)  |

##### Negación lógica

El operador de negación es `not` se encarga de **transformar** booleanos de true a false y viceversa

| C++  | Negación | python |
| :--: | :------: | :----: |
|  !   |    no    |  not   |

Este operador funciona así:

| negación | booleano | resultado |
| :------: | :------: | :-------: |
|    !     |   true   |   false   |
|    !     |  false   |   true    |

En la introducción de los operadores mencione que eran 4 pero el cuarto, los [**Operadores de logica booleana**](#Operadores-de-lógica-booleana) tienen mas que ver con lo que son las condicionales, por eso los preferí poner en esa parte de la documentación

---

### Condicionales

Para hacer programas funcionales debemos comprobar constantemente si ciertas condiciones se cumplen o no, para esto usamos las condicionales.

#### Operadores de lógica booleana

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

#### Condicional if

La condicional if funciona casi completamente igual que en otros lenguajes como lo serian c# en este caso especial por que ya conozco el lenguaje desde antes.

La condicional `if` (si) se basa en una pregunta bastante fácil tanto de ejecutar como de responder y funciona de la siguiente forma:

~~~c++
//si (condicion) se cumple
if ("ejemplo" == "ejemplo")
{
	//codigo 
}
//si no es true, el codigo continua y se salta lo que hay en esta condicional
~~~

Si la condición en si se cumple se ejecuta el código, si no, no se ejecuta y continua con las siguientes lineas, ademas estas condiciones se pueden enlazar/anidar.

Ejemplo:

~~~c++
if (condicion1 == condicion1)
{
    if (condicion2 == condicion2)
    {
        //ejecutar codigo;
	}
}
~~~

---

#### Condicional else if

La condicional `elif` una abreviación de`else if` o `si no, si` esta condición actúa cuando la condición if o otra condición `elif` no se cumple.

Ejemplo:

~~~c++
if (condicion)
{
    //esta condicion no se cumple;
}
else if (condicion2)
{
    //esta condicion se cumple y ejecuta codigo;
}
~~~

---

#### Condicional else

La condicional `else` o `si no` sirve para ejecutar una acción si ni una de las condiciones antes expuestas es  correcta o se cumple.

Ejemplo:

~~~c++
if (condicion)
{
    //esta condicion no se cumple;
}
else if (condicion2)
{
    //esta condicion no se cumple y no se ejecuta codigo;
}
else
{
    //si no se cumplen las condiciones anteriormente aplicadas se ejecuta esta linea;
}
~~~

#### Instrucciones de selección condicional

A la hora de usar variables, puede que nosotros queramos que el usuario elija entre un numero especifico de las mismas y para eso usamos el **`switch`**.

Su sintaxis es la siguiente:

~~~ c++
int numero=1
switch(numero)	//se propone el switch y la variable que ocupara
{
    case 1: //en caso que el valor sea 1
        //caso 1
        break;	//se rompe la cadena
    case 2:	//en caso que el valor sea 2
        //caso 2
        break;
    default:    // si ni un caso se cumple
}
		//caso 3
        break;
}
~~~

**Cabe recordar que el case usa ":" envés de ;**

---

### Bucles

Los bucles son acciones de código que se repiten mientras una condición sea "true" o hasta llegar a un estado que nosotros determinemos como "el final del bucle".

Hay 3 tipos en particular:

---

#### for

Este bucle tiene la capacidad de determinar "el dato inicial", "condicional" y "la forma en la que cambia" ya sea si es un numero que sube de 1 en 1 o un array que se va consultando de forma constante, el for buscara o ejecutara esa acción  hasta que esa condición pase de ser true a false.

Su sintaxis es la siguiente:

~~~c++
for(inicio/variable; condicional; como cambia)
{
    //codigo a ejecutar;
}
~~~

Un ejemplo mas claro del mismo seria:

~~~c++
//luego de darse la variable, se comprueba si numero es menor que 10
//al ser numero menor a 10, se repite la accion hasta que esa condicion sea falsa
//mientras esa condicion sea real, se le sumara 1 a numero
//por cada vez que se repite se mostrara en consola el numero, desde el 0 al 10
for(int numero=0; numero<=10; numero++)
{
    cout << numero;
}
~~~

---

#### while

El bucle While (o como es su traducción literal **mientras**) se basa en ejecutar una acción **mientras** esa condición sea true.

Su sintaxis básica es la siguiente:

~~~c++
while (condicion)
{
    //codigo que se repite
}
~~~

Cabe recordar añadir la condición con la que cambia la variable y el fin de el bucle (cuando este terminara).

---

#### do while

Este bucle se define directamente como un bucle que **ejecuta una acción mientras una condición sea true**.

Su sintaxis es la siguiente:

~~~c++
do 
{
    bloque de codigo //este codigo se ejecuta
}
while(condicional); //si esta condicional es true, se repite, si es false se rompe
~~~

Como ejemplo practico seria:

~~~c++
int numero=0;
do
{
    cout << numero;
    numero++;
}
while(numero<=10);
~~~

En este caso, este funcionara de la misma forma que el ejemplo que tengo del for, aumentara los números hasta que este tenga un valor igual a 10.

---

#### Instrucción break y continue

Estas son instrucciones que nos permiten interactuar con el código en los bucles, en este caso hablaremos de 2 muy importantes:

+ break; (esta instrucción se encarga de que cuando un caso o algo en particular ocurra en el bucle se pueda romper el mismo y se continué con el bloque de código que venga luego)
+ continué; (este detiene el bucle actual, vuelve al inicio de la instrucción y vuelve a empezar por la siguiente iteracion si es que esta existe.
+ goto; (esta instrucción genera la posibilidad de poder ir a una función en especifico al cumplirse una parte especifica del código)

---

### Librerías

Las librerías son "añadidos a nuestro código" con ellos podemos ingresar nuevos comandos, funciones y métodos para hacer funcionar nuestro código y los requerimos para poder trabajar con algunos dispositivos extra entre otras cosas.

Para añadir librerías a nuestro código debemos usar la siguiente sintaxis :

~~~c++
#include <NombreDeLibreria>
~~~

---

### Funciones

Las Funciones son un tema proveniente de la programación orientada a objetos el cual nos puede ser bastante útil en este caso, en ellas ponemos acciones que pueden ser llamadas en otro momento del código, aun que en el caso de arduino hay 2 que se llaman de forma automática.

La sintaxis de una función es la siguiente

~~~c++
TipoDeDatoaRetornar NombreFuncion(parametros){
    //codigo de la funcion
    return //dato a devolver;
}
~~~

el tipo de dato puede ser cualquiera, desde un int, hasta un float pero también puede ser "void" en caso de que no retorne ni un dato.

Y estos se llaman solo usando `NombreFuncion();` y así llamamos una función ya creada.

---

#### Funciones especiales

Arduino de por si tiene algunas funciones bastante útiles para nosotros, tanto para hacer alguna acción como para recibir datos de algún sensor.

AquÍ hay una lista de funciones:

##### Funciones Digital I/O

Estas funciones se encargan de recoger/entregar información de los pines digitales, osea que trabajan con el paso o no paso de energÍa.

+ `pinMode(n° de pin, INPUT/OUTPUT);  ` **con esta función configuramos si queremos que un pin digital sirva como entrada o salida de datos, el numero del pin puede ser solo un numero si es un pin digital o la letra junto al numero si es un pin análogo (este va en la función setup)**.
+ `digitalWrite(n° de pin, HIGH/LOW);` **con esta función elegimos que carga se añada a cada pin de forma digital, si un pin tiene una carga alta(high) se le enviara corriente, si obtiene una baja(low) no recibirá corriente alguna (este se suele añadir en la función loop)**.
+ `digitalRead(n° de pin);` con esta función podemos leer el estado de algún sensor que funcione de forma digital, así saber si este permite o no el paso de electricidad, el estado lo da de forma automática y si lo añadimos a una variable, la misma sera LOW o HIGH dependiendo de el estado del sensor.

---

##### Funciones Analog I/O

Estas funciones se encargan de recoger/entregar información de los pines análogos, osea que trabajan con la variabilidad de la corriente, ya no es solo un paso de corriente o un no paso de corriente, en este caso también actúa que tan fuerte es la corriente que se entrega.

+ `analogWrite(n° de pin analogo, 0/255);` **con esta función elegimos que carga se añada a cada pin de forma análoga, en este caso 0 es la mínima cantidad a leer del pin y 255 la máxima de la misma**.

+ `analogRead(n° de pin analogo);`**con esta función, al ejecutar una acción en algún pin como "mover un análogo (stick)" nos entrega un valor, ese valor representa el estado de el pin análogo**.