# Django

este framework requiere de cambios en la configuracion de python, para esto vamos a crear un entorno virtual en la que agregaremos nuestro server con django, al menos para no destruir nada.

`python -m venv entornovirtual` con este codigo creamos un entorno virtual en cmd

Entramos en la misma

, para activarlo debes entrar a la carpeta scripts *de donde hiciste eso y usar la keyword (./activate), notaras que este esta funcionando por que habra un (entorno virtual) al inicio de nuestra linea

~~~cmd
PS C:\Users\Khals\Desktop\django\> python -m venv entornovirtual
PS C:\Users\Khals\Desktop\django> cd entornovirtual
PS C:\Users\Khals\Desktop\django\entornovirtual> cd scripts
PS C:\Users\Khals\Desktop\django\entornovirtual\Scripts> .\activate
(entornovirtual) PS C:\Users\Khals\Desktop\django\entornovirtual\Scripts> cd..
(entornovirtual) PS C:\Users\Khals\Desktop\django\entornovirtual> pip install django
(entornovirtual) PS C:\Users\Khals\Desktop\django\entornovirtual> django-admin startproject djproject
(entornovirtual) PS C:\Users\Khals\Desktop\django\entornovirtual> cd djproject
(entornovirtual) PS C:\Users\Khals\Desktop\django\entornovirtual\djproject> python manage.py runserver
esto nos dara la ip local (127.0.0.1) junto a un puerto (en mi caso el 8000)
~~~

Recomendado que esto se haga en un entorno raiz, (recuerda que el nombre de las carpetas no puede tener espacios)

para cerrar el entorno virtual usamos ´ctrl´ + ´c´ (para hacer esto con vscode debemos abrirlo como administrador) 

**si nos sale un error en vscode, debemos usar el comando 'Set-ExecutionPolicy Unrestricted'**

## Creado aplicaciones

Para crear una aplicación tenemos que utilizar la linea `django-admin startapp aplicacion` en la carpeta donde se encuentre el manage.py

Luego en esta creamos una carpeta llamada templates, otra dentro de la misma llamada aplicación y dentro de esta agregamos un ``home.html` 

Tras esto en nuestro proyecto tendremos que referenciar nuestra aplicación, para ello primero:

1. En settings.py agregamos nuestra aplicación:

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

2. en urls.py agregamos:

   ~~~python
   from django.contrib import admin
   from django.urls import path, include ## el include
   
   urlpatterns = [
       path('admin/', admin.site.urls),
       path('', include('aplicacion.urls')), ## la referencia a nuestro home
   ]
   ~~~

**Tras esto tenemos que hacer unos pequeños cambios en la aplicacion**

1. En urls.py (**si este no existe debemos crearlo**)

   ~~~python
   from djproject.urls import path #tenemos que importar el elemento traido desde el proyecto creado
   from aplicacion.views import home
   
   # creamos el objeto con nuestras referencias a los templates
   urlpatterns = [
       path('', home, name="home")]
   ~~~

2. En views.py (si no existe hay que crearlo) debemos agregar:

   ~~~python
   from django.shortcuts import render
   
   # creamos la funcion que llame a nuestra aplicacion
   def home(request):
       return render(request, "aplicacion/home.html")
   ~~~

---

## ADMIN

Django tiene un usuario de administración por defecto al usar `enlace/admin`, aun no tenemos forma de ingresar en esto ya que estos datos deben ser ingresados en una base de datos para ser editados, primero empezamos instalando sqlite

primero, migramos nuestro proyecto con `python manage.py migrate` en donde este nuestro manage.py

y creamos un super usuario con `python manage.py createsuperuser`