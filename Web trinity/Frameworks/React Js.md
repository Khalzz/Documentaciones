# React Js

**Documentación hecha por Rodrigo Seguel**

Desde el inicio de los tiempos, los desarrolladores web han buscado formas fáciles de hacer interfaces de usuario tan dinámicas como efectivas, esto es posible con Html,Css y JavaScript vanilla, pero se vuelve una tarea notablemente mas compleja de lo que debería, por eso estamos aquí.

React Js es una biblioteca de código abierto para JavaScript enfocada en facilitar el proceso de creación de "**single page applications**" o "**aplicaciones de una sola pagina**", este nos permite hacer grandes modificaciones al **DOM** desde nuestro JavaScript de forma muy sencilla, facilitando el proceso de esto utilizando algo llamado "**Virtual DOM**".

React Js esta desarrollado por Facebook y su comunidad, este lleva siendo una de las bibliotecas mas utilizadas y amadas para JavaScript desde el 2013 llegando al punto de ser actualmente la mas usada y amada en Front-End development estando presente en miles de aplicaciones web como son Facebook, Instagram, Netflix, entre muchos mas.

Los requisitos para aprender este son:

+ Html
+ Css
+ JavaScript

Sin mas que divagar, comencemos.

---

## Por que React?

Como ya mencione React Js es una biblioteca enfocada al Front-End, a demás de entregarnos la posibilidad de "modular" nuestras aplicaciones web, tanto como permitirnos hacer cosas mas complejas gracias al sistema de "componentes" que nos entrega React Js.

Recomiendo el aprendizaje de este por principalmente 3 razones:

1. Es cómodo de usar: Su integración modular nos entrega la posibilidad de dividir nuestra aplicación en pequeñas secciones cada una con una función y mas componentes "hijo" para hacer así iteraciones mas y mas complejas con nuestra aplicación.
2. Es muy requerido: Al ser una de las bibliotecas mas utilizadas en JavaScript es muy fácil encontrar trabajos que requieran de este como uno de los principales requisitos.
3. Alto desempeño: React Js si es algo es rápido y nos permite hacer cambios a nuestra web sin tener que "recargar" nuestra pagina.

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

## Estructura del proyecto

En la sección anterior quizás abras notado que al terminar la creación del proyecto con React se habrán creado una gran cantidad de elementos y carpetas en el mismo, ahora te enseñare el uso y función de cada una.

las carpetas y archivos son:

+ Readme.md: este archivo es un markdown que podemos usar como documentación o nota para otros desarrolladores que vean nuestro proyecto.

---

+ Package.json: este archivo se encarga de compilar al informacion de nuestro proyecto, agregando cosas como el nombre del proyecto, su version, si es privado o no, dependencias, scripts, validadores de escritura y buscadores soportados por el proyecto.

  ---

+ Package-lock.json: es un archivo usado por el funcionamiento interno de React, no hay que tocarlo.

  ---

+ .gitignore: nos permite "ignorar" ciertos archivos para que la subida a Git o GitHub sea mas eficiente, rápida y fácil.

  ---

+ src: es una carpeta que contiene el código de react, tanto archivos como otros que utilizaremos para poder proceder con nuestro proyecto de forma efectiva.

  ---

+ public: es la pagina en la que encontramos el template de Html de la pagina, aquí simplemente veremos todos los datos utilizados por la pagina principal que no pertenecen a React, al ver por ejemplo el archivo "**index.html**" notaras que en su **body** no hay nada y aun así podremos ver cosas en la pagina, esto es por que React edita cosas para Html y Css, pero se escribe totalmente en JavaScript.

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

## Hola Mundo

Para iniciar con React primero borraremos todo lo que se encuentre en la carpeta "**src**" para que así podamos iniciar desde 0.

Con esto listo vamos a crear en la misma un archivo de JavaScript con el nombre "**index.js**" y le importaremos todas las dependencias necesarias de react al mismo, el archivo debería quedar de la siguiente forma:

~~~javascript
// importamos react y el dom de react
import React from 'react';
import reactDom from 'react-dom';

// recuerda que segun el dom los elementos son nodos definidos por etiquetas html
// este elemento funciona como un DOM virtual
const element = <h1>Hello World!</h1>;

// si hacemos lo siguiente deberia devolvernos un objeto representando al elemento de html en la consola
console.log(element);

// renderizamos todo lo que le demos al dom virtual en el elemento traido con el getElementById osea el div de html
reactDom.render(element, document.getElementById("root"));

~~~

Por si no lo mencione, en la carpeta "**public**" podremos encontrar un archivo de Html con el nombre "**index.html**", este tiene un div que funciona como contenedor para nuestra aplicación y lo demás que encontremos en el cuerpo del archivo, se ejecutara en caso que por ejemplo no este activado el JavaScript del buscador.

---

# Componentes

Los componentes son una parte fundamental para el desarrollo web moderno, imagínalo como pequeñas secciones de nuestra pagina que pueden ser lo que quieras, un botón, un cuadro en blanco o una imagen, que a demás tiene "componentes hijo", un texto, otro botón entre muchos otros.

La gracia de los componentes como concepto es su "reutilización posterior" ya que la idea de estos es que se puedan hacer una vez y si lo requerimos poder crearlos nuevamente.

Un ejemplo de componente por ejemplo seria un post de Instagram, este es un componente con la siguiente estructura:

+ Cuadro en blanco
  + Imagen
  + Sección de botones
    + Me gusta
    + Comentar
    + Compartir
    + Guardar
  + Sección de opciones y cuenta
    + Imagen de perfil y nombre de quien subio la foto
    + Opciones para la publicación
  + Sección de comentarios

Esta estructura se repite en cada una de las publicaciones que podemos ver en Instagram, por lo que si creamos un componente con estos elementos, podemos replicarlo para que se copie cada vez que hay una publicación nueva.

En si estos no son mas que Funciones las cuales retornan un valor, siendo este un código JSX el cual contiene todos los elementos y componentes dentro de nuestro componente.

## Creando componentes

Para crear un componente primero necesitamos de 3 cosas en especifico, el código donde estamos renderizando nuestro React "**Index.js**" y un código que se encargue de generar esos componentes, ahora crearemos un archivo "principal de renderización de datos" llamado "**App.js**" a demas de obvio el html "**index.html**" que se crea por defecto en la carpeta "public".

En el "**App.js**" hacemos lo siguiente

~~~react
import React from "react"; // importamos react

// creamos nuestro componente
function Componente() {
    return <h1>Hola bro, como estas?</h1>
}

// estos componentes funcionan igualmente en funciones flecha como:
const Componente = () => {<h1>Hola bro, como estas?</h1>} // recuerden que las funciones flecha retornan por defecto

// tambien podemos hacer lo mismo por medio de una clase por ejemplo:
class Componetne extends React.Component {
    render() {
        return <h1>Hola bro, como estas?</h1>
    }
}

export default Componente; // exportamos la funcion "Componente"
~~~

En el código de "**Index.js**" haremos lo siguiente:

~~~react
// importamos react y el dom de react
import React from 'react';
import reactDom from 'react-dom';

import Componente from './App'; // importamos la funcion "Componente"

// renderizamos todo lo que le demos al dom virtual en el elemento traido con el getElementById osea el div de html
reactDom.render(<Componente/>, document.getElementById("root"));

~~~

Un extra, podemos hacer esto:

~~~react
import React {Component} from 'react';

// y a la hora de hacer un componente como clase solo habra que hacer lo siguiente:
class Componente extends Component {}
~~~

---

## Props

Los props son lo que llamariamos "parametros de una funcion" pero agregados a los conceptos de componente que conocemos de React.

Estos mas que solo datos funcionan como objetos ya que al crear un "prop" enrealidad creamos un objeto con un dato en su interior el cual es igual a la propiedad asignada, osea:

~~~react
// si hacemos lo siguiente:
<Componente nombre = "Rodrigo"/>

// estamos creando un objeto
{
    nombre = "Rodrigo"
}
~~~

entonces la forma en la que estos funcionan es por medio de los siguientes pasos:

~~~React
// 1. donde estemos llamando nuestro componente tenemos que agregar la nueva propiedad
<Componente nombre = "Rodrigo"/>

function Componente(prop) { // 2. le entregamos un parametro "prop" a nuestro componente
    console.log(prop); // si hacemos esto en la consola podremos ver todas las propiedades recibidas
    return <h1>Hola bro, mi nombre es {prop.nombre}</h1> // referenciamos el prop con llaves {prop.propiedadNueva}
}

// esto nos dejaria por ejemplo hacer:
<Componente nombre = "Rodrigo"/> <Componente nombre = "Ariel"/> <Componente nombre = "Jenniffer"/>
// y mostrar distintos mensajes con esas respectivas ediciones
~~~

Con eso ya habremos creado un prop, esto se puede compartir entre distintos componentes entre si y agregar ese toque de interactividad que nos dan los parámetros en una función.

Ya si queremos agregar varias propiedades podemos hacer algo como lo siguiente:

~~~react
<Componente nombre = "Rodrigo" edad = 15/>

function Componente(prop) {
    console.log(prop);
    return <h1>Hola bro, mi nombre es {prop.nombre} y mi edad es {prop.edad}</h1>
}
~~~

Si hacemos esto en una clase tenemos que usar `this.props.propiedad`.

---

## Estados

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

## Agregando Css

Como es relativamente obvio, podemos agregarle un css a nuestros componentes, para esto simplemente podemos hacer lo siguiente:

*Supongamos que hemos hecho un archivo llamado "archivo.css" en la misma carpeta que nuestro "App.js"*

~~~react
import React from "react"; // importamos react
import ./archivo.css // instanciamos el css

// creamos nuestro componente
function Componente() {
    return <h1 id = "Saludo">Hola bro, como estas?</h1>
}

export default Componente; // exportamos la funcion "Componente"
~~~

Ahora desde nuestro "archivo.css" podríamos hacer algo como lo siguiente:

~~~css
#Saludo {
    border 1px solid #000;
    /* aqui puedes agregar el estilo que desees */
}
~~~











