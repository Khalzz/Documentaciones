# CSS

Css (o **hojas de estilo en cascada**) es un "lenguaje" designado al diseño de nuestra pagina web, dado que con este añadimos el "estilo" de la pagina en si.

Esta junto a html (ademas de javascript) entran en lo que me gustaría llamar "**el mundo web**" en su forma mas básica.

Debemos tomar en cuenta que el css se hace en conjunto usualmente con el html, por lo que es 100% imposible hacer el css sin html, pues como un ejemplo seria imposible mover una caja si esta no existe con anterioridad.

---

## Indice



---

## inicia tu estilo

Como ya dije css se usa para **crear el aspecto gráfico de nuestra pagina** así editando lo que se conoce como "**el flujo de html**" este siendo la forma en la que se "ven" los datos del html (en este caso desde arriba hacia abajo en orden) ademas de los colores y formas de todos estos datos.

Pero antes debemos saber como añadirlo a nuestro código.

Hay 2 formas principales de añadir css a nuestro html y son:

### **Forma interna**

La forma interna se hace con un método que se llama **Estilo lineal** osea que el css se añade en la misma linea/etiqueta que queremos editar, por ejemplo:

~~~html
<p style = "color: blue">Hola mundo web</p>
~~~

Usamos la opción `style` que se puede usar en todas las etiquetas en este se añade los parámetros para editar el estilo de lo que queramos en este caso el mensaje "hola mundo" se mostrara en color azul.

### Forma externa 
La forma externa requiere de tener un archivo implicado solo o principalmente al diseño de la pagina, este es enlazable a nuestro html con la etiqueta `<link>` obviamente ya habiendo hecho el archivo que recomiendo tenga el nombre `style.css`

para esto escribimos lo siguiente en el `<head>` de la pagina:

~~~html
<head>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
~~~

Luego como demostramos en el ejemplo usamos el `href = "style.css"` para enlazar el archivo de css que por mi recomendación debería estar en la misma carpeta que nuestro html.

---

## Estructura de css

En el nuevo archivo de css debemos estructurar el código de una forma especifica, en el archivo debemos manejar la siguiente:

~~~css
selector{
    propiedad:valor;
}
~~~

En este caso la estructura es así, y cada parte son las siguientes:

+ **Selector** (el selector es el objeto o parte del html que vamos a editar, ya sea un párrafo, botón, o otros aspectos/datos del html) lo veremos un poco mas adelante [justo aqui](#Selectores).
+ **Propiedad** (el "editor" que aplicaremos a el objeto html, por ejemplo el color, la forma, el tamaño, entre otros).
+ **Valor** (el valor es en efecto el valor de ese editor, por ejemplo si tenemos la propiedad color el valor es `red` o si tenemos la propiedad width el valor seria la anchura del mismo).

***Por ejemplo:***

Si tenemos varios párrafos en  nuestro html y queremos que su color sea rojo, vamos a nuestro archivo de css y hacemos lo siguiente:

~~~css
p{ /*Se tomara en cuenta todos los parrafos <p></p>*/
    color:red; /*Añadimos la propiedad color:red; para hacer el parrafo color rojo*/
}
~~~

Así al abrir nuestro `index.html` en el navegador **todos los párrafos** se verán de color rojo (también podemos cambiar red por un valor en hexadecimal) en este caso usamos un **selector de tipo**.

Cabe resaltar que los comentarios en css se escriben usando `/*comentario*/`.

---

### Selectores

Como ya mencionamos los selectores nos permiten seleccionar que etiqueta(s) vamos a editar, los selectores son:

#### Selector Universal

Nos permite editar todas las etiquetas de nuestro html, aun si estas son de diferente tipo y el selector es `*`.

*ejemplo:*

~~~css
* {
    propiedad:valor;
}
~~~

---

#### Selector De Tipo

Nos permite seleccionar específicamente un tipo concreto de etiquetas, por ejemplo si seleccionamos solo párrafos, todos los párrafos se verán iguales, lo mismo si lo aplicamos a input, botones, entre otros aun que también nos permite tener mas de un tipo al mismo tiempo seleccionado.

*Por ejemplo:*

~~~css
p {
    propiedad:valor;
}
~~~

en este caso solo llamamos los párrafos pero también podemos hacer lo siguiente:

~~~css
p,li,h1 {
    propiedad:valor;
}
~~~

y así añadimos a todos los "párrafos,listas y encabezados de nivel 1" el mismo css.

---

#### Selector Por Clases

Para usar esta debemos "encasillar" nuestras etiquetas con un identificador llamado `class`, a este identificador le entregamos un "nombre" luego podemos añadir el mismo a varias otras etiquetas.

Tras esto si lo usamos como selector toda etiqueta que lo tenga, se vera editado.

*ejemplo:*

Primero hacemos un párrafo en html

~~~html
<p class="parrafo-1"> Este es un parrafo en html </p>
~~~

Luego lo usamos como selector

~~~css
.parrafo-1{
    propiedad:valor;
}
~~~

Para llamar la clase, debemos escribir `.Nombre-de-la-clase` y el nombre no debe llevar espacios.

---

#### Selector Por Id

Este funciona muy similar al **selector por clase** solo que en este caso debemos añadir a una etiqueta la cual es `id` y a diferencia de la class en este el id solo nos permite acceder a una etiqueta, no a un grupo de etiquetas.

*ejemplo:*

~~~html
<p id="id-de-la-etiqueta"> Este es un parrafo en html </p>
~~~

para editar solo ese párrafo debemos usar `#ID-de-etiqueta` de la siguiente manera:

~~~css
#id-de-la-etiqueta {
    propiedad:valor;
}
~~~

---

#### Selector Por Atributo

Para esto creamos un atributo sin función a nuestra etiqueta html.

*ejemplo:*

~~~html
<p TeGustaLaDocumentacion="si"> Este es un parrafo html </p>
~~~

y luego solo lo llamamos escribiendo lo siguiente:

~~~css
[TeGustaLaDocumentacion="si"] {
    propiedad:valor;
}
~~~

Cabe recalcar que el atributo puede ser el que nosotros queramos crear.

---

#### Selector Por Descendiente

Para esto necesitamos crear una etiqueta padre y una etiqueta hijo.

*por ejemplo:*

~~~html
<div>
    <p> Este es un parrafo dentro de un header </p>
</div>
~~~

En este caso es un párrafo dentro de un div y para poder seleccionarlo hacemos esto:

~~~css
/*contenedor y hijo*/
div p {
    propiedad:valor;
}
~~~

Cambien podríamos hacerlo con clases, id u otros métodos pero este también sirve de este método

---

   ### Unidades

En Css hay 2 tipos muy específicos de medidas (refiriéndome al tamaño) estas se aplican a todas las propiedades que trabajen con medidas y son estas:

+ **Medidas Fijas:** *Medidas que se basan en un tamaño general que no cambian, por ejemplo si pasamos una pagina de computador a mobiles el objeto con tamaño fijo se mantendrá igual de grande `incluso si este sale de la pantalla`*.

  *ejemplo:*

  ~~~css
  p{
      font-size:15px; /*este puede ser tanto px, pt, mm, cm, entre otros sistemas metricos*/
  }
  ~~~

  Esto genera que la fuente del párrafo llamado siempre tendrá un tamaño de `15 pixeles` sin importar desde donde se visualiza la página.

  ---

+ **Medidas Relativas:** Medidas que se basan en un tamaño que puede variar, un ejemplo claro seria que si la pagina la pasamos de computador a mobiles, el tamaño del objeto se ajustara al tamaño de nuestro "Layout" así que a diferencia del fijo si usamos este `el objeto no saldra de la pantalla`.

  *ejemplo:*

  ~~~css
p{
      font-size: 1em; /*1em equivale a 16px // en su defecto por ejemplo 5em son 80px*/
}
  ~~~
  
  Esta medida se edita dependiendo del tamaño de el "padre" por ejemplo si tenemos un div con `font-size: 25px` el valor de 1em pasa a ser 25px y hacemos un diseño "***Responsive***" pero mientras nuestro "contenedor" o "padre"  no exista el valor de 1em serán 16px. 
  
  En este caso tenemos también otra "unidad importante" llamada `ViewPort` este nos permite definir el tamaño en porcentajes, por ejemplo:
  
  ~~~css
  /*Suponemos que el margen de la pagina es 0*/
  *{
      padding: 0px;
      margin: 0px;
  }
  
  p{
      width: 50vw; /*el ancho del <p> sera un 50% de el ancho de su clase "padre"*/
      height: 50vh; /*el alto del <p> sera un 50% de el alto de su clase "padre"*/
  }
  ~~~
  
  Lo mismo se aplica si esto es un 100%, 20%, 1% etc...

---

### Especificidad

La especificidad es "el método que usamos para seleccionar que selector tiene mayor prioridad a la hora de ser editado en el estilo de nuestro html".

*Por ejemplo:*

~~~css
/*si tenemos 2 editores de una misma "etiqueta" como*/
p{
    color:red;
}
/*y ademas añadimos un*/
p{
    color:blue;
}
/*al final el color que quedara del parrafo sera azul*/
~~~

Esto es por la prioridad que le da css a sus lineas en si y en caso de no usar la especificidad de forma "practica" esta ira desde las primeras lineas hasta la ultima, por lo que si determinamos por ejemplo como en este caso, el color de un elemento y luego le seleccionamos al mismo otro color.

Este se mostrara en el ultimo color, pues la especificidad dice que la ultima linea es la que vale.

---

#### Lista de jerarquía

Esta jerarquía ya mencionada sigue la siguiente lista **(esta lista va en orden, desde el mas importante hasta el que menos)**

1. !important

   *ejemplo:*

   ~~~css
   p{
       color:red !important;
   }
   ~~~

   el `!important` le entrega la mayor jerarquía a nuestro editor, sin importar su "selector"  *no es recomendable por que luego editarlo es difícil.*

2. estilos en linea

   ejemplo:

   ~~~html
   <!--en este caso la jerarquia se aplica si le damos el diseño en la linea de html-->
   <p style="color:red"> lorem ipsum, dolor sit... </p>
   ~~~

3. Identificadores

   *ejemplo:*

   ~~~css
   /*suponiendo que tenemos un parrafo con un atributo id="id-de-la-etiqueta"*/
   #id-de-la-etiqueta{
       color:red
   }
   ~~~

4. clases, pseudo-clases y atributos

   *ejemplo:*

   ~~~css
   /*suponiendo que tenemos un parrafo con un atributo class="clase-1"*/
   .clase-1{
       color:red
   }
   ~~~

5. elementos y pseudo-elementos

   *ejemplo:*

   ~~~css
   p{
       color:red
   }
   ~~~

---

## Metodología BEM

Css y HTML al igual que muchos otros lenguajes tiene un conjunto de reglas especificas que no son las de sintaxis, sino las de comunidad, desde proponer variables en camelCase hasta dejar un espacio entre el fin de una función y el inicio de otra, estas reglas nos ayudan tanto a que nuestro código este mas ordenado como para que sea mas legible.

*Las siglas significan **Bloque, Elemento y Modificador***

Este busca poder dividir nuestras clases en "bloques imaginarios" que nos ayudaran a acceder a estos de forma mas fácil.

*Ejemplo:*

~~~html
<!--a la hora de crear una etiqueta en html la dividiremos por clases usando divs asi:-->
<div class="clase-principal">
    <p class="clase-principal__p"> este es un "hijo de la clase-principal" </p>
    <h1 class="clase-principal__h1"> este es otro "hijo de la clase principal" </h1>  
</div>
~~~

Y así ya dividimos nuestro texto de una forma mas "accesible" en nuestro css y sin tener que usar como clase: `p1, p2, p3, parrafo-5, parrafo4-pq-me-olvide` entre otras clases "menos eficaces".

**Recordar si hacemos un cambio en el contenedor o "clase padre" este generara el cambio a sus clases hijo**.

---

## Propiedades de texto basicas

El texto se ingresa de distintas formas en html y al ser algo tan constante en nuestras paginas requerimos también de saber como editar el estilo de estos textos.

Las propiedades principales que nos pueden interesar pueden ser:

+ **font-size** el tamaño de fuente es uno de las propiedades que podemos aplicar con alguna unidad de medida de las anteriormente ya mencionadas y como dice su nombre, edita el tamaño de la fuente/texto.

  *ejemplo de uso:*

  ~~~css
  p{
      font-size: 15px;
  }
  ~~~

  ---

+ **font-family** el "tipo de fuente" del texto, podemos usar de referencia [la siguiente página](https://fonts.google.com/) y para añadirlo al proyecto (si la fuente no esta valida de forma nativa para css) en esta pagina seleccionamos la fuente o la familia de fuentes, seleccionamos la fuente a usar, y le damos en "select this style", tras esto en la opción "Embed" copiamos la etiqueta html y la añadimos en nuestro header de html.

  *ejemplo de uso:*

  ~~~css
  p{
      font-family: Georgia;
  }
  ~~~

  ---

+ **line-height** la "altura lineal" de el texto, es "la altura" de este según según una unidad especifica, este no usa mm, cm,px o otros como lo hace el font size, este usa un numero por defecto, ya sea 1,2,3...

  *ejemplo de uso:*

  ~~~css
  p{
      line-height: 1;
  }
  ~~~

  Esto representa que si trazamos una linea horizontal en la mitad de una letra, esta tendrá 0,5 unidades en la mitad superior y en la inferior, si el line height fuera 2 por ejemplo arriba habrían 1 y abajo también.

  ---

+ **font-weight** el grosor de la fuente determina el grosor de las lineas que componen a este.

  *ejemplo de uso:*

  ~~~css
  p{
      font-weight: normal; 
  }
  ~~~

  Sus valores pueden ser los siguientes:

  + normal: grosor equivalente a 400.
  + bold: grosor mayor **similar a negrita** equivale a 700.
  + lighter: corresponde a un tipo de fuente mas delgada que el "elemento padre".
  + bolder: corresponde a un tipo de fuente mas grueso que el "elemento padre".
  + 100,200,300,400...: los valores numéricos son otro método que tenemos de ingresar el valor, estos no requieren de una unidad de medida.
  
  ---
  
+ **Text-align** como esta el texto alineado en torno a su caja.

  *ejemplo de uso:*

  ~~~css
  p{
      text-align: center;
  }
  ~~~

  Sus valores pueden ser los siguientes:

  + center: centra el texto en torno a su caja
  + left: organiza el texto al lado izquierdo en torno a su caja
  + right: organiza el texto al lado derecho en torno a su caja
  + justify: organiza el tamaño del texto tomando en cuenta el ancho de su caja
  + initial: devuelve el valor por defecto al `text-align`

---

## Estilo predeterminado

A la hora de trabajar con css debemos ser cocientes de que todos los buscadores, dispositivos, etc tienen "valores predeterminados".

Tanto en sus margenes como en sus padding entre otros valores estos se ven editados por cada buscador pero tenemos una forma de configurar todos estos de un tipo por defecto sin importar que buscador usemos y es con un archivo llamado `normalize.css`.

***Para descargarlo lo buscamos en [esta pagina](https://necolas.github.io/normalize.css/) lo descargamos (clic derecho y "guardar como") y lo añadimos a nuestra carpeta donde tenemos tanto el archivo `index.html` y `style.css`.***

~~~html
<!--para añadir el archivo descargado lo hacemos de la siguiente forma-->
<link href="normalize.css" rel="stylesheet" type="text/css">

<!--o llamarlo por el enlace de la pagina de la siguiente forma-->
<link href="enlace/de/la/pagina.algo" rel="stylesheet" type="text/css">
~~~

Y listo!!!.

Si descargamos localmente el archivo `normalize.css` por mi recomendación en cualquier parte del archivo deberíamos añadir:

~~~css
/*añadimos esto en cualquier lugar libre que encontremos*/
*{
    margin: 0; /*margen entre cajas = 0*/
    padding: 0; /*separasion entre contenido y su caja = 0 */
    box-sizing: border-box; /*mejor configuracion sobre el tamaño de las cajas*/
}

/*esto ya esta en el archivo, pero añadimos una linea*/
img{
    border-style: none;   
    /*añadimos lo siguiente*/
    max-width: 100%;
    /*asi seleccionamos que en moviles las imagenes se ajusten al 100%*/
}
~~~



---

## Modelo de Cajas

Las cajas son un "factor importante" al hablar de css.

Todo objeto o etiqueta tiene una caja que determina tanto el tamaño del objeto como el espacio que ocupa en la pagina de por si.

Estas cajas determinan el espacio que ocupa el objeto y son visibles con la opción `inspeccionar` que nos otorga especialmente google chrome (o chromium), así ver un cuadrado o rectángulo al rededor de nuestros objetos y saber como podemos iterar con estos.

![imagen no encontrada](https://hackernoon.com/hn-images/1*2jZwpWH9XO_QllhEpyGqMA.png)

este es un "ejemplo" del modelo de cajas y lo que lo compone.

---

### Elementos en linea y en bloque

Las cajas se dividen en 2 tipos distintos, los conocidos como "elementos en linea" y "en bloque".

Un elemento **en linea** es el que nos permite organizar/colocar otros elementos a su lado pues su caja solo se ajusta al tamaño del elemento ocupado, por ejemplo el alto y ancho solo equivaldrá al alto y ancho de un texto (su alto y ancho no se puede editar con las propiedades `height` y `width`).

Un elemento **en bloque** es el que por defecto ocupa una linea entera de la pagina, pues su caja tiene el tamaño del ancho de la misma (la altura se define por la altura del elemento pero tanto la altura como la anchura se pueden editar con las propiedades `height` y `width`).  

~~~css
h2{
    /*el h2 es un elemento en bloque*/
}

b{
    /*el b es un elemento en linea*/
}
~~~

Pero **¿se puede cambiar el tipo de elemento?** si usando la propiedad `display` de la siguiente forma:

~~~css
h2{
    display: inline; /*transformamos un elemento en bloque a en linea*/
}

b{
    display: block; /*transformamos un elemento en linea a en bloque*/
}
~~~

### Propiedades de cajas

Las cajas (al igual que todo técnicamente en css) tienen propiedades que editan el como se ven estas, las mismas podemos usarlas en distintas formas para distintas ocasiones, pero ahora veremos las principales.

*Estas son:*

+ `background-color:` color de fondo puede ser tanto hexadecimal como simplemente por nombre.

  ---

+ `opacity:` opacidad de la caja, su valor es desde el 0 al 1 con números flotantes.

  ---

+ `padding:` separación entre un contenido y su caja, usan las unidades ya vistas y se divide en 4 tipos y son:

  + `padding-bottom:` padding aplicado a la parte inferior de la caja.
  + `padding-top:` padding aplicado a la parte superior de la caja.
  + `padding-left:` padding aplicado a la parte izquierda de la caja.
  + `padding-right:`  padding aplicado a la parte derecha de la caja.
  + `padding:` si lo usamos así, el padding se aplica igual a todos los lados aun que tambien podemos hacer:

  ~~~css
  h2{
      padding: 10px; /*padding de 10px a cada lado de la caja*/
      padding: 10px 20px; /*padding 10px al eje y ademas de padding 10 px al eje x*/
      padding: 10px 20px 10px 20px; /*padding en orden (top, right, bottom, left)*/
  }
  ~~~

  ---

+ `height:` altura de la caja (interactúa con todo tipo de unidad).

+ `width:` anchura de una caja (interactúa con todo tipo de unidad).

  ---

+ `box-sizing:`  selecciona como actúan tanto los **padding** como el **height  y width**, tiene 2 parámetros:

  + `box-sizing: content-box;` por defecto aplica que el padding se le sume a los valores de height y width (estos últimos siendo por defecto 100px por 100px).
  + `box-sizing: border-box;` el padding se genera tomando en cuenta el tamaño de la caja y no la edita, sino trabaja según su tamaño.

  ---

+ `margin:` este define el espacio o "margen" que hay entre nuestra caja y las otras (funciona similar al padding) y podemos hacerlo de las siguientes formas:

  ~~~css
  p{
      margin: 10;/*ajustamos un margen en todos los ejes de nuestra caja*/
      margin: 10 20; /*ajustamos un margen para los ejes x/y de forma independiente*/
      /*si el 10 lo cambiamos por auto se apega al alto de su contenedor*/
      /*si el 20 lo cambiamos por auto este se centrara en su contenedor */
  }
  ~~~

  ---

+ `border-radius:` el "radio" de las esquinas de la caja según una unidad (preferencia % o em).

  ---

+ `border:` es una propiedad abreviada que se conforma por:

  + `border-width:` anchura del borde.
  + `border-style:` estilo del borde, estos estilos los puedes ver [aqui](https://www.mclibre.org/consultar/htmlcss/css/css-bordes.html).
  + `border-color:` color del borde.

  ~~~css
  /*su sintaxis seria*/
  p{
      /*border: anchura/estilo/color;*/
      border: 10px solid blue;
  }
  ~~~

  este genera un borde en la caja, pero lo posiciona dentro de la misma (*ejemplo: si tenemos una caja de 200x200 con un border de 10, de esos 200x200 solo 190x190 serian contenido lo demás es el borde*).

  ---

+ `outline:` es similar al border a excepción que en este caso, el borde no queda dentro de la caja sino que por fuera, ademas de que no afecta las otras cajas que entren en contacto con el mismo, su sintaxis es exactamente la misma.

  ---

+ `box-shadow:` nos permite añadir una sombra a la caja de por si (también funciona con texto).

  *su sintaxis es así:*

  ~~~css
  p{
      /*box-shadow: ejex/ejey/tamañoSombra/nivelBorde/colorHex;*/
      box-shadow: 20px 20px 10px 0 #000;
      /*el "nivelBorde" no funciona en un text-shadow*/
  }
  ~~~

---

### Position

la propiedad `position` es otra mas orientada a las cajas y se encarga de **posicionar las cajas según la forma en la que elijamos**, esta propiedad tiene 5 parámetros posibles, y son:

+ `static` es la opción por defecto, lo único que hace es mantener la posición entregada por html.

  ---

+ `relative` esta opción nos entrega 4 propiedades extra (top, left, right, bottom) aun que los primeros 2 son los mas importantes, su peculiaridad es que al mover un objeto este deja una "caja vacía" en la posición original del mismo.

  ~~~css
  p{
      position: relative;
      top: 100px;
      left: 50px;
      /*las propiedades top y left tienen una jerarquia mas alta que right y bottom*/
  }
  ~~~

  ademas debemos tomar en cuenta que estos números toman en cuenta la posición original, **no** se basa en el tamaño de la pagina.
  
  ---
  
+ `absolute` este es similar al `relative` con una diferencia especial, este al mover un objeto, también se mueve esa "caja vacía" que se generaba con el html (**ptra cosa importante es que si no definimos un valor para el `height` y `width` estos se ajustaran al tamaño del contenido aun sea una caja en bloque o en linea**) cabe recordar que este **usa los mismos parámetros de "top, left, right y bottom"**

  ademas debo resaltar que a diferencia de el `relative`, en este la posición original es en torno al objeto "padre".

  ---

+ `fixed` este es exactamente lo mismo que un `absolute` (excepto que este mantiene su posición, incluso cuando hacemos scroll como si fuera un anuncio que al bajar en la pagina este nos sigue sin importar cuanto scroll hagamos) **funciona con los mismos parámetros de "top, left, right y bottom"** .

  ---

+ `sticky` este funciona como una unión rara entre `sticky` y `relative`, este nos permite hacer scroll y llevarnos la caja con nosotros igual que el sticky, pero la diferencia es que tiene un tipo de "condición" que debe cumplirse, por ejemplo:

  ~~~css
  p{
      position: sticky
      top: 0;
  }
  ~~~

  lo que ocurre es que si la caja la posicionamos en algún punto aleatorio, solo cuando el top llegue a 0 este seguirá el scroll, de no ser así este se quedara en su lugar.

---

#### Z-index

La propiedad `z-index` es muy importante y mas ahora que estamos trabajando con la posición de las cajas, lo que nos permite es organizar el orden de estas en el eje z, así como si fueran las `layers` de cualquier programa de diseño/ilustración/edición fotográfica.

por defecto este z-index tiene valor 0 y si por ejemplo tenemos un objeto con indice 0 y un objeto con indice 1, el segundo objeto se mostrara sobre el primero

*ejemplo de uso*

~~~css
p{
    position:relative;
    top: 60;
    left: 40;
    z-index: 1;
}
~~~


