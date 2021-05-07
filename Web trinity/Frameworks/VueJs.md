# Vue.Js

**Documentación hecha por Rodrigo Seguel**.

A pesar de haber visto el "core" principal del desarrollo web en mis documentaciones anteriores (específicamente las de Html, Css y JavaScript) aun hay muchos temas, funciones y capacidades que no lograremos concretar con ese conocimiento o que directamente intentarlos sin frameworks seria un trabajo masivo y notablemente difícil.

Una de las herramientas o "frameworks" que nos permitirá hacer esto es Vue.Js, un framework para JavaScript enfocado en el **desarrollo de paginas y aplicaciones web con interfaces de usuario de una sola pagina** o SPA (single web applications), siendo así un competidor directo de otros frameworks como React o Angular.

En si Vue.js es lo que se le conoce como un "framework progresivo"

Un punto perfecto para los novatos en el desarrollo web es que Vue.js nos permite trabajar con el mismo en el momento que sea necesario, dado que es mas sencillo que Angular y React, además de permitirnos añadirlo de forma "progresiva" a nuestros proyectos que ya están en desarrollo.

---

## ¿Como iniciar con Vue.Js?

Antes que nada añadiremos el **CDN** a nuestro HTML que para los que no recuerden, **son enlaces o direcciones de internet que podemos llamar desde una etiqueta `<script>` de HTML**.

En este caso lo que debemos hacer es tomar la siguiente línea de HTML:

~~~html
<script src="https://unpkg.com/vue@next"></script>
~~~

Y aplicarla en nuestro archivo HTML donde aplicaremos el uso de Vue.js, de la siguiente manera:

~~~html
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://unpkg.com/vue@next"></script> <!--el CDN se añade en el head-->
</head>
<body>
    <!--aqui va nuestro código html-->
</body>
</html>
~~~

Luego de esto como recomendación principal deberían descargar en Visual Studio Code (el editor que utilizo personalmente) la extensión "Live Server" este nos permitirá revisar nuestros cambios en tiempo real mientras nuestro HTML, Css y JavaScript se ejecutan, para esto debemos ir a nuestro archivo HTML, dar clic derecho sobre algún lugar dentro del archivo y seleccionar la opción **open with live server** (no estoy seguro que esta extensión este en otros editores, esa búsqueda te la dejo a ti).

---

## Hola Mundo

Como es obvio en cada lenguaje requerimos de hacer un hola mundo para así poder realmente "iniciar con nuestro aprendizaje en ese lenguaje, framework o herramienta" y aquí no será menos y en Vue.Js la forma que tenemos de hacer un "Hola Mundo" es la siguiente:

~~~html
<!DOCTYPE html> <!--creamos nuestro archivo html-->
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vue.Js</title>
    <script src="https://unpkg.com/vue@next"></script> <!--añadimos el CDN-->
</head>
<body>
	<div id="app"> <!--creamos un div y sera como un "contenedor" del vue js para los datos de nuestro hola mundo-->
        <h1></h1> <!--creamos un h1 donde se mostrara en efecto los datos-->
	</div>
    
    <script src="main.js"></script> <!--llamamos nuestro archivo de javascript-->
</body>
</html>
~~~

Tras esto haremos lo siguiente en orden, en nuestro archivo de JavaScript (según el ejemplo `main.js`) añadimos lo siguiente

~~~javascript
//el nombre "app" es opcional, pero es lo mas comun al trabajar con vue
const app = Vue.createApp({ //inizializamos nuestro vue con la funcion "Vue.createApp()" y como parametro trae un objeto
    data() { 
        return { //retornamos el valor al se puede acceder por medio de la constante "app"
            titulo: 'Hola Mundo!!! pero en Vue.Js :D'
            //tambien podriamos añadir mas valores al objeto para luego llamarlos desde el html con {{}}
        }
    }
})
~~~

Luego en nuestro HTML luego de llamar nuestro `main.js` ingresamos lo siguiente:

~~~html
<!--ahora lo que haremos sera "montar" nuestro vue en el archivo HTML y en especifico sobre un "elemento"-->
<script src=main.js></script>
<script> //este script debe ir al final de todo el body
    //creamos una constante
	const mountedApp = app.mount('#app') //su sintaxis es "nombreDeConstanteEnJs.mount('#idEnLaQueMontar')" y por eso es app.mount()
    //su atributo es '#app' dado que queremos añadirla en el objeto que contenga ese id "en este caso, dentro del div"
</script>
~~~

Al ya hacer todo este proceso el `div` que tenemos en nuestro archivo de HTML nos permitirá introducir algunas reglas de Vue.Js dentro de si mismo, una de estas es la siguiente:

~~~html
<div id="app">
    <h1>{{titulo}}</h1> <!--llamamos los datos del objeto app-->
</div>
~~~

 Ahora esto nos mostraría en pantalla el mensaje de **'Hola Mundo!!! pero en Vue.Js :D**, felicidades!!!! acabas de hacer tu primer "Hola Mundo" en Vue.Js, si te sientes confundido no te preocupes, mas adelante tu entendimiento sobre este gran framework incrementara y cosas como esta misma se volverán muy fáciles.

---

# Inserción de Javascript

Como ya vimos anteriormente, el `{{}}` nos permite "añadir JavaScript en nuestro elemento" y no solo datos como vimos en nuestro ejemplo anterior, de hecho podemos incluso añadir condicionales por ejemplo de la siguiente forma:

~~~Javascript
//supongamos que el programa es sobre una venta de ciertos objetos
const app = Vue.createApp({
    data() {
        return {
            producto: 'pelota'
            precio: 10000
        }
    }
})
~~~

Y luego iteramos sobre el objeto en nuestro HTML.

~~~html
<div id="app">
    <h1>{{ producto }}</h1> <!--llamamos solo el dato producto-->
    <h1>{{ if precio >= 5000 ? 'no me alcanza' : 'puedo comprarlo'}}</h1>
    <!--si el precio es mayor o igual a 5000 "no me alcanza", sino (:) "puedo comprarlo"-->
</div>
~~~

Y como ya vimos, ingrese un `if` junto a un `else if` con una sintaxis que al menos a mi me recuerda a las condicionales de Excel.

Otro tema que no he mencionado es el factor de que podemos concatenar texto con el JavaScript de la siguiente forma:

~~~html
<div>
    <h1>el precio de la pelota es: {{ precio }}</h1>
</div>
~~~

---

