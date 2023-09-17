# Flutter

**Documentación hecha por Rodrigo Seguel.**

La magia del desarrollo móvil, empacada en un sistema multiplataforma capaz de hacer aplicaciones que fácilmente funcionan de forma casi nativa, esto ha sido un sueño para los desarrolladores móviles, hasta la llegada de **Flutter**.

**Flutter** es un SDK open source de desarrollo multiplataforma para el lenguaje Dart creado por Google, este nos permite crear aplicaciones rápidas y eficientes utilizando JIT (just in time compiler) para recompilar el proyecto cada vez que haya un cambio.

Este también cuenta con opciones como Hot-Reload, por lo que podemos hacer cosas como abrir el proyecto en un emulador, hacer un cambio y verlo reflejado inmediatamente en la aplicación.

Esta y otras características hacen a **Flutter** un gran lenguaje para el desarrollo móvil.

---

# Lo basico de Flutter

Flutter en si requiere un proceso extraño ya que varia mucho no solo de tu sistema sino también de la forma en la que deseas llevar a cabo la instalación, por lo que para ello tendrás que guiarte con [la siguiente pagina](https://docs.flutter.dev/get-started/install/windows).

Con esto listo ya podríamos continuar creando un proyecto, para esto simplemente escribir `flutter create nombre_app` o en **visual studio code** presiona `ctrl` + `shift` + `p` y escribes `flutter new project`, ahí simplemente seleccionas los elementos básicos del proyecto y podremos empezar a trabajar con el código.

---

## Estructura de un proyecto

Cuando el proyecto haya terminado de construirse, veremos una estructura de carpetas como la siguiente:

* `linux/macos/windows/web/android/ios`: Todas estas carpetas son referentes a las builds del proyecto que corren en tales sistemas, por lo que no les prestaremos tanta atención por ahora.
* `lib`: Archivo principal, donde encontraremos el entry point de nuestra app.
  * `main.dart`: El entry point de nuestra app, donde crearemos nuestra función main.
* `test`: Aquí tendremos nuestros archivos de testing, no le daremos mucha atención por ahora.
* `pubspec.yaml`: Este archivo sirve para mencionar las dependencias de nuestro proyecto, como el `package.json` de NodeJs.

En términos generales estos son los "archivos importantes", por ahora no te preocupes de los otros, mas adelante quizá los veamos, por ahora, continuemos con lo normal.

---

## Hola mundo

Haremos un pequeño ejercicio típico en cada nuevo lenguaje o tecnología que aprendemos y es escribir un **Hola Mundo**.

Este se vera de la siguiente forma:

~~~dart
import 'package:flutter/material.dart'; // importamos los elementos basicos de flutter

// creamos nuestro entry point
void main() {
  runApp( // la funcion runApp() ejecuta nuestro widget principal
    const Center( // el widget "center" inserta todo en el centro
      child: Text( // dentro de este ingresamos un hijo que sera un texto
        'Hello, world!',
        textDirection: TextDirection.ltr, // decimos que se escriba en orden (left to right)
        style: TextStyle(color: Colors.white), // seleccionamos el color del texto
      ),
    ),
  );
}
~~~

En terminos generales asi se veria una app basica de Flutter, pero hay algo importante a mencionar.

Como ya dije anteriormente, flutter tiene la opcion de "Hot reload" o sea cada vez que hagamos cambios en el codigo, la app se recompilara y actualizara.

Pero esto no funcionara hasta que ingresemos un widget desde una clase, para ello simplemente edita el codigo a lo siguiente:

~~~dart
import 'package:flutter/material.dart';

// Agregamos nuestro Widget Principal como entry poiny
void main() => runApp(MyApp());

// esta clase es un widget (como un class component de react) pero sin estado (stateless)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { // la funcion build espera que retornemos un widget
    return const MaterialApp( // esto funciona como el return de un componente funcional de react
      home: Center( // el widget principal es el center
        child: Text( // el hijo del widget es un widget texto
          'Hello, world!',  
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

~~~

Aun debo explicar el funcionamiento real de los Widgets, pero en términos generales ya deberías tener un proyecto de Flutter completamente funcional.

---

## Widgets

Los widgets en **Flutter** son los que en **React** llamamos "componentes", un elemento con el que construimos nuestras paginas, separándolas por trozos.

Los widgets cuentan como **bloques de código que mantienen un estado, este al ser cambiado el widget es totalmente reconstruido, permitiéndonos ver como se actualiza el mismo**, exactamente igual como lo veríamos en un componente de **React **(aun que también podemos crearlos sin estado o con el mismo estado de otro widget).

Los widgets funcionan por un sistema de jerarquías por lo que tenemos siempre widgets padres con propiedades y widgets hijo con sus propiedades.

Con esto entendido sabemos que algo como:

~~~dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp()); // aqui entregamos nuestro widget "raiz"

// nuestro widget raiz no tendra un estado
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( 
      home: Center(
        child: Text(
          'Hello, world!',  
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
~~~

Por otro lado un widget con estado se vería como el siguiente:

~~~dart
// agregamos un valor como estado
class Counter extends StatefulWidget {
  const Counter({super.key}); // esto nos permite recargar solo las partes del widget que cambien

  @override
  CounterWidget createState() => CounterWidget(); // el counter ejecuta este widget
}

class CounterWidget extends State<Counter> {
  int _counter = 0;

  void addOne() {
    setState(() {
      // cuando hacemos algo con setState(), reconstruimos el widget
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column( // si nuestro widget tendra varios hijos usamos Column y children
      children: [
        Text(
          'El contador va en: $_counter',
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.amber),
        ),
        ElevatedButton(
          onPressed: addOne, // aqui agregamos la funcion que ejecuta nuestro boton
          child: Text('Aumentar contador'),
        )
      ],
    );
  }
}

~~~

Antes de continuar haremos un cambio al código de ahora en adelante, este cambio se basara en separar nuestro codigo en archivos, para mejorar el orden y la legibilidad de nuestro código.

En nuestro `main.dart` haremos lo siguiente:

~~~dart
import 'package:flutter/material.dart';
import 'homepage.dart'; // importamos un archivo que crearemos mas adelante

void main() { // llamamos nuestro widget raiz
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(), // nuestro widget raiz llamara este widget
    );
  }
}

~~~

Mientras tanto crearemos otro archivo llamado `homepage.dart`, donde agregaremos lo siguiente:

~~~dart
import 'package:flutter/material.dart';

// si escribes stf creas este widget mas rapido
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // en el widget agregamos un scaffold
      body: Container(width: 200, height: 200, color: Colors.deepPurpleAccent),
    );
  }
}
~~~

De cierta forma ya tendríamos un conocimiento básico de como funcionan los Widgets con y sin estado, por ello ahora simplemente nos dedicaremos a ver ciertos Widgets muy utilizados que vienen por defecto.

### Widgets Comunes

Al igual que ciertos frameworks web, Flutter viene con varios componentes predefinidos y saber cuales son puede ahorrarnos mucho sufrimiento en forma de incesantes búsquedas por internet.

#### Scaffold

Uno de los primeros que  veremos y que notaste en el ejemplo anterior es el `Scaffold()`, este se define como un widget utilizado para la estructuración de nuestro código, de hecho si no lo agregamos y por ejemplo intentamos usar un `Text()`, notaremos una rara línea amarilla debajo, esto es por que el Widget requiere de un Scaffold para su correcto funcionamiento.

El scaffold se describe en 2 partes principales:

* AppBar: Este widget nos permite ingresar un "titulo superior" o "barra superior" a nuestra ventana, en el cual podremos ingresar cosas como títulos, botones de menú, entre otros...
* Body: Este es "el cuerpo de la ventana" aquí agregaremos cada elemento principal en nuestra "main page".

Un ejemplo de un Scaffold fácil seria el siguiente:

~~~dart
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // creamos el scaffold
      appBar: AppBar( 
        title: const Text('Titulo'), // este titulo se vera en la parte superior de la app
      ),
      body: Center( // en el body definimos que poner
        child: Container(
        	width: 200, height: 200, color: Colors.deepPurpleAccent
      	)
      ),
    );
  }
}
~~~

---

#### Container

El elemento "Container" puedo definirlo como una versión de Flutter de los `div`, estos nos permiten ingresar elementos en su interior, pero también suelen ser utilizados para dibujar formas o componentes visuales como botones u otros.

Estos poseen varias propiedades útiles como:

+ Color: Permite cambiar el color de fondo del contenedor.
+ Width: Permite seleccionar el ancho del contenedor.
+ Height: Permite seleccionar el alto del contenedor.
+ Entre otros...

La forma en la que veríamos un container básico dentro de un scaffold seria el siguiente:

~~~dart
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( // usamos el center para que todo este centrado
        child: Container( // creamos el contenedor con un ancho y alto de 200
          width: 200,
          height: 200,
          decoration: BoxDecoration( // le entregamos estulo al container
            borderRadius: BorderRadius.circular(15), // le damos un borde de 15
            color: Colors.purple, // le damos un color de fondo purpura
          ),
        ),
      ),
    );
  }
}
~~~

Otro elemento interesante del container es la propiedad `alignmen:`, este nos entrega la posibilidad de definir de que forma se alinearan los elementos dentro de nuestro container, segun un plano que va desde el -1 al 1 en el eje x e y, por ejemplo:

~~~dart
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment(0.5, 0.5), // alineamos el hijo de nuestro container (0,0 = centro)
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.purple,
          ),
          child: Text('Hola'), // este elemento se mostrara en la ezquina inferior derecha
        ),
      ),
    );
  }
}
~~~

Para encontrar mas opciones de edición para el `BoxDecoration()` puedes ir a [este enlace](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html).

---

