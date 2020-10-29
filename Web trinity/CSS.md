 # CSS

Css (o **hojas de estilo en cascada**) es un "lenguaje" designado al diseño de nuestra pagina web, dado que con este añadimos el "estilo" de la pagina en si.

Esta junto a html (ademas de javascript) entran en lo que me gustaría llamar "**el mundo web**" en su forma mas básica.

Debemos tomar en cuenta que el css se hace en conjunto usualmente con el html, por lo que es 100% imposible hacer el css sin html, pues como un ejemplo seria imposible mover una caja si esta no existe con anterioridad.

---

## Indice



---

# CSS (Básico)

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

## Conocimiento basico de css

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

**OJO, si queremos usar numeros decimales como 0.1; 0.50; 0.23; etc... podemos simplemente usar el numero escribiendo por ejemplo: .1; .50; .23; etc...**

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

### Colores

A la hora de trabajar nuestros diseños como es obvio **el color sera importante para nosotros** pero al ser algo general debemos saber como trabajar con estos.

El color de por si tiene muchas formas de ser ingresado y estas son:

+ **nombre de color** (red, blue, yellow, etc...) //no tan recomendado//

+ **Hexadecimal** (#B38176, #48DFCD, #140E5F, etc...)
+ **RGB** ([0, 230, 45], [255, 120, 21], [41, 87, 101], etc...)
+  **RGBA** ([0, 230, 45, 0,1], [255, 120, 21, 0.15], [41, 87, 101, 0.42], etc...)
+ **HSl** ([180, 50%, 50%], [44, 15%, 80%], [15, 50%, 41%], etc...) //poco usado//
+ **HSLA** ([180, 50%, 50%, 0.8], [44, 15%, 80%, 0.1], [15, 50%, 41%, 0.15], etc...) //poco usado//

Y esto lo podemos aplicar a cualquier propiedad que tenga algo que ver con el color, como:

+ `color:` Cambia el color de los elementos que esten en **primer plano** y no cambia el color de la caja.
+ `background-color:` Cambia el color de fondo del elemento (de la caja).
+ `font-color:` Cambia solo el color de la fuente de un texto.
+ etc...

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

Otra cosa que podríamos hacer seria algo mas fácil y se basa en **añadir en el archivo principal, la edición básica para nuestro css** por ejemplo:

~~~css
body{
    margin: 0;
    padding: 0;
    max-width: 100%;
    /*estas serian las opciones principales para el body pero deberiamos añadir mas*/
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

Algo a tomar en cuenta es que a la hora de trabajar con los elementos en bloque en varias ocasiones vamos a querer hace **cajas o figuras vaciar sin necesidad de tener algún elemento en su interior**.

Esto principalmente para hacer formas geométricas que podamos usar en nuestro diseño para las partes que por ejemplo **no queramos un texto en su interior** y esa misma forma la queramos usar como "componente visual" solo para el diseño de la misma.

Esto lo haremos en algunas partes de la documentación desde aquí en adelante y antes de ello debo dejar algo en claro.

*Estas "cajas vacías" las hacemos con divs en html* (con en este caso una clase que usaremos para llamarlo desde css)

~~~html
<div class="div-1">
    <!--aqui añadimos datos si lo necesitamos, en este caso no-->
</div>
~~~

Al llamarlo en css y editarlo no ocurrirá nada si no definimos antes **el tamaño de la caja**

~~~css
.div-1{
    width: 50px
    height: 50px
}
~~~

Luego podemos añadirle nuestro diseño, dado que el div por algún motivo, no se mostrara en pantalla **hasta tener un elemento o un tamaño seleccionado**.

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

Otras opciones del parámetro `display` son:

+ `inline-block` transforma un elemento de cualquier tipo a un elemento en linea que ademas nos permite editar las dimensiones de la caja con las propiedades `width` y `height`.

+ `flex` Les permite usar un tipo "especial" de maquetádo, similar al bloque pero que nos permite acceder a mas características [mas informacion aqui](#FlexBox).

+ `grid`

  ---



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
  
+ `absolute` este es similar al `relative` con una diferencia especial, este al mover un objeto, también se mueve esa "caja vacía" que se generaba con el html (otra cosa importante es que si no definimos un valor para el `height` y `width` estos se ajustaran al tamaño del contenido aun sea una caja en bloque o en linea) **cabe recordar que este usa los mismos parámetros de "top, left, right y bottom"**

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

---

## Propiedades útiles
Como ya sabemos hay un numero gigantesco de propiedades que nos pueden ser útiles en nuestro css, y por eso aquí veremos muchas de ellas.
### Overflow

Digamos que tienes una caja en la que quieres insertar texto, pero la cantidad de texto es mayor al tamaño de su contenedor, por lo que el texto se **"desborda"** esto obvio no es algo bonito para nuestra pagina y una forma de arreglar esto seria añadiendo un scroll **dentro del contenedor donde esta nuestro texto**.

Esto mismo lo logramos con la propiedad `overflow:` que es un tipo de "propiedad **shorter**" por que al igual que otras como la propiedad `padding` este se compone de 2 propiedades, que son:

+ `overflow-x:`  crea el scroll de desborde en el eje x.
+ `overflow-y:` crea el scroll de desborde en el eje y.

 este tiene por defecto una opción, la cual es "visible" y permite ver este texto fuera de su caja pero ademas de esta existen otras como:

+ `auto` este se encarga de ver si nuestro "en este caso texto" desborda su contenedor y de ser así le da una barra de scroll para poder moverte por este.

  ---

+ `scroll` este **coloca la barra de scroll de forma obligada, sea necesario o no**

  ---

+ `hidden` este se encarga de **esconder** el "contenido" que sale de su contenedor como si este desapareciera al no estar en contacto con su contenedor.

  ---

Cabe aclarar que estas opciones también funcionan con las propiedades `overflow-x:` y `overflow-y:` si es que queremos especificar con que eje queremos trabajar.

*un ejemplo de uso de estos seria:*

~~~css
p{
    overflow: scroll; /*nos da la barra de scroll en todo momento*/
}

p{
    overflow-x: hidden; /*escuende el elemento que se "desborda" en solo el eje x*/
}
~~~

---

### Object Fit

A la hora de trabajar con cosas como imágenes o vídeos usualmente nos surgirá un problema **al cambiar su tamaño, en ocasiones estos se deformaran** haciendo que obvio la imagen pierda resolución ademas de dejar nuestra pagina en un estado digamos que "**poco estético**"

Este lo usamos llamando alguna imagen (o vídeo) que tengamos dentro de un contenedor dado que esta propiedad itera en la imagen tomando en cuenta el tamaño de su contenedor.

Principalmente tenemos los siguientes valores:

+ `fill` **El valor por defecto (deforma la foto en el momento que cambiamos el tamaño del contenedor).**

+ `contain` **Al cambiar el tamaño de la imagen esta se agranda o se achica, pero no se deforma.**

  *ejemplo de uso*

  ~~~css
  .clase-imagen{
      object-fit:contain;
  }
  ~~~

  

+ `cover` **la imagen se agranda para rellenar el contenedor pero "cortada", lo faltante estará "fuera de la imagen".**

  *ejemplo de uso:*

  ~~~css
  .clase-imagen{
      object-fit:cover;
  }
  ~~~

+ `none` **se muestra solo una pequeña parte de la imagen según lo que declaremos.**

  *ejemplo de uso:*

  ~~~css
  .clase-imagen{
      object-fit:none;
  }
  ~~~

+ `scale-down` **hace una seleccion entre `none` y `contain` seleccionando el elemento que tenga el menor tamaño**

  *ejemplo de uso:*

  ~~~css
  .clase-imagen{
      object-fit:scale-down;
  }
  ~~~

---

### Object Position

A la hora de trabajar con propiedades como `object-fit:cover` veremos que sera de ayuda mover "internamente la imagen" y eso lo logramos con esta propiedad.

Con `object-position` seleccionamos a que lado se "apegue" la imagen utilizada en torno a su contenedor, esto se selecciona usando los valores:

+ `left` apega la imagen a su izquierda

  *ejemplo de uso:*

  ~~~css
  .clase-imagen{
      object-position:left;
  }
  ~~~

+ `right` apega la imagen a su derecha

  *ejemplo de uso:*

  ~~~css
  .clase-imagen{
      object-position:right;
  }
  ~~~

+ `top` apega la imagen a la parte superior

  *ejemplo de uso:*

  ~~~css
  .clase-imagen{
      object-position:top;
  }
  ~~~
  
+ `bottom` apega la imagen a la parte inferior

    *ejemplo de uso:*

    ~~~css
    .clase-imagen{
        object-position:bottom;
    }
    ~~~

+ `unidades numericas` también podemos usar números u otras unidades numéricas

    *ejemplo de uso:*

    ~~~css
    .clase-imagen{
        object-position:1em; /*puede ser negativo, positivo, px,em,mm,etc...*/
    }
    ~~~

---

### Cursor

A la hora de trabajar con el "campo visual de nuestra pagina" una cosa que nos puede llamar la atención sera el cambiar el cursor al generarse una acción.

Esto lo logramos con la propiedad `cursor` que por defecto se activa al pasar el cursor sobre el objeto en el que añadamos esta.

*su sintaxis es:*

~~~css
.clase-caja{
    cursor:nombre-del-cursor;
}
~~~

Hay demasiados tipos de cursor como para ponerlos en una lista, por lo que la mejor opcion es ver sus nombres en [esta pagina](https://www.w3schools.com/cssref/tryit.asp?filename=trycss_cursor).

---

# CSS (Intermedio)

## Float (y clear)

Este es otro parámetro bastante útil en muchos casos, este nos permite seleccionar a que lado del contenedor se va a apegar un objeto, así saliendo del flujo normal del html.

Esto significa que si por ejemplo movemos un objeto de su punto normal y lo volvemos a mover al punto original luego, este no afectara los demás elementos y se posicionara detrás de los elementos que si estén en este flujo html.

Por defecto esta propiedad tendrá asignado el parámetro `none` que mantendrá el objeto en su flujo normal de html, pero ademas existen los parámetros:

+ `left` apega el objeto al lado izquierdo de su contenedor.
+ `right` apega el objeto al lado derecho de su contenedor.
+ `inherit` le entrega el mismo valor que una etiqueta "padre".

*Un ejemplo de este seria:*

~~~css
img{
    float: right; /*esto apegara la imagen al lado derecho de su contenedor*/
}
~~~

---

#### Clear

Clear es una propiedad muy bien ligada a el float, al usar un dato float o de cualquier otro tipo podemos hacer algo llamado **limpieza** que se basa simplemente en seleccionar que datos pueden estar o no a los lados de un objeto.

Sus parámetros son:

+ `left` hace esa "limpieza" a los objetos que estén al lado izquierdo de nuestro objeto.
+ `right` hace esa misma limpieza a los objetos que estén al lado derecho de nuestro objeto.
+ `both` que hace la limpieza a los objetos que estén tanto al lado izquierdo como al derecho de nuestro objeto.
+ `none` es el valor por defecto de esta propiedad.

por ejemplo si tenemos un objeto  con un `float: left;` y le añadimos como extra un `clear: right;`, dejara un espacio en blanco al lado derecho de nuestro objeto en si.

*ejemplo de uso:*

~~~css
.elemento{
    clear:left;
}
~~~

---



----

## Pseudo-Elementos

`inline-flex` Los pseudo elementos son "partes" de los elementos que usamos y que podemos editar de por si, por ejemplo, la primera linea de un texto.

Los pseudo-elementos requieren de la siguiente sintaxis:

~~~css
.elemento-1-texto::pseudo-elemento{
    /*todo lo que ingresemos aqui, solo editara al pseudo-elemento que seleccionemos*/
}
~~~

Y los pseudo-elementos que nos importan son los siguientes:

+ `::first-line` nos permite iterar en la primera linea de un texto (esta linea puede verse editada por el funcionamiento responsive de nuestra pagina) **este funciona en todos los tipos de elemento, excepto los elementos en linea**

  *un ejemplo de uso seria:*

  ~~~css
  .texto1::first-line{
      color: red;
  }
  ~~~

  suponiendo que tenemos un texto multi-linea con un `id="texto1"`, esto hara que la primera linea de ese texto se muestre en color rojo
  
  ---
  
+ `::first-letter` nos permite iterar en la primera palabra del texto que usemos (este no se adaptara al diseño responsive de nuestra pagina, sino a el texto que usemos) y al igual que el `::first-line` **funciona en todo tipo de elemento excepto los elementos en linea**

  *un ejemplo de uso seria:*

  ~~~css
  .texto1::first-letter{
      color: blue;
      font-size: 4em;
  }
  ~~~

  En este caso (suponiendo que tienes el mismo texto que mencionamos en el `::first-line`) determinara que la primera letra tendrá **color azul y un tamaño de 4 em**.

  ---

+ `::placeholder` nos permite iterar con el "texto" que se muestre dentro de un input, refiriéndome con esto a por ejemplo ese típico texto de *inserte su contraseña*.

  *un ejemplo de uso seria:*

  ~~~css
  .input::placeholder{
      color: yellow;
      font-size: 12px;
  }
  ~~~

  esto hará que ese texto por defecto aparezca en color amarillo y con un tamaño de fuente de 12px.

  ---

+ `::selection` haz notado que al mantener clic izquierdo y mover el mouse siempre se ve un cuadro azul con texto en blanco?, pues esto nos permite cambiar eso.

  *un ejemplo de uso seria:*

  ~~~css
  .input::selection{
      color: yellow;
  }
  ~~~

  esto hará que en el input mencionado, si usamos esa "selección" (clic izquierdo y mover mouse) en el input, el color del texto seleccionado sera de color amarillo

  ---

+ `::before` (antes) nos permite hacer una "edición" antes de un elemento **creando un elemento hijo** el cual es un "elemento en linea"

  *por ejemplo:*

  ~~~html
  <p id="nombre">Rodrigo</p> <!--supongamos que tenemos esto en html-->
  <!--esto deberia mostrar solo el texto "Rodrigo" en nuestra pagina-->
  ~~~

  para añadir un texto antes deberíamos hacer:

  ~~~css
  .nombre::before{
      content: "Hola, mi nombre es ";
  }
  ~~~

  Esto nos mostrara en la pagina el texto `Hola, mi nombre es Rodrigo` pues añadimos un "pseudo-elemento" **antes** de el elemento que queremos iterar, esto se puede aplicar a mas etiquetas, no solo texto.

  **cabe recalcar que este necesita si o si el parámetro `content` o sino no funciona**

  ---

+ `::after` (después) nos permite generar un "pseudo-elemento" hijo (en linea) **después** de el elemento que ya tenemos y en el que queremos iterar.

  *por ejemplo:*

  ~~~css
  /*supongamos que estamos usando el mismo html de el ejemplo anterior*/
  .nombre::after{
      content: " ese es mi nombre!!!";
  }
  ~~~

  Esto nos mostrara el texto `Rodrigo ese es mi nombre!!!` generando un `pseudo-elemento` **después** del elemento a iterar ademas de que este también se puede aplicar a otras etiquetas, no solo a las de texto.

  **este al igual que el before requiere si o si del parámetro `content`.**

---

## Pseudo-Clases

Estas podríamos resumirlos como "accionadores" que cuando se cumpla una "condición" se generara un "cambio" en el estilo de lo que active este "accionador" o mejor dicho **son estados de elementos que cambian según lo que haga el usuario**.

**Recordar que aun que hablamos de "condiciones" este no sirve como una función o condicional de cualquier lenguaje de programación**.

Su sintaxis es similar a la de los **pseudo-elementos** solo que con un cambio principal **usan `:` en lugar de `::`** y su uso seria de la siguiente forma:

~~~css
.elemento-seleccionado:pseudo-clase{
    /*aqui va la edicion activada con esa pseudo-clase*/
}
~~~

*alguna de estas son:*

### Pseudo-Clases (enlaces)

+ `:hover` Nos permite generar cambios cuando **el mouse pasa sobre el elemento especifico**

+ `:active` Nos permite generar cambios cuando **se presiona un enlace u elemento**

+ `:link` Nos permite generar cambios **a un enlace sin visitar** (cuando el enlace se ve en azul normal)

+ `:visited` Nos permite generar cambios **a un enlace ya visitado** (cuando el enlace se ve en azul gastado)

  ---

### Pseudo-clases (generales)

+ `:first-child` si tenemos una clase padre con 3 elementos hijo, este nos permite **editar el primer elemento hijo** ademas de permitirnos seleccionar que tipo de elemento hijo queremos editar.

  *ejemplo de uso:*

  ~~~css
  .clase-padre :first-child{
      /*itera en el "primer hijo de la clase"*/
  }
  
  .clase-padre p:first-child{
      /*itera en el "primer hijo de la clase" que sea un parrafo*/
  }
  ~~~

+ `:last-child` si tenemos una clase padre con 3 elementos hijo, este nos permite **editar el ultimo elemento hijo** ademas de permitirnos seleccionar que tipo de elemento hijo queremos editar.

  *ejemplo de uso:*

  ~~~css
  .clase-padre :last-child{
      /*itera en el "ultimo hijo de la clase"*/
  }
  
  .clase-padre p:last-child{
      /*itera en el "ultimo hijo de la clase" que sea un parrafo*/
  }
  ~~~

  ---

+ `:first-of-type` nos permite **seleccionar el primero elemento entre sus hermanos** y iterar en el.

  *ejemplo de uso:*

  ~~~css
  p:first-of-type{
      /*itera en el "primer elemento de tipo parrafo" que encuentre entre sus hermanos*/
  }
  
  .clase-padre p:first-of-type{
      /*itera en el "primer elemento de tipo parrafo" que este dentro de la "clase-padre"*/
  }
  ~~~

+ `:last-of-type` nos permite **seleccionar el ultimo elemento entre sus hermanos** y iterar en el.

  *ejemplo de uso:*

  ~~~css
  p:last-of-type{
      /*itera en el "ultimo elemento de tipo parrafo" que encuentre entre sus hermanos*/
  }
  
  .clase-padre p:last-of-type{
      /*itera en el "ultimo elemento de tipo parrafo" que este dentro de la "clase-padre"*/
  }
  ~~~
+ `:only-child` nos permite seleccionar **el único "hijo" que tiene una clase en la que iteramos** y este mismo no tiene efecto **si la clase tiene mas de 1 "hijo"**

  *ejemplo de uso:*

  ~~~css
  .clase-padre:only-child{
      /*si tenemos un div con una subclase que es un <p> iteraremos en este parrafo*/
      /*si hay mas subclases esta funcion no sirve*/
  }
  ~~~

+ `:only-of-type`nos permite seleccionar **el único "hijo" de un tipo especial** y por ejemplo, si queremos iterar en un párrafo pero hay mas de otros tipos este funciona, aun que deja de hacerlo si hay 2 párrafos.

  *ejemplo de uso*

  ~~~css
  .clase-padre p:only-of-type{
      /*solo trabajara en la unica subclase parrafo (solo si hay 1)*/
  }
  ~~~
  ---

### Pseudo-clases (listas)

+ `:nth-child()` Si tenemos una lista, este nos permite seleccionar **en que elemento de la lista iterar**.

  *ejemplo de uso:*

  ~~~css
  .clase-lista:nth-child(3){
      /*en este caso al tener un 3 nos permite editar solo el tercer elemento de la lista*/
  }
  
  .clase-lista:nth-child(odd){
      /*en este caso al tener un odd nos permite editar los elementos con posicion inpar*/
  }
  
  .clase-lista:nth-child(even){
      /*en este caso al tener un even nos permite editar los elementos con posicion par*/
  }
  
  .clase-lista:nth-child(4n){
      /*en este caso al tener un 4n nos permite editar un elemento cada 4 de estos*/
      /*osea que en este caso los 4to, 8vo, 12vo... elementos se editaran*/
  }
  ~~~

+ `nth-last-child` nos permite iterar con **solo el ultimo elemento en nuestra  lista**.

  *ejemplo de uso:*

  ~~~css
  .clase-lista:nth-last-child{
      /*en este caso iteramos en el ultimo elemento de la lista*/
  }
  
  .clase-lista:nth-last-child(3){
      /*en este caso iteramos en el elemento numero 3 de abajo hacia arriba*/
  }
  ~~~

+ `:nth-of-type()` nos permite seleccionar un elemento en una lista **dependiendo del tipo de elemento y con el indice que ingresemos en la pseudo-clase**

  *ejemplo de uso:*
  
  ~~~css
  .clase-lista p:nth-of-type(3){
      /*en este caso se iterara en el tercer parrafo que este dentro de la "clase-lista"*/
      /*la clase no necesariamente debe ser lista, pero debemos añadir indice si o si*/
  }
  ~~~
  
+ `:nth-last-of-type` nos permite seleccionar un elemento en la lista **dependiendo del tipo de elemento, el indice usado y este se cuenta de forma inversa (de abajo hacia arriba)**

  *ejemplo de uso:*

  ~~~css
  .clase-lista p:nth-last-of-type(3){
      /*en este caso se iterara en el tercer parrafo en la clase desde abajo hacia arriba*/
  }
  ~~~
  

---

## Responsive Web Design

Responsive web design (o diseño web "responsivo") es una forma o mejor dicho **un conjunto de patrones de diseño** que seguirlos nos permite desarrollar nuestra pagina web de una forma que su diseño sea tanto compatible para dispositivos grandes (como la pantalla de un computador) como pequeños (como la pantalla de un smartphone o la pantalla de un computador "comprimido").

El termino de "diseño responsivo" se acuño el año 2010 por Ethan Marcotte y su uso lo describía combinando tres "técnicas", las cuales son:

1. **Columnas fluidas** usando **algunos anchos en porcentaje o medidas relativas ** (vh, vw, %, em, etc...) por lo menos solo en los elementos que **si serán responsivos** esto no es necesario si queremos que un elemento cambie su tamaño.
2. **Imágenes flexibles** seleccionando el `max-width:100%` así pudiendo mantener un tamaño general para  la imagen tanto en pantallas de computador como en pantallas de dispositivos mobiles.
3. **Media querys** el uso de "condicionales" que lean la forma de la pantalla y según eso muestren un tipo de pagina u otra.
4. **Javascript** este es un extra pero realmente también se volvió algo indispensable para las paginas responsive, mas tomando en cuenta que para las paginas "complejas" este es simplemente nuestro **único aliado**.

**Deben recordar que el responsive design no es un "tema de css en si" sino un tipo de "reglas" que deberíamos seguir a la hora que queramos hacer una pagina que funcione tanto en dispositivos pequeños como grandes y de hecho podemos saltarnos estas reglas totalmente**

---

#### Propiedades recomendadas

a la hora de trabajar con nuestros diseños "responsive" existirán muchas cosas que querremos editar dependiendo del tamaño de la pantalla como es obvio.

esto es algo que lograremos con el uso de algunas propiedades muy útiles como:

+ `min-width` Nos permite determinar el **ancho mínimo** de un elemento
+ `min-height` Nos permite determinar el **alto mínimo** de un elemento
+ `max-width` Nos permite determinar el **ancho máximo** de un elemento
+ `max-height` Nos permite determinar el **alto máximo** de un elemento
+ 

---

## FlexBox

Flexbox (o cajas flexibles) es otro "método de maquetación" ocupado para lo mismo que usaríamos el `float` anteriormente visto.

Como ya deberían saber, este es un "método" que podemos usar para "organizar" los componentes de nuestra pagina específicamente, editando nuestros elementos de forma que generemos un cambio en torno a **la posición** de nuestros elementos.

Este funciona similar a los elementos con `display: block;` o simplemente elementos en bloque, solo que a diferencia de ellos, en este caso el tamaño se adapta aproximadamente al de su contenido pero intentando "mantener" una altura especifica aun que esto es variable y se puede cambiar.

Antes de iniciar de lleno con lo que es FlexBox debemos saber unos conceptos clave:

+ El flexbox funciona como un tipo de "plano cartesiano" (supongamos que de -1 a 1 en todos sus ejes). 

+ El eje X se llama `Main Axis` y se conforma por:

  + `main-start` (vendría siendo el -1 en el eje X del plano cartesiano)
  + `main-end` (vendría siendo el 1 en el eje X del plano cartesiano)

+ El eje Y se llama `Cross Axis` y se conforma por:

  + `cross-start` (vendría siendo el 1 en el eje y del plano cartesiano)
  + `cross-end` (vendría siendo el -1 en el eje y del plano cartesiano)

+ En flexbox hay 2 elemntos con "nombres especiales" estos son los **`flex-container`** que son los contenedores que usan `display: flex;` y los **`flex-item`** que son **todo elemento que sea hijo directo de un `Flex-container`** 

  *ejemplo:*

  ~~~html
  <div style="display: flex;"> <!--este div es un flex-container-->
      
      <h1>header de nivel 1</h1> <!--este es un Flex Item-->
      <p>parrafo simple</p> <!--este es un Flex Item-->
      
      <div> <!--este es un Flex Item-->
          <b>este es una "negrita"</b> <!--este NO es un Flex Item-->
      </div> <!--este es el fin del div "Flex Item"-->
    
  </div> <!--este es el fin de nuestro flex-container-->
  ~~~

  En este caso el `<b></b>` no es un Flex Item pues no es hijo directo de el contenedor `<div></div>` que posee el `display: flex`

  **debemos recordar que estos nombres de `flex-container` y `flex-item` son realmente identificadores que deberíamos usar al añadir un `id` o una `class` en nuestro elemento html**

---

### Propiedades de contenedor

Flex (para "acortar" su nombre) como ya deberian saber es un valor de la propiedad `display:` y al seleccionarlo con `display: flex` podremos tener acceso a múltiples propiedades que nos permiten iterar sobre el funcionamiento de este estos contenedores.

cabe recordar que los "contenedores flexibles" o `flex container` son **todos los contenedores que tengan la propiedad `display:flex;` y tengan como clase o id `flex-content` (aun que esto ultimo no es obligatorio)**.

---

#### Flex-flow

Flex-flow es una propiedad shorthand (abreviada) que en realidad lo que hace es unir 2 propiedades en una sola, estas son `flex-direction` y `flex-wrap`.

*su sintaxis es asi:*

~~~css
.flex-container{
    flex-flow: valor-flex-direction valor-flex-wrap;
    /*ejemplo*/
    flex-flow: row wrap;
}
~~~

Sus funcionalidades son:

+ `flex-direction:` Nos permite seleccionar la orientación de los elementos que tengamos dentro del `flex-container` donde usaremos esta propiedad.

  *ejemplo de sintaxis:*

  ~~~css
  .flex-container{
      flex-direction: row; /*el row lo podemos cambiar por otros valores*/
  }
  ~~~

  *y sus valores son:*

  + `:row` Posiciona los elementos en el `Main Axis` o una fila (de izquierda a derecha).
  + `:row-reverse` Posiciona los elementos en el `Main Axis` o una fila pero inversa (de derecha a izquierda).
  + `:column` Posiciona los elementos en el `Cross Axis` o en una columna (de arriba hacia abajo).
  + `:column-reverse` Posiciona los elementos en el `Cross Axis` o en una columna pero inversa (de arriba hacia abajo).

  ---

+ `flex-wrap: ` Nos permite "reorganizar" los elementos de un `flex-container` dependiendo del tamaño de la pantalla.

  *ejemplo de sintaxis:*

  ~~~css
  .flex-container{
      flex-wrap: wrap; /*el wrap podemos cambiarlo por otros valores*/
  }
  ~~~

  *y sus valores son:*

  + `:no-wrap` Es el valor por defecto **no genera cambios**.

+ `:wrap` **No cambia el tamaño de sus elementos** y por defecto si la pantalla se hace mas pequeña, estos elementos los envía hacia **abajo de uno en uno** (los elementos del `Main End` o de la derecha bajan primero).

  + `:wrap-reverse` **No cambia el tamaño de sus elementos** y por defecto si la pantalla se hace mas pequeña, estos elementos los envía hacia **arriba de uno en uno** (los elementos del `Main End` o de la derecha suben primero).

**Ambas podemos usarlas por si solas, en caso que queramos usar un valor en solo uno de ellos, en lugar de de editar algo en ambas propiedades**.

---

#### Posicionamiento general

Estas propiedades nos permiten iterar en la posición de los elementos en torno a su "contenedor" y en base a la posición en tanto el `Main Axis` como en el `Cross Axis` ademas de hacer estas iteraciones tomando en cuenta aveces a los otros elementos que hay en su contenedor.

+ `justify-content:` Nos permite posicionar el o los elementos en torno al `Main Axis` (eje x).

  *su sintaxis es:*

  ~~~css
  .flex-container{
      justify-content: center; /*tiene mas valores, "center" es solo un ejemplo*/
  }
  ~~~

  *Sus valores son:*

  + `:center` Centra los elementos dentro de el contenedor en el `Main Axis`.
  + `:flex-start` Posiciona los elementos dentro de el contenedor en el `Main Start` (a la izquierda).
  + `:flex-end` Posiciona los elementos dentro de el contenedor en el `Main End` (a la derecha).
  + `:space-between` Posiciona los elementos en el `Main Axis` de forma que todos tienen el mismo espacio entre ellos (a los costados del contenedor estos se apegan al mismo contenedor).
  + `:space-around` Posiciona los elementos en el `Main Axis` de forma que todos tienen el mismo espacio entre ellos (a los costados del contenedor estos se separan del mismo por **la mitad de la distancia entre elementos**)

  ---

+ `align-item:` Su funcionamiento es similar al del `Justify Content` a excepción que este itera en el `Cross Axis` (eje y) es recomendado usarlo **solo cuando los elementos usados usan una linea pues el `flex-wrap` lo hace ver raro** (para dos lineas usamos `align-content`).

  *su sintaxis es:*

  ~~~css
  .flex-container{
      align-item: center; /*tiene mas valores, "center" es solo un ejemplo*/
  }
  ~~~

  *sus valores son:*

  + `:center` Centra los elementos dentro de el contenedor en el `Cross Axis`.
  + `:flex-start` Posiciona los elementos dentro de el contenedor en el `Cross Start` (arriba).
  + `:flex-end` Posiciona los elementos dentro de el contenedor en el `Cross End` (abajo).
  + `:space-between` Posiciona los elementos en el `Cross Axis` de forma que todos tienen el mismo espacio entre ellos (arriba  y abajo del contenedor estos elementos flexibles son ajustados de modo que sus bases queden alineadas. El elemento con la distancia mayor entre su límite transversal inicial y su base es combinado con el borde transversal de la línea. apegan al mismo contenedor).
  + `:space-around` Posiciona los elementos en el `Cross Axis` de forma que todos tienen el mismo espacio entre ellos (arriba y abajo del contenedor estos se separan del mismo por **la mitad de la distancia entre elementos**)
  + `:stretch` es el valor por defecto y hace que los elementos se estiren **para rellenar el contenedor en el eje Y**.
  + `:baseline` Alinea la base de **todos los elementos flexibles** (en ocasiones se usa para hacer footers o posicionar elementos en la parte inferior de la pagina)

  ---

+ `align-content:` Su función es exactamente la misma que el `align-item` solo que este esta pensado para cuando queremos 2 lineas de elementos dentro del contenedor a usar, los valores son los mismos que del `align-content` excepto que este funciona bien interactuando con el `flex-wrap`.

    *su sintaxis es:*
    
    ~~~css
    .flex-container{
        align-content: center; /*tiene mas valores, "center" es solo un ejemplo*/
}
  ~~~

  *sus valores son:*
  
  + `:center` Centra los elementos dentro de el contenedor en el `Cross Axis`.
  + `:flex-start` Posiciona los elementos dentro de el contenedor en el `Cross Start` (arriba).
  + `:flex-end` Posiciona los elementos dentro de el contenedor en el `Cross End` (abajo).
  + `:space-between` Posiciona los elementos en el `Cross Axis` de forma que todos tienen el mismo espacio entre ellos (arriba  y abajo del contenedor estos elementos flexibles son ajustados de modo que sus bases queden alineadas. El elemento con la distancia mayor entre su límite transversal inicial y su base es combinado con el borde transversal de la línea. apegan al mismo contenedor).
  + `:space-around` Posiciona los elementos en el `Cross Axis` de forma que todos tienen el mismo espacio entre ellos (arriba y abajo del contenedor estos se separan del mismo por **la mitad de la distancia entre elementos**)
+ `:stretch` es el valor por defecto y hace que los elementos se estiren **para rellenar el contenedor en el eje Y**.
  
  + `:baseline` Alinea la base de **todos los elementos flexibles** (en ocasiones se usa para hacer footers o posicionar elementos en la parte inferior de la pagina)
  
  (si queremos hacer algo en un footer por ejemplo debemos usar `align-content:baseline;` y con eso añadir un `flex-wrap: wrap-reverse;` )

---

### Propiedades de items

Tanto como existen las propiedades de contenedores, existen las propiedades orientadas a los elementos dentro de estos contenedores.

Así podemos hacer estas ediciones de forma mas especifica a cada elemento y no a un grupo de estos como lo hacíamos anteriormente.

**Recordar que se considera flex item todos los "hijos" de un `flex-container` y tengan como clase o id el nombre `flex-item` (aun que esto ultimo no es obligatorio)**.

**cabe aclarar que aquí el `margin:` funciona distinto, pues este cambia la posición de los elementos por separado, en lugar de hacer cambios a el margen de el mismo** (`margin: auto;` lo centra en ambos ejes, `margin: auto 0;` "solo lo centra en el eje Y" ademas del `margin: 0 auto` que "lo centra en el eje X" esto solo ocurre cuando el margin **se aplica en un objeto flexible**.

---

#### Posicionamiento individual

+ `align-self:` Es similar a las propiedades `align-items` y `align-content` anteriormente mencionados, solo que este ajusta la posición (en el Cross Axis) de un elemento especifico.

  *su sintaxis es:*

  ~~~css
  .flex-item{
      align-self: center; /*tiene mas valores, "center" es solo un ejemplo*/
  }
  ~~~

  *sus valores son:*

  + `:center` Centra el elemento en el `Cross Axis`.
  + `:flex-start` Posiciona el elemento en el `Cross Start` (arriba).
  + `:flex-end` Posiciona el elemento en el `Cross End` (abajo).
  + `:auto` Ajusta el tamaño según el `align-items` del padre o al valor `stretch` si el elemento no tiene padre.
  + `:stretch` es el valor por defecto y hace que el elemento se estire **para rellenar su contenedor en el eje Y**.
  + `:baseline` Alinea la base de **todos los elementos flexibles** (en ocasiones se usa para hacer footers o posicionar elementos en la parte inferior de la pagina)

  (si queremos hacer algo en un footer por ejemplo debemos usar `align-content:baseline;` y con eso añadir un `flex-wrap: wrap-reverse;` )

---

#### Flex

La propiedad flex **al igual que flex flow es un shorthand** osea que es una propiedad compuesta por varias otras.

*Su sintaxis es:*

~~~css
.flex-item{
    flex: 0 2 50px; /*valor-flex-grow valor-flex-shrink valor-flex-basis*/
    
    /*tambien podemos hacer:*/
    flex: 2 2; /*valor-flex-grow valor-flex-shrink*/
    flex: 4 50px; /*valor-flex-grow valor-flex-basis*/
    flex: 3; /*valor-flex-grow*/
}
~~~

Y las propiedades que lo componen son las siguientes:

+ `flex-grow:` nos permite hacer que un elemento en particular **aumente o disminuya su ancho dependiendo del tamaño de la pagina/pantalla/contenedor** rellenando las partes del `Cross Axis` que no tengan elemento y sin ocupar las que si tengan uno.

  *su sintaxis es:*

  ~~~css
  .flex-item{
      flex-grow: 0;
  }
  ~~~

  A la hora de usarlo notaremos que este funciona con números (siendo 0 el valor por defecto que dice que el `flex-grow` no generara efecto alguno).

  Estos números generan un tipo de "columnas invisibles" y con ese numero definimos **cuantas "columnas" usara nuestro elemento** por ejemplo si tenemos tres elementos donde **solo uno tiene la propiedad `flex-grow:1;` este usara gran parte del Cross Axis** pero los demás mantendrán su tamaño.

  Pero por otro lado si mantenemos el mismo elemento con `flex-grow:1;` y le añadimos a otro elemento `flex-grow:2;` este ocupara mas espacio que el primer elemento, dado que el numero de "columnas ocupadas" es mayor.

  **Luego solo nos queda jugar con estos valores**.

  ---

+ `flex-shrink:` Este seria el "similar y opuesto" a `flex-grow` siendo el `flex-shrink:` la propiedad que se encarga de seleccionar **que tanto se va a "contraer" un elemento cuando el tamaño de su contenedor se vea disminuida** mientras que el `flex-grow` se encarga de calcular cuanto aumentara cuando su contenedor aumente de tamaño.

  *su sintaxis es:*

  ~~~css
  .flex-item{
      flex-shrink: 1 /*este es el valor por defecto*/
  }
  ~~~

  El valor de 1 se puede cambiar por números (preferibles entre el 0 y el 10 y ademas podemos usar 0.5) puesto que ya en por ejemplo 6 **el máximo de contracción hace que el elemento se vea muy pequeño**, y de hecho 10 en su tamaño mínimo en algunos casos no permite siquiera ver al mismo.

  ---

+ `flex-basis:` esta es similar al `width`, a excepción que el `flex-basis` tiene mayor jerarquía que el `width`, osea si un elemento flexible tiene la propiedad `width:200px;` y un `flex-basis: 30px;` **el elemento final tendrá 30 pixeles de ancho**.

  *su sintaxis es:*

  ~~~css
  .flex-item{
      flex-basis: 50px;
  }
  ~~~

  **Su valor puede ser cualquier tipo de unidad en css (px, em, %, etc...)**

---

#### Order

Esta propiedad nos permite **ordenar o seleccionar el orden** de los elementos dependiendo de su `flex-direction` usando números que tomaremos como un "indice" para posicionar el elemento, siendo 1 el elemento que este mas posicionado a la izquierda y los números mas altos irán organizándose en orden hacia la derecha de este elemento con `order: 1;`.

*su sintaxis es:*

~~~css
.flex-item{
    order: 0; /*valor inicial*/
    
    /*ejemplos:*/
    order: 1; /*el elemento se quedara apegado al lado izquierdo de su contenedor*/
    order: 2; /*este elemento se posicionara al lado derecho del elemento anterior*/
}
~~~

En los dos ejemplos que mostré (`order: 1;` y `order: 2;`) si nuestra `flex-direction` tubiéra el valor `row`  el primer ejemplo apegaría el elemento a la parte superior (o inferior si es `row-reverse`) mientras que los demás elementos se organizaran tomando en cuenta la posición de ese elemento.

---

## Grid

Grid es otro "sistema de maquetacion" que podemos usar para diseñar y organizar los componentes/elementos de nuestra pagina.

Este sistema se basa en el uso de una "grilla" (un tipo de cuadro separado por cuadriculas) donde cada cuadricula la usaremos para posicionar elementos 

Pero antes hay algunos conceptos básicos que debemos aprender, los cuales son:

+ **Grid Container** es el **contenedor externo de la grilla** donde se encuentran las "cuadriculas" donde añadiremos nuestros elementos (es similar al `flex container` solo que algo distinto) específicamente son **los contenedores que en la propiedad `display` tengan el valor `grid`**.

+ **Grid item** son los **elementos que introduciremos en nuestra grilla** o mejor dicho los que se posicionaran en la misma siendo estos **hijos directos de nuestro Grid Container**.

  *ejemplo:*

  ~~~html
  <div style="display:grid;"> <!--este es un grid container--> 
      <div> <!--este div es un grid item pues es hijo directo de un grid container-->
          <p>este parrafo no es grid item</p> <!--pues no es hijo del grid container-->
      </div>
  </div>
  ~~~

+ **Grid cells** son las "cuadriculas" que conforman la "grilla" aun que su nombre real seria "celdas" similar a como ocurre en excel son esos cuadros donde colocamos nuestra información solo que, en este caso son nuestros elementos.

+ **Grid tracks** son el conjunto de celdas que conforman ya sea una `column` (columna) o `row` (fila).

+ **Grid area** es **el conjunto de celdas que ocupamos** para posicionar nuestros elementos.

+ **Grid line** son las lineas que separan un grid track de otro y separan tanto las columnas como las filas y algo a tomar en cuenta es que esto empieza en  **la primera linea donde inicia el grid container**.

Otro tema a tomar en cuenta de grid es que cuando iniciamos un "contenedor grid" con `display: grid;` este grid se creara **con solo 1 columna** donde estarán nuestros elementos por defecto, similar a la disposición de elementos de html.

---

### Propiedades de contenedor

A la hora de trabajar con grid al igual que con flexbox debemos crear el "contenedor" que ya mencionamos, este se crea añadiendo la propiedad `display: grid;` y recomendablemente nombrar con `class="grid-container"` en html el elemento que usaremos como "contenedor".

Tras esto podemos empezar a trabajar con sus propiedades

---

#### Tamaño del grid

Antes de trabajar con un grid debemos seleccionar el numero de celdas que con el que trabajaremos, este seleccionándose con las propiedades:

+ `grid-template-columns:` Sirve para seleccionar el numero y tamaño de las columnas con las que trabajaremos.

  *su sintaxis es:*

  ~~~css
  .grid-container{
      grid-template-columns: 150px 150px 150px;
  }
  ~~~

  en este caso hacemos un grid **con 3 columnas con un tamaño de 150 pixeles en cada una** aun que estos números pueden cambiar dependiendo de el tamaño que queramos aplicarle.

  ---

+ `grid-template-rows:` Sirve para seleccionar el numero y tamaño de las filas con las que trabajaremos.

  *su sintaxis es:*

  ~~~css
  .grid-container{
      grid-template-rows: 150px 150px 150px;
  }
  ~~~

  en este caso hacemos un grid **con 3 filas con un tamaño de 150 pixeles en cada una** aun que estos números pueden cambiar dependiendo de el tamaño que queramos aplicarle.

**Antes de continuar, esta configuración nos hará un grid de `3x3` totalmente cuadrado y estático** en lo que su tamaño se refiere, pues loso tamaños que usamos son en efecto, estáticos.

Para cambiar esto debemos usar la unidad `fr` esta es similar a la propiedad `flex-grow` y nos permitirá que el tamaño de alguna cuadricula u otra cambie de tamaño dependiendo de lo que queremos hacer. 

**otra cosa a tomar en cuenta es que podemos usar la función `repeat()` a la hora de seleccionar el tamaño de el `grid-template`** esto funcionaria de la siguiente forma:

~~~css
.grid-container{
    /*en lugar de hacer 150px 150px 150px podemos hacer:*/
    grid-template-rows: repeat(3, 150px); /*(numero de veces que se repite, unidad usada)*/
}
~~~

---

#### Margen entre celdas

Si por alguna razón queremos hacer un tipo de "margen" entre las celdas con las que trabajaremos, nos sera muy necesaria la propiedad `grid-gap:`.

Esta propiedad es un "shorthand" y su sintaxis es:

~~~css
.grid-container{
    grid-gap: 10px 10px; /*valor-fila valor-columna*/
    /*estos valores pueden variar dependiendo de lo que quieras hacer*/
}
~~~

Y las propiedades que lo componen son:

+ `grid-row-gap:` nos permite seleccionar el espacio que hay entra cada celda **en una fila por la linea que esta en contacto con otra celda**.
+ `grid-column-gap:` nos permite seleccionar el espacio que hay entra cada celda **en una columna por la linea que esta en contacto con otra celda**.

---

#### Grid explicito y implícito

El grid se puede dividir en dos tipos distintos.

+ Grid Explicito (es la parte que funciona dependiendo de los cambios que nosotros apliquemos en el)
+ Grid Implícito (es la parte que funciona tomando en cuenta la forma en la que grid interactúa con su edición **sin tomar en cuenta las ediciones que hagamos**) seria algo así como un tipo de "comportamiento por defecto"

Estos generan una función que de por si a veces es rara, ya que por ejemplo al usar un `grid-template` de cualquier tipo y corremos un elemento con `grid-column` o `grid-row` un tema "implícito" seria que los objetos que quedan fuera de el tamaño original del grid quedan solo en una fila mas no en una columna.

Esta clase de problemas los podemos arreglar con las siguientes propiedades:

+ `grid-auto-columns:` nos permite seleccionar el tamaño de la columna nueva que se creara a la hora de que se corran elementos a esa columna de forma automatica.

  *ejemplo:*

  ~~~css
  .grid-container{
      grid-auto-columns: 120px;
      /*cuando se cree otra columna por correr elementos, esta tendra 120px*/
  }
  ~~~
  
+ `grid-auto-rows:` nos permite seleccionar el tamaño de la fila nueva que se creara a la hora de que se corran elementos a esa fila de forma automatica.

  *ejemplo:*

  ~~~css
  .grid-container{
      grid-auto-rows: 120px;
      /*cuando se cree otra fila por correr elementos, esta tendra 120px*/
  }
  ~~~
  
+ `grid-auto-flow:` nos permite seleccionar la forma en la que actuaran los "elementos" que sobren en nuestro container, yendo a una columna si le damos como valor `:column` o como fila si seleccionamos `:row`

---

### Propiedades de items

También puede que queramos aplicar alguna propiedad que específicamente altere el orden y función de un elemento en especifico, para ello tenemos otras propiedades que nos pueden ser muy útiles.

---

#### Asignación de espacio

A la hora de posicionar nuestros elementos en el grid, puede que queramos posicionar un especifico elemento **en mas de una celda**, esto es muy simple y muy útil.

Esto lo lograremos con las propiedades:

+ `grid-column:` Nos permite seleccionar el espacio que ocupara nuestro elemento en una columna especifica, por ejemplo este usara 1, 2, 3 o mas celdas de la columna.	

  *su sintaxis es:*

  ~~~css
  .grid-item{
      grid-column: 1/3; 
  	/*este item ocupara 2 celdas de una columna (desde la celda 1 a la celda 3)*/
      /*el mismo ira desde el inicio de el item 1 al inicio del item 3*/
  }
  ~~~

+ `grid-row:` Nos permite seleccionar el espacio que ocupara nuestro elemento en una fila especifica.

  *su sintaxis es:*

  ~~~css
  .grid-item{
      grid-row: 1/3
      /*este item ocupara 2 celdas de una fila (desde la celda 1 a la celda 3)*/
      /*el mismo ira desde el inicio de el item 1 al inicio del item 3*/
  }
  ~~~

Ambas van a "correr" los elementos que sobren así **creando un nuevo espacio para el objeto que sobre**, ademas podemos en lugar de hacer que un objeto se calcule entre el inicio de una celda y el inicio de otra, **que se ocupen las celdas enteras** así haciendo mas fácil el calculo de el espacio a asignar.

Para esto en lugar de usar (*inicio de columna o fila / inicio de columna o fila*) añadiremos la palabra `span` haciendo (*inicio de columna o fila* / **span** *columna o fila a usar*) asi en lugar de por ejemplo llenarse dos filas si hacemos `frid-row: 1/3;` podemos llenarlas haciendo `grid-row: 1/span2;`.

---

### Grid dinámico

A la hora de trabajar con grid es muy probable que queramos seguir conceptos del diseño responsive, hacer que nuestra pagina se ajuste al tamaño de la pantalla en la que lo veamos, por lo que debemos recurrir al **Grid dinámico**.

---

#### Repeat

Como ya mencionamos el repeat es una función que se encarga de **facilitar el uso de valores en el `grid-template`**.

Usando principalmente dos datos:

+ El numero de veces que se repetirá el valor de la unidad de "tamaño a usar".
+ La unidad que se repetirá para seleccionar el "tamaño" de cada celda.

Pero algunos de estos valores se pueden cambiar, especialmente este ultimo, "la unidad de tamaño".

+ `min-content` nos permite ver la parte mas "grande del contenido" dentro de una celda y ajusta el tamaño de la celda "a ese contenido", por ejemplo no se hará mas pequeño que la palabra mas larga.

+ `max-content` nos permite seleccionar el valor máximo del contenido y seleccionarlo como el tamaño de la celda por ejemplo en el caso de una frase, el largo de la misma.

+ `minmax()` esta función nos permite seleccionar el valor mínimo y máximo de la misma celda, así haciendo que su tamaño no varíe tanto si hacemos algún cambio en el tamaño de la pagina.

  *su sintaxis es así:*

  ~~~css
  .grid-container{
      grid-template-row: repeat(3, minmax(100px, 300px)); /*valor minimo, valor maximo*/
      /*esto hara que el tamaño de las celdas en la fila varien entre 100px y 300px*/
      /*dependiendo de el tamaño de la pantalla o de la pagina en si*/
      
  }
  ~~~

  De por si tanto el valor mínimo como el máximo se pueden definir tanto con varias unidades como con `max-content` y `min-content`

---

Pero también existen valores que se pueden añadir en "la cantidad de veces que se repite la funcion" específicamente valores como:

+ `auto-fill` añadirá mas celdas dependiendo de el tamaño de la pantalla y de si esto es necesario o no.
+ `auto-fit` hará un escalado de las celdas, así rellenando el "espacio libre" que queda al agrandar el tamaño de la pagina.

---

### Alineación y control de flujos

Si recuerdas bien a la hora de trabajar con flex habían 3 propiedades bastante necesarias para posicionar nuestros elementos en nuestra pagina.

cabe aclarar que estos elementos funcionan similar que en flex pero estas propiedades no se aplican al elemento en la pagina, sino al elemento en su contenedor (en este caso la celda del grid).

*las propiedades son:*

+ `justify-items:` nos permite seleccionar como posicionaremos los elementos según el contenedor en el que se encuentra de forma horizontal (este se aplica en el contenedor).

  *sus valores son:*

  + `:start` alinea los elementos en si a el "inicio de el eje horizontal" (en este caso a la izquierda).
  + `:end` alinea los elementos en si al "final de el eje horizontal" (en este caso a la derecha).
  + `:center` nos permite centrar los elementos en su contenedor/la celda en si.
  + `:stretch` rellena todo el ancho de la celda con los elementos (es el valor por defecto)

  ---

+ `align-items:` nos permite seleccionar como posicionaremos los elementos según el contenedor en el que se encuentra de forma vertical (este se aplica en el contenedor).

  *sus valores son:*

  - `:start` alinea los elementos en si a el "inicio de el eje vertical" (en este caso arriba).
  - `:end` alinea los elementos en si al "final de el eje vertical" (en este caso a la abajo).
  - `:center` nos permite centrar los elementos en su contenedor/la celda en si.
  - `:stretch` rellena todo el alto de la celda con los elementos (es el valor por defecto).
  
  ---
+ `align-self:` nos permite seleccionar como posicionaremos **un elemento en especifico** en el eje vertical (hay que recordar que este se le aplica directo al elemento a mover y no a su contenedor)
  + `:start` alinea el elemento en si a el "inicio de el eje vertical" (en este caso arriba).
+ `:end` alinea el elemento en si al "final de el eje vertical" (en este caso abajo).
  + `:center` nos permite centrar el elemento en su contenedor/la celda en si.
  + `:stretch` rellena todo el alto de la celda con el elemento (es el valor por defecto).
+ `justify-self:` nos permite seleccionar como posicionaremos **un elemento en especifico** en el eje horizontal (hay que recordar que este se le aplica directo al elemento a mover y no a su contenedor)
  + `:start` alinea el elemento en si a el "inicio de el eje horizontal" (en este caso a la izquierda).
  + `:end` alinea el elemento en si al "final de el eje horizontal" (en este caso a la derecha).
  + `:center` nos permite centrar el elemento en su contenedor/la celda en si.
  + `:stretch` rellena todo el ancho de la celda con el elemento (es el valor por defecto).

**estos dos últimos los podemos remplazar por un `place-self` que nos permite unificarlos en un shorthand (`place-self: valor-align-self valor-justify-self;`).**

---

#### Alineación de filas y columnas

+ `align-content:` nos permite especificar/seleccionar donde y como posicionaremos las filas, asi moviendo las mismas en conjunto por el eje y (este se aplica en el contenedor).
  + `:start` alinea las filas a "el inicio del eje vertical" (en este caso arriba).
  + `:end` alinea las filas "al final del eje vertical" (en este caso abajo).
  + `:center` alinea las filas "al centro de su contenedor".
  + `:stretch` (valor por defecto) ajusta las filas al tamaño total de su contenedor.
  + `:space-between` posiciona los elementos en el eje vertical de forma que todos tienen el mismo espacio entre ellos (haciendo mucho mas pequeño el espacio arriba y abajo).
  + `:space-around` posiciona los elementos en el eje vertical de forma que todos tienen el mismo espacio entre ellos (arriba y abajo contenedor se separan del mismo borde por **la mitad de la distancia entre elementos**).
  + `:space-evenly` posiciona los elementos en el eje vertical de forma que todos tienen el mismo espacio entre ellos (incluso arriba y abajo).
+ `justify-content:` nos permite especificar/seleccionar donde y como posicionaremos las columnas, así moviendo las mismas en conjunto por el eje x (este se aplica en el contenedor).
  + `:start` alinea las columnas a "el inicio del eje horizontal" (en este caso a la izquierda).
  + `:end` alinea las columnas "al final del eje horizontal" (en este caso a la derecha).
  + `:center` alinea las columnas "al centro de su contenedor".
  + `:stretch` (valor por defecto) ajusta las columnas al tamaño total de su contenedor.
  + `:space-between` posiciona los elementos en el eje horizontal de forma que todos tienen el mismo espacio entre ellos (haciendo mucho mas pequeño el espacio a los lados del mismo).
  + `:space-around` posiciona los elementos en el eje horizontal de forma que todos tienen el mismo espacio entre ellos (arriba y abajo del contenedor se separan del mismo borde por **la mitad de la distancia entre elementos**).
  + `:space-evenly` posiciona los elementos en el eje horizontal de forma que todos tienen el mismo espacio entre ellos (incluso arriba y abajo).

---

### Order

El order es similar al "zindex" solo que envez de trabajar en el orden (tomando en cuenta el eje z) nos permite tomar en cuenta el orden de los elementos en el mismo **"flujo de html"**.

Su funcion se basa en entregar un "indice" a cada elemento en css, asi el elemento con el indice mas alto estara ultimo en el flujo y el con elemento mas pequeño estara primero.

**Algo a tomar en cuenta es que un elemento con `order: 1;` tiene un indice mas alto que un elemento que no tiene esa propiedad, por lo que ira después de los elementos que no posean esta misma**

*ejemplo:*

~~~css
.grid-item-1{
    order: 3; /*este ira ultimo pues su order es el mayor de los tres*/
}

.grid-item-2{
    /*este elemento ira primero*/
}

.grid-item-3{
    order: 1; 
    /*este ira segundo pues su order es mayor que el item 2, pero menor que el item 1*/
}
~~~

**Es similar al funcionamiento de el "order" en flexbox, pero en este caso la orientación de este orden varia dependiendo del "grid track"**

---

