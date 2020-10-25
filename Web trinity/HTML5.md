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

+ [Inicia tu HTML](#Inicia-tu-HTML)
  + [Sintaxis Básica](#Sintaxis-Básica)
+ [Etiquetas](#Etiquetas)
  + [Metadatos](#Metadatos)
  + [Etiquetas basicas](#Etiquetas-basicas)
  + [Enlaces](#Enlaces)
  + [Listas y tablas](#Listas-y-tablas)
  + [Multi-media](#Multi-media)
    + [Imagen](#Imagen)
    + [Video](#Video)
    + [Icono](#Icono)
  + [Formularios](#Formularios)
  + [Nav](#Nav)
  + [Artículos y secciones](#Artículos-y-secciones)
  + [Header](#Header)
  + [Aside](#Aside)
  + [Footer](#Footer)
  + [Divisores](#Divisores)
+ [Teoría de cajas](#Teoría-de-cajas)

---

## Inicia tu HTML

Antes de trabajar con nuestro html (como es obvio) debemos crear un archivo nuevo en el que trabajar, para eso solo debemos crear un archivo con extencion `.html` (**como standar de la industria recomiendo que este archivo en si tenga el nombre de `index.html`**).

Tras esto debemos simplemente crear la sintaxis básica de html dependiendo de nuestro editor (en mi caso yo uso **visual studio code** y para ello debes escribir `html:5` y dar enter para crear nuestra sintaxis básica para trabajar).

---

### Sintaxis básica

Como es común y ya mencionamos no puedes simplemente escribir html sin una "estructura o sintaxis" inicial, en este caso es la siguiente:

~~~html
<!DOCTYPE html> <!--version de html-->
<html lang="en"> <!--idioma-->
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
~~~

Antes de iniciar con la edición de html hay 3 cosas que deberías saber:

1. Html tienen 2 partes principales, estos son el `head` y el `body`.

   El head se identifica con las etiquetas `<head></head>` y en ella van los datos de la pagina que **no se verán en la misma** cosas como:

   + datos del autor
   + titulo de la pestaña
   + el tipo de caracteres que usara
   + etc...

   Y el body se identifica por usar las etiquetas `<body></body>` donde ira todo **lo que se vera en la pagina**, específicamente cosas como:

   + párrafos
   + imágenes
   + listas
   + etc...

   ---

2. Hay una etiqueta especial en este archivo:

   ~~~html
   <html lang="en">
   ~~~

   Esta nos permite "seleccionar" o "mencionar" el idioma que usaremos para nuestra pagina (por defecto esta en ingles) y recomiendo (en caso de que nuestra pagina este en español) usar:

   ~~~html
   <html lang="es">
   ~~~

   ---

3. A la hora de trabajar con html puede que exista la necesidad de hacer "comentarios", esto lo hacemos escribiendo:

   ~~~html
   <!--aqui va el comentario-->
   ~~~

   Y como es obvio, esa linea no afectara el funcionamiento del html que estamos escribiendo.

   ---

4. HTML no es al 100% un lenguaje que pueda interpretar de forma nativa lo que quiere escribir el "desarrollador", dado que por ejemplo, si nosotros estructuramos una pagina HTML de la siguiente forma:

   ~~~html
   Titulo de pagina
   
   parrafo de pagina
   ~~~

   Lo único que veremos en la pagina final sera esas dos lineas de texto concadenadas, osea:

   `Titulo de pagina parrafo de pagina`

   Esto se genera dado que para usar HTML en su forma correcta, necesitamos avisarle y configurar que tipo de texto es cada parte a añadir y este no puede saber que parte es un encabezado, o un párrafo, una imagen, etc...


---

## Etiquetas

El lenguaje de html se basa en "etiquetas" que de forma resumida son "marcadores" y indican la funcion del texto que estamos escribiendo, por ejemplo un `<p>asi escribimos un parrafo</p>` y se separan en 2 tipos distintos, los cuales son:

+ Etiquetas "auto-concluidas" osea que se abren y se cierran al instante usando `<>`

  ~~~html
  <meta name="description" content="esta es la descripcion de mi pagina">
  ~~~

  las etiquetas auto-concluidas no requieren de `/` para funcionar, de hecho deberiamos saltarnos este signo **a no ser que trabajemos con herramientas como react** pero en ese caso no es necesario en todas las ocaciones como con `<link>`,  `<br>` , `<img>`, etc...

  ---

+ Etiquetas "dobles" osea que requieren de un texto que la inicie y otro que la cierre usando `<></>`

  ~~~html
  <p>Esto es un parrafo y requiere una "etiqueta doble"</p>
  ~~~

  ---

En el caso del primer ejemplo añadimos "propiedades" dentro de la etiqueta, esto se puede añadir a técnicamente **todas las etiquetas** así editamos lo que ingresemos en nuestras etiquetas o la función de la etiqueta en si (esto lo veremos mas adelante).

---
### Metadatos

Para poder añadir mas información a la pagina (metadatos) debemos usar la etiqueta `<meta/>` que por cierto debemos ingresar dentro de nuestro `<head></head>`.

Esta nos permite en efecto editar estos datos, así entregando una "información extra" bastante útil para tanto cosas como la gente que ve nuestro código fuente como incluso para que sea mas fácil de ver en google, entre otras cosas muy necesarias.

Las "propiedades" que puede tener son las siguientes:

~~~html
<meta name="description" content="aqui escribimos el texto de mi descripcion">
<meta name="author" content="Rodrigo Seguel">
<meta name="keywords" content="palabras,clave,para,facilitar,la,busqueda,de,tu,pagina">
<meta charset="utf-8" > este se usa para agregar caracteres extra a la pagina
<meta name="copyright" content="nombre de la empresa quien tiene los derechos">
<meta name="robots" content="index"> este permite mostrar la pagina en buscadores
<meta name="robots" content="noindex"> este no muestra la pagina en buscadores
~~~

Como se puede ver, la parte "name" nos permite elegir seleccionar que opción queremos mostrar, y el "content" nos permite mostrar el contenido de esa misma "opción".

**Cabe aclarar que algunos de estos datos no se muestran en la pagina en si, por estar directamente en el header, estas usualmente no son visibles para el usuario normal**.

**Recuerden que los 2 últimos son indispensables dependiendo de la pagina que estaremos creando**.

---

### Etiquetas básicas

Como ya mencionamos requeriremos de etiquetas constantemente (por que en eso se basa el lenguaje) pero aquí tienen una lista corta de "etiquetas básicas" cuyo uso es bastante simple.

| Etiqueta            | Descripción                                                  |
| ------------------- | ------------------------------------------------------------ |
| `<title></title>`   | Titulo de la ventana (va en el `<head></head>`)              |
| `<h1></h1>`         | Encabezado (hay 6 niveles, el h1 es el mas grande y el h6 el mas pequeño) |
| `<p></p>`           | Párrafo                                                      |
| `<b></b>`           | texto en **negrita**                                         |
| `<i></i>`           | *cursiva*                                                    |
| `<strike></strike>` | ~~tachada~~                                                  |
| `<small></small>`   | letras **chiquitas**                                         |
| `<br>`              | salto de linea                                               |

---
### Enlaces

Los enlaces se crean con la etiqueta `<a></a>` y sirven para redireccionarnos a otros lugares/paginas, su funcionamiento directo es el siguiente:

~~~html
<a href="https://paginaWebRedireccionada.com">texto que se muestra como enlace</a>
~~~

Estos enlaces se definen por **rutas** y estas pueden ser **locales** o **externas**, osea que puede ser una pagina web o un archivo en la carpeta de "html".

Si por ejemplo queremos hacer un enlace a una pagina/archivo desde nuestro html debemos por ejemplo crear otro archivo html en la misma pagina y llamarlo así:

~~~html
<a href="archivo_a_redireccionar.html">texto que se muestra como enlace</a>
~~~

Si ese archivo .html esta dentro de otra carpeta debemos llamar la ruta en si como si fuera `carpeta/index.html` y si queremos volver a la carpeta anterior debemos usar por ejemplo `../carpetaVieja.html`.

Y así podemos por ejemplo movernos entre nuestra pagina html con enlaces.

Para que la pagina se abra en otra pestaña debemos añadir después del `href="link"` un `target="_BLANK"`.

Si queremos hacer un hipervínculo "interno" como lo podría ser un indice o algo así debemos ingresar en la etiqueta a la que nos vincularemos el parámetro `id="nombreId"` y en nuestro hipervínculo hacer `href="#nombreId"` es similar a markdown pero no especialmente lo mismo.

**Cabe aclarar que también sirve para otras cosas, por ejemplo si creamos un archivo de css externo en vez de usar `<a></a>` deberías usar `<link/>` de la siguiente forma:**

~~~HTML
<head>
	<link href="nombre-de-archivo.css" rel="stylesheet" type="text/css">
</head>
~~~

**También podemos usarlo de otras formas y para otras razones, pero esta es una de sus funciones mas importantes**.

---

### Listas y tablas

Hay varias etiquetas que nos permiten mostrar información de forma agrupada y para esto html nos permite usar tanto **listas** como **tablas**.

+ **Las listas** como ya todos sabemos son simplemente un "conjunto de datos organizados de forma vertical" en este caso usamos la etiqueta `<ul></ul>` para crear una lista desordenada y dentro usamos `<li></li>` para añadir datos en la misma

  *ejemplo:*

  ~~~html
  <ul>
      <li>esta</li>
      <li>es una</li>
      <li>lista</li>
      <li>desordenada</li>
  </ul>
  ~~~

  cabe aclarar que para hacer listas "ordenadas" o listas con orden numérico (que aparezcan con un numero antes) deben cambiar el `<ul></ul>` por un `<ol></ol>`.
  
  ---
  
+ **Las tablas** como dice su nombre son tablas en las que se pueden ingresar y organizar datos, utiliza varias etiquetas como:

  +  `<table></table>`  que permite definir donde empieza una tabla
  + `<tr></tr>` que permite definir un nivel de la tabla
  + `<td></td>` que nos permite añadir datos a ese nivel en la tabla

  *un ejemplo de uso seria:*

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

### Multi-media

A la hora de trabajar con html, en mas de una ocasion vamos a querer añadir contenido multi-media.

Imágenes, vídeos, audios e iconos son algunos de estos contenidos reproducibles que podríamos añadir a nuestra pagina y puede ser una parte bastante útil para mantener a nuestros usuarios en ella.

---

#### Imagen

Para mostrar una imagen en html debemos usar la etiqueta:

~~~html
<img src="https://enlace-o-directorio-de-imagen.com">
~~~

Al igual que con los enlaces podemos añadir desde una ruta **local** o **externa** .

Dentro de la etiqueta también podemos usar atributos como lo serian `width="400px" o height="400px"`  ambos sirven para editar el tamaño de la imagen que añadimos, pero solo hace falta poner uno por que se escala la resolución a no ser que queramos hacerla dispareja.

**En este caso no recomiendo usarlo pues esto lo haremos con css mas adelante**.

Podemos añadir la opción `alt="nombre/titulo"` para añadir un texto que se pueda mostrar en caso que la imagen no cargue o no se encuentre el directorio de la misma.

Ademas si añadimos la opción `title="titulo de imagen"` para mostrar un texto cuando el ratón pase sobre de la imagen.

---

#### Vídeo

Para insertar un vídeo en la pagina requerimos de una etiqueta que a diferencia de la anteriormente mencionada esta requiere de abrirse y cerrarse, esta etiqueta es la siguiente:

~~~html
<video src="https://enlace-o-directorio-de-imagen.com" controls="">
</video>
<!--la opcion controls no tiene atributo y nos permite mostrar los controles del video-->
~~~

**Ademas si en lugar de añadir un video queremos añadir audio hacemos lo mismo pero con la etiqueta `<audio></audio>` y añadimos los mismos atributos de los vídeos.**

**Ojo**, si queremos añadir un vídeo proveniente de youtube debemos antes dar en la opción "compartir" en el mismo vídeo y seleccionar la opción "insertar", esto nos dará acceso a una etiqueta de html completa, que nos permitirá la inserción de ese vídeo de youtube en nuestra pagina.

*esta se ve así:*

~~~html
<iframe width="560" height="315" src="https://www.youtube.com/embed/kN1XP-Bef7w" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
~~~

En este caso debería mostrarnos un curso de html hecho por el canal de "soy dalto" [puedes verlo aqui](https://www.youtube.com/watch?v=kN1XP-Bef7w&t=6277s&ab_channel=SoyDalto).

---

#### Icono

Es importante para el estilo de nuestra pagina tener un icono, uno bonito es indispensable, pero aprender a diseñarlo es cosa tuya, para añadir un icono a la pagina  debemos usar en el `head` la siguiente etiqueta:

~~~html
<link rel="icon" href="imagenIcono.ico">
~~~

El `.ico` es indispensable, y en la parte donde va la imagen debemos ingresar la ruta de la imagen en si.

---

### Formularios

Estos son "inputs" que permiten al usuario ingresar datos y que podamos iterar con estos por ejemplo en nuestro servidor.

Utiliza la etiqueta `<form></form>` y dentro de la misma la etiqueta `<input>` dentro de la cual añadimos 2 parámetros:

+ `type=""` el tipo de input con el que trabajaremos.
+ `name=""` el "nombre" o identificador que usaremos para iterar con el dato recibido en el input.

ademas en el `<form></form>` existe el parámetro `method=""` ahí seleccionaremos el método de "envió" de los datos a nuestro **backend**.

~~~html
<form method="metodo de envio al servidor">
    <input type="tipoDeInput" name="identificadorDeBackend" placeholder="textoDefault">
</form>
~~~

*Ojo: aquí usamos el parámetro `name=""` este es un "parámetro obsoleto y puede que google nos penalice a la hora de tener alguna prioridad en los buscadores, por lo que recomiendo que lo cambies por `id=""`*, ademas el `placeholder=""` nos permite ingresar textos default, como ese tipico texto de *inserte su contraseña*.

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

debemos recordar que hay una propiedad de los input llamado `value=""` que es el valor que recibe el formulario, este cambia dependiendo de la información que recibe nuestro input (**este es IMPORTANTISIMO a la hora de trabajar con nuestro javascript**)

Para hacer un campo obligatorio podríamos usar el parámetro `requiered=""` en el input que queramos dejar como obligatorio.

También podríamos usar el `<textarea></textarea>` como otro tipo de input que nos permite escribir texto multi-linea.

---

### Nav

Esta etiqueta nos permite hacer algo similar a una "barra de navegación" estas se crean con listas y nos permiten como dice la pagina el "navegar dentro de los datos de la pagina".

Este mismo como ya mencionamos se crea con listas, que van dentro de el nav y que por cierto debe ir dentro de un header, por lo menos en el caso que lo aplicaremos ahora.

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

En este caso creamos una barra de navegación con solo un botón en una lista que nos permite "acceder" a otro archivo html.

---

### Artículos y secciones

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

### Header

El header es esta "sección" superior en cada pagina donde usualmente irán las "diferentes secciones" que separan nuestra pagina entre inicios de sección u otras cosas/información.

Este usa la etiqueta `<header></header>` y no confundir con el `<head></head>` dado que este ultimo es la información que no se vera en la pagina por el usuario.

*un ejemplo seria:*

~~~html
<header>
    <p>dato en el header</p>
</header>
~~~

Cabe aclarar que ese párrafo puede ser remplazado por muchas otras etiquetas dependiendo de nuestra necesidad.

---

### Aside

Esta etiqueta nos permite crear una "sección" de la pagina que se conoce como Aside, esta siendo esa típica "mini-pestaña" de información al lado "derecho" de la pagina.

su sintaxis es la siguiente:

~~~html
<aside>
    <p>dato extra que va a la derecha de la pagina principal</p>
</aside>
~~~

Recordar que en el mismo podemos añadir todo lo que queramos **mientras sea semanticamente correcto**.

---

### Footer

El footer es la sección de "información" al inferior de la pagina, este se usa con la etiqueta:

~~~html
<footer>
    <p>aqui va la info que ingresariamos en el pie de pagina</p>
</footer>
~~~

Ahí se suele ubicar la información de contacto, derechos, comentarios y servicio al cliente, entre otra información bastante útil tanto para el usuario como para la pagina en si.

---

### Divisores

Los divisores de por si son algo bastante útil especialmente a la hora de estructurar nuestro código, nosotros los usaremos en varios ámbitos como "encapsular" nuestro código tanto como para "usar Teoría de cajas" (este tema lo veremos mas adelante).

*ejemplo:*

~~~html
<div>
    <p>aqui va tu codigo</p>
</div>
~~~

Por eso el usarlo en varios ámbitos puede ser muy útil.


---

## Teoría de cajas

Todas las etiquetas (o al menos la mayoría de ellas) tienen una particularidad y es que funcionan con "**Cajas**".

Al abrir cualquier pagina (por lo menos en google chrome o chromium) al seleccionar un objeto en el html de la pagina nos daremos cuenta que existirá un "cuadro celeste" que rodeara este objeto.

Estas de por si son lo que se consideran como "cajas" y a pesar de ser un tema mas importante al usar css es útil saber de este tema desde ya.

Las etiquetas en general se dividen en 2 tipos:

* **Elementos en linea** (son los elementos cuyo tamaño de la caja se basa en "el dato" que guardan) ademas **se pueden apilar de forma horizontal como vertical**.

  ---

* **Elementos en bloque** (son los elementos cuyo tamaño de la caja ocupa todo el largo horizontal de la pagina) ademas **solo pueden apilarse de forma vertical**.

osea que si por ejemplo usamos un elemento en linea, al colocar otro debería organizarse al lado del mismo, a diferencia de los en bloque que al ocupar todo el ancho de su contenedor, no deberían permitir esto.

**Elementos en linea (mas usados):**

+ `<a>` (enlaces)
+ `<span>` (similar a un div pero cuya función permite agrupar datos de forma vertical)
+ `<strong>` (es un tipo de "**negrita**")
+ `<img>` (imágenes)
+ `<input>` (entrada de interacción del usuario)
+ `<code>` (nos permite escribir texto en nuestra pagina como código similar a usar `~~~` en markdown)
+ `<b>` (otro tipo de "**negrita**")

**Los elementos en bloque (mas usados):**

+ `<h1>`, `<h2>` y `<h3>` (encabezados/títulos de texto)
+ `<p>` (párrafos)
+ `<ul>` (listas desordenadas)
+ `<li>` (elementos de lista)
+ `<div>` (divisores)
+ `<header>` (encabezado de la pagina)
+ `<nav>` (barra de navegación)
+ `<section>` (secciones)
+ `<article>` (artículos)
+ `<footer>` (sección inferior de la pagina)
+ `<form>` (formularios)
+ `<table>` (tables)

---
