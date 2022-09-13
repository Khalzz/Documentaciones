# Django

**Documentación hecha por Rodrigo Seguel**.

Django es un **framework de Python orientado al desarrollo web de back-end**, entregando gran velocidad y simplicidad al desarrollo de aplicaciones por lado del servidor siendo este utilizado de forma variada por empresas de renombre como:

+ Instagram.
+ Spotify.
+ Pinterest.
+ Entre otros...

Por esto y por su simplicidad **Django es una opción notable** tanto para empresas grandes como para desarrolladores que desean crear soluciones con una conexión a servidores de forma tanto eficiente como sencilla.

---

## Instalando Django

Como es obvio para utilizar Django debes tener instalado **Python** en tu ordenador, tras ello utilizando el manejador de paquetes `pip` instalaremos finalmente Django con el comando `pip install django` desde la terminal.

*Recuerda que dependiendo de como este todo instalado deveras escribir `pip` o `pip3`*.

Con esto listo podremos continuar.

---

## Creando un proyecto

Para crear el proyecto simplemente crearemos una carpeta y entraremos a la misma desde nuestro terminal.

*Recomiendo que esta carpeta se encuentre en la raíz del disco D*.

Cuando esto simplemente utilizaremos el comando **`django-admin startproject djtest`** para crear una carpeta con el nombre "**djtest**" con todos los archivos necesarios.

Para comprobar que todo funcione de forma correcta abrimos nuestro servidor local con `python manage.py runserver`.

Al hacer esto nuestra terminal nos entregara un enlace que al abrirlo, nos mostrara una pagina base de Django.

---

## Módulos y Apps

Django funciona con un sistema de "Apps/Módulos" que nos permiten separar nuestros proyectos en pequeños pedazos que podemos compartir entre proyectos o complementar con otros módulos descargados por `pip`.

Para crear un modulo debes ejecutar el comando **`python manage.py startapp appname`**, **recuerda que el nombre puedes cambiarlo si " appname" no te convence**.

Al crear estos tendremos a demás que hacer cierta configuración del proyecto, haciendo lo siguiente:

1. En `proyecto/settings.py` agregamos nuestra aplicación:

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

2. en `proyecto/urls.py` agregamos:

   ~~~python
   from django.contrib import admin
   from django.urls import path, include ## el include
   
   urlpatterns = [
       path('admin/', admin.site.urls),
       path('', include('aplicacion.urls')), ## la referencia a nuestro home
   ]
   ~~~

**Tras esto tenemos que hacer unos pequeños cambios en la aplicación**

1. En `aplicación/urls.py` (**si este no existe debemos crearlo**)

   ~~~python
   from proyecto.urls import path #tenemos que importar el elemento traido desde el proyecto creado
   from aplicacion.views import home
   
   # creamos el objeto con nuestras referencias a los templates
   urlpatterns = [
       path('', home, name="home")]
   ~~~

2. En `aplicación/views.py` (si no existe hay que crearlo) debemos agregar:

   ~~~python
   from django.shortcuts import render
   
   # creamos la funcion que llame a nuestra aplicacion
   def home(request):
       return render(request, "aplicacion/home.html")
   ~~~

---

## Arquitectura de un proyecto

Cuando creamos un proyecto veremos un conjunto de carpetas y archivos, cada uno con una funcionalidad especial, siendo estas:

* **DjTest**: En este caso es el nombre de nuestro proyecto, aquí estarán todos los archivos pertinentes a la configuración del framework.
* **Modulo o app creado**: cuando creamos una app o modulo se debe crear esta carpeta, aquí es donde trabajaremos.
* **db.sqlite3**: En este archivo se almacenaran nuestros datos ya que el mismo es en si nuestra base de datos.
* **manage.py**: Este archivo contiene funciones que utilizaremos para hacer cosas como ejecutar la app, migrar la base de datos, crear apps, entre otros...

Al adentrarnos en la carpeta de módulos o app encontraremos los siguientes archivos:

* **Modulo o app creado**.
  * **\_\_init_\_.py**: Este archivo se encarga de mencionar que esta carpeta es una "**app**" o "**modulo**" de Django.
  * **admin.py**: Este archivo se encarga de registrar los modelos de la "administración de django" como son:
    * Registrar modelos.
    * Crear superusuarios.
    * Inicio de sesión y uso de la aplicación web.
  * **apps.py**: Este archivo se utiliza para incluir la configuración de la aplicación en si.
  * **models.py**: Representa nuestro modelo de datos en forma de clases de python.
  * **views.py**: Es la forma en la que comunicaremos nuestra aplicación de **Django** con nuestro front-end.
  * **urls.py**: Principalmente es la forma en la que el usuario hace peticiones por medio de los enlaces de la pagina.
  * **tests.py**: Este archivo será utilizado para hacer pruebas en nuestra aplicación.

A parte  de estos archivos hay ciertas carpetas que podremos crear que cumplirán en si ciertas **funcionalidades especiales**.

Estas serán creadas por nosotros o de forma automática y estos son:

* **migrations**: esta carpeta guarda las migraciones de nuestra base de datos (se crea de forma automática).
* **static**: esta es una carpeta "especial", donde guardaremos los "recursos" que utilizaremos en nuestra pagina, usualmente lo que haremos será crear dentro de esta otra carpeta con el nombre de la aplicación siguiendo una estructura similar a la siguiente:
  * [Nombre de la aplicación]
    * Css: por ejemplo aquí iría nuestro estilo.
    * Js: y aquí nuestra lógica.
* **templates**: aquí tendremos los elementos HTML que representaran el área visual de nuestra pagina (**esta carpeta será creada por nosotros**).
  * \[Aplicación\]: Dividiremos por carpetas cada aplicación creada en el proyecto en si.
    * **home.html**: Es la pagina principal de nuestro proyecto, la que se mostrara cuando abramos nuestra pagina principal


---

## Admin

Django tiene una opción de "administración de datos" por defecto que se encuentra al ingresar `enlace/admin` en el buscador, esto nos lleva a un inicio de sesión en el cual deberemos ingresar con un "super usuario".

Para esto primero tendremos que efectuar una "**migración de la base de datos**", esto por medio del comando `python manage.py migrate`.

Tras esto ya podremos crear nuestro super usuario con `python manage.py createsuperuser`, esto nos pedirá 4 elementos en si:

* Nombre de usuario para el administrador.
* Correo del admin (este puedes dejarlo vacío si quieres).
* Contraseña del admin y su respectiva confirmación.

Con esto ya podríamos acceder al perfil de administrador utilizando `enlace/admin` en el buscador.

---

