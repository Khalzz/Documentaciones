# Bootstrap

Este es un FrameWork implementado en el area del front-end buscando facilitar y mejorar el proceso del diseño de la misma.

Bootstrap funciona con un sistema de "cuadrillas" separando horizontalmente la pagina en 12 "trozos" los cuales iremos utilizando y uniendo para posicionar nuestros elementos en la pagina.

# Iniciando en Bootstrap

## Instalacion

hay muchas formas de instalar este framework y una de ellas es por medio de CDN, este lo conseguimos agregando las siguientes líneas:

~~~html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
~~~

---

# Como funciona bootstrap

Bootstrap funciona con un sistema de "clases" al instanciar los elementos anteriormente escritos en el head de nuestro html nos permite acceder a multiples clases y hacer algo como lo siguiente:

~~~html
<div class="container mt-0 p-0">
        <div class="mt-4 p-5 bg-danger text-white rounded"> 
            HIR WI GOOOOOOOOOOOOOOOOO
        </div>
    </div>
~~~

En este ejemplo podemos sacar que:

+ container: es un elemento "base de bootstrap".
+ mt-"numero": nos permite darle un margen según el numero (con las variables mtl,mtr,mtt,mtb).
+ p-"numero": nos permite darle un padding a nuestro elemento (con las variables pl,pr,pt,pb).
+ bg-"nombre": nos permite darle un color al fondo segun el nombre del color que da bootstrap:
  + danger (rojo).
  + warning (amarillo).
  + important (azul).
  + etc...
+ text-"color" nos permite definir el color del texto (segun nombres normales como: white, black, red...).
+ rounded: nos permite redondear las esquinas de nuestro elemento.

---

## Columns y rows

Imagina que queremos posicionar una fila con 2 elementos en bootstrap, esto lo haremos de la siguiente forma:

~~~html
<div class="container">
    <div class="row">
        <div class="col-sm-6">Wena Po</div>
        <div class="col-sm-6">Wena Po</div>
    </div>
</div>
~~~

+ Por cada elemento hay que hacer un container.
+ definimos nuestra fila con class="row"
+ col-sm-numero: nos permite hacer una columna pequeña que ocupe cierta cantidad de unidades de la pantalla (6,6/3,3,6/etc...)