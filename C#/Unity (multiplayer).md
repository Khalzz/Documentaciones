Unity (multiplayer)

**Mini-documentación hecha por Rodrigo Seguel**

Los videojuegos multijugador son una moda vigente y que perdurara con nosotros el resto de la historia, la sociabilidad que te ofrece un mundo ficticio en el que puedes ser lo que sea nos atrae mucho y no es poco probable que alguna vez hayas pensado en tu mismo hacer una experiencia multijugador para que disfrute gente de todo el mundo.

Unity y el multijugador es como el agua y el aceite, 2 compuestos que por su funcionamiento parecerían tener sentido uno al lado del otro pero en si son muy distintos y sinceramente muy poco cooperativos entre si.

Pero en esta documentación me tomare la tarea de educarte un poco sobre el concepto de multijugador y networking en el entorno de Unity, por que es tan difícil, como quitarnos gran parte de ese peso de encima y una respuesta general a las dudas que te pueden salir mientras sigues esta documentación.



---

# Conceptos de Networking

En esta parte me encargare de hablar sobre la parte teórica de lo que haremos, explicar temas que se van a tomar en cuenta en varios momentos que hablemos sobre el "networking" en general.

---

## Como funcionan el sistema "cliente-servidor"?

Cuando te adentras a un multijugador este te suele permitir abrir una de estas 3 instancias:

+ Cliente: La "forma básica" del usuario que se conecta a nuestro servidor el mismo se encarga tanto de enviar datos como de recibirlos y así mostrar en un ente "observable" el estado del mismo, desde cosas como disparar o ver el personaje de alguien moviéndose, todo esto se puede observar desde el cliente.

  **En pocas palabras es quien se conecta al servidor.**

  ---

+ Servidor: Es nuestra instancia de "importancia" para el juego, es quien se encarga de hacer los cálculos relevantes para el desarrollo de la partida y se encarga de recibir datos, "procesarlos" y enviarlos de vuelta para que el cliente pueda ver cambios reflejados en la partida.

  **Es en pocas palabras el ordenador al que los clientes se conectan.**

  ---

+ Host: Este es uno "especial" Técnicamente se encarga de hacer las 2 tareas en una misma instancia, crea el servidor y hace los calculos pertinentes para otros jugadores, mientras que al mismo tiempo se conecta para poder jugar directamente.

  **Es en pocas palabras el ordenador al que los clientes se conectan al mismo tiempo que es un "cliente" y se conecta a el mismo.**

Por ultimo debo resaltar que el sistema (cliente-servidor) es mejor conocido como "**sistema de servidor local**" ya que dado que la existencia del servidor no depende del host, si algún jugador se desconecta el servidor puede continuar sin problemas.

Por otro lado, el sistema (cliente-host), **P2P** o **peer to peer** es un sistema que depende de un "jugador especial" por lo que si este pierde la conexión, se perderá la conexión de los demás jugadores ya que estos están conectados a la maquina del jugador que acaba de perder su conexión.

Aun así debo resaltar que hay juegos que te permiten ingresar a un servidor por medio de estos 2 tipos de conexión al mismo tiempo como por ejemplo **Counter Strike 1.6** que te permite agregar jugadores a una partida como host por medio de steam pero también crear tu propio servidor dedicado.

---

## Modelo OSI

El modelo OSI (Open System Interconnection) es lo que conocemos como un "framework conceptual" que define la forma en la que las aplicaciones se conectan sobre la red.

Este es dividido en capas que representan la abstracción de los datos según como son enviados desde un cliente hasta como son recibidos por nuestro servidor, estas resumen de una forma entendible los pasos que se deben llevar a cabo para que esta conexión sea tanto efectiva como funcional y aquí las podrás aprender:

+ **La capa de aplicación**: Esta capa se encarga de ofrecer servicios de red al usuario final y por medio de protocolos poder trabajar con los datos que se reciban del mismo, por ejemplo en las paginas web usamos el protocolo **HTTP** y estos protocolos son la forma en la que un cliente y servidor se "comuniquen" entre ellos.

+ **La capa de presentación**: En esta capa nos encargamos de **procesar los datos para su posterior envió** transformándolos su sintaxis a un conjunto de bits para un envió eficiente y encriptándolos para que el proceso sea seguro si este lo necesita.

---

+ **La capa de sesión**: En esta capa nos encargamos de manejar la **construcción, dirección y conclusión** de conexión entre dispositivos, esta nos permite acceder a distintos tipos de conexión a demás de ser la encargada de la autentificación de estas o de reconexión si un problema se presenta en la misma.

---

+ **La capa de transporte**: Esta capa se encarga de según ciertos protocolos **enviar la información de forma estable o rápida según lo que necesitemos** utilizando tanto **TCP para una conexión estable pero mas lenta** o **UDP para una conexión propensa a fallos pero mucho mas rápida** y estos protocolos coordinan cuanta información se envía, que tan rápido y hacia donde va la misma.

---

+ **La capa de red**: Esta capa se encarga de dirigir los datos hacia el servidor correcto por medio de una búsqueda por **dirección IP y dirección Mac** para así encontrar precisamente hacia donde debe llegar la información dentro de la conexión de nuestros servidores y que así no llegue a otro por error (la capa de **IP** de **TCP/IP** es el método convencional que utiliza el internet como su capa de red).

  + Dirección MAC: Esta se asemeja a la "identificación de una persona" y nos permite **identificar el dispositivo especifico en una red**.
  + Dirección IP: Esta se asemeja a la "dirección de tu casa" y nos permite **identificar donde se encuentra un dispositivo de red en especifico**.

  Por ejemplo en una casa pueden haber 6 personas con una identificación distinta, en el caso de  estas direcciones es lo mismo pero hablando de redes, o sea **en una dirección ip (conexión a router) hay 6 dispositivos identificables vía "dirección MAC"**.

---

+ **La capa de enlace de datos**: Esta capa es la mas compleja, se encarga de tomar los datos y "separarlos" en un conjunto de "paquetes" o sea "**un conjunto de datos que representan tanto a quien envía los datos, quien los recibe y obvio los datos y "instrucciones" para volver a armarlos**", esto se hace para así evitar "atascos" y que los datos puedan transportarse de forma eficiente.

---

+ **La capa física**: Cuando te conectas de forma inalámbrica a un router estas enviando "ondas", cuando estas conectado por cable envías "pulsos electromagnéticos", ambos al ser leídos pueden representar valores como 1 y 0, estos se conocen como bits los cuales ordenados y agrupados de cierta forma pueden representar cualquier dato que nosotros deseemos enviar.

  **La capa física se conoce así dado el medio físico por el que estos se envían los datos (ya sean cables, repetidores, ondas, etc...).**

---

## Protocolos para el envio de datos

A la hora de enviar datos entre distintos dispositivos tenemos que utilizar distintos protocolos para "asegurarnos" que estos datos lleguen de forma segura o eficiente.

Para esto internet utiliza principalmente 2 protocolos (aun que existen mas, no nos centraremos en ellos aun):

+ **TCP/IP**: Este "**protocolo de control de transmisión y protocolo de internet** se encarga del procesado de datos y envió de los mismos para que lleguen de forma "fiable" a nuestro destino aun que es mas lento.

  Este utiliza el sistema de 

+ **UDP**: Este "**protocolo de datagramas de usuario**" se encarga igualmente del procesamiento de datos y envió de los mismos, pero en lugar de centrarse en la "fiabilidad", se centra en la eficacia aun que este **puede** generar ciertos problemas entre medio (perdida de paquetes por ejemplo).

---

## Sockets

Cuando queremos hacer una conexión "cliente-servidor" usualmente ocurre de la siguiente forma:

El usuario hace una "petición" al servidor y este ultimo actualiza su estado enviando una "respuesta", esto funciona bien en varios casos pero tiene un problema y es que si por ejemplo algo del servidor se ha actualizado y nuestro cliente no hace una petición, a este no se le mostrara esta actualización hasta que lleve3 a cabo una petición nueva.

Esto ocurre por que el servidor de cierta forma no puede tener acceso a lo que nuestro equipo puede visualizar ni puede "avisarle" sobre el nuevo cambio.

Para esto usamos sockets, este nos permite mantener una comunicación activa-activa entre el cliente y el servidor, o sea el server por ejemplo será capaz de enviar notificaciones al cliente mientras que este podrá interactuar con lo que sea que le envié el servidor. Y por medio de este se pueden enviar integers, strings booleanos entre otros muchísimos datos u objetos y luego notificarnos en tiempo real cuando algo ocurra(por ejemplo se conecta otro dispositivo con conexión activo-activo).

A demás podremos por ejemplo saber cuándo un usuario se desconecta, un usuario nuevo se conecta o un usuario se vuelve a conectar.

---

## RiptideNetworking

RiptideNetworking es un proyecto de código abierto que nos permite conectar nuestro proyecto a un sistema multijugador de forma sencilla quitándonos muchas pegas de encima ya funcionando de una forma clara y mas entendible que otros métodos anteriormente requeridos para lo mismo en Unity.

Este proyecto de la mano de "Tom Weiland" es una iteración a un proyecto anterior de su mano que buscaba facilitar por medio de tutoriales la creación de multijugadores, pero ahora con el uso de un framework abierto y de mas fácil uso.

Este lo pueden encontrar [en el siguiente enlace](https://github.com/tom-weiland/RiptideNetworking) a demás de encontrar el video explicativo del mismo [aquí](https://www.youtube.com/watch?v=6kWNZOFcFQw&t=262s&ab_channel=TomWeiland).

Los sistemas en el que este funciona dependen de la forma en la que los datos se transformen, pero por ahora se tiene certeza de su funcionamienteo tanto en Windows, Linux, Mac y Android.

La cantidad de jugadores permitidos por el sistema de riptide es totalmente proporcional al poder de procesado que encontramos en el dispositivo que este funcionando como servidor o "host" de la partida, pero esta totalmente a nuestra mano limitar el numero de jugadores si esto es lo que deseamos.

Pero **¿en que se diferencia Riptide de otras opciones como Mirror?**, pues comparar estos no es justo ya que ambos sirven para distintos propósitos, pero en términos generales Mirror entrega mas características, pero a cambio ofrece menos control, mientras que Riptide ofrece menos características aun que aumentando el control que tienes en las mismas.

