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
+ **PUT** (/users/:id): nos permite **reemplazar** un usuario especifico (cambiar una persona completa). 
+ **PATCH** (/users/:id): nos permite **actualizar** un usuario ya existente (cambiar el nombre de una persona).
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

*Ojo, recuerda que si tu archivo se llamara api.js este recomiendo que sea cambiado en el archivo `package.json` para que el mismo pueda ejecutarse simplemente utilizando `node .`, si no hacemos esto, al utilizar este comando se buscara por un archivo con nombre `index.js`*.

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

---


## Refactorizando

Por temas de comodidad y legibilidad haremos un **refactoring** del código, recomiendo seguir este orden con cada elemento accesible de nuestro API.

Empezaremos creando una carpeta llamada **`user.controller.js`**, este lo nombraremos según el elemento con el que trabajaremos, obviamente en este ejemplo trabajaremos con usuarios.

En este crearemos una lista compuesta por las funciones que tendrán nuestros usuarios, viéndose de la siguiente forma:

~~~javascript
const User = {
    get: (req,res) => {
        res.status(200).send("Este es un elemento especifico");
    },
    list: (req,res) => {
        res.status(200).send("Wena po");
    },
    create: (req,res) => {
        res.status(201).send("Se ha creado un elemento");
    },
    update: (req,res) => {
        res.status(204).send("Se ha actualizado un elemento");
    },
    delete: (req,res) => {
        res.status(204).send("Se ha eliminado un elemento");
    },
}

module.exports = User; // exportamos este archivo para nuestro index.js
~~~

Tras esto en nuestro **`index.js`** arreglaremos nuestros métodos http de la siguiente forma:

~~~javascript
const user = require('./user.controller'); // importamos nuestro archivo de funciones

const express = require('express');
app = express();
port = 3000;

// los referenciamos en nuestros metodos http
app.get('/', user.list); // vemos todos los objetos
app.get('/:id', user.get) // obtenemos un objeto especifico
app.post('/', user.create); // agregamos un objeto
app.put('/:id', user.update); // actualizamos un objeto
app.patch('/:id', user.update); // actualizamos un objeto
app.delete('/:id', user.delete); // eliminamos un objeto

app.listen(port, ()=>{
    console.log('la pagina ha funcionado en: http://localhost:' + port);
})
~~~

Siguiendo esta forma nuestro código puede ser mas legible y cómodo a largo plazo.

---

## Capturando todas las peticiones.

A la hora de trabajar con NodeJs te darás cuenta que al hacer peticiones invalidas (como por ejemplo es hacer un get a un id que no existe), este te devolverá un mensaje señalando específicamente que la pagina que tratas de buscar no existe, este mensaje por defecto puede ser cambiado haciendo lo siguiente:

~~~javascript
// ahora en cada momento que hagas un get invalido se devolvera ese mensaje
app.get('*', (req, res) => {
    res.status(404).send('Esta pagina no existe');
})
~~~

Esto podríamos también hacerlo en otros métodos HTTP como son **`POST`**, aun que hacer esta edición es relativamente innecesaria, ya que el método post será ingresado directamente desde nuestra pagina, por ello es poco probable que esto sea visible desde el usuario.

---

# MongoDB

Una de las bases de datos **noSql** mas utilizadas en la era actúa, MongoDB es una base de datos orientada a documentos de código abierto, el sistema de guardado de datos a diferencia de en otras bases de datos no se basa en tablas.

Siendo una de las mejores opciones para cantidades gigantes de datos, dado su fácil escalabilidad.

Este sistema se basa en archivos o **documentos** estructurados con un lenguaje similar a **JSON** conocido como **BSON**.

MongoDB se compone de:

* Documentos: Archivos JSON de los datos en si.
* Colecciones: Un grupo o listado de Documentos (por ejemplo la colección "Users" es un listado de usuarios).
* Propiedades: Elementos que definen los datos almacenados por cada documento.

---

## Atlas

En si hay múltiples formas de trabajar con MongoDB, principalmente utilizaremos algo conocido como "MongoDB Atlas", esta es la opción de la nube que nos entrega MongoDB, entregándonos servidores con los que trabajar hasta 500mb de forma gratuita.

También puedes hacerlo por medio de un servidor local, pero lo bueno de esta opción es que directamente puede ser testeado desde cualquier dispositivo sin tener que configurar personalmente un servidor.

Mientras tanto, encárgate de crear una cuenta en la plataforma de atlas y selecciona la opción gratuita de MongoDB Atlas.

Tras esto creamos un nuevo servidor, seleccionándolo con **AWS** eligiendo el servidor mas cercano a la zona donde nos encontremos, le entregamos un nombre y finalmente creamos un nuevo **Cluster**.

Tras esto tendremos que agregar o crear nuestro super usuario, esto entregando un nombre de usuario y contraseña para el administrador de nuestra base de datos, en nuestro caso utilizare:

* Usuario: admin
* Contraseña: asdf123

Obviamente estos cambiaran en un ambiente de producción ya que por temas de prueba he hecho una cuenta de este tipo y en la zona inferior nos encargamos de posicionar que **ip** referencia el dispositivo en el que hemos lanzado nuestra aplicación, en nuestro caso será desde nuestro computador con una **ip** que cambiara constantemente.

Por ello simplemente usa `0.0.0.0/0` con la descripción de `Word`, ojo que en un ambiente de producción, eliminaríamos la **ip**: `0.0.0.0/0` y utilizaríamos el de nuestro dispositivo donde se lanzo la aplicación.

Con todo esto listo, al presionar el botón **connect** nos entregara la posibilidad de conectarnos desde nuestra aplicación.

Simplemente seleccionas la opción de **connect your application** y nos entregara una URL para conectarnos a nuestra base de datos (asegúrate de que en el driver este puesto **NodeJs** y como versión pongas la que estas utilizando actualmente).

Esta es la siguiente:

~~~
mongodb+srv://admin:<password>@cluster0.ghuxske.mongodb.net/?retryWrites=true&w=majority
~~~

Acá tendrás que cambiar la contraseña o el nombre de usuario por los que generaste anteriormente, en mi caso este quedara así:

~~~
mongodb+srv://admin:asdf123@cluster0.ghuxske.mongodb.net/miApp?retryWrites=true&w=majority
~~~

A demás hay un valor escondido el cual es "el nombre de nuestra base de datos", este se encuentra entre `mongodb.net/` y el `?` que encontramos luego, en el ejemplo llame a mi base de datos **miApp**.

---

## Conectándonos a nuestra base de datos

Ahora podemos empezar con nuestra conexión en si.

Para esto utilizaremos una librería llamada **Mongoose**, esta nos permitirá hacer una conexión entre **MongoDB** y nuestro entorno de **NodeJs**.

Primero instalaremos esta librería con el comando `npm install mongoose`.

Tras esto podremos generar nuestra conexión en la base de datos haciendo lo siguiente:

~~~javascript
const mongoose = require('mongoose'); // importamos mongoose

// generamos la conexion con el enlace que nos entrego Atlas
mongoose.connect('mongodb+srv://admin:asdf123@cluster0.ghuxske.mongodb.net/miApp?retryWrites=true&w=majority');
~~~

En términos simples, ya nos habríamos conectado a nuestra base de datos.

---

## Guardando datos

Para el proceso de guardado de datos llevaremos a cabo un conjunto de pasos que nos permitirán probar las funcionalidades de MongoDb, siendo estos:

1. La creación de un modelo para nuestros elementos en la base de datos.
2. La creación de datos e ingreso de los mismos en la base de datos.

Para esto en nuestro mismo archivo de `index.js` agregaremos lo siguiente luego de la conexión a MongoDB:

~~~javascript
// modelos se crean con mayuscula
// la funcion mongoose.model() tiene 2 parametros:
	// 1. el nombre del modelo.
	// 2. el modelo en cuestion segun su estructura (en este caso en json).
const User = mongoose.model('User', {
    username: String,
    edad: Number,
});

const crear = async () => {
    /// instancias de un modelo se crean con minuscula
    const user = new User({username: 'Rodrigo Seguel', edad: 19})
    
    // la funcion de user.save es una promesa que guarda los elementos creados
    // al ser una promesa podemos ejecutarlo con un .then y llamar una funcion luego de que se concrete
    const savedUser = await user.save()
    console.log(savedUser);
}

crear(); // llamamos la funcion de crear el nuevo usuario
~~~

Con esto al ejecutar nuestro archivo `index.js` veremos en nuestra terminal algo como lo siguiente:

~~~
{
  username: 'Rodrigo Seguel',
  edad: 19,
  _id: new ObjectId("6322c3356c785f651359635e"),
  __v: 0
}
~~~

Esto es en si la representación del usuario guardado por la función `user.save()`, este elemento contiene los datos que le entregamos a demás de un **id**, este nos puede servir para obviamente identificar elementos en la base de datos.

Permitiéndonos por ejemplo, si creamos un sistema de ingreso de productos, permitir acceder a quien le pertenece entregándole a este producto un elemento que referencie el identificador de el usuario que lo creo.

Finalmente si vamos a nuestro cluster en Atlas, encontraras que al presionar **browse collections**, se abrirá la ventana de **miApp.users** donde deberías ver una instancia de nuestro usuario recién creado.

---

## Buscando datos

Para buscar datos utilizaremos las funciones `find()` y `findOne()` respectivamente, permitiéndonos acceder a un arreglo de elementos o a un objeto representando un elemento de la misma base de datos en si.

Para continuar, asegúrate de crear mas usuarios para así poder leerlos.

* Buscar todos: Si deseamos leer todos los elementos en la base de datos podemos hacer lo siguiente:

  ~~~javascript
  const buscarTodo = async () => {
      const users = await User.find() // esto nos devuelve un arreglo de usuarios
      // console.log(users) si hacemos lo siguiente traeremos todos los elementos completos
  
      // al ser un arreglo, podemos hacer lo sigueinte
      users.forEach(element => {
          console.log(element.username) // y traer solamente el nombre de los usuarios
      });
  }
  
  buscarTodo()
  ~~~

  ---

* Buscar elementos segun filtro: Si deseamos traer todos los elementos que compartan un valor (como por ejemplo nombre, edad, tipo u otras características del modelo) podemos hacer lo sigueinte:

  ~~~javascript
  const buscar = async () => {
      // traemos un arreglo con todos los elementos cuya edad sea 19
      const user = await User.find({edad: 19}) 
      console.log(user)
  }
  
  buscar()
  ~~~

  En este caso tengo 2 elementos con la misma edad por lo que devolverá un arreglo con estos, el problema es que si por ejemplo tenemos un solo elemento que cumple con las características, este también devolverá un arreglo.

  ---

* Buscar solo un elemento: Si deseamos traer un solo elemento segun un filtro debemos hacer lo siguiente:

  ~~~javascript
  const buscarUno = async () => {
      // traemos el usuario cuyo nombre de usuario es "Rodrigo Seguel"
      const user = await User.findOne({username: 'Rodrigo Seguel'})
      console.log(user)
  }
  
  buscarUno()
  ~~~

  En este caso, si hay varios elementos que se relacionan con el filtro (como `edad: 19`), este traerá el primer elemento encontrado de estos.

---

## Actualizar elementos

Para actualizar elementos simplemente tenemos que acceder a uno de estos por medio de las funciones de búsqueda anteriormente utilizadas y simplemente asignando un nuevo valor a estos datos.

Por ejemplo:

~~~javascript
const actualizar = async () => {
    const user = await User.findOne({username: 'Rodrigo Seguel'})  // llamamos un elemento
    user.edad = 20 // cambiamos la edad del usuario obtenido
    await user.save() // guardamos los cambios
    console.log(user) // mostramos el elemento con el nuevo valor 
}

actualizar();
~~~

---

## Eliminar elementos

La eliminación de elementos funciona de una forma similar a la de actualizar, simplemente buscando y eliminando el mismo de la siguiente forma:

~~~javascript
const eliminar = async () => {
    const user = await User.findOne({username: 'Jennifer Conuel'})  // llamamos un elemento
    
    if (user) { // nos aseguramos de la existencia del elemento
        console.log('se ha eliminado el usuario: ' + user.username)
        await user.remove() // este se ejecutara solamente cuando el usuario exista
    } else { // si este no existe mostraremos el siguiente mensaje
        console.log('el usuario no existe')
    }
}

eliminar();
~~~

---

Con todo esto ahora podríamos actualizar nuestros Endpoints y permitirnos hacer mas acciones que simplemente mostrando **status codes**.

---

## Actualizando y organizando nuestra API

Para continuar organizaremos nuestro código de una mejor forma uniendo las acciones hechas con nuestros Endpoints anteriormente creados.

Antes de esto haremos ciertas configuraciones para poder trabajar esto sin problemas.

Primero conectaremos nuestro archivo `api.js` haciendo lo siguiente:

~~~javascript
const express = require('express');

const mongoose = require('mongoose'); // importamos mongoose

const user = require('./user.controller');
app = express();
port = 3000;

// esto es para obtener nuestras peticiones y poder trabajar con ellas
app.use(express.json());

// creamos conexion
mongoose.connect('mongodb+srv://admin:asdf123@cluster0.ghuxske.mongodb.net/miApp?retryWrites=true&w=majority');

app.get('/', user.list);
//...
~~~

Con esto listo podremos crear nuestro modelo de datos, ahora creare otro modelo de **usuarios**, estos los crearemos en otro archivo el cual llamaremos `Users.js` y se vera de la siguiente forma:

~~~javascript
const mongoose = require('mongoose')

// creamos el modelo de nuestros usuarios
const Users = mongoose.model('User', {
    name: {type: String, required: true, minLength: 3},
    lastName: {type: String, required: true, minLength: 3}
})

module.exports = Users
~~~

Como podrás ver, Mongoose nos entrega la posibilidad de seleccionar ciertos elementos obligatorios de cada propiedad, en este caso el nombre:

* Debe ser de tipo string.
* Es requerido (debe estar obligatoriamente).
* Debe tener un largo mínimo de 3.

Tras esto ya podremos empezar a actualizar nuestro `user.controller.js`.

---

### Actualizando nuestro código

Ahora finalmente actualizaremos nuestro archivo de `user.controller.js`, esto preferiblemente lo haremos en cierto orden, para así poder hacer pruebas y asegurarnos del correcto funcionamiento de nuestro código.

Recuerda en este archivo primero agregar nuestro modelo de usuarios con agregando en la primera linea:

~~~javascript
const Users = require('./User');
~~~

Con esto ya podemos continuar.

* **List**: Empezaremos actualizando la función `list()` permitiéndonos llamar todos los elementos en la base de datos dejándolo de la siguiente forma:

  ~~~javascript
  list: async (req,res) => {
      const users = await Users.find(); // esto nos devuelve un arreglo de usuarios
  	res.status(200).send(users);
  }
  ~~~

  Ahora en Postman simplemente llamando el método **GET **veremos en si un arreglo compuesto por todos los usuarios ingresados en la base de datos.

  ---

* **Create**: Para este primero haremos una pequeña prueba (recuerda tener el `app.use(express.json());` en nuestro `api.js`):

  ~~~javascript
  create: async (req,res) => {
  	console.log(req.body);
     	res.status(201).send("Se ha creado un elemento");
  }
  ~~~

  Tras esto iremos a Postman y cambiaremos el método por **POST**, tras esto iremos a la opción **"body"**, aquí agregaremos un dato en formato **JSON** el cual será agregado a la base de datos, por ejemplo:

  ~~~json
  {
      "name": "Catalina",
      "lastName": "Gonzales"
  }
  ~~~

  Lastimosamente esto solo nos entregara un objeto vacío si lo ejecutamos, para que nos muestre el valor que le entregamos, tenemos que ir a la sección **"headers"** y agregar:

  * Key = Content-type
  * Value = application/json

  Con esto listo ya seremos capaces de ejecutar esta petición y al hacerlo en nuestra terminal encontraremos el formato **JSON** de los datos que acabamos de crear.

  Para ya poder subir estos datos agregados simplemente tendremos que dejar nuestra funcion como la siguiente:

  ~~~javascript
  create: async (req,res) => {
      const user = new Users(req.body); // crea el nuevo usuario
      const savedUser = await user.save(); // guardamos el usuario
      res.status(201).send(savedUser._id); // retornamos el id del usuario creado
  }
  ~~~

  En términos generales el `req.body` es en si el archivo **JSON** que hemos enviado por medio de nuestra peticion.

  ---

* **Get**: Para obtener solo un valor debemos dejar nuestra funcion como lo siguiente:

  ~~~javascript
  get: async (req,res) => {
      const { id } = req.params; // definimos el parametro entregado en el enlace
      const user = await Users.findOne({ _id: id}); // buscamos un usuario con el id obtenido
      res.status(200).send(user); // retornamos el usuario obtenido
  }
  ~~~

  Ahora cambiando nuestro método a **GET** si llamamos el enlace raíz agregando nuestro identificador como por ejemplo seria: `http://localhost:3000/6323e4757553ce4f2c044391`, obtendré el usuario que creamos, o sea:

  ~~~json
  {
      "_id": "6323e4757553ce4f2c044391",
      "name": "Catalina",
      "lastName": "Gonzales",
      "__v": 0
  }
  ~~~

  ---

* **Update**: para actualizar los datos de un elemento lo que haremos será el obtener este elemento y luego simplemente actualizar el dato especificado.

  Para esto simplemente haremos:

  ~~~javascript
  update: async (req,res) => {
      // traemos un objeto
      const { id } = req.params;
      const user = await Users.findOne({ _id: id});
      
      // asignamos nuevos valores segun el cuerpo de la peticion enviada
      Object.assign(user, req.body);
      await user.save(); // guardamos los cambios
      
      res.sendStatus(204); // enviamos nuestra respuesta
      }
  ~~~

   Ahora si cambiamos el método a **PUT**, ingresamos `http://localhost:3000/6323e4757553ce4f2c044391` y cambiamos el **"body"** del mismo similar a como lo hicimos anteriormente (puedes cambiar cualquier valor), al ejecutar este se realizaran esos cambios en el mismo servidor.

  Debes asegurarte de que en caso de que quieras alterar solamente un valor, en el **"body"** referencia solo a ese valor, por que sino, estarás reenviando todos los valores del mismo objeto, lo que a futuro puede generar problemas de rendimiento.

  *por ejemplo:*

  ~~~json
  {
      "name": "cata"
  }
  ~~~

  ---

* **Delete**: Finalmente para eliminar valores simplemente tendremos que hacer lo siguiente:

  ~~~javascript
  delete: async (req,res) => {
      // buscamos el usuario
      const { id } = req.params;
      const user = await Users.findOne({ _id: id});
      
      // nos aseguramos de que exista
      if (user) {
          user.remove(); // lo eliminamos
      }
  	res.sendStatus(204); // enviamos respuesta
  }
  ~~~

  Ahora simplemente al cambiar el método a **DELETE** y ejecutar el enlace con el id especificado, veremos que efectivamente nuestro usuario se eliminara de la base de datos.

---

# Utilizando nuestra API

Finalmente empezaremos a mostrar nuestro uso del API en una pagina utilizable por nuestros usuarios, para ello empezaremos permitiendo el mostrar un **HTML** en la ventana.

Esto es relativamente simple, para ello (continuando con el ejemplo que hemos seguido por el proyecto) haremos lo siguiente en nuestro `api.js`:

~~~javascript
//..
app.get('/Users', user.list);
app.get('/Users/:id', user.get);
app.post('/Users', user.create); 
app.put('/Users/:id', user.update);
app.patch('/Users/:id', user.update);
app.delete('/Users/:id', user.delete);

// creamos este metodo get a la raiz de la pagina
app.get('/', (req, res) => {
    console.log(__dirname); // __dirname nos entrega la carpeta donde se encuentra el archivo
    res.sendFile(`${__dirname}/index.html`); // enviamos al cliente el archivo de index.html
})

//..
~~~

Tras esto simplemente crea un archivo **HTML** con el nombre `index.html` y agrega lo que quieras a el por ahora, al abrir el servidor, podrás ver que el **HTML** se ha aplicado a la pagina raíz.

pero antes de continuar tendré que mencionar un tema especifico, mínimo y que quizá te genere confusión.

En nuestros métodos habrás notado que agregue un "**Users**" como parte del enlace para acceder a los métodos en si, esto fue para que cuando requieras de acceder al **HTML** esto se haga desde la carpeta raíz de forma normal.

Mientras que para ejecutar estos métodos HTTP, necesitaremos que el enlace especifique que la edición es a **Users**, mas que nada **es una forma de separar la llamada a la pagina principal, con la llamada a los métodos HTTP**.

---

## Carpetas estáticas

En el desarrollo web hay un concepto de carpetas estáticas, este representa los elementos como archivos **JS, HTML Y CSS** a los cuales nuestro cliente va a acceder, estos deben ser "preparados antes de ser accedidos".

Entregándole en si a nuestra app, la ruta en la que estos contenidos serán accesibles utilizando la siguiente línea:

~~~javascript
app.use(express.static('client')); // nuestra carpeta estatica se llamara "client"

// lo hacemos antes de nuestro get principal
app.get('/', (req, res) => {
    console.log(__dirname);
    res.sendFile(`${__dirname}/index.html`);
})
~~~

Por lo que desde ahora en adelante cuando accedamos a otros elementos desde nuestro `index.html`, estos deberan estar en esa carpeta estática.

Entonces ahora crea una carpeta con el mismo nombre que le entregaste a la carpeta estática (en nuestro caso `client`), por y ahí por motivos de prueba, crearemos un script con el nombre de `main.js`.

Ahora en nuestro `index.html` agrega lo siguiente:

~~~html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <script src="main.js"></script>
</head>
<body>
    <h1>Hola</h1>
</body>
</html>
~~~

Si todo esta bien **nuestro `main.js` se utilizara de forma correcta**.

---

## Creando una plantilla y formulario

Para empezar a trabajar recibiendo datos de nuestros usuarios primero llevaremos a cabo el proceso de crear un template, el cual se encargara de generar el formulario al que nuestros usuarios van a acceder.

Para esto primero haremos unos cambios en nuestro `index.html`, dejándolo de la siguiente forma:

~~~html
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <script src="main.js"></script>
</head>
<body></body>
</html>
~~~

Básicamente dejamos toda la pagina vacía, ya que será el body donde ingresaremos nuestro formulario.

Ahora volviendo a nuestro `main.js` nos encargaremos de hacer lo siguiente:

1. Crear una función que genere un template del formulario y lo aplique en el `<body></body>`.

   ~~~javascript
   // creamos el template para nuestro html
   const loadInitialTemplate = () => {
       // creamos el template a utilizar de nuestro formulario
       const template = `
           <h1>Usuarios</h1>
           <form id="user-form">
               <div>
                   <label>Nombre</label>
                   <input name="name">
               </div>
               <div>
                   <label>Apellido</label>
                   <input name="lastname">
               </div>
               <button type="submit">Enviar</button>
           </form>
           <ul id="user-list"></ul>
       `
   
       // pasamos el template al body
       const body = document.getElementsByTagName('body')[0] // buscamos el body en html
       body.innerHTML = template // al body le entregamos la plantilla
   }
   ~~~

   ---

2. Crear una función que lea los datos enviados desde el formulario y los transforme en un JSON.

   ~~~javascript
   // esperamos a que se ejecute alguna accion en el formulario
   const addFormListener = () => {
       const userForm = document.getElementById('user-form') // buscamos el formulario
       userForm.onsubmit = async (e) => { // presionas el submit
   
           e.preventDefault() // esto evita que la pagina se refresque cuando enviemos el formulario
   
           // transformamos los datos obtenidos por el formulario en un objeto JSON
           const formData = new FormData(userForm) // obtenemos formulario
           const data = Object.fromEntries(formData.entries()) // transformamos en JSON
           console.log(data);
       }
   }
   ~~~

   ---

3. Aplicar estas funciones cuando la pagina haya cargado.

   ~~~javascript
   // ejecutamos todo cuando la pagina se haya cargado
   window.onload = () => {
       loadInitialTemplate()
       addFormListener()
   }
   ~~~

   ---

Con esto listo, al recargar el servidor y abrir la pagina nos aparecerá un formulario en el que podremos ingresar datos, al enviarlos, en nuestra terminal recibiremos un objeto **JSON** con los datos del mismo.

---

## Creando usuarios

Para crear usuarios vamos a generar una pequeña actualización a nuestra función `addFormListener()`.

La idea de esta función es el permitirnos ingresar datos en la base de datos para luego mostrarlos en una lista, por ello la función quedara de la siguiente forma:

~~~javascript
const addFormListener = () => {
    const userForm = document.getElementById('user-form')
    userForm.onsubmit = async (e) => {
        e.preventDefault()
        const formData = new FormData(userForm)
        const data = Object.fromEntries(formData.entries())

        // hacemos un post de usuarios, pasando nuestro json data como body
        await fetch('/users', {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        })
        userForm.reset() // limpiamos el formulario
    }
}
~~~

---

## Listando usuarios

Para el listado de usuarios crearemos otra función antes de nuestro `addFormListener()` la cual se vera de la siguiente forma:

~~~javascript
const getUsers = async () => {
    // hacemos una llamada a usuarios y la respuesta la recibimos en json
    const response = await fetch('users')
    const users = await response.json()

    // creamos el template de los usuarios a listar
    const template = user => `
        <li>
            ${user.name} ${user.lastName} <button data-id="${user._id}">Eliminar</button>
        </li>
    `

    // aplicamos el template en nuestro html
    const userList = document.getElementById('user-list')
    userList.innerHTML = users.map(user => template(user)).join('')
}

~~~

Ahora simplemente agregamos esta función en el `addFormListener()` y en el `onload()` haciendo:

~~~javascript
const addFormListener = () => {
    //...
    userForm.onsubmit = async (e) => { // presionas el submit
		//...
        getUsers() // llamamos la funcion cuando se crea un usuario nuevo
    }
}

window.onload = () => {
    loadInitialTemplate()
    addFormListener()
    getUsers() // llamamos la funcion cuando se carga la pagina
}
~~~

---

## Eliminando usuarios

Para eliminar usuarios, simplemente haremos un pequeño cambio en la función que se encarga de cargar los nodos quye representan cada usuario en la base de datos, siendo en este caso `getUsers()`.

Esta función la dejaremos de la siguiente forma:

~~~javascript
const getUsers = async () => {
    const response = await fetch('users')
    const users = await response.json()
    const template = user => `
        <li>
            ${user.name} ${user.lastName} <button data-id="${user._id}">Eliminar</button>
        </li>
    `
    const userList = document.getElementById('user-list')
    userList.innerHTML = users.map(user => template(user)).join('')

    // hacemos lo siguiente...
    users.forEach(user => { // traemos cada boton de eliminar como un "nodo"
        const userNode = document.querySelector(`[data-id="${user._id}"]`)

        // al presionar el boton
        userNode.onclick = async e => {
            // eliminamos el elemento de la base de datos
            await fetch(`/users/${user._id}`, {
                method: 'DELETE',
            })
            userNode.parentNode.remove() // eliminamos el elemento de la lista
            alert('se ha eliminado un elemento')
        }
    });
}
~~~

---

# Autorización y registro

Cuando empezamos a trabajar con bases de datos una de las funcionalidades mas especiales que nos interesaran será la de **confirmar la conexión de nuestros usuarios por medio de un proceso de "Registro y autorización"**.

Por eso, en esta sección nos encargaremos de desarrollar un sistema que nos permita llevar a cabo esta funcionalidad especifica.

Empezando por ciertos conceptos de relativa importancia, como son:

* **Autenticación**: El proceso de **reconocer y confirmar** quienes somos y entregar una "llave" como respuesta.

* **Autorización**: El proceso del servidor de **indicar** si tenemos permisos para acceder a un recurso.

  Esto se hace por medio de un concepto conocido como "**FireWall**" como una "pared" que se encarga de filtrar si por ejemplo el usuario tiene o no acceso a recursos como `/Users` o `/Payments` entre otros...

---

## Criptografía

La criptografía es uno de los conceptos mas importantes a la hora de mantener cierto **secretismo en nuestros datos**, siendo esta un área matemática encargada de "**esconder información**" con técnicas de **cifrado** y **codificado** permitiéndonos alterar las representaciones de nuestro lenguaje con el fin de hacerlos inteligibles a simple vista.

Conocer la matemática detrás de esta área no es necesaria, pero hay ciertos conceptos que son esenciales para cada desarrollador BackEnd.

*Estos son:*

### Hash

proveniente del mundo culinario, el termino "**Hash**" significa "**picar y mezclar**", este es un valor "codificado" generado por una "**función de hashing**", la cual se encargara de transformar un **input** en un conjunto de valores que sin las herramientas adecuadas se podría considerar como "**información basura**".

La idea de esto es poder dar una primera capa de encriptación a nuestros datos ya que en caso de que por ejemplo alguien tenga acceso a nuestra base de datos, a parte tendrá que descifrar el hash para tener una claridad de los datos a los que tiene acceso, siendo muy seguro ya que a día de hoy es muy difícil para un computador descifrar un hash.

Además de todo nos permitirá guardar datos sin siquiera conocer que datos hemos guardado, simplemente comprobando si están bien al ingresarse y al comprobarse, entregándonos una confianza ciega a nuestros usuarios de que no podremos acceder a sus datos.

Un ejemplo de como implementar un hash en node:

~~~javascript
// importamos 'crypto' (este viene en los paquetes de node)
const { createHash } = require('crypto');

// creamos una funcion a la que le pasaremos un input
function hash(input) {
    // creamos el hash con 'sha256', este se aplicara al input y devolvera el hash como hexadecimal
    return createHash('sha256').update(input).digest('hex');
}

// si imprimimos un dato con esta funcion nos entregara un hash
console.log(hash('Hola, este dato estara encriptado!!!'));
~~~

*sha256, es un conjunto de algoritmos de hashing creados por la NSA (national security agency)*.

Al ejecutar este código en nuestra terminal deberíamos ver un hash recién salido del horno, pero también podríamos hacer otras cosas, como por ejemplo comparar si 2 input son los mismos como hashes, por ejemplo:

~~~javascript
let password = 'password123';
const hash1 = hash(password)

let password2 = 'password123';
const hash2 = hash(password)

if (hash1 == hash2) {
    console.log('The passwords are the same!!!');
} else {
    console.log('The passwords are different!!!')
}
~~~

Pero como quizá pensaras, un hash no es suficiente para proteger este tipo de información.

---

### Salt

Así nos referimos a una pequeña edición a nuestros valores antes de ser transformados en un "Hash", para así permitirnos un nivel extra de seguridad, ahora si alguien accede a nuestra base de datos, no solo tendrá que descifrar nuestro hash, sino también el Salt que le hemos agregado al mismo.

Por si no lo sabias las contraseñas:`123456789`; `12345678`; `1234`; `111111`; `000000`; `1234567`; `1234567890` son de las mas utilizadas en el mundo por lo que aun que creamos que son la cosa mas insegura del mundo (y lo son), estas seguirán siendo utilizadas y lastimosamente esto nos puede jugar en contra.

Si no utilizamos un **Salt**, alguien podría acceder a una tabla de contraseñas ya descifradas y hacer una búsqueda de los hashes de estas contraseñas en nuestra base de datos, así accediendo a los datos que no debería ya que como ya mencionamos, si hasheamos 2 veces el mismo elemento, estos resultados darán el mismo hash.

Por eso el Salt es tan importante, nos permite generar cambios a los datos ingresados antes de ser generado este hash, así no será tan fácil de reconocer alguna coincidencia.

ojo que por ejemplo al crear un usuario, cada usuario tendrá un Salt distinto para su contraseña en particular.

---

### HMAC

Un **Hash-based message authentication code** es en si **un tipo de hash que requiere una contraseña o firma, esta nos permite verificar simultáneamente la integridad de los datos a demás de la autenticación de los datos**.

Esto lo aplicamos en Node con algo conocido como **JSON web token** el cual será esta llave que nos permitirá verificar que nuestros datos provienen de un lugar seguro.

Este siendo un método para manejar en si las autenticaciones en nuestras aplicación asegurando mayor seguridad entre ambas partes de la conexión (ya sea servidor - cliente o cliente - cliente).

El proceso de verificar el origen de estos datos se logra gracias a un tipo de "firma" secreta asegurada por el **HMAC**.

aun así el **Jwt** es mas visto en los escenarios de: autorización o intercambio de información entre 2 entidades en la aplicación.

---

## Empezando un nuevo proyecto

Para probar estos conceptos crearemos un nuevo proyecto en el que haremos la prueba de crear usuarios y iniciar sesión con estos.

Para ello como es obvio crearemos un proyecto nuevo siguiendo los siguientes pasos:

1. Crea una carpeta con el nombre de tu proyecto (en mi caso lo llame "**`LoginTesting`**").
2. En esta inicia un proyecto nuevo de Node con `npm init`.
3. Instala las dependencias de este proyecto con `npm i express mongoose bcrypt jsonwebtoken express-jwt`.
4. Creamos los archivos de código con los que trabajaremos inicialmente siendo estos: `index.js` y `user.js`

Ahora podemos empezar con la configuración básica de nuestro proyecto:

+ En `Index.js` empezaremos haciendo lo siguiente:

  ~~~js
  // agregamos nuestras dependencias
  const express = require('express');
  const mongoose = require('mongoose');
  const bcrypt = require('bcrypt');
  const jwt = require('jsonwebtoken');
  const {expressjwt: expJwt} = require("express-jwt");
  const User = require('./user');
  
  // creamos nuestra conexion a mongo
  mongoose.connect('mongodb+srv://admin:asdf123@cluster0.ghuxske.mongodb.net/auth?retryWrites=true&w=majority');
  
  const app = express();
  app.use(express.json());
  
  // ejecutamos nuestro servidor en el puerto 3000
  app.listen(3000, () => {
      console.log('listening on port 3000');
  })
  ~~~

+ En `user.js` creamos el modelo de nuestros usuarios en la base de datos de la siguiente forma:

  ~~~js
  const mongoose = require('mongoose');
  
  // creamos el modelo
  const User = mongoose.model('User', {
      username: {type: String, required: true},
      password: {type: String, required: true},
      salt: {type: String, required: true},
  });
  
  // lo exportamos como un modulo (para que sea accesible desde nuestro index.js)
  module.exports = User;
  ~~~

Con esto listo podemos comenzar con las funcionalidades principales de registro y autorización.

---

## Registrando un usuario

Como es obvio empezaremos con una función importante para el proceso de inicio de sesión, ya que de cierto modo es imposible verificar la existencia de un usuario si ni un usuario existe en nuestra base de datos.

Para esto crearemos nuestro End-point de registro de la siguiente forma::

+ Revisar si un usuario existe.
+ Agregar un usuario si el usuario no existe.
+ Enviarle al usuario 
+ Mostrar un error si alguno de estos pasos falla.

Para ello haremos lo siguiente en nuestro `index.js`:

~~~js
// esta funcion se encargara de crear un token con el id que le entreguemos
const signToken = _id => jwt.sign({ _id }, 'thisStringMustBeSecret');

app.post('/register', async (req,res) => {
    const { body } = req;
    console.log(body);

    try {
        // buscamos si el username ya existe en la base de datos
        const isUser = await User.findOne({ username: body.username });
        if (isUser) {
            return res.send('This user already exists');
        }

        // si el usuario no existe en la base de datos:
        const salt = await bcrypt.genSalt(); // generamos un salt
        const hashed = await bcrypt.hash(body.password, salt); // lo aplicamos a nuestra password
        
        // creamos la instancia de user con el nombre de usuario, el hash creado y nuestro salt
        const user = await User.create({ username:body.username, password:hashed, salt })

        // finalmente para poder enviar estos datos al cliente los firmamos como un token JWT
        const signed = signToken(user);
        res.status(201).send(signed); // y enviamos el token firmado al usuario
    } catch (err) {
        console.log(err);
        res.status(500).send(err.message);
    }
});
~~~

Un tema importante antes de continuar, si ves la siguiente linea:

~~~javascript
// esta funcion se encargara de crear un token con el id que le entreguemos
const signToken = _id => jwt.sign({ _id }, 'thisStringMustBeSecret');
~~~

esta función tiene un string `'thisStringMustBeSecret'`, como dice el mismo, este debe ser secreto, ya que es el que utilizaremos para firmar nuestros tokens.

En términos generales la idea es revisar la existencia de este usuario, en caso de que no exista simplemente crearemos este mismo pasando su contraseña por un hash y agregando un salt, para luego todos estos datos firmarlos como un JWT.

Si entramos ahora a **Postman** y intentamos hacer un registro desde el enlace `http://localhost:3000/register` (de la misma forma que hacíamos un **POST** como cuando creamos nuestro primer Rest API) y le entregamos como Body lo siguiente:

~~~javascript
{
    "username": "Rodrigo",
    "password": "contrasena"
}
~~~

Recibiremos un codigo similar al siguiente:

~~~
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOnsidXNlcm5hbWUiOiJBbGVqYW5kcm8iLCJwYXNzd29yZCI6IiQyYiQxMCRiRzBXMldxUEtFSzVsMHdHbmtEMGtPZDR4alZsbktKcTBNWkhLMWtsL2wvcTQzNXk2MDNWdSIsInNhbHQiOiIkMmIkMTAkYkcwVzJXcVBLRUs1bDB3R25rRDBrTyIsIl9pZCI6IjYzNjMzZjNiYmU2MWE5YTUxN2JhZmJkZSIsIl9fdiI6MH0sImlhdCI6MTY2NzQ0ODYzNX0.2HIIFbMk_uhT5ARl06kpzeJjQzso0Cv8Sr-_sqfgCDw
~~~

En este caso este es el código que le entregamos a nuestro cliente, técnicamente es simplemente el id de nuestro usuario pero transformado en un **Json Web Token**.

Finalmente si revisamos nuestra base de datos de MongoDb encontraras algo como lo siguiente:

~~~json
{"_id":"635f706d1d0f3c6a666bbfc4",
 "username":"Rodrigo",
 "password":"$2b$10$LQkP1ucljvpEft6Z6uMlNeLTeRUjDNb0zMDygF/N1qUWb9b8zR5Va",
 "salt":"$2b$10$LQkP1ucljvpEft6Z6uMlNe",
 "__v":"0"}
~~~

Como podrás ver nuestra contraseña se encuentra encriptada, para mantener este secretismo necesario.

----

## Iniciando sesión

Continuando con lo anteriormente visto ahora nos enfocaremos en buscar estos datos y confirmar de forma segura que un usuario ingrese a estos sin problemas.

Por ello crearemos ahora el End-Point de inicio de sesión de la siguiente forma:

~~~javascript
app.post('/login', async (req,res) => {
    const { body } = req;
    console.log(body)

    try {
        const user = await User.findOne({ username: body.username });
        if (!user) { // revisamos si un usuario NO existe
            return res.send('Username or password is incorrect!!!');
        } else { // si este existe
            const isMatch = await bcrypt.compare(body.password, user.password) 
            if (isMatch) { // comprobamos que la password sea correcta
                const signed = signToken(user._id);
                res.status(200).send(signed) // si es correcta enviamos token al usuario
            } else {
                res.status(403).send('Username or password is incorrect!!!')
            }
        }
    } catch (error) {
        res.status(500).send(err.message);
    }
});
~~~

Un elemento importante de esta función es el: 

~~~javascript
const isMatch = await bcrypt.compare(body.password, user.password) 
~~~

La función `bcrypt.compare()` se encarga de hacer una comparación entre 2 parametros:

+ Un String sin encriptar (en este caso la contraseña que le entregamos desde el Body).
+ Un String encriptado (en este caso la contraseña que encontramos al hacer la búsqueda del usuario).

Por ello es mas eficiente utilizar esto a una condicional normal al menos cuando utilizamos **bcrypt**.

Ahora si hacemos una prueba en **Postman** desde el enlace `http://localhost:3000/login` pasándole como Body un elemento ya existente como es: 

~~~javascript
{
    "username": "Rodrigo",
    "password": "contrasena"
}
~~~

Debería devolvernos un JWT del id de este elemento y en caso de que ingreses un usuario o contraseña invalida, te mostrara un error.

Recuerda que el End-point lo creamos con el método **POST** así que debe estar en el mismo cuando ejecutes la peticion.

----

### Middlewares

Antes de continuar hay un concepto importante que debes conocer sobre **express** siendo este los **middlewares**, en si estos no los hemos visto de forma literal pero los has utilizado sin darte cuenta.

En si, un **Middleware** es una función que **se ejecuta después de recibir nuestras peticiones y antes de enviar nuestras respuestas**, siendo como dice su nombre, lo que se encuentra en medio de estos pasos.

Un ejemplo ya visto de estos **Middlewares** proviene en la función `app.use()` que ya hemos utilizado.

Al llamar esta función, nuestro servidor esperara por una petición (sin importar con que método HTTP se envíe), cuando esta se reciba, ejecutara una función seleccionada por nosotros.

El ejemplo mas fácil es el siguiente:

~~~javascript
app.use(express.json);
~~~

Esta función esperara a que llegue una petición, cuando esta llegue, transformara el estilo de la misma para que se transforme a un JSON, para luego pasar a la siguiente función.

#### Parámetros de un middleware

La forma real de un Middleware en si es la siguiente:

~~~javascript
const middleware = (req, res, next) => {
    console.log('este es el test de un Middleware');
    next();
}

app.use(middleware);
~~~

En si este se define por 3 parámetros importantes:

1. `req`: anteriormente usado, nos permite acceder a el `request` hecho por el usuario.
2. `res`: anteriormente usado, nos permite generar una `response` que se enviara al usuario.
3. `next`: representa la siguiente función después de la ejecución de nuestro middleware, este es ejecutado con el `next()` y en las funciones que no lo posean de forma explicita, este será ejecutado de forma automática.

Por lo que imagina que tenemos lo siguiente:

~~~javascript
app.use(middleware);

app.get('/', (req,res) => {
    console.log('has entrado a la pagina')
})

const middleware = (req, res, next) => {
    console.log('este es el test de un Middleware');
    next();
}
~~~

En este caso creamos al final el middleware y al inicio hacemos la llamada del mismo, este será ejecutado y **al tener el `next()`, nos permitirá ejecutar el siguiente middleware (la función `app.get()`)**, en caso de que este `next()` no se encuentre, **no se nos permitirá ejecutar nunca nuestro `app.get()`**.

De esta forma podemos hacer cosas como, permitir que nuestro usuario acceda a una lista de productos **solo cuando este inicie sesión**, por ejemplo de la siguiente forma:

~~~javascript
app.use(isConnected);

app.get('/productos', (req, res) => {
    res.status(200).send('el usuario esta conectado, felicidades!!!');
});

function isConnected(req, res, next) {
    let connected = true;
    
    if (connected) { 
        next();
    } else {
        res.status(200).send('el usuario no esta conectado');
    }
}
~~~

Lo que tenemos es una pagina que al acceder a nuestro **endpoint** `/productos`, dependiendo del estado de la variable `connected` recibiremos un mensaje en la misma, avisando si el usuario esta o no conectado.

Estos son los que conocemos como `middlewares globales` ya que la forma en la que estos afectan es en base a la posicion que tienen respecto otros middlewares.

> De hecho si tenemos algo como lo siguiente:
>
> ~~~javascript
> // primero el get
> app.get('/productos', (req, res) => {
>     res.status(200).send('el usuario esta conectado, felicidades!!!');
> });
> 
> // luego el end point
> app.use(isConnected);
> ~~~
>
> Solo obtendremos el mensaje de `"el usuario esta conectado"` ya que al ejecutar el `app.get()` no le entregamos el endpoint que referencie la ejecución del `app.use()`.
>
> Para ejecutar el `app.use()` simplemente haríamos lo siguiente:
>
> ~~~javascript
> app.get('/productos', (req, res, next) => {
>     res.status(200).send('el usuario esta conectado, felicidades!!!');
>     next(); // llamamos al siguiente endpoint
> });
> 
> app.use(isConnected);
> ~~~

A demás debo aclarar que este funcionamiento se encuentra presente solo cuando llamamos el metodo `app.use()`o cuando otro endpoint tiene luego un `app.use()`, ya que usualmente nuestros endpoints como `GET`, `POST`, `PUT`, etc... suelen jser ejecutados por el usuario, el `app.use()` no.

El `app.use()` se ejecuta automáticamente por nuestro código, y el `next` afecta solamente a estas funcionalidades que están después de este o a los end points que luego tienen uno.

por eso no necesitamos un `next` cuando hacemos algo como esto:

~~~javascript
app.get('/productos', (req, res, next) => {
    res.status(200).send('lista de productos');
    next(); // llamamos al siguiente endpoint
});

app.get('/usuarios', (req, res, next) => {
    res.status(200).send('lista de usuarios');
    next(); // llamamos al siguiente endpoint
});
~~~

pero si cuando tenemos:

~~~javascript
app.get('/productos', (req, res, next) => {
    res.status(200).send('lista de productos');
    next(); // llamamos al siguiente endpoint
});

app.use(ejemplo);

app.get('/usuarios', (req, res, next) => {
    res.status(200).send('lista de usuarios');
    next(); // llamamos al siguiente endpoint
});
~~~

---

### Middlewares generales y singulares

Estos se dividen en 2 tipos en si:

* Generales: trabajan en base a las funciones que creamos, de forma "general" donde definimos nuestros metodos.
* Singulares: trabajan de forma especifica en una acciona en si (dentro de una función).

La primera ya lo vimos, lo utilizamos para aprender que es un middleware, pero ahora revisaremos específicamente que es un middleware singular.

Este lo podemos aplicar de una forma perfecta para nuestro funcionamiento ya creado de identificar si un usuario esta o no logeado, de la siguiente forma:

~~~javascript
app.get('/productos', isConnected , (req, res) => {
    res.status(200).send('el usuario esta conectado, felicidades!!!');
});

function isConnected(req, res, next) {
    let connected = true;
    if (connected) {
        next();
    } else {
        res.status(200).send('el usuario no esta conectado');
    }
}
~~~

Como podrás ver en el ejemplo, ahora eliminamos el middleware de nuestro `app.use()`, ahora simplemente definimos su uso como un parámetro de nuestro get, esto significa que **siempre se ejecutara antes de ejecutar el get** y según lo que ocurra en el mismo, accederemos o no a la función con esta forma de autenticación.

---

## Validando un jwt

Continuando con nuestro código anterior de inicio de sesión nos encargaremos de verificar que el JWT traído sea correcto y valido.

Para ello tendré que recordarte la siguiente línea de código:

~~~js
const {expressjwt: expJwt} = require("express-jwt");   
~~~

Esta misma nos trae una funcion la cual no hemos utilizado por ahora, este mismo lo utilizaremos como un middleware para confirmar que un json web token sea correcto, entregandole al mismo nuestra palabra secreta y el algoritmo con el que hemos encpriptado nuestros datos de la siguiente forma:

~~~js
const  validateJwt = expJwt({ 
    secret: 'thisStringMustBeSecret', // esta es nuestra palabra secreta
    algorithms: ['HS256'] // este es un array con el algoritmo utilizado para encriptar
})

// solo por temas de orden, crearemos el validate antes de nuestro firmador
const signToken = _id => jwt.sign({ _id }, 'thisStringMustBeSecret');
~~~

Con esto listo simplemente iremos al endpoint `/middleware` que ya creamos para hacer lo siguiente:

~~~js
app.get('/middleware', validateJwt, (req, res) => {
    console.log('log', req.auth)
    res.send('ok');
})
~~~

Ahora por motivos de prueba abriremos **Postman** y seguiremos los siguientes pasos:

1. Haremos un post de login para algún usuario que tengamos creado (si no hay, debes registrarlo), al hacerlo recibiremos en **Postman** un id largo, este es nuestro JWT.
2. Copiamos ese JWT y vamos a el panel de "Headers" en **Postman**, ahi agregaremos:
   + Key: `Authorization`
   + Value: `Bearer {el JWT sin las llaves}`
3. Con esto listo ahora podremos hacer la llamada de nuestro middleware sin problemas, simplemente cambiamos nuestro enlace al de `http://localhost:3000/middleware` y ejecutamos un método `GET`.

Si todo esta correcto, deberíamos recibir en nuestro Postman el texto "ok", mientras que en nuestra terminal recibiremos un texto con 2 valores:

1. El id de nuestro usuario (el que hemos encriptado).
2. Un valor llamado **iat** (este define cuando se creo el JWT y nos es útil en caso de que queramos caducar un JWT).

Con esto listo podremos acceder a nuestros datos y en efecto ahora **buscar un usuario y acceder a todos sus datos en base a este request hecho**, principalmente por que por ahora de nuestro usuario solo tenemos los valores de **id** y **iat**.

Para hacer esta asignacion haremos lo siguiente:

~~~js
const findAndAssignUser = async (req, res, next) => { // 1.
    try {
        const user = await User.findById(req.auth._id); // 2.
        if (!user) { // 3.
            return res.status(401).end();
        }
        req.user = user;
        next(); // 4.
    } catch (e) {
        next(e); // 5.
    }
}

app.get('/middleware', validateJwt, findAndAssignUser, (req, res) => {
    res.send(req.user);
    console.log(req.user);
})
~~~

Con esto listo, veremos de uno en uno las partes importantes de este codigo.

1. Creamos un middleware externo solo para tener mayor facilidad en la lectura de nuestro código.
2. Intentamos asignar un usuario buscado en base a lo que recibamos en el request anterior.
3. En caso de que el usuario no exista retornaremos un status de "no encontrado".
4. En caso de que el usuario exista se pasara a la siguiente función (donde mostraremos los datos del usuario).
5. En caso de que haya un error, ejecutaremos un middleware especial con el error enviado (se vera mas adelante)

Listo, ahora si intentas ejecutar el código como antes, deberías tener los datos del usuario en base al mensaje con el **id** y el **iat**, a demás, prueba cambiar una palabra del **JWT** que ingresaste como `Authorization` en **Postman**, ahí veras como la api rechaza tu petición, ya que no se ha podido validar el **JWT** recibido.

Como extra antes de continuar podemos unificar los middleware en uno solo gracias a una función de express, siendo la siguiente:

~~~javascript
// agregamos nuestros middleware en uno solo
const isAuthenticated = express.Router().use(validateJwt, findAndAssignUser)

// despues simplemente lo llamamos
app.get('/middleware', isAuthenticated, (req, res) => {
    res.send(req.user);
    console.log(req.user);
})
~~~

Así haciendo mas corto nuestros endpoints.

---

### Manejo de errores

Como habrás visto, en nuestro middleware recién creado tenemos lo siguiente:

~~~javascript
catch (e) {
	next(e);
}
~~~

Esto lo tenemos específicamente para poder ejecutar una acción en caso que nuestro código genere un error.

En si un tema importante a mencionar es que **cuando le pasamos un error a un `next()`, este ejecutara otro middleware que creemos especialmente para el manejo de estos errores**.

Estos los crearemos de la siguiente forma:

~~~javascript
app.use((err, req, res, next) => {
    console.log('ha habido un error', err)
    res.send('Ha habido un error')
})
~~~

En si es un middleware global el cual posee un error, este se ejecutara **siempre que usemos un `next()` pasándole un error como parámetro**, lo que puedes hacer es crear este y probar enviando datos inválidos a nuestro middleware, así veras ambos mensajes.

Esto a demás nos puede servir para no solo retornar un mensaje al cliente, sino también una pagina especificando que estos errores se han encontrado.

---

## Haciendo nuestra palabra secreta

Como quizá recordaras hay 2 líneas importantes de nuestro código, siendo las siguientes:

~~~javascript
const  validateJwt = expJwt({secret: 'thisStringMustBeSecret', algorithms: ['HS256'] })
const signToken = _id => jwt.sign({ _id }, 'thisStringMustBeSecret');
~~~

En estas líneas creamos una función que validara un JWT en base a un "string secreto" y el otro firmara un JWT en base a este mismo "string secreto".

El error esta a simple vista, **¿como puede ser esto un secreto si podemos verlo sin problemas?**, la respuesta es que simplemente no lo es, si subimos así nuestro código a git por ejemplo, cualquier persona tendrá acceso a nuestra palabra secreta, lo que facilitara el trabajo de robar datos de nuestras bases de datos.

Para evitar esto, utilizaremos algo conocido como **Variables de entorno**, siendo estas **variables creadas específicamente en nuestro sistema, que solamente son accesibles desde el mismo**, es decir que esta variable debe crearse en cada sistema que corra el software, por ejemplo cuando subamos el proyecto a un servidor, debemos crear estos.

Entonces si alguien accede a nuestro código y tiene que ejecutarlo, deberá crear el su propia variable de entorno, con su propia palabra secreta y con otros valores en caso de que utilicemos mas variables que requieran cierto secretismo.

---

### Como hacer una variable de entorno

Empezaremos de forma simple, hay un modulo de node conocido como `dotenv` que nos permite acceder a archivos que se encargaran de definir estas variables de entorno.

Este lo instalaremos con el comando `npm install dotenv` y luego simplemente lo importaremos agregando arriba del todo lo siguiente:

~~~javascript
require('dotenv').config();
~~~

Cuando esto este listo, crearemos un archivo con el nombre de `.env` y en el haremos lo siguiente:

~~~
SECRET=thisStringMustBeSecret
~~~

Agregaremos el nombre de nuestra variable de entorno y le entregaremos un valor (estos no pueden estar separados por un espacio), en si este modulo simplemente se encarga de facilitarnos el proceso de hacer todo esto a mano ya que varia entre lenguaje y sistema.

Pero con esto listo simplemente podemos probarlo escribiendo lo siguiente en nuestro código:

~~~javascript
console.log(process.env.SECRET);
~~~

Si esto te muestra el texto de `thisStringMustBeSecret`, todo ha funcionado correctamente, por lo que en teoría ahora podríamos cambiar nuestras líneas anteriormente mencionadas por lo siguiente:

~~~javascript
const  validateJwt = expJwt({secret: process.env.SECRET, algorithms: ['HS256'] })
const signToken = _id => jwt.sign({ _id }, process.env.SECRET);
~~~

---

### importante

Un tema **obligatorio** si trabajaras con `dotenv` es que este archivo **NO DEBE SER SUBIDO A NUESTRO REPOSITORIO PUBLICO**, ya que el mismo contiene estos datos privados.

Recuerda que cuando subas este código a tu repositorio, agregar a `.gitignore` la línea:

~~~
.env
~~~

Ahora finalmente tienes una palabra secreta **realmente secreta**.

