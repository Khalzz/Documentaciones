# HTML5

**documentación escrita por Rodrigo Andres Seguel Nuñez**

HTML(Hypertext Markup Language) es un "lenguaje de marcado de hipertexto" que se usa en las paginas web para estructurar y añadir los datos mas básico de una pagina web.

Para la creación de una pagina web se requiere de la **trinidad de la web** y este se compone de los siguientes lenguajes:

+ HTML (marcar/ingresar los datos básicos a las paginas).
+ CSS (genera la parte "diseñable/gráfica" de la pagina en si).
+ JavaScript (la parte lógica y interactiva de la pagina, lo que nos permite interactuar directamente con la pagina de por si).

Como ya se menciono, este es un lenguaje de marcado de hipertexto, no de programación perse, la parte lógica va en JavaScript, HTML te permite añadir el texto, la información y imágenes que queremos usar en la misma pagina de por si.

También podemos definirlo como lenguaje de etiquetas, dado que se usan ciertas "etiquetas" para marcar para que se usa cada parte del código, ya sea por ejemplo donde va un párrafo, donde va un titulo, donde va una imagen,donde va el código (CSS y JavaScript), etc...

Un punto que tiene a favor es que es **multi-plataforma** dado que en todo tipo de buscador o sistema operativo funciona de la misma forma, por lo que cada pagina de HTML se vera de la misma forma (por lo menos en su base).

---

## Indice

+ [Crear archivo HTML](#Crear-archivo-HTML)
+ [Funcionamiento](#Funcionamiento)
+ [Etiquetas de documento](#Etiquetas-de-documento)
+ [Etiquetas basicas](#Etiquetas-basicas)
+ [Listas](#Listas)
+ [Enlaces](#Enlaces)
+ [Multimedia](#Multimedia)
  + [Imagen](#Imagen)
  + [Video](#Video)
+ [Div](#Div)
+ [Formularios](#Formularios)
+ [Nav](#Nav)
+ [Article y section](#Article-y-section)
+ [Aside](#Aside)
+ [Footer](#Footer)
+ [Tablas](#Tablas)
+ [Icono](#Icono)

---

## Crear archivo HTML

Para la creación y edición de un código **HTML** requieres de un archivo con la extensión correspondiente, para ello debemos crear un archivo de texto con la extencion `.html` para que se reconozca con un archivo de HTML y el sistema lo abra directamente con el navegador por defecto.

**ojo: nuestro archivo principal de HTML es recomendado que tenga el nombre de `index.html`**

**también podemos solo escribir "html5" y se abrirá un archivo con el código por defecto y directamente podemos iniciar a escribir nuestro código (solo en caso de que usemos visual studio code, no estoy  seguro de en que otros funciona pero por lo menos en visual studio code sirve**

---

## Funcionamiento

HTML no es al 100% un lenguaje que pueda interpretar de forma nativa lo que quiere escribir el "desarrollador", dado que por ejemplo, si nosotros estructuramos una pagina HTML de la siguiente forma:

~~~html
Titulo de pagina

parrafo de pagina
~~~

Lo único que veremos en la pagina final sera esas dos lineas de texto concadenadas, osea:

`Titulo de pagina parrafo de pagina`

Esto se genera dado que para usar HTML en su forma correcta, necesitamos avisarle y configurar que tipo de texto es cada parte a añadir y este no puede saber que parte es un encabezado, o un párrafo, una imagen, etc...

---

## Etiquetas de documento

Como ya dijimos, HTML funciona con "etiquetas", hay dos tipos de etiquetas y estas se estructuran de la siguiente forma:

~~~html
<etiqueta>Texto a usar en la pagina</etiqueta>
------------------------------------------------------------------------------------------
<title>Este es el titulo de la ventana</title>
~~~

~~~html
<etiqueta name="nombre del objeto o etiqueta" />
------------------------------------------------------------------------------------------
<meta name="author" content="Rodrigo Seguel" />
~~~

Así se puede estructurar cada parte de el código para que la información que añadiremos a la pagina, se añada de la forma que queremos y esperamos.

Pero antes de empezar con las etiquetas, es importante marcar que versión de HTML usamos, eso lo logramos usando:

~~~html
<!DOCTYPE html>
~~~

Ademas debemos de ingresar una etiqueta que nos diga **que lenguaje usaremos en la pagina** y esta se crea usando:

~~~html
<html lang="es"> en este caso es en español
---------------------------------------------------------------------------------------------
<html lang="en"> en este caso es en ingles
~~~

Esto le dice al navegador que estamos usando específicamente la ultima versión de HTML (html5) y **el código de HTML para tener un código bien estructurado se ingresa en las siguientes etiquetas**:

~~~html
<!--con esto puedo hacer comentarios-->
<!DOCTYPE html>
<html lang="es">
<html>
    <head>
        <title>Aqui va la "cabeza de la pagina"</title>
    </head>
    <body>
        <h1>Encabezado del ""cuerpo de la pagina"</h1>
    	<p>Aqui va el "cuerpo de la pagina"</p>
    </body>
</html>
~~~

Así podremos mantener una mejor estructura en la pagina, y poder añadir lo que va directamente en la cabeza de la pagina, tanto como lo que tenemos en su cuerpo, ademas podemos ser mas específicos con lo que queremos escribir en este.

Osea que en general, la Estructura básica de un archivo html es de la siguiente forma:

![image not found](https://lenguajehtml.com/html/introduccion/estructura-documento-html/estructura-documento-html.png)

---
## Descripciones y autor

Para poder añadir mas información a la pagina (metadatos) (como una descripción o el nombre del autor en estos casos) usamos las siguientes etiquetas en la etiqueta `<head>`:

~~~html
<meta name="description" content="aqui escribimos el texto de mi descripcion"/>
<meta name="author" content="Rodrigo Seguel"/>
<meta name="keywords" content="palabras,clave,para,facilitar,la,busqueda,de,tu,pagina"/>
<meta charset="utf-8" /> este se usa para agregar caracteres extra a la pagina
<meta name="copyright" content="nombre de la empresa quien tiene los derechos">
<meta name="robots" content="index"> asi se muestra la pagina (si no debemos usar noindex)

~~~

Como se puede ver, la parte "name" nos permite elegir seleccionar que opción queremos mostrar, y el "content" nos permite mostrar el contenido de esa misma "opción".

**Cabe aclarar que algunos de estos datos no se muestran en el buscador, dado que esta es solo mas información para el buscador, pero no necesariamente información que el usuario debería ver**

---

## Etiquetas basicas

| Etiqueta            | Descripcion                                                  |
| ------------------- | ------------------------------------------------------------ |
| `<title></title>`   | Titulo de la ventana                                         |
| `<h1></h1>`         | Encabezado (hay 6 niveles, el h1 es el mas grande y el h6 el mas pequeño) |
| `<p></p>`           | Parrafo                                                      |
| `<b></b>`           | texto en **negrita**                                         |
| `<i></i>`           | *cursiva*                                                    |
| `<strike></strike>` | ~~tachada~~                                                  |
| `<small></small>`   | letras **chiquitas**                                         |
| `<br>`              | salto de linea                                               |

---

## Listas

Para hacer listas debemos crear etiquetas que marquen cuando inicia y termina una lista, estas etiquetas son las siguientes

~~~html
<ul>
    <li>esta</li>
    <li>es una</li>
    <li>lista</li>
    <li>desordenada</li>
</ul>
~~~

El `<ul></ul>` sirve  para que el código que tengamos ingresado en el mismo sea considerado una lista en particular, ademas esto nos ayuda en el caso que queramos hacer 2 listas separadas podamos usar 2 veces esta etiqueta y no se unan nuestras listas de una forma rara.

---

## Enlaces

Los enlaces se crean con la etiqueta `<a></a>` y sirven para redireccionarnos a otros lugares/paginas, su funcionamiento directo es el siguiente:

~~~html
<a href="https://paginaWebRedireccionada.com">texto que se muestra como enlace</a>
~~~

Estos enlaces se definen por **rutas** y estas pueden ser **locales** o **externas**, osea que puede ser una pagina web o un archivo en la carpeta de "html".

Si por ejemplo queremos hacer un enlace a una pagina/archivo desde nuestro html debemos por ejemplo crear otro archivo html en la misma pagina y llamarlo así:

~~~html
<a href=pagina_A_Redireccionar.html>texto que se muestra como enlace</a>
~~~

Si ese archivo .html esta dentro de otra carpeta debemos llamar la ruta en si como si fuera `carpeta/index.html` y si queremos volver a la carpeta anterior debemos usar por ejemplo `../carpetaVieja.html`.

Y así podemos por ejemplo movernos entre nuestra pagina html con enlaces.

Para que la pagina se abra en otra pestaña debemos añadir después del `href="link"` un `target="_BLANK"`.

Si queremos hacer un hipervínculo "interno" como lo podría ser un indice o algo así debemos ingresar en la etiqueta a la que nos vincularemos el parámetro `id="nombreId"` y en nuestro hipervínculo hacer `href="#nombreId"` es similar a markdown pero no especialmente lo mismo.

---

## Multimedia

### Imagen

Para mostrar una imagen en html debemos usar la etiqueta:

~~~html
<img src="https://enlace-o-directorio-de-imagen.com">
~~~

Al igual que con los enlaces podemos añadir desde una ruta **local** o **externa** .

Dentro de la etiqueta también podemos usar atributos como lo serian `width="400px" o height="400px"`  ambos sirven para editar el tamaño de la imagen que añadimos, pero solo hace falta poner uno por que se escala la resolución a no ser que queramos hacerla dispareja.

**En este caso no debemos usarlo mucho, dado que con css deberíamos modificar el tamaño y diseño de la misma pagina/etiquetas**.

Podemos añadir la opción `alt="nombre/titulo"` para añadir un texto que se pueda mostrar en caso que la imagen no cargue o no se encuentre el directorio de la misma.

Ademas si añadimos la opción `title="titulo de imagen"` para mostrar un texto cuando el ratón pase sobre de la imagen.

---

### Vídeo

Para insertar un vídeo en la pagina requerimos de una etiqueta que a diferencia de la anteriormente mencionada esta requiere de abrirse y cerrarse, esta etiqueta es la siguiente:

~~~html
<video src="https://enlace-o-directorio-de-imagen.com" controls="">
</video>
<!--la opcion controls no tiene atributo y nos permite mostrar los controles del video-->
~~~

Si queremos añadir audio hacemos lo mismo pero con la etiqueta `<audio></audio>` y añadimos los mismos atributos de los vídeos.

---

## Div

Este a nivel estructural sirve para separar y agrupar el contenido, osea nos deja separar en "cajas" nuestro código, así podemos dividir nuestro código por partes y este funciona de la siguiente manera:

~~~html
<div>
    <p>aqui va tu codigo</p>
</div>
~~~

---

## Formularios

Estos son "inputs" que permiten al usuario ingresar datos y que estos se envíen a un servidor por ejemplo, su sintaxis es la siguiente:

~~~html
<form method="metodo de envio al servidor">
    <input type="tipoDeInput" name="nombreQueLoConectaConElBackend">
</form>
~~~

En el type hay varias opciones que pueden ir en el atributo `type` y algunas son:

+ `type="text"` este permite escribir texto normal en la casilla de input.
+ `type="number"` este permite escribir solo números en la casilla de input.
+ `type="password"` este permite que cada carácter se escriba como contraseña (*).
+ `type="email"` este no permitirá el envió del formulario a no ser que contenga un email.
+ `type="color"` este nos da una casilla en la que podemos seleccionar un color.
+ `type="range"` este nos entrega una barra (de arrastre) con un selector central (este nos deja usar `min="numero" max="numero"` para seleccionar el valor de el "range".
+ `type="date"` este nos da una casilla para ingresar fechas.
+ `type="time"` este nos da una casilla para ingresar la hora
+ `type="button"` este nos entrega un botón, para que este tenga un texto escrito debemos ingresar un `value="texto que hay en el boton"`.
+ `type="submit"` este nos entrega un botón "enviar" que se encarga de ejecutar la orden de enviar los datos al servidor (este muestra el "enviar" dependiendo del idioma de la maquina).

**Recordar que si queremos hacer que un formulario sea obligatorio, aparte de añadir el tipo debemos añadir la opción `required=""`, esto hará que el formulario no se envié hasta que ese mismo este completado (ejemplo con contraseña o con otras cosas como lo seria un email, username, etc...) pero esto no es recomendado dado que se puede editar el html desde el navegador y no es practico pues literalmente así pueden hackear nuestra web**.

---

## Nav

Esta etiqueta nos permite hacer algo similar a una "barra de navegacion" estas se crean con listas y nos permiten como dice la pagina el "navegaar dentro de los datos de la paigina".

Este mismo como ya menvionamos se crea con listas, que van dentro de el nav y que por cierto debe ir dentro de un header, porlomenos en el caso que lo aplicaremos ahora.

Su sintaxis es la siguiente:

~~~html
<header>
    <nav>
        <ul> <!--en este caso hay que recordar que son listas desordenadas-->
            <li><a href="archivos.html">Nombre Del Enlace</a></li>
        </ul>
    </nav>
</header> 
~~~

---

## Article y section

Estas etiquetas son bastante "especiales" en el caso de que queramos hacer un **articulo** y hacerlo semanticamente correcto deberíamos usar la etiqueta 

~~~html
<article>
    <p>Aqui ingresamos lo que va en nuestro articulo.</p>
</article>
~~~

Pero si por algún motivo queremos añadir mas de un articulo deberíamos añadir la etiqueta "section" y usarlo de la siguiente manera:

~~~html
<article>
    <section>
        <p>
            Esta es la primera seccion del articulo.
        </p>
    </section>
    <section>
        <p>
            Esta es la segunda seccion del articulo.
        </p>
    </section>
</article>
~~~

---

## Aside

Esta etiqueta nos permite tener "datos extra" al lado de la pagina como lo seria en cualquier otra pagina esa minipestaña de "datos extra" que suele ir a la derecha de la pagina.

su sintaxis es la siguiente:

~~~html
<aside>
    <p>dato extra que va a la derecha de la pagina principal</p>
</aside>
~~~

Recordar que en el mismo podemos añadir todo lo que queramos **mientras sea semanticamente correcto**.

---

## Footer

El footer es la sección de "información" al inferior de la pagina, este se usa con la etiqueta:

~~~html
<footer>
    <p>aqui va la info que ingresariamos en el pie de pagina</p>
</footer>
~~~

Ahí se suele ubicar la info de contacto, derechos, comentarios y servicio al cliente, entre otra información bastante útil tanto para el usuario como para la pagina en si.

---

## Tablas

Como es obvio son tablas en las que se pueden ingresar y prganizar datos de forma comun, de hecho antes se usaban para organizar partes de la pagina con solo html pero ya no hace falta, su etiqueta se usa de la siguiente forma como ejemplo:

~~~html
<table>
    <tr>
        <td>Nombre</td>
        <td>Apellido</td>
        <td>Edad</td>
    </tr>
    <tr>
        <td>Rodrigo</td>
        <td>Seguel</td>
        <td>17</td>
    </tr>
    <tr>
        <td>Ailin</td>
        <td>Jara</td>
        <td>17</td>
    </tr>
    <tr>
        <td>Javiera</td>
        <td>Retamal</td>
        <td>17</td>
    </tr>
</table>
~~~

Esta lista se mostrara de la siguiente forma en la pagina:

| Nombre  | Apellido | Edad |
| ------- | -------- | ---- |
| Rodrigo | Seguel   | 17   |
| Ailin   | Jara     | 17   |
| Javiera | Retamal  | 17   |

Obvio es un ejemplo ya que no se ve 100% igual.

---

## Icono

Es importante para el estilo de nuestra pagina tener un icono, uno bonito es indispensable, pero aprender a diseñarlo es cosa tuya, para añadir un icono a la pagina  debemos usar en el `head` la siguiente etiqueta:

~~~html
<link rel="icon" href="imagenIcono.ico">
~~~

El `.ico` es indispensable, y en la parte donde va la imagen debemos ingresar la ruta de la imagen en si.

---

## Fin

 Con esto ya sabrás lo necesario de html y puedes continuar con el siguiente escalón el cual seria css.

Con css podrás hacer el diseño gráfico de la pagina, o hacer que la misma sea mas visual, bonita y decente para la vista, al momento que estoy escribiendo esta documentación aun no empiezo con el aprendizaje de css pero cuando logre terminar el estudio de este iniciare con otra documentación útil para novatos y como recordatorio para ya programadores.

**Sin mas que decir, soy Rodrigo Seguel y te agradezco por preferir esta documentación <3**.