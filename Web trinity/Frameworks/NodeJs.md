# NodeJs

**Documentación escrita por Rodrigo Seguel**.

Como posiblemente ya sepas, **JavaScript** es uno de los lenguajes mas utilizados en el mundo gracias a su fácil implementación en un sin fin de sistemas.

Uno de estos es el desarrollo **Back-end** que nos permite generar conexiones entre nuestras paginas web y nuestro servidor de forma segura y confiable, proceso para el cual utilizaremos **NodeJs**.

---

## ¿Que es NodeJs?

NodeJs es un marco de ejecución de JavaScript del lado del servidor, en términos simples, es una herramienta que nos entrega la posibilidad de ejecutar **JavaScript dentro de un servidor** en un entorno totalmente seguro a cualquier intervención en los datos con los que trabajemos.

Diseñado para crear aplicaciones escalables, todo gracias **al mismo lenguaje**.

Este funciona como una capa de el motor **V8** de chromium que funciona por encima del sistema operativo en si, definiendo acciones especificas como la forma en la que se utiliza la memoria, como se accede a las variables, como y cuando ejecutar el garbage collector entre otros elementos.

---

## Hola Mundo

En si **NodeJs** no es complejo, primero empezaremos descargándolo e instalándolo [en el siguiente enlace](https://nodejs.org/en/), tras esto desde nuestra terminal ejecutamos el comando `node -v` para comprobar que efectivamente **NodeJs** este instalado.

Tras esto en una carpeta crearemos un archivo de JavaScript con el nombre `index.js`, en realidad puede tener el nombre que tu desees, pero tendrás que agregar el nombre de este archivo en el comando de ejecución de **NodeJs**.

Entonces en nuestro `index.js` haremos lo siguiente:

~~~js
console.log('Hola Mundo');
~~~

Ahora en caso de que el archivo se llame **`index.js`** ejecuta el comando `node .` desde la terminal, por otro lado en caso de que el archivo tenga otro nombre utiliza `node nombre-archivo.js`.

---

## Sistema de módulos

Cuando trabajamos en cualquier proyecto, lo mas probable es que necesitemos el uso de múltiples archivos en si para hacer mas legible nuestro código, pero también para agregar funcionalidades hechas por otras personas.

Por ello poseemos un sistema de "módulos" que nos permite llevar a cabo esta parte importante de **NodeJs**.

Imagina que tenemos 2 archivos de JavaScript, uno con el nombre `math.js` y el otro es nuestro `index.js`, el primero contiene solamente funciones que permiten hacer cálculos matemáticos como:

~~~javascript
const Math = {};

const suma = (x,y) => {
    return x + y;
}

const resta = (x,y) => {
    return x - y;
}

Math.suma = suma;
Math.resta = resta;

module.exports = Math;
~~~

Si queremos acceder a estas funciones desde nuestro `index.js` tenemos que "importar" de cierta forma estas funcionalidades.

para ello desde este ultimo haremos lo siguiente:

~~~javascript
// primero instanciaremos el archivo del cual estamos obteniendo estas funciones con:
const math = requiere('./math.js')

// ahora siempre que querramos acceder a estas funciones tendremos que hacer mencion a la constante
console.log(math.suma(10,15));
~~~

De la misma forma podremos instanciar herramientas ya hechas por otros programadores.

---

# Rest Api

Uno de los conceptos básicos para el desarrollo Back-End es el conocer que es un **Rest API**, por lo cual en esta sección nos encargaremos de aclarar esta posible duda.

---

## ¿Que es un Rest Api?

Una **Application Programming Interface** en si es un conjunto de funcionalidades que permiten conectar **un cliente** (ya sea una aplicación móvil, un dispositivo de escritorio, una pagina web, entre otros...) con un conjunto de datos almacenados en **una base de datos**, permitiéndonos interactuar con estos datos de ciertas formas.

El sistema de comunicación funciona por medio de **Requests** y **Responses** por medio de una petición y un mensaje que devuelve lo que hemos pedido a demás de entregar un código que **confirma que esta se haya efectuado de forma correcta**.

Estas respuestas pueden seguir varios niveles para entregar estos **Status Codes**:

* 1\*\*: Los códigos entre **100** y **199** son **Respuestas informativas**.
* 2\*\*: Los códigos entre **200** y **299** son **Respuestas satisfactorias**.
* 3\*\*: Los códigos entre **300** y **399** son **Respuestas sobre redirecciones**.
* 4\*\*: Los códigos entre **400** y **499** son **Errores del cliente**.
* 5\*\*: Los códigos entre **500** y **599** son **Errores del servidor**.

En términos simples **un Rest API no es mas que una formalidad a la hora de comunicar un cliente con un servidor**, permitiendo llevar a cabo ciertas funcionalidades conocidas como **HTTP METHODS**, estos nos entregan ciertas formas de comunicarnos con nuestros datos.

Con estas "iteraciones" nos referimos a algo similar a un "**CRUD**", o las acciones de "**crear, leer, actualizar y eliminar**" de una base de datos.

*Los Http Methods mas comunes son:*

+ **GET**
  + **GET** (/users): Utilizando simplemente el **GET** nos entrega acceso a **todos los usuarios**.
  + **GET** (/users/:id): Utilizando el **GET** junto a un id podremos acceder a **un usuario en especifico**.
+ **POST** (/users): Nos permite **agregar** usuarios.
+ **PUT** (/users/:id): nos permite **reemplazar** un usuario especifico.
+ **PATCH** (/users/:id): nos permite **actualizar** un usuario ya existente.
+ **DELETE** (/users/:id): nos permite **eliminar** un usuario ya existente.

Otro concepto relativamente relevante a los **Rest API'S** es algo conocido como "**Endpoints**", siendo estos **el lugar a donde nuestra "request"**.

---

## Creando nuestro proyecto

Para iniciar tendremos que crear una carpeta en la que ejecutaras el siguiente comando: `npm init -y`, para poder crear la instancia del **`json`** que se encarga de revisar nuestros valores básicos (lo único que cambiare será la variable **`author`**).

Luego en la misma carpeta agrega un archivo de JavaScript, en mi caso lo llamare **`api.js`**.

Tras esto, simplemente agregaremos una dependencia necesaria en el proyecto, siendo esta **`express.js`** para la creación de API's utilizando el comando `npm install -S express`.

Luego de hacer este proceso tendremos la siguiente estructura de carpetas:

+ API (carpeta del producto)
  + **node_modules**: dependencias **prohibido tocar**.
  + **api.js**: nuestro código base.
  + **package-lock.json**: nuestro archivo encargado de asegurar las versiones de las dependencias.
  + **package.json**: nuestro archivo encargado de mencionar los datos esenciales del proyecto.

---

## Creando la API

Empezaremos con un API básica con elementos como la implementación de `Express` hasta el levantamiento de un **local server** donde integraremos nuestra solución. 

Agregaremos lo siguiente en nuestro archivo `api.js`.

~~~javascript
const express = require('express');
const app = express(); // creamos nuestra app
const port = 3000;
~~~

Con estas lineas nos encargamos de importar express y de entregar todos sus valores a una constante, esta la utilizaremos para crear una instancia de nuestra **app**, desde este valor podremos acceder a **nuestras funciones de acceso a datos** .

### HTTP Methods

Los **Metodos HTTP** son los metodos que nos permiten acceder a ciertas funcionalidades con los datos accesibles en nuestro API, siendo estos los anteriormente vistos:

+ **GET**
  + **GET** (/users): Utilizando simplemente el **GET** nos entrega acceso a **todos los usuarios**.
  + **GET** (/users/:id): Utilizando el **GET** junto a un id podremos acceder a **un usuario en especifico**.
+ **POST** (/users): Nos permite **agregar** usuarios.
+ **PUT** (/users/:id): nos permite **reemplazar** un usuario especifico.
+ **PATCH** (/users/:id): nos permite **actualizar** un usuario ya existente.
+ **DELETE** (/users/:id): nos permite **eliminar** un usuario ya existente.

Entre otros que quizá necesitemos mas adelante, la forma en la que los utilizaremos será por medio de nuestra **App** (de Express), utilizando la sintaxis de `app.METHOD()` siendo `METHOD()` una de las funciones anteriormente mencionadas (GET, POST, PUT, PATCH, DELETE).

Utilizando el primero de estos abriremos o "crearemos" la conexión raíz utilizando el método **`GET`** con un enlace vacio de la siguiente forma:

~~~javascript
app.get('/', (req, res) => {
    res.status(200).send('La pagina esta funcionando, felicidades!!!');
});
~~~

Al generar esta función estaremos constantemente en búsqueda de un **Request**, esperando para dar una **Response**, cada vez que abramos la pagina raíz en `https://localhost:3000/` se enviara una petición.

A esta le daremos una respuesta(res) con el **Status code** de 200, mencionando así que la respuesta del mismo es exitosa, enviando con el **send** el texto `"la pagina esta funcionando, felicidades!!!"` a nuestro cliente.

 Por ultimo generaremos la escucha al puerto con la función **listen** de Express.

~~~javascript
app.listen(port, () => { 
    console.log('arrancando la aplicacion');
});
~~~

Esta función escucha por que se envié una petición al puerto, así preparándose para entregar una respuesta.

Si el puerto que se asigna es omitido o cero, se asignara un puerto aleatorio que este vacío, útil para hacer testing y herramientas de automatización.

Ahora con todo esto listo, si ejecutas en la terminal `node api.js` veras el mensaje de `"arrancando la aplicacion"` en la terminal, y buscar el enlace **`http://localhost:3000/`** en el buscador, tendrás una pagina en blanco con el texto ingresado en el `app.get()`.

---

## End-Points

 Un End-Point es **una localización digital** que genera una petición de ciertos datos, estos nos permiten especificar **que datos son accesibles desde nuestro API**.

Y estos deben ser generados por nosotros por medio de los **HTTP Methods** y deben estar antes de nuestro **`app.listen()`**.

Para probar estos **End-points** utilizaremos la herramienta **Postman** utilizando el enlace que nos entrega nuestro proyecto.

---

### Post

Primero haremos un **End-point** para la publicación de datos en nuestro api, este tendra la siguiente sintaxis:

~~~javascript
app.post('/', (req, res) => {
    res.status(201).send('Se ha creado un elemento');
});
~~~

El Status **201** nos entrega el mensaje "**OK CREATED**", confirmando la creación de un elemento con el método **POST**.

*Algunos desarrolladores al crear elementos suelen devolver el id del mismo pero no es necesario*.

Ahora abre Postman y en una nueva ventana ingresa el enlace `http://localhost:3000/` y cambia la opción **GET** por **POST**, tras esto será visible el mensaje de "**Se ha creado un elemento**", confirmando que todo funcione correctamente.

---

### PUT, PATCH y DELETE

Si recuerdas bien nuestra lista de **métodos http** teníamos los siguientes:

+ **PUT** (/users/:id): nos permite **reemplazar** un usuario especifico.
+ **PATCH** (/users/:id): nos permite **actualizar** un usuario ya existente.
+ **DELETE** (/users/:id): nos permite **eliminar** un usuario ya existente.

Como notaras estos estan especificamente creados **para trabajar con datos individuales**, por lo cual los **endpoints** de todos tendrian la siguiente forma:

~~~javascript
app.put('/:id', (req, res) => {
    res.sendStatus(204);
});

app.patch('/:id', (req, res) => {
    res.sendStatus(204);
});

app.delete('/:id', (req, res) => {
    res.sendStatus(204);
});
~~~

*El status 204 se encarga de entregarnos una respuesta de "OK, No Content" cuando esta funciona de forma exitosa*.

Con esto agregado a nuestro código, podremos abrir Postman y ejecutar las mismas funcionalidades, pero primero hay que ver algo importante.

Si lo notaste ahora no estamos directamente desde la raíz con `'/'`, ahora estamos agregando una variable `'/:id'`, ese "id" es el elemento que le pasaremos a nuestro enlace como "id" al elemento que **remplazaremos, actualizaremos o eliminaremos.** 

Entonces si ponemos la opción **PUT, PATCH o DELETE** en Postman, asegúrate de que nuestro enlace tenga al final un **string** o **integer** que funcione como identificador.

Al enviar la petición, en la esquina superior izquierda de el visualizador de respuestas deberías ver el texto "204 No Context".

Si por ejemplo en el **PUT** agregas la siguiente linea:

~~~javascript
console.log(req.params);
~~~

Se nos entregara un objeto compuesto por el id del elemento agregado, esto puede ser muy útil en las otras funcionalidades mencionadas, ya que es necesario acceder a estos datos antes siquiera de cambiarlos.

Con estos endpoints en si podremos acceder a los datos de nuestra base de datos y en si efectuar los cambios que nos entrega cada verbo.

Por ultimo tambien como recordaras hay una versión del **GET** que utiliza un `:id`, este se veria de la siguiente forma:

~~~javascript
app.get('/:id', (req, res) => {
    console.log(req.params) // mostramos el id del nuevo valor
    res.status(200).send(req.params); // lo enviamos
});
~~~

