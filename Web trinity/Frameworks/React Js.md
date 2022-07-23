# React Js

**Documentación escrita por Rodrigo Seguel**.

El mundo del desarrollo web es uno en constante crecimiento, no solo en la gente que se adentra al mismo sino que también en las herramientas que se pueden usar en este.

Por eso mismo no es poco común ver herramientas, complementos, frameworks u bibliotecas que nos entreguen funcionalidades tan útiles que decidan permanecer como una parte del desarrollo web actual, como lo es en nuestro caso la tecnología de la que se trata esta documentación, me refiero a **React.Js**.

Este framework desarrollado por facebook (Meta) y su comunidad lleva siendo una de las bibliotecas mas utilizadas a la fecha actual dado su facilidad de uso y lo increíblemente útil que es para hacer "**Single page applications**" (aplicaciones de una pagina) gracias a su capacidad de ser tan modular como tu lo desees.

Esto gracias a un aumento en la facilidad de uso del **DOM** de JavaScript gracias a un elemento llamado **Virtual Dom** y aun mas por medio de un lenguaje llamado **JSX** que utilizaremos para crear estos **componentes** en nuestra pagina uniendo tanto HTML como JavaScript en una misma base.

Sin mas que agregar, comencemos.

---

# Las bases de React

Primero como en todo otro campo, iniciaremos viendo lo básico del lenguaje, conceptos, su instalación entre otras muchas cosas importantes para el aprendizaje del mismo.

## Como instalar React Js

Primero lo primero, puede encontrar la pagina oficial de React Js en [el siguiente enlace](https://reactjs.org/), ahí encontraras documentaciones y mas información sobre React Js que pueden servirte de mucho.

Antes que nada tenemos que tener instalado Node Js en nuestro equipo, esta es una herramienta que nos permite instalar "aplicaciones especificas" a nuestro JavaScript, entonces iremos [al siguiente enlace](https://nodejs.org/en/) y descargamos descargar la opción que dice "**Current**".

La instalación es simple, aceptar términos y dar siguiente hasta terminar, para comprobar su instalación abriremos la terminal y escribiremos `node`, esto nos debería mostrar la versión actual de nuestro Node Js.

Al instalar Node Js no solo tendremos Node, tambien una herramienta llamada **NPM** la cual podemos comprobar en la consola usando `npm --version`, ahora esta es la parte importante, npm nos permite administrar paquetes de Nodo, ósea técnicamente instalar programas de JavaScript y ya con esto instalado podríamos instalar React Js

Para ello tenemos primero que acceder a un conjunto de comandos llamado "**Create react app**" que puedes encontrar en [el siguiente enlace](https://reactjs.org/docs/create-a-new-react-app.html#create-react-app), tecnicamente lo que tenemos que hacer es lo siguiente:

~~~shell
# primero buscamos nuestro escritorio con
c:\Users\USUARIO> cd Desktop

# luego creamos nuestra app de react con (npx + create-react-app + el nombre de nuestra aplicacion) el nombre noi puede llevar CamelCase
c:\Users\USUARIO\Desktop> npx create-react-app myfirstapp

# al haber terminado la instalacion se nos presentaran varios scripts que podemos utilizar pero los principales son
npm start # nos permite iniciar nuestro entorno de desarrollo para trabajar con react
npm run build # nos permite "transformar" nuestro react a JavaScript para que asi una pagina web pueda interactuar con el
# estos los utilizaremos mas adelante
~~~

Por ultimo lo que nos queda hacer es abrir nuestro proyecto recién creado en un editor, yo personalmente utilizare Visual Studio Code, tu puede utilizar el que mas cómodo se te haga.

Con el programa abierto en nuestro editor, abrimos la terminal integrada y escribimos `npm start` y se abrirá una pagina web donde podremos ver nuestro React ya funcionando.

Listo ahora podemos cerrar todo a excepción de nuestro editor y la pagina de LocalHost recien creada.

---

## La estructura de un proyecto (carpetas)

Los proyectos de React al ser creados nos darán un conjunto grande de carpetas y archivos que requeriremos en el uso del mismo, por ello las repasaremos por aquí y hablaremos de que se puede hacer con ellos.

El comando **`npx create-react-app`** nos suele generar una carpeta con los siguientes archivos:

+ **node_modules**: una carpeta llena de modulos de node (no los elimines, son necesarios para que esta funcione).
+ **public**: Aquí encontramos los datos que serán públicos al hacer el build de la pagina (el Html base, imágenes, css, etc...).
+ **src**: Aquí esta nuestra base de código, aquí haremos nuestras aplicaciones y componentes de react.
+ **.gitignore**: archivo de Git (recomiendo no tocar).
+ **package y package-lock**: archivo encargado de almacenar paquetes entre otros elementos del programa.
+ **README**: archivo donde escribiremos nuestra documentación del proyecto.

Estos archivos tendran dentro de si muchos elementos, haremos una vista a 2 en especifico, siendo estos:

* **public**: En esta carpeta tendremos múltiples elementos, entre estos los unicos de relativa importancia serian el archivo:
  * index.html: Este es nuestro html base, aquí tendremos cosas como el titulo de la pagina, icono, u otros elementos fuera de react en si.
  * robots.txt: Su principal idea es permitir a nuestra pagina el ser indexada por buscadores.
* **src**: en esta pagina igual tendremos múltiples elementos útiles pero los importantes son:
  * index.js: es en si el unico archivo necesario ya que nos permite mostrar en el html un elemento especifico que llama nuestros componentes de react.
  * app.js: anteriormente mencione que solo es necesario index.js pero también usaremos este para específicamente crear nuestros componentes.
  * index.css y app.css: estos son archivos de estilo para ambos **.js** recomiendo guardarlos solo por la necesidad de hacer todo mas fácil.

Técnicamente hablando con simplemente mantener estos archivos podríamos tener un programa funcional (por temas de facilidad eliminare al resto).

---

## La estructura de un proyecto (código)

Obviamente un conjunto de carpetas no son lo único que hace falta entender para llevar a cabo un producto como este, en esta sección repasaremos todos los elementos ejecutándose en nuestro proyecto.

+ **La base (index.html)**: como ya mencione anteriormente, en la carpeta de **public** tendremos un archivo de html el cual **limpiándolo un poco** debería verse de la siguiente forma.

  ~~~html
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <!--los meta datos de aqui no nos importan por ahora, pero deben estar aqui-->
    </head>
    <body>
      <noscript>You need to enable JavaScript to run this app.</noscript> <!--en caso qeu javascript no este activado-->
      <div id="root"></div> <!--Nuestro elemento de react!!!-->
    </body>
  </html>
  ~~~

  Como notaras tenemos un div con un id "root" este elemento es donde va a mostrarse los elementos de react que creemos en nuestra aplicación, pero primero debemos definir el elemento "root" así que:

  ---

+ **La conexión (index.js)**: en este archivo tenemos lo que viene a ser la definición de lo que se mostrara en nuestro div "root" y se ve de la siguiente forma:

  ~~~jsx
  import React from 'react'; // importamos react
  import ReactDOM from 'react-dom/client'; // importamos el virtual dom
  import './index.css'; // agregamos un css a nuestro programa
  import App from './App'; // y traemos nuestra aplicacion
  // import reportWebVitals from './reportWebVitals'; // este import lo usamos para la funcion reportWebVitals()
  
  // en esta constante traemos el dato donde vamos a renderisar nuestro react
  const root = ReactDOM.createRoot(document.getElementById('root'));
  
  // y finalmente seleccionamos que se va a renderizar
  root.render(
    <React.StrictMode>
      <App /> <!-- este elemento lo traemos desde el import de arriba -->
    </React.StrictMode>
  );
  
  // reportWebVitals(); // esta funcion la usamos para mostrar elementos sobre rendimiento
  ~~~

  Como abras visto en especial aquí es donde podemos hacer todo, especialmente en el render podemos agregar lo que queramos para hacer todo mas fácil, pero lo que hacemos es modularizarlo, para así poder trabajar de forma mas organizada y ordenada, por ultimo veamos nuestras aplicaciones.

  ---

+ **La aplicación (app.js)**: aquí empezaremos a crear nuestros componentes, técnicamente podemos eliminar todo el archivo y dejarlo de la siguiente forma:

  ~~~jsx
  export default App; // esto debera estar siempre al final (sirve para enviar nuestra funcion al index.js)
  ~~~

  Dependiendo de el editor que utilicemos nos mostrara un error, pero eso lo repararemos en un rato mas.

---

## JSX

Seguramente en varias partes de la documentacion veras un lenguaje similar a Html pero en un codigo de JavaScript, aun que estos se parezcan mucho debo hacer una mencion, esto **no es Html**, esto es un lenguaje llamado JSX especificamente creado para funcionar con React de una forma muy similar a la que funcionaria Html.

Con JSX podemos hacer cosas como las siguientes:

~~~react
// usarlo con variables
const nombre = Rodrigo:
const elemento = <h1>Hola, mi nombre es {nombre}</h1>;

// podemos referencias funciones con <NombreFuncion/>
const DecirNombre = () => <h1>Rodrigo Seguel</h1>
const textoCompleto = <h1>Hola mi nombre es: <DecirNombre/></h1> // asi llamamos una funcion dentro de jsx
~~~

---

## Virtual Dom

Como ya sabras existe un concepto en JavaScript conocido como **Dom**, este "**Document object movel**" nos permite conectar nuestro JavaScript con nuestro Html por medio de ciertas lineas de código aun que de una forma casi indirecta utilizando cosas como:.

+ `document.getElementById`
+ `document.querySelector`
+ entre otros...

Pero React  nos entrega un extra bastante util conocido como el "**Virtual Dom**", este tiene una característica especial y es que nos permite utilizar directamente JSX para acceder a componentes y elementos de Html en nuestro JavaScript.

Para crear por ejemplo un elemento de JSX en React simplemente haria falta hacer algo como:

~~~react
const element = <h1>Hola Mundo!</h1>; // y luego renderizar el elemento para que se muestre en la pagina
~~~

Este en si se puede definir como un "Falso Dom" que nos facilita la comunicación entre Html y JavaScript.

---

# Componentes

Los componentes son la parte principal de React, estos se definen como **funciones o clases que retornan un elemento de html con una funcionalidad predefinida** y que transformaremos en etiquetas para mas tarde utilizarlas con facilidad.

Los componentes tienen un "**ciclo de vida**" compuesto por 3 estados que lo definen, siendo estos:

1. **Montado**: Es cuando "un componente es instanciado en el DOM" siendo este proceso ejecutado solo una vez por componente.
2. **Actualizado**: Es cuando "un componente presenta cambios en sus **states** o **props**" siendo este ejecutado múltiples veces o ninguna por componente.
3. **Desmontado**: Es el ultimo estado de un componente, este se ejecuta solo una ves antes de que el componente en si sea desmontado del DOM.

El proceso de actualizado es de relativa importancia ya que este es quien se encargara de permitirnos visualizar los cambios efectuados en el componente por medio de **una nueva ejecución de la renderización del componente (el método render en caso de una clase)**.

Debo recordar que esta actualización se ejecutara solo en ciertos casos, siendo estos cuando se presente **un cambio en los states** o **un cambio en los props** del componente.

**En si hay 2 tipos de componentes**:

## Componentes de clases

Los componentes en clases son como es obvio **clases que nos renderizan un elemento que al ser llamados podemos reutilizar como etiquetas en jsx**

ejemplo:

~~~react
import { Component } from 'react' // importamos la funcionalidad de react

class App extends Component { // creamos una clase llamada App
  render() { // con esta funcion renderizamos el componente
    return( // y retornamos un valor (este debe ser un elemento jsx)
      <div>
        <h1>este es un componente</h1>
        <h2>puede estar compuesto de varios elementos</h2>
        <h3>y al llamar a la clase app en index.css</h3>
        <h1>se posicionaran todos al mismo tiempo</h1>
      </div>
    )
  }
}

export default App; // esto ya no dara error ya que ahora poseemos una clase llamada App
~~~

Con estos elementos ahora siempre que  llamemos el elemento App mostraremos este componente en la pantalla.

---

### Estados

Los estados son datos ingresados en nuestros componentes y elementos los cuales referencian alguna opcion u otro elemento.

Estos son muy similares a los props, con la diferencia de que los props son publicos mientras que estos son privados, osea **solo el mismo componente puede cambiar sus estados**.

Para explicar la similitud con los props tengo primero que dar un ejemplo:

~~~react
// como ya mencione a la hora de crear un prop es como si hicieramos un objeto imaginario con las propiedades del mismo
// en este caso es similar solo que estos efectivamente son objetos reales
// para usarlos principalmente tenemos que hacer nuestros componentes con una clase de la siguiente forma:

class Componente extends React.Component {\
    
	// creamos un objeto con los estados que querramos revisar
    state = { 
        // aqui van nuestros estados por ejemplo:
        estaVivo: true
    }
    
    render() {
        if (this.state.estaVivo) {
	        return <h1>Esta vivo :D</h1>            
        } else {
            return <h1>Esta muerto :c</h1>
        }
    }
}

// si ejecutamos esto y estaVivo es verdadero se mostrara el mensaje de "Esta vivo :D" de lo contrario se mostrara el "Esta muerto :c"
~~~

Técnicamente podemos utilizarlos como variables que representan estados del mismo elemento y que por cierto debes llamar como un objeto del mismo ya que la privacidad del mismo evita que accedas a otros a diferencia de los props.

Por lo que si por ejemplo llamas 3 veces a este componente, puedes hacer que individualmente cada uno de ellos pueda tener un estado distinto. 

Ahora probemos hacer algo mas dificil, en especifico algo como cambiar internamente el estado de nuestro elemento, esto lo haremos de la siguiente forma:

~~~React
class Component1 extends React.Component { // creamos nuestra clase

    // creamos un objeto para nuestros estados
    state = {
        estaVivo: true
    }
    
    render() {        
        if (this.state.estaVivo) { // si esta vivo
	        return(
                <div>
                    <h1>Esta vivo :D</h1>
                    <button onClick={() => this.setState({estaVivo: false})}>Matar :c</button>
                </div>
            ) 
                  
        } else { // de no ser asi
            return(
            <div>
                <h1>Esta muerto :c</h1>
                <button onClick={() => this.setState({estaVivo: true})}>Revivir :D</button>
            </div>
        )

        }
    }
}
~~~

De este ejemplo puedes sacar 2 cosas importantes:

1. Para editar un estado internamente se debe usar la función **`this.setState({estado: valor})`**.

2. Para accionar un botón o recibir un clic desde un elemento podemos usar **`onClick = { // codigo javascript}`** para ejecutar al dar clic en un elemento, tambien nos permite ejecutar funciones de las siguientes formas:

   ~~~React
   // si tenemos una funcion simple como:
   function matar() {
       this.setState({estaVivo: false});
   }
   
   // debemos usar:
   <button onClick={this.matar.bind(this)}>Revivir :D</button>
   
   // --------------------------------------------------------------
   
   // si tenemos una funcion en linea como:
   const matar = () => this.setState({estaVivo: false});
   
   // podemos hacer:
   
   <button onClick={this.matar}>Revivir :D</button>
   ~~~

---

### Props

Los Props o propiedades son lo que llamaríamos "parámetros de una etiqueta" pero agregados a los conceptos de componente que conocemos de React y que nos permite hacer mas interactivos nuestros elementos de JSX.

En la base las propiedades funcionan de la siguiente forma:

~~~jsx
// creamos un componente funcional con un prop entre los parametros de la funcion
const X = (props) => {<p>Hola mi nombre es {props.nombre} y estoy {props.estado}</p>} 

// esto llamara a los elementos que le pasemos a este jsx a la hora de referenciarlo, por ejemplo:
ReactDOM.render(
  <X nombre="Rodrigo" estado="Feliz"/>, document.getElementById('root')
)

// al haber hecho esto tecnicamente estaremos creando un objeto como el siguiente:
props {
    nombre = "Rodrigo",
    estado = "Feliz"
}
// cuyos elementos podemos llamar utilizando:
props.nombre /* y */ props.estado

// debes recordar que para ingresar javascript en un JSX debemos usar llaves {} para permitirnos insertar codigo en los mismos

// ya si hacemos esto
ReactDOM.render(
  <X nombre="Rodrigo" estado="Feliz"/>, document.getElementById('root')
)

// obtendriamos un "Hola mi nombre es Rodrigo y estoy Feliz"
~~~

Con eso ya habremos creado un prop, esto se puede compartir entre distintos componentes entre si y agregar ese toque de interactividad que nos dan los parámetros en una función.

Si hacemos esto en una clase tenemos que usar `this.props.propiedad`.

No lo he explicado pero tambien podemos acceder a estos elementos dentro de un mismo componente por ejemplo:

~~~jsx
const Componente = () => {
    let nombre = "Rodrigo";
    return (
    	<p>Hola, me llamo {nombre}</p> // aplicamos el valor de la variable directamente
    );
}
~~~

Pero nos faltan ciertas cosas de importantes por ver, hay veces en las que nosotros querremos "anidar componentes" osea llamar un componente desde dentro de otro como el siguiente caso:

~~~jsx
const ParrafoNombre = () => { // creamos un componente
    return <p>Rodrigo Seguel</p>
}

// luego podemos usarlo dentro de otro:
const App = () => {
    return (
    	<div>
        	<ParrafoNombre></ParrafoNombre>
        </div>
    ); 
}
// al haber ingresado el texto dentro del componente en si, no hace falta agregar nada para acceder al texto del mismo
~~~

Esto puede ser totalmente funcional y no traer ni un problema pero en temas de funcionalidad es mas bien inutil, algo que podemos hacer es pasarle los valores a `ParrafoNombre` para asi definir funcionalidades en nuestro elemento anteriormente visto, como hacemos esto, pues de la siguiente forma:

~~~jsx
const ParrafoNombre = (props) => { // referencuamos un objeto con props
    return <p>{props.children}</p> // llamamos el objeto props y uno de los datos llamado "children"
}

// luego podemos usarlo dentro de otro:
const App = () => {
    return (
    	<div>
        	<ParrafoNombre>Rodrigo Seguel</ParrafoNombre>
        </div>
    ); 
}
// y ahora pasamos el componente del mismo desde nuestra otra funcion
~~~

Esto lo que hace es permitirnos acceder a distintos componentes del mismo siendo **children** el que representa el dato que le damos a nuestra etiqueta, y si por ejemplo queremos pasar otras propiedades podemos hacer lo siguiente:

~~~jsx
const ParrafoNombre = (props) => { // referencuamos un objeto con props
    return <p>hola, soy {props.children} y estoy {props.estado}</p> // llamamos el objeto props y uno de los datos llamado "children"
}

// luego podemos usarlo dentro de otro:
const App = () => {
    return (
    	<div>
        	<ParrafoNombre estado="feliz">Rodrigo Seguel</ParrafoNombre>
        </div>
    );
}
~~~

ahora le estaríamos pasando tanto el **children** (el dato ingresado en la etiqueta) como el **estado** (el dato ingresado como propiedad).

---

#### Object destructoring

La "desestructuración de objetos" es una forma de trabajar con los mismos segun las propiedades que nos permiten acceder de forma mas explicita y limitada a los datos que queremos pasar como props, quiza en componentes muy pequeños no sea de tanta ayuda pero en componentes mas grandes puede ser de vital importancia.

por ejemplo:

~~~jsx
// imagina que tenemos lo siguiente:
const ParrafoNombre = (props) => { // referencuamos un objeto con props
    return <p>{props.children}</p> // llamamos el objeto props y uno de los datos llamado "children"
}

const App = () => {
    return (
    	<div>
        	<ParrafoNombre estado="feliz">Rodrigo Seguel</ParrafoNombre>
        </div>
    );
}
~~~

esto de aqui seria un componente que recibe como valor un objeto con 2 valores: **`{estado, children}`** por lo que al acceder a los mismos tendríamos que usar `props.estado` o `props.children` para referenciarlos, pero como te daras cuenta en nuestro componente `ParrafoNombre` solo estamos utilizando el children, pero eso nos lleva a una pregunta:

**¿Como limitamos o especificamos las propiedades que llegan a nuestros componentes?**

Bueno eso lo logramos por medio de la desestructuración de objetos, es el proceso de mencionar de forma literal los elementos a llamar de un objeto y es magico a la hora de hacer nuestro codigo mas "efectivo", por ejemplo:

~~~jsx
// imagina que tenemos lo siguiente:
const ParrafoNombre = ({estado, children}) => { // referencuamos los datos a pasar (solo estado aun que no lo usemos y el children)
    return <p>{props.children}</p>
}

const App = () => {
    return (
    	<div>
        	<ParrafoNombre estado="feliz" edad=19>Rodrigo Seguel</ParrafoNombre>
        </div>
    );
}
/* 
    en este caso en vez de llegar un objeto con todo lo que tiene nuestro componente referenciado,
    haremos uno solo con las propiedades necesarias.
*/ 

// otra forma de hacer esto con los props seria haciendo un destructoring a los props en si de la siguiente forma:
const ParrafoNombre = ({props}) => { // referencuamos los datos a pasar (solo estado aun que no lo usemos y el children)
    const {edad} = props; // ahora al referirnos a edad en realidad estaremos llamando al prop de edad
    return <p>{edad}</p>
}

const App = () => {
    return (
    	<div>
        	<ParrafoNombre edad="19">Rodrigo Seguel</ParrafoNombre>
        </div>
    );
}
~~~

---

## Componentes funcionales

Los componentes funcionales son la parte importante de los componentes, a pesar de tener 2 tipos estos son los que deberias estar utilizando especialmente por su facilidad y utilidad.

La sintaxis de un componente funcional podria ser la siguiente:

~~~jsx
// en una funcion normal:
function App() {
  return( // las funciones normales requieren el return, mientras que las funciones flecha no
    <div>
      <h1>este es un componente</h1>
    </div>
  )
}

// en una funcion flecha:
const App = () => {
    <div>
        <h1>este es un componente</h1>
    </div>
  )
}
~~~

las funciones se dividen en 2 tipos:

1. funciones puras: funciones que al ser ejecutadas siempre darán el mismo valor de retorno (los componentes de react siempre serán de estos).
2. funciones impuras: funciones que al ser ejecutadas, siempre darán valores distintos de retorno (por ejemplo el valor de una fecha)

---

### Hooks

Los hooks son un elemento de los componentes funcionales que te permiten acceder a ciertas características que de otra forma requerirían ser hechos desde una clase para contar con estos.

En si **React** nos entrega la posibilidad de utilizar tanto:

+ **Componentes de clase**.
+ **Componentes funcionales**.

Y con el tiempo se ha adaptado una ideologia y preferencia ante los componentes funcionales por su facilidad y utilidad.

En el caso de los **Componentes de clases** hay ciertos elementos de estos que por ejemplo no son directamente accesibles desde una función, como lo es el acceso a la función **`Render()`** o el acceso a los "**States**" de forma explicita, para funcionalidades como estas es que están los **hooks**.

En si los hooks tienen 2 reglas fundamentales, siendo estas:

+ **No instancies hooks dentro de un scope distinto al de la funcion**: queda totalmente prohibido **instanciar** hooks dentro de **condicionales, bucles, u otros scopes que no sean la base de la funcion/componente** y se recomienda que sea ingresado en el nivel mas alto **al inicio**.
+ **No llamarlos** en otro lugar que no sean **componentes de react** ni **custom hooks**

**Los hooks mas utilizados son**:

+ **`useState()`**: El hook **`useState()`** es la forma con la que accedimos a los "**States**" desde un **componente funcional**, este funciona de la siguiente forma:

  ~~~react
  import React, { useState } from 'react';
  
  // imagina que haremos un contador
  function Contador() {
  	// Declaramos un nuevo estado con el nombre "conteo" y utilizaremos setConteo() para cambiar su valor.
  	const [conteo, setConteo] = useState(0); // por ultimo agregamos el hook useState() para generar el State con un valor base
  	// el valor del conteo por defecto sera 0 en este caso (el valor por defecto es el parametro de useState)
      
  	return (
      	<div>
        		<p>Me has clickeado {conteo} veces</p>
        		<button onClick={() => setConteo(conteo + 1)}> <!--el conteo aumentara en 1 en cada click-->
          		Clickeame
        		</button>
  		</div>
  	);
  }
  ~~~

  Aun que en si el **`useState()`** se puede usar en mas que solo números, por ejemplo:

  ~~~react
  const [conteo, setConteo] = useState(0); // en caso de un numero
  const [nombre, setNombre] = useState('Rodrigo'); // en caso de un nombre(texto) (por defecto sera Rodrigo)
  const [vivo, setConteo] = useState(true); // en caso de un booleano (por defecto sera verdadero)
  ~~~

  Y importante saber que **cada vez que se llame el setter de un `useState()` se volverá a ejecutar el componente en si, o sea que el Render se ejecutara nuevamente**.

  ---
  
+ **`useEffect()`**: Este hook se encarga de generar "**efectos secundarios**" cuando se presencie algún cambio **basado en algún elemento del componente** como por ejemplo seria hacer una actualización en el **DOM**.

  *funciona de la siguiente forma*:

  ~~~react
  import React, { useState, useEffect } from 'react';
  
  function Contador() {
  	const [conteo, setConteo] = useState(0);
      
    // este es nuestro efecto secundario
    useEffect(() => { // cada vez que ocurra un cambio se ejecutara esta funcion
      console.log("Has presionado en el contador"); 
    });
      
  	return (
      	<div>
        		<p>Me has clickeado {conteo} veces</p>
        		<button onClick={() => setConteo(conteo + 1)}>
          		Clickeame
        		</button>
  		</div>
  	);
  }
  ~~~

  Aun que el hook contiene una "funcionalidad escondida a simple vista" la cual son las **dependencias**.

  Los hooks de efectos nos permite agregar una lista de elementos a revisar y de los que **nuestra ejecución depende**, dándonos las siguientes posibilidades:

  + **Sin dependencia**: en caso de que no se encuentre nada en las dependencias, **la función se ejecutara siempre que se actualice el componente**.

    *un componente sin dependencia se vería de la siguiente forma:*

    ~~~react
    useEffect(() => { // siempre que se ejecute la actualizacion del componente se ejecutara 
    	console.log("Has presionado en el contador"); 
    });
    ~~~

  + **Con dependencias vacias**: en caso de que se encuentre una lista vacía, **la función se ejecutara solo una vez cuando se actualice el componente**.

    *un componente con dependencias vacías se ve de la siguiente forma:*

    ~~~react
    useEffect(() => {
    	console.log("Has presionado en el contador"); 
    }, []); // agregamos la lista vacia al final de la funcion
    ~~~

  + **Con dependencias**: en caso de que se encuentre una dependencia, **la función se ejecutara siempre que se detecte un cambio en ese dato específicamente**.

    *un componente con dependencia se ve de la siguiente forma:*

    ~~~react
    const [conteo, setConteo] = useState(0);
        
      useEffect(() => {
        console.log("Has presionado en el contador");
      }, [conteo]); // cada vez que se detecte un cambio en el estado "conteo" se ejecutara el hook
    ~~~

  
  ---
  
+ 
