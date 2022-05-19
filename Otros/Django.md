# Django

**Documentación hecha por Rodrigo Seguel**

Django es **un framework de Python orientado al desarrollo web del back-end**, manteniendo tanto la seguridad como brindándonos otras características únicas que hacen de este una gran herramienta para nuestro desarrollo.

El funcionamiento de Django se basa en el desarrollo de "**aplicaciones**" que en si son las mismas paginas que acceden a estos elementos de django.

---

# Empezando en Django

Django requiere antes de nada varios elementos que "cambian de cierta forma las configuraciones de Python", por esto tendremos que llevar a cabo ciertos procesos antes de poder comenzar con nuestro desarrollo.

Primero empezaremos instalando Django de forma general, esto lo haremos escribiendo en nuestra terminal **`pip install django`** (recuerda que dependiendo de como este todo instalado deveras escribir `pip` o `pip3`).

Tras esto podemos continuar.

---

## Creando un proyecto

Para crear el proyecto en nuestra terminal iremos a un entorno raíz de disco (elije tu la que quieras, en mi caso utilizada el disco **`D`**) y haremos lo siguiente:

~~~cmd
# Creando el entorno virtual y activandolo
PS C:> mkdir proyecto # primero desde la raiz haremos una nueva carpeta (la llamare proyecto)
PS C:> cd proyecto # y entramos en la carpeta
PS C:\proyecto> python -m venv entornovirtual # crearemos el entorno virtual dentro de esta carpeta
PS C:\proyecto> cd entornovirtual # entramos al entorno virtual
PS C:\proyecto\entornovirtual> cd scripts # entramos a la carpeta scripts (que se creo en el entorno)
PS C:\proyecto\entornovirtual\Scripts> .\activate # finalmente activamos el entorno virtual
(entornovirtual)PS C:\proyecto\entornovirtual\Scripts> cd.. # al activarlo veremos el nombre al inicio de la terminal (volvemos atras)
# Creando el proyecto 
(entornovirtual)PS C:\proyecto\entornovirtual> pip install django # instalamos django dentro de del proyecto
(entornovirtual)PS C:\proyecto\entornovirtual> django-admin startproject djproject # creamos el proyecto con el nombre djproject
(entornovirtual)PS C:\proyecto\entornovirtual> cd djproject # entramos en el projecto
(entornovirtual)PS C:\proyecto\entornovirtual\djproject> python manage.py runserver # corremos el proyecto desde la carpeta del mismo
~~~

Listo ahora en la terminal te debería aparecer un enlace, al abrir este deberá aparecerte una pagina funcional que ahora mismo esta corriendo en un servidor local, recomiendo que ahora mismo abramos **Visual Studio Code** en la carpeta djproject.

Como recordatorio puedes cerrar el servidor y volver a la terminal usando **`ctrl`** + **`c`** y para volver a abrirlo simplemente en la carpeta djproject ejecutas el comando `python manage.py runserver`.

**si nos sale un error en vscode, debemos usar el comando 'Set-ExecutionPolicy Unrestricted'**.

---

## Creando aplicaciones

Como ya dije anteriormente, las funcionalidades de Django se dividen en "aplicaciones" que crearemos para entregarle una funcionalidad a nuestro django, estos se crean de la siguiente forma.

Simplemente vamos a la carpeta de nuestro proyecto **en el caso de este ejemplo la carpeta es djproject** y ahí usamos  **`django-admin startapp aplicacion`** donde "aplicación" es en efecto el nombre de la misma (puedes cambiarlo por lo que quieras).

Luego **en esta** creamos una carpeta llamada `templates` , otra dentro de la misma llamada `aplicación` y dentro de esta agregamos un ``home.html`.

Por ultimo simplemente tendremos que agregar nuestra aplicacion a nuestro proytecto, para esto buscaremos las siguiewntes carpetas y haremos los cambios pertinentes:

1. En djproject/settings.py agregamos nuestra aplicación:

   ~~~python
   INSTALLED_APPS = [
       'django.contrib.admin',
       'django.contrib.auth',
       'django.contrib.contenttypes',
       'django.contrib.sessions',
       'django.contrib.messages',
       'django.contrib.staticfiles',
       'aplicacion', # agregamos la aplicacion en nuestras aplicaciones instaladas
   ]
   ~~~

2. en djproject/urls.py agregamos:

   ~~~python
   from django.contrib import admin
   from django.urls import path, include ## el include
   
   urlpatterns = [
       path('admin/', admin.site.urls),
       path('', include('aplicacion.urls')), ## la referencia a nuestro home
   ]
   ~~~

**Tras esto tenemos que hacer unos pequeños cambios en la aplicación**

1. En aplicación/urls.py (**si este no existe debemos crearlo**)

   ~~~python
   from djproject.urls import path #tenemos que importar el elemento traido desde el proyecto creado
   from aplicacion.views import home
   
   # creamos el objeto con nuestras referencias a los templates
   urlpatterns = [
       path('', home, name="home")]
   ~~~

2. En aplicación/views.py (si no existe hay que crearlo) debemos agregar:

   ~~~python
   from django.shortcuts import render
   
   # creamos la funcion que llame a nuestra aplicacion
   def home(request):
       return render(request, "aplicacion/home.html")
   ~~~

Cosas como el css se agregan en una carpeta llamada static, que esta fuera de los templates, allí pondremos los elementos como el css, javascript, imagenes, etc.

Con esto ya tendremos un proyecto listo para ejecutar, pero primero tendremos que ver un ultimo elemento de importancia.

---

## Estructura de un proyecto de Django:

En esta sección mostrare de que esta compuesto un proyecto, pero recuerda que mostrare en base a lo que hicimos en las secciones anteriores (ojo que hare énfasis solo en los archivos que sean de relativa importancia).

Un proyecto de Django se ve de la siguiente forma:

+ **aplicación**: esta carpeta es la que creamos en la sección de aplicaciones (debes recordar que un proyecto puede tener varias aplicaciones)
  + **migrations**: esta carpeta guarda las migraciones que se irán haciendo a la base de datos.
  + **static**: en esta carpeta guardaremos los elementos que no cambiaran (archivos css, javascript, etc) **esta debemos crearla nosotros**.
    + **aplicación** esta carpeta es donde realmente guardaremos todo el css, javascript u otros que tengan que ver con la aplicación llamada "aplicación".
      + css: por ejemplo agrego una carpeta con este nombre, aquí ira nuestro css
      + js: aquí ira nuestra lógica
  + **templates**: aquí separaremos por aplicación los elementos de html que definirán nuestra pagina: **esta debemos crearla nosotros**
    + **aplicación**: este archivo esta para mencionar específicamente de donde viene o a que aplicación le pertenece el archivo html.
      + home.html: este elemente es el que se mostrara al dejar la pagina por defecto
  + admin.py: aquí seleccionamos de que formas mostraremos los datos de la base de datos en la pagina de admin
  + models.py: aquí definimos los modelos de la base de datos por medio de clases de python.
  + urls.py: aquí llamamos las urls de las aplicaciones.
  + views.py: aquí definimos ciertas funcionalidades que tienen que ver con la vista de la pagina.
+ **djproject**: esta carpeta es la de nuestro proyecto principal, aquí se encuentran las configuraciones pertinentes del proyecto.
  + settings.py: este archivo contiene la configuración de nuestro proyecto, desde le idioma hasta las aplicaciones anidadas al mismo.
  + urls.py: en este archivo veremos los enlaces "funcionales en nuestro proyecto para que todo corra de forma correcta" en base a los links
+ db.sqlite3: esta es la base de datos donde almacenaremos lo que requiramos (se vera masa adelante).
+ manage.py: este archivo de python lo utilizamos para ejecutar múltiples funciones que nos permitirán desde correr el servidor hasta crear mas aplicaciones.

---

## ADMIN

Django tiene un usuario de administración por defecto al usar `enlace/admin`, aun no tenemos forma de ingresar en esto ya que estos datos deben ser ingresados en una base de datos para ser editados, primero empezamos instalando sqlite

primero, migramos nuestro proyecto con `python manage.py migrate` en donde este nuestro manage.py

y creamos un super usuario con `python manage.py createsuperuser

