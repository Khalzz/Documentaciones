# Next.js

**Documentación hecha por Rodrigo Seguel**.

**Next.js** es un framework de desarrollo Fullstack implementado sobre React y utilizando el backend de NodeJs.

Su principal enfoque es el de "extender las capacidades de React", y permitirnos hacer aplicaciones con **server side rendering** y **static site generation** de forma rápida y sencilla

Este framework desarrollado por **Vercel** y salido al publico el año 2016, este rápidamente se ha convertido en uno de los frameworks mas utilizados si no es el mas utilizado de React.

Si te llama la atención el utilizar NodeJs con React de una forma ya predefinida, con estándares de la industria, **Next.js es ideal para ti**.

---

## Creando un proyecto

Como es obvio, empezaremos creando un proyecto vacío de **Next.js**, esto lo hacemos de una forma similar a como lo haríamos con React.

Simplemente en tu terminal escribes: `npx create-next-app nombre-aplicacion` y continuas seleccionando las opciones que te ofrece, estas son :

+ Quieres usar Typescript? (no)
+ Quieres usar ESLint en el proyecto? (si)
+ Quieres usar una carpeta `src/` en este proyecto? (no)
+ Quieres usar la carpeta experimental `app/` en este proyecto? (si, en esta documentación utilizaremos **Next.js** 13) 

Si te hace mas preguntas, simplemente da `enter`, con esto listo ya puedes abrir el proyecto con tu editor favorito.

---

## Estructura de un proyecto

Cuando creemos este proyecto vacío, veremos la siguiente estructura de carpetas:

+ `app`: Aquí es donde creamos nuestras "rutas" para cada pagina según un sistema de carpetas.
+ `pages`: Esta es la forma anterior en la que solíamos hacer nuestras "rutas", ahora lo utilizamos solo para nuestras API's
+ `public`: Aquí ingresamos nuestros elementos "estáticos" o "públicos", como imágenes predefinidas por ejemplo.
+ `next.config.js`: Un archivo que define la configuración de Next.js.
+ `package.json`: El archivo de dependencias y configuraciones de NodeJs.

Para mantener la simplicidad en este proyecto eliminaremos la carpeta `pages` por ahora, así tendremos una base de código mas limpia y legible.

---

## Rutas

Empezaremos revisando cada una de las carpetas empezando por la carpeta `App`.

Este contiene los siguientes elementos:

+ `globals.css`
+ `head.jsx`
+ `layout.jsx`
+ `page.jsx`
+ `page.modules.css`



### Page.jsx

En si el sistema de rutas de Next.js requiere siempre de un archivo con el nombre `page.jsx` o `page.js`, para mencionar que ese elemento es una pagina.

O sea que en este caso como el `page.jsx` se encuentra en la raíz de la carpeta `app`, cuando entremos a la pagina principal (sin una ruta especificada), se cargaran los elementos referentes a este `page.jsx`.

Y por ejemplo si quisiéramos hacer otra pagina llamada "`saludo`", simplemente crearíamos una carpeta con ese nombre y dentro le agregamos un `page.jsx`, aun que antes de ser funcional, tenemos que retornar algo desde esta pagina, así que simplemente escribe:

~~~jsx
export default function saludo() {
    return <div>Holis</div>
}
~~~

Y ya funcionaria, cuando corras la aplicación y busques "`localhost:3000/saludo`" debería aparecerte este texto en pantalla.

---

### Layout.jsx

El archivo `layout.jsx` es un archivo que solo se encontrara en las carpetas "padre", ya que este en si es el "contenedor de nuestros `page.jsx`".

Esto significa que en el podemos hacer "componentes básicos que se mantendrán sin importar en que ruta estemos".

Por ejemplo, si quieres hacer un header que se mantenga en todas las paginas, simplemente vas a `layout.jsx` y haces lo siguiente:

~~~jsx
import './globals.css'

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <head />
      <body>
        <div>holi</div> <!--Aqui agregamos este mensaje-->
        {children}
      </body>
    </html>
  )
}
~~~

Ahora, si entras a la pagina principal o al `/saludo`, en ambos encontraras el material retornado por `page.jsx`, pero a demás encontraras el elemento que se encuentre en el `layout.jsx`.

este elemento también podemos agregarlo en una ruta ya creada, por lo que si creamos sub-rutas, estos tendrán el layout de nuestra ruta "padre".

---

### Head.jsx

Como quizá habrás notado en el ejemplo anterior, en el HTML, solo tenemos **el final de la etiqueta `head`**, esto no es un error ya que los elementos de esa etiqueta se cargan segun un archivo llamado `head.jsx`.

Este archivo debes o puedes crearlo por cada ruta, y en el definimos los valores ingresados en nuestro `<head></head>`, ya sean valores como el **title**, **logo** u otros...

Este elemento se veria de una forma similar a la siguiente: 

~~~jsx
export default function Head() {
  return (
    <>
      <title>Nueva aplicacion</title>
    </>
  )
}
~~~

Y con ello ya estaría listo para ser llamado desde nuestro layout.

---

### Otras carpetas

También un tema importante a considerar es que podemos agregar otras carpetas a nuestro `app`, como por ejemplo una llamada `components` donde agregaríamos nuestros componentes de React.

Por lo que si, todas las rutas son carpetas, pero no todas las carpetas son rutas.

---

### Moviéndonos entre rutas

Next.js a demás de permitirnos hacer componentes con React, también trae unos propios, ahora veremos uno llamado `<link>`.

Este se encarga de permitir el abrir otras rutas sin tener que cargar totalmente la pagina, como lo haría una etiqueta `<a>`.

Por ello, este nos resulta muy útil para tratar nuestras paginas como "single page applications".

Para este ejemplo, crearemos una carpeta y un componente: `components/Navigation.jsx` aquí crearemos el siguiente componente:

~~~jsx
import Link from "next/link"; // importamos el componente link

export function Navbar() {
    const links = [ // aqui agregamos las rutas de nuestra aplicacion
        {
          name: 'Home',
          route: '/'
        },
        {
          name: 'Saludo',
          route: '/saludo'
        }
    ];

    // retornamos el componente
    return (
        <ul>
            {links.map(({name, route}) => (
                <li key={route}>
                    <Link href={route}>{name}</Link>
                </li>
            ))}
        </ul>)
} 
~~~

Y desde nuestro `layout.jsx` en nuestra raíz, agregaremos este componente de la siguiente forma:

~~~jsx
import { Navbar } from './components/navigation' // importamos el componente

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <head />
      <body>
        <Navbar/>
        {children}
      </body>
    </html>
  )
}
~~~

---

### Rutas dinámicas

Imagina que estas haciendo algún sistema de administración de usuarios en el cual debes ser capaz de acceder a los usuarios de forma fácil.

Lo que podrías hacer es tomar el id del usuario a revisar, pasarlo en nuestro enlace y utilizar lo que llamamos "rutas dinámicas".

Las Rutas dinámicas, son un tipo de ruta que podemos crear a la cuales en base a lo que le pasemos al enlace (por ejemplo `/usuario/1`), podremos acceder a esos datos los que les pasemos, y con estos ejecutar alguna acciona, por ejemplo hacer un fetch de datos que busque ese id en particular.

Para esto y por temas de ejemplo iremos a nuestra carpeta app y crearemos las siguientes carpetas: `./usuarios/[id]`.

**Cuando creamos una ruta dinámica, esta debe estar dentro de otra** y la misma de forma obligatoria, **tiene que tener los corchetes**, ya que los mismos indican que este es una ruta dinámica.

Dentro de estas carpetas crearemos un `page.jsx` para cada uno, retornaremos algún elemento para no tener errores y intentaremos ingresar a `localhost:3000/usuarios/1`.

En teoría debería iniciar normalmente, pero intentemos mostrar el id entregado en la misma pagina, en `[id]/page.jsx` ingresa lo siguiente:

~~~jsx
export default function user({params}) {
    const {id} = params;

    return <div>Has ingresado el id: {id}</div>
}
~~~

Ahora cuando entremos a `localhost:3000/usuarios/1`, se mostrara un mensaje indicando el ingreso con el usuario "1".

Después de esto, simplemente podemos hacer un fetching de datos y mostrar los elementos que se relacionen con el mismo.

Por motivos de prueba, utilize `jsonplaceholder`, asi que pude hacer una implementacion con un fetching de datos de la siguiente forma:

~~~jsx
export default async function user({params}) {
    const {id} = params; // traigo el id del enlace
    const user = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`)
    .then(response => response.json()) // traigo los datos de la api

    // retorno el componente
    return (<div>
            <h1>nombre: {user.name}</h1>
            <h2>username: {user.username}</h2>
            <h2>email: {user.email}</h2>
        </div>)
}
~~~

 

---

### Componentes del cliente

Quizá habrás notado que al intentar hacer un `console.log()`, crear un componente con algún hook o utilizar el `onclick()` nos generara ciertos problemas.

Con el `console.log()` veremos el texto en la terminal del servidor, mientras que con los posteriores, directamente no funcionaran.

Esto ocurre ya que los mismos son funcionalidades que de forma usual queremos ver del lado del cliente y por defecto en Next.js, **los componentes que se encuentren en la carpeta `app`, serán componentes del servidor**.

Esto significa que si tenemos este componente: 

~~~jsx
import { useState } from "react";

export function Counter() { // recuerda que el componente debe empezar con una mayuscula
    const [count, setCount] = useState(0);

    return (
        <>
            <h1>count: {count}</h1>
            <button onClick={() => setCount(count + 1)}>
                Presioname
            </button>
        </>
    )
}
~~~

Si lo llamamos desde alguna ruta, veremos un error explicando que al ser un elemento de servidor, no funciona el `useState` o el `onClick`, para esto simplemente lo transformaremos en un componente de cliente, agregando en la primera línea:

~~~jsx
'use client'
~~~

Con simplemente agregar esto, nuestro componente ya seria del cliente.

**Recuerda!!!**, lo mas efectivo de Next.js es el efectivizar la carga del cliente, por ello recomiendo que esto lo hagas en el componente mas pequeño posible, para así cargar la cantidad de elementos necesarios para que no hayan errores.

---

### Generación estática

Volviendo a nuestra ruta dinámica, notaras que de cierta forma no  estamos afectando los datos a los que hacemos fetching, por lo que de cierta forma estaríamos generando **una pagina estática**.

Por lo que cuando corramos `npm run build`, la generación del Html, tendrá también los datos del fetch automáticamente.

En caso de que nosotros tengamos que cargar de forma constante datos, ya sea por ejemplo en caso de que nuestra base de datos tenga variaciones, tendremos que indicar que nuestro fetch **no debe guardarse de forma estática**.

Esto lo hacemos de la siguiente forma:

~~~jsx
// volviendo al fetch ya hecho, agregaremos lo siguiente:
const user = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`, { cache: 'no-store' })
.then(response => response.json())
~~~

Técnicamente avisamos que este fetching de datos sea del lado del servidor, y que no se cargue completamente de forma estática.

---

### Generación estática incremental

Como ya mencione, por defecto al crear nuestra build, nuestro fetching de datos vendrá de forma estática, por lo que no se cambiara o "actualizara" a no ser que permitamos esto con lo visto en la sección anterior.

Por otro lado, existe una forma que hará el fetching de datos según periodos de tiempo, generando cada cierta cantidad de segundos un fetching nuevo, para luego crear una pagina estática con los mismos y mostrárselos al cliente.

Esto lo hacemos de la siguiente forma:

~~~jsx
// volviendo al fetch ya hecho, agregaremos lo siguiente:
const user = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`, { 
	next: {
        revalidate: 10 // cada 10 segundos hariamos un nuevo fetch
    }
})
.then(response => response.json())
~~~

Ahora cada 10 segundos tendrás nuevos datos en tu html si algún cambio se ha aplicado.

---

## Apis

Otra de las funcionalidades útiles que nos entrega Next.js es directamente permitirnos hacer una REST API en el mismo framework.

Así guardando en el mismo servidor nuestro **front-end** y **back-end**.

Esto se hace según el sistema de rutas anterior de Next.js, por lo que tendremos que hacer una carpeta llamada `pages/api/`, en esta carpeta crearemos nuestros end-points.

En esta carpeta crea un archivo llamado `index.js` y escribe lo siguiente:

~~~javascript
export default function handler(req, res) {
	res.status(200).json({ text: 'Hola!!!' });
}
~~~

Ahora cada vez que acedamos a la api obtendremos una respuesta trayendo este mensaje, para ello iremos al enlace `http://localhost:3000/api/index`, te darás cuenta que no hizo falta agregar un `page.jsx`, ya que el sistema de rutas que se encuentra en `pages`, se basa en archivos y no en carpetas.

Otro tema importante a tomar en cuenta es la forma en la que separamos los métodos enviados a nuestra api, por ejemplo en express utilizaríamos `app.get()` y `app.post()` para funciones diferentes.

Aquí tendremos que hacer algo como lo siguiente:

~~~js
export default function handler(req, res) {
    if (req.method == 'GET') {
	    res.status(200).json({ text: 'Hola!!!' });    
    } else if (req.method == 'POST') {
        // en este caso hacemos un post
    } else {
        // hacemos algo por defecto
    }
}
~~~

Con esto listo podemos acceder a este elemento desde nuestro **front-end**, haciendo algo como lo siguiente:

~~~jsx
const data = await fetch('http://localhost:3000/api/test', {
        method: 'GET',
        cache: 'no-store'
}).then(response => response.json())
~~~

Listo, ya podremos hacer fetching de nuestra api, solo recuerda que para hacer deploy debes setear el localhost como una variable de entorno, esto lo veremos mas adelante.

---

## Prisma

Prisma es un ORM de código abierto orientado a facilitar la implementación de ciertas bases de dato en nuestro código, funcionando como un intermediario entre este y nuestro código.

Esta herramienta esta altamente recomendada para la conexión con bases de datos en Next.js ya que tiene compatibilidad con las principales bases de datos utilizadas.

Siendo estas, **postgreSql**, **MySql**, **SQLite**, **SQL Server**, **CockroachDB** y la que utilizaremos hoy **MongoDB**.

Para esto seguiremos ciertos pasos: 

1. 

2. Instalamos las dependencias de prisma con `npm i prisma` y `npm i @prisma/client`

3. Iniciamos prisma escribiendo `npx prisma init` en nuestra terminal.

4. Configuramos los elementos principales de prisma en `prisma/schema.prisma`:

   ~~~
   generator client {
     provider = "prisma-client-js"
   }
   
   datasource db {
     provider = "mongodb"
     url      = env("DATABASE_URL")
   }
   ~~~

   Y desde el archivo `.env` que se habrá creado, agregamos el enlace a nuestro mongodb atlas.

5. Generamos nuestros "Schemas" en el mismo archivo, estos siguen una sintaxis similar a la siguiente:

   ~~~\
   model User {
     id String @id @default(auto()) @map("_id") @db.ObjectId
     name String
     age Int
   }
   ~~~

   La principal razón por la que nuestro `id` es tan grande, es debido a que:

   + Al ser un id debemos agregar `@id`.
   + Al ser un dato creado por defecto por la base de datos agregamos `@default(auto())`.
   + En MongoDB al "id" le llamamos "_id" por defecto, así que debemos mapearlo con este ultimo nombre.
   + Por ultimo, los id's de MongoDb son "objectId's" por lo que a demás de `String`, usamos `@db.ObjectId`

6. "Generamos nuestro cliente" con `npx prisma generate` y agregamos lo siguiente en nuestro servidor:

   ~~~js
   import { PrismaClient } from "@prisma/client"
   const prisma = new PrismaClient();
   ~~~

7. Utilizamos prisma.

La forma en la que el mismo se utiliza es relativamente similar a como lo haríamos con mongoose por lo que no es difícil, un ejemplo aplicado en como aprendimos a hacer las apis seria el siguiente:

~~~javascript
import { PrismaClient } from "@prisma/client" // importamos el cliente
const prisma = new PrismaClient(); // creamos la instancia de prisma

export default async function handler(req, res) { // transformamos esta funcion en asincrona
    if (req.method == 'GET') {
	    const user = await prisma.user.create({ // creamos un valor de la coleccion "user"
            data: { // los valores se los agregamos en "data:{}"
                name: "Rodrigo",
                age: 19
            }
        });
        res.status(200).json({user})
    }
}
~~~

Recuerda que la función `handler()` debe ser asíncrona y agregar un await en el método usado con prisma, ya que de no hacerlo, este no generara ni un resultado.

**ojo:** para que esto funcione y no te de errores, recuerda cambiar:

~~~jsx
// esto:
const data = await fetch('http://localhost:3000/api/test', {
        cache: 'no-store'
});

// por esto:
const data = await fetch('http://localhost:3000/api/test', {
	next: {
		revalidate: 3
	}
});
~~~

Listo, con esto ya tendríamos una conexión a base de datos 100% funcional.

---

## Socket.io

Socket.io es una librería enfocada a permitir la conexión entre clientes por medio de "Web Sockets", generando una conexión constante que permita la actualización de datos sin tener que constantemente recargar la pagina en la que haces la petición de los mismos.

Esta es útil ya que nos entrega muchas facilidades para este tipo de desarrollo, por lo que puede ser una herramienta necesaria para ciertos tipos de proyectos, como chats, juegos y otros proyectos que requieran conexión en tiempo real.

Para iniciar, instalaremos las dependencias de esta librería, las cuales son `npm i socket.io` y `npm i socket.io-client`.

El primero será utilizado para abrir estas "conexiones" mientras que el segundo nos permitirá acceder a las mismas desde el cliente con mayor facilidad.

Antes de continuar debes tener un elemento en cuenta y es que Socket.io generara problemas si el elemento desde el cual intentamos hacer la llamada de datos es un elemento de servidor, así que recuerda:

1. La parte del cliente debe estar si o si en un componente de cliente (con el `'use client'`).
2. Estos deben ir en **componentes** a parte, por lo que no es recomendado que lo agregues en un: `layout`, `page` u otros.

Empezando con la instalación tendrás que seguir los pasos:

### Creación del socket

En `pages/api/` agrega un archivo con el nombre `socket.js` en la cual haremos lo siguiente:

~~~javascript
import { Server } from 'socket.io'; // importamos socket.io

export default function SocketHandler (req, res) { // creamos un "manejador"
    if (res.socket.server.io) { // revisamos si existe la conexion
        res.end();
        return;
    }
    
    // creamos una conexion nueva
    const io = new Server(res.socket.server);
    res.socket.server.io = io; 

    // creamos nuestro "event handler"
    io.on("connection", (socket) => {
        console.log('Holi')
    })

    res.end();
}
~~~

Con esto listo, ya podemos proceder.

---

### Creando nuestro cliente

Como ya mencione, tendremos que crear un componente que utilizaremos como cliente.

Este puedes llamarlo como quieras, pero asegurate que se vea de la siguiente forma:

~~~jsx
'use client' // recuerda que debe se run componente de cliente

// importamos socket.io y creamos un socket
import io from "socket.io-client";
let socket;

export function Counter() {

    const socketInitializer = async () => {
        await fetch('http://localhost:3000/api/socket'); // nos conectamos al server
        socket = io(); // creamos el socket

        // empezamos a emitir eventos.
        socket.on('connect', () => {
            console.log('conectao')
        })

        socket.emit('say-hi');
    }
    
    socketInitializer();

    return <>Este es un socket</>
}
~~~

Con esto listo, ya tendríamos una conexión completada de Socket.io, ahora simplemente empezamos a emitir y recibir eventos.
