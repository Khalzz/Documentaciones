# Consultas de bases de datos

---

~~~
Para cambiar el "idioma de la sesion" osea el idioma del sql, sus formatos, la hora , los digitos, etc usamos la siguiente linea en nuestro master

ALTER session set NLS_LANGUAGE='SPANISH';
~~~

---

## Crear usuario

~~~sql
-- La siguiente linea la debes descomentar SI Y SOLO SI tienes instalado el Oracle 18c
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
-- USER SQL
CREATE USER duocUc IDENTIFIED BY duoc -- create user (usuario) identified by (contraseña)
--DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER duocUc QUOTA UNLIMITED ON USERS; -- alter user (usuario)

-- ROLES
GRANT "RESOURCE" TO duocUc ; -- usuario
GRANT "CONNECT" TO duocUc ; -- usuario
ALTER USER duocUc DEFAULT ROLE "RESOURCE","CONNECT";
~~~

---

# Unidad 1

## Select

Select nos permite **recuperar datos de una tabla**, suponiendo que esta ya tenga datos en si misma, para eso debemos seleccionar el dato que buscaremos y la tabla en la que este se encuentra, por ejemplo:

~~~sql
-- buscamos todos los datos en "nombre_cliente" dentro de la tabla "cliente"
select nombre_cliente from cliente;
~~~

También podemos **llamar 2 elementos de una tabla**, por ejemplo:

~~~sql
-- aqui nos mostrara la fila nombre y la fila apellido paterno de la tabla "cliente"
select nombre_cliente, appaterno_cliente from cliente;
~~~

Su sintaxis completo es el siguiente:

~~~
SELECT
FROM
WHERE
ORDER BY
~~~



---

### Order by

El order by es una palabra clave que nos permite "formatear" la forma en la que se muestran los datos, ejemplo:

~~~sql
select appaterno_cli, nombre_cli -- primero, el select debe estar en orden
from cliente
order by appaterno_cli; -- esto asegura el orden a usar
~~~

Esto nos mostrara los datos pero en orden de **apellido paterno, nombre** en lugar de **nombre, apellido paterno**.

A demás podemos usar la keyword ``Desc`` para mostrar los datos de forma descendente en forma numérica o desde la Z hasta la A de un elemento en si, por ejemplo:

~~~sql
select appaterno_cliente, nombre_cliente -- primero, el select debe estar en orden
from cliente
order by appaterno_cliente desc; -- esto mostrara solo los elementos de appaterno_cliente en orden descendente
~~~

También si queremos hacer una referencia a una tabla ordenada podemos hacer lo siguiente:

~~~sql
SELECT columna1
FROM tabla
ORDER BY 1, 2 desc, 3

-- suponiendo que tenemos 3 columnas que debemos ordenar, en este caso:
-- la primera la ordenara normalmente, la segunda de vorma descendiente y la tercera normalmente
~~~



---

### Disctinct

El distinct es una clausula que nos permite "eliminar los repetidos" de la lista, entonces nos quedamos con solo 1 elemento de la lista si este se repite, por lo que podemos "filtrar los elementos dentro de la lista"

esto lo usamos de la siguiente forma:

~~~sql
select distinct nombre_cliente -- esto eliminara de la tabla todos los datos que se repitan
from cliente
~~~



---

## Concatenar datos

En varios lenguajes de programación algo muy común es **concatenar strings**, esto para "sumar" y unir strings de distintas formas, por ejemplo:

~~~python
nombre = "Rodrigo"
apellido = "Seguel"
print(nombre + "" + apellido)

# esto mostrara el dato "Rodrigo Seguel"
~~~

Esto se puede hacer en sql con el operador `||` de la siguiente forma:

~~~sql
select appaterno_cliente || ' ' || nombre_cliente -- añadimos las comillas para generar un espacio entre ellos
from cliente
~~~

---

## crear una tabla (as)

Si tenemos ciertos datos por ejemplo tras una concatenación, podemos generar una nueva tabla para trabajar con esos datos, por ejemplo si hacemos lo siguiente:

~~~sql
select appaterno_cliente || ' ' || nombre_cliente -- añadimos las comillas con un espacio entre ellos
from cliente
~~~

tendremos que iterar con ello todas las veces que queramos un dato (tabla) completo, pero podemos hacer lo siguiente:

~~~sql
select appaterno_cliente || ' ' || nombre_cliente as "apellido y nombre" -- se creara una nueva tabla con el nombre (apellido y nombre)
from cliente
~~~

El as debe aplicarse independientemente a cada dato con el que se crea una nueva tabla.

---

## Operaciones matemáticas

Para hacer ciertos cálculos matemáticos podemos hacer lo siguiente:

~~~sql
select valor_int*0.1 from tabla; -- esto llamara los datos pero la tabla tendra el nombre "valor_int*0.1"
~~~

para que esto no ocurra podemos usar el as:

~~~sql
select valor_int*0.1 as "nuevo dato" from tabla;
~~~

Y si tenemos varios datos debemos usar el as en solo los datos que estemos editando:

~~~sql
select valor_int*0.1 as "nuevo dato", valor_int_2 from tabla; 
-- ahora se mostrara el valor_int con otro nombre y valor_int_2 seguira igual
~~~



---

## Mostrar datos con condición

Para mostrar datos en base a una condición podemos utilizar la "condición" `where`, esto nos permitirá mostrar elementos según una condición, por ejemplo:

~~~sql
-- mostrar solo los datos arriba de 100
SELECT dato
FROM tabla
WHERE dato > 100;

-- mostrar solo los datos menores a 100
SELECT dato
FROM tabla
WHERE dato > 100;

-- mostrar solo los datos de fecha anteriores al 2000
SELECT datoFecha
FROM tabla
WHERE datoFecha < '31/12/2000'; -- las fechas se comparan como si fueran strings normales

-- mostrar solo los datos inferiores al valor que nosotros ingresemos
SELECT dato
FROM tabla
WHERE dato < &&valorAComprobar;
-- el && abrira una ventana en la que podremos ingresar texto y lo que ingresemos se va a comparar con el fato
~~~

---

### doble condicional

También puede que requiramos de utilizar una condicional que verifique 2 estados y para esto utilizaremos la "keyword" `BETWEEN AND` , este lo utilizaremos de la siguiente forma:

~~~sql
-- mostrar datos arriba de 100 y abajo de 100
SELECT dato
FROM tabla
WHERE dato BETWEEN 100 AND 1000;
~~~

---

## Condicionales múltiples

También podemos hacer múltiples comparaciones en una utilizando el `=`

~~~sql
-- mostrar un dato solo si es igual a 1 o 2
SELECT dato
FROM tabla
WHERE dato = 1 OR dato = 2; -- tambien se puede hacer con solo 1 dato
~~~

Esto es lo mas similar a un if en algún lenguaje de programación, en el caso normal es el mas fácil, pero hay veces en el que hay que comparar muchos estados, para ello utilizamos la keyword `ìn`, la cual compara el  dato entre varios otros dentro de una lista, por ejemplo

**si hacemos los mismo con in se vería de la siguiente forma:**

~~~sql
-- mostrar un dato solo si es igual a 1 o 2
SELECT dato
FROM tabla
WHERE dato IN(1,2); -- si usamos NOT IN(1,2) mostrara todos los datos excepto los que contengan un 1 y un 2
~~~

---

Si queremos probar igualdades con datos varchar (strings) debemos en lugar de utilizar un =, usar un `LIKE`, de la siguiente forma:

~~~sql
SELECT datoVarChar
FROM tabla
WHERE datoVarChar LIKE 'Algo'; -- tambien se puede hacer con solo 1 dato
~~~

Si utilizamos el `%` nos va a buscar datos **que inicien con el dato ingresado** o sea, si hacemos por ejemplo: `'A%'` vamos  a buscar todos los datos **que inician con una A** (**este es sensible a las mayúsculas**).

Al contrario si hacemos `'%A'` nos mostrara **solo los datos que terminan con la A**

Si hacemos por ejemplo `"M%A"` nos mostrara **solo los datos que inicien con M y terminen con A**

Tambien podemos "Seleccionar" el caracter en el que queremos hacer el orden utilizando **`_`** de la siguiente forma:

+ Si queremos saltarnos el primer caracter y comprobar solo la segunda letra debemos usar `_A%` (el segundo caracter debe ser una **A**).
+ Si queremos saltarnos el segundo caracter y comprobar solo la tercera letra debemos usar `__A%` (el tercer caracter debe ser una **A**).
+ Entre otros

**A demas podemos añadir varios de estos en una "condicion `where`", por ejemplo:**

~~~sql
SELECT datoVarChar
FROM tabla
WHERE datoVarChar LIKE 'A%' OR datoVarChar LIKE 'M%'; -- AQUI REVISAMOS QUE EL 
~~~

---

Si queremos comprobar que un dato sea nulo, osea que no este ingresado en caso que ese dato sea opcional, debemos comprobar la no existencia del mismo de la siguiente forma:

~~~sql
SELECT datoVarChar
FROM tabla
WHERE datoVarChar IS NULL -- compara los que son Null
WHERE datoVarChar IS NOT NULL; -- compara los que NO SON NULL
-- recordar que los null se comparan con IS
~~~

---

## Extract

Este nos permite "extraer datos" como por ejemplo el "mes" de una fecha, para esto hacemos lo siguiente_

~~~sql
SELECT EXTRACT(MONTH FROM date) -- extraemos el mes de una fecha
FROM tabla;

SELECT EXTRACT(DAY FROM date) -- extraemos el dia de una fecha
FROM tabla;

SELECT EXTRACT(YEAR FROM date) -- extraemos el año de una fecha
FROM tabla;
~~~



---

## Create table

Este nos permite crear una nueva tabla usando la siguiente sintaxis:

~~~sql
CREATE TABLE nombreTable AS
-- select con datos de la tabla;
~~~

Si queremos borrar una tabla debemos usar:

~~~sql
DROP TABLE nombreTabla; -- este funciona solo si la tabla no es dependiente de otras tablas
~~~

---

## Funciones

Al igual que en otros lenguajes, podemos utilizar funciones que generan distintas acciones dentro de este lenguaje en si, entre las que utiliza sql voy a mostrar algunas, pero hay muchas mas:

| función   | descripción                                                  |
| --------- | ------------------------------------------------------------ |
| INITCAP() | Pone en mayúscula la primera letra de uno o varios varchar   |
| UPPER()   | Pone en mayúscula **Todas las letras del varchar**           |
| LOWER()   | Pone en minúscula **Todas las letras del varchar**           |
| SUBSTR()  | Nos permite acceder a ciertas partes del varchar (varchar, donde empezamos, donde terminamos), si queremos obtener los datos desde atrás hacia adelante debemos usar (varchar, -indice) |
| LPAD()    | Esta función nos permite "rellenar" un dato hasta llegar a una cantidad de letras o números, por ejemplo si tenemos un string "Rodrigo" y usamos LPAD("Rodrigo", 10, '+'), se añadirán "+" hasta que hayan 10 caracteres ´+++Rodrigo´ |
| RPAD()    | Esta función es similar al LPAD solo que en lugar de rellenar al inicio, rellena al final |
| ROUND()   | Esta función redondea el valor numérico que le entreguemos   |
| TRUNC()   | Esta función **elimina el decimal** del valor numérico que le entreguemos |
| TO_CHAR() | Esta funcion nos permite "formatear ciertos datos", por ejemplo si queremos hacer que una fecha se muestre de la siguiente forma (dia/mes/año) utilizamos `TO_CHAR(fecha, 'DD/MM/YY')` y si queremos por ejemplo solo llamar el mes del dato, podemos hacer: `TO_CHAR(fecha, 'MM')`, si queremos que este se muestre por ejemplo con el mes textual, usamos `TO_CHAR(fecha, 'DD MONTH YYYY')` y para dinero debemos usar: `TO_CHAR(sueldo_base, '$999g999g999')` |
|MONTHS_BETWEEN()|Esta funcion admite 2 parametros, (mes mayor, mes menor) y nos devuelve la diferencia en meses entre 2 fechas (SYSDATE)|
|NVL()|Busca un parametro, si este es nulo lo reemplaza con el segundo parametro ejemplo: `NVL(NOMBRE, 'NO SE LLAMA')` **este solo funciona con datos de tipo char o cadenas de caracteres**.|

Ojo como recomendacion, si tienes pensado "formatear un rut" deberias hacer lo siguiente:

~~~sql
SELECT to_char(rut, '99g999g999') || '-' || upper(cod_ver_rut) as "RUT"
-- despues de esto se mostrara como un rut nomrmal "12.345.678-9" o "12.345.678-K" (con la k en mayuscula o no segun lo pidan)
~~~

A demás como recordatorio para evaluaciones **las fechas pueden estar formateadas tanto por dd-mm-yyyy como mm-yyyy-dd entre otros**, en las pruebas fíjate en esto bastante bien.

---

## Case

El case sirve similar a los if dentro de un lenguaje de programacion como cualquier otro, solo que en este caso "declaramos que una sona va a utilizar ciertas condicionales" y los resultados de esas condicionales de la siguiente forma:

~~~sql
SELECT
	CASE
	-- aqui van las condiciones
		WHEN dato1 = 'valor probable' THEN 'valor nuevo'
		-- si dato 1 es igual al valor probable, este se va a cambiar por el valor que ingresemos a su lado
	END -- debemos cewrrar el case si o si con un end (si queremos usar un as, debemos añadirlo aqui)
FROM tabla1;
~~~

---

## Input

Para añadir un input n nuestro sql debemos hacer uso de los &&, estos referencian que un dato (con el nombre que le añadiremos luego) funcionara como una variable, cuyo valor será añadido por el usuario por medio de su teclado.

*ejemplo:*

~~~sql
dato_ya_existente = &&nombre_variable
~~~

Si necesitamos un dato por ejemplo varchar, necesitamos agregar comillas (`'06-2003'`) en nuestro input por ejemplo si comparamos un dato con una fecha.

---

# Unidad 2

## Funciones de grupo

| Función | Definición                                 |
| ------- | ------------------------------------------ |
| MAX     | Entrega el valor máximo de una fila        |
| MIN     | Entrega el valor mínimo de una fila        |
| AVG     | Entrega el promedio de valores en una fila |
| SUM     | Entrega la suma de los valores de una fila |
| COUNT   | Cuenta los datos ingresados en una fila    |

---

## GROUP BY

el group by nos permite "ejecutar funciones de grupo" junto a otras funciones normales, por ejemplo:

~~~sql
-- Esto nos generaria error por que solo un dato utiliza una funcion de grupo
SELECT id_estcivil as "ESTADO CIVIL", 
    COUNT(run_emp) as "TOTAL DE EMPLEADOS"
FROM EMPLEADO;

-- Si hacemos lo siguiente no hara fallta que todas nuestras funciones sean de grupo
-- caso 6
SELECT id_estcivil as "ESTADO CIVIL", 
    COUNT(run_emp) as "TOTAL DE EMPLEADOS"
FROM EMPLEADO
GROUP BY id_estcivil; -- aqui añadimos la tabla que NO UTILIZA UNA FUNCION DE GRUPO
~~~

---

## Having

El having es otro adiamiento en nuestra sintaxis básica del 

~~~sql
SELECT
FROM
WHERE
GROUP BY
HAVING -- Este es nuestro especimen
ORDER BY
~~~

El having funciona exactamente igual que el where solo que este funciona específicamente con funciones de grupo en si mismo y requiere estar ingresado debajo del **group by**.

---

## Join

Los join son una "sentencia" al igual que las anteriormente vistas, solo que estos nos permiten acceder a mas de una tabla desde el mismo **`Select`**, unificando estas por un dato en especifico el cual ambas tablas compartan.

El join se aplica específicamente en la sentencia "FROM" dado que como ya mencione anteriormente, lo usaremos para señalar que accederemos a mas de una tabla.

**Algo que debo mencionar es que para "unir" tablas con un join, estas si o si deben estar relacionadas entre si en nuestro modelo de datos.**

Para explicarlo voy a dar un pequeño ejemplo:

Imagina que un grupo de marcianos te ha capturado y necesitan que en una base de datos sql (para marcianos) puedas unificar 2 tablas, una que representa un marciano y otra que representa la base a la que este pertenece.

Lo que debes conseguir es que se muestre el nombre del marciano junto al nombre de la base a la que este pertenece, las tablas son las siguientes:

| Marciano        | Base        |
| --------------- | ----------- |
| nombre_marciano | nombre_base |
| id_marciano     | loc_base    |
| **id_base**     | **id_base** |

Como podras ver, ambas tablas estan separadas pero comparten un elemento, el cual es **id_base** y utilizaremos este para relacionar ambas tablas.

~~~sql
-- empezamos llamando el primer dato de relevancia
SELECT nombre_marciano, nombre_base
FROM Marciano m JOIN Base b ON(m.id_base = b.id_base);
~~~

-- luego haremos el from pero siguiendo los siguientes pasos:

1. Tendremos nuestro from con nuestra tabla base, en este caso la tabla Marciano.
2. Usamos el join para agregar nuestra nueva tabla, en este caso es la tabla Base.
3. Les asignamos un "identificador" a cada uno, en este caso para mariano es m y para base es b.
4. Agregamos la funcion ON() donde añadiremos los datos que conectan nuestra tabla marciano con la tabla base.
   + En este caso usamos `identificador1.cod_dato_compartido = identificador2.cod_dato_compartido` esto significa que la unión se hará gracias a ese dato compartido.

Y tras esto ya podremos concretar nuestro cometido, el unificar 2 tablas y ayudar a nuestros amigos marcianos.

---

## Join Complejos

LEFT JOIN

Supongamos que tenemos 2 tablas anidadas por un mismo conjunto de datos, al hacer un join uniremos **solo los datos que estén en ambas tablas**, o sea `(A(Inner Join)B)` Mientras que el left join nos permite acceder a los datos de la "izquierda" **Los datos que están en a y el medio, pero no en b** **`(A(MEDIO)`**`B)` o **`(A`**`(MEDIO)B) `.

Este seria de la siguiente forma:

~~~sql
SELECT datoA
FROM TablaA a LEFT JOIN TablaB b ON(a.datoA = b.datoA); -- asi llamamos los datos que estan en A y el medio

-- Pero si queremos hacer esto sin incluir el medio deemos usar:
SELECT datoA
FROM TablaA a LEFT JOIN TablaB b ON(a.datoA = b.datoA); -- asi llamamos los datos que estan en A y el medio
WHERE b.datoA IS NULL;
~~~

Lo mismo pero al contrario ocurre si decidimos utilizar "RIGHT JOIN", solo que en este caso el join llama a los datos que están a la derecha y al medio, o en su defecto solo a la derecha `(A`**`(MEDIO)B) `** o `(A(MEDIO)`**`B) `** .

---

## Join en tablas no enlazadas

Quizá creas que o puedas llamar datos de una tabla que no esta anidada a la otra, pero si se puede, esto lo hacemos on algo llamado "**NONEQUIJOIN**" esto nos permite acceder a dos tablas sin un dato que los conecte y su sintaxis es:

~~~sql
SELECT datoA
FROM TablaA JOIN TablaB ON(datoQueTraemosDeTablaB); -- en este caso no necesitamos identificador en las tablas
~~~

---

## Subconsultas

Resulta que hay una forma de agregar mas select dentro de un select en si, llamando diversos elementos en una lista, suponiendo que estos no tienen una conexiones al 100% con nuestro select original.

Esto se puede lograr siguiendo la siguiente sintaxis:

~~~sql
SELECT dato1, (SELECT dato2 FROM tabla2)
FROM tabla1;
~~~

De esta forma podríamos referenciar los datos de la primera tabla referenciada en el from (fuera de los paréntesis) y entre los paréntesis llamamos otro dato a nuestra consulta.

Si en algún momento tenemos que hacer comparaciones que requieren del valor de otro select, podemos hacer lo siguiente:

Supongamos que tenemos que mostrar los sueldos de ciertos médicos donde estos sean mayores al promedio de los mismos, para eso haremos lo siguiente:

~~~sql
SELECT sueldo_base
FROM medico
WHERE sueldo_base > (select avg(sueldo_base) from medico);
~~~

En este caso tendríamos que hacer esto para que funcionara, esto no funcionaria si del otro lado lo que intentáramos hacer fuera:

~~~sql
SELECT sueldo_base
FROM medico
WHERE sueldo_base > avg(sueldo_base);
~~~

Puede que en algún momento podamos llegar a hacer algo similar a esto mas adelante, pero en este caso no nos funcionaria correctamente.

Algo que podemos hacer en un where a parte es comprobar la existencia o la no existencia de un dato en otra subcopnsulta, por ejemplo:

~~~sql
SELECT sueldo_base
FROM medico
WHERE sueldo_base in(SELECT dato1 FROM tabla1); -- si el dato se encuentra en esta tabla, se mostrara en el select
~~~

Por el otro lado:

~~~sql
SELECT sueldo_base
FROM medico
WHERE sueldo_base not in(SELECT dato1 FROM tabla1); -- si el dato NO se encuentra en esta tabla, se mostrara en el select
~~~

---

## Operadores "SET"

Estos operadores funcionan de una forma similar a los join, nos permiten tomar 2 select como si fueran tablas en si y interactuar con la diferencia que existe entre estos, esto por medio de una serie de reglas comunes que debemos ser consientes a la hora de utilizarlos.

Su sintaxis técnicamente es la siguiente:

~~~sql
-- tenemos nuestra "consulta 1"
SELECT -- aqui agregaremos los "as" que definiran la base de nuestra tabla final
FROM
WHERE
GROUP BY
HAVING

-- AQUI VA NUESTRO OPERADOR SET

-- tenemos nuestra "consulta 2"
SELECT
FROM
WHERE
GROUP BY
HAVING

ORDER BY -- al final del todo es donde debe ir si o si nuestro order by
~~~

Entonces podremos interactuar con los datos que hay en la consulta 1, la consulta 2 y los que hay en medio, dependiendo de si por ejemplo queremos todos los datos, solo los del medio, o solo los de un lado.

Otra regla importante a tomar en cuenta es la siguiente:

~~~sql
-- imaginemos que hicimos lo siguiente:
SELECT dato1, dato2
FROM tabla1

UNION

SELECT dato1, dato2
FROM tabla
~~~

La regla a la que hago referencia es que a la hora de ejecutar nuestra tabla la de abajo debe ser condicionada por la de abajo, osea que abajo no pueden haber mas o menos datos que en la de arriba.

Aun que algo que por ejemplo podemos hacer es:

~~~sql
-- imaginemos que hicimos lo siguiente:
SELECT dato1, dato2
FROM tabla1

UNION

SELECT dato1, 0 -- en este caso, todos los datos que obtenemos con esta consulta se rellenaran con 0 en el dato 2 de la tabla final
FROM tabla
~~~

 Y ya como ultimo antes de entrar con los operadores en si **recuerda que el "select" de arriba debe ser distinto al de abajo** por que los sets funcionan en parte gracias a esta diferencia, si no la hay técnicamente lo que estas haciendo es 1 select que cuesta mas en temas de rendimiento.

Los "operadores Set" son los siguientes:

+ Union: llama todos los datos de la tabla "a" y la tabla "b" (los datos repetidos solo tienen 1 instancia) el mas usado.

  ~~~sql
  SELECT dato_tabla_1 as "titulo 1", dato_tabla_2 as "titulo 2" -- solo el primer select lleva los alias
  FROM tabla1
  WHERE dato_tabla_2 <= 1
  UNION
  SELECT dato_tabla_1, dato_tabla_2
  FROM tabla1
  WHERE dato_tabla_2 >= 1
  ORDER BY 2;
  ~~~

  En este caso estamos por ejemplo llamando 2 tablas en base a datos distintos, en uno llamamos los datos que son menores o iguales al 1, mientras que en el otro llamaremos los datos mayores o iguales al 1, por lo que si en una tenemos por ejemplo los datos (-1,0,1) y en la otra (1,2,3) este nos devolvera los datos (-1,0,1,2,3).

  ---

+ Intersect: llama todos los datos de entre medio (que están en "a" y "b", pero no solo en "a" u solo en "b").

  Su utilidad principal es "llamar a los datos que tenemos en medio" por ejemplo:

  ~~~sql
  SELECT dato_tabla_1 as "titulo 1", dato_tabla_2 as "titulo 2" -- solo el primer select lleva los alias
  FROM tabla1
  WHERE dato_tabla_2 <= 1
  
  INTERSECT
  
  SELECT dato_tabla_1, dato_tabla_2
  FROM tabla1
  WHERE dato_tabla_2 >= 1
  ORDER BY 2; -- esto es para recordarte que los order by van al final de toda la sentencia sql
  ~~~
  
  En este caso lo que estamos haciendo es llamar nuevamente a los datos (-1,0,1) en una tabla y en la otra los datos (1,2,3), el intersect vera la intersección de estos, los datos que se comparten pero que no están separados según cada uno, en este caso solo será el (1).
  
  ---
  
+ Minus: llama 2 tablas y nos entregan los datos que están solo en "a", pero los que están en ("b") o ("a" y "b") se desechan.

  En el caso del minus las cosas son un poco distintas, en este recibimos los datos que están en una tabla, mientras que no están en la otra (ni siquiera los que se comparten), por ejemplo:

  ~~~sql
  SELECT dato_tabla_1 as "titulo 1", dato_tabla_2 as "titulo 2" -- solo el primer select lleva los alias
  FROM tabla1
  WHERE dato_tabla_2 <= 1
  
  MINUS
  
  SELECT dato_tabla_1, dato_tabla_2
  FROM tabla1
  WHERE dato_tabla_2 >= 1
  ~~~

  En este caso lo que hacemos es llamar nuevamente a los datos (-1,0,1) como la tabla "A" y por el otro lado a los datos (1,2,3) como la tabla "B", en este caso estamos haciendo "A" `MINUS` "B" por lo que como resultado nos quedarían los datos (-1, 0).

  Si fuera al revés ("B" `MINUS` "A") nos daría los datos (2,3).

  ---

+ Union all: llama todos los datos de la tabla "a" y la tabla "b" (muestra datos repetidos por cada tabla).

  Este técnicamente hablando es el hermano inútil del union, esto dado que su funcionalidad especial no es particularmente útil en gran cantidad de ocasiones.

  El mismo funciona exactamente igual al unión original, solo que en este caso nos va a entregar repetidos los datos que se encuentren en medio, por ejemplo:

  ~~~sql
  SELECT dato_tabla_1 as "titulo 1", dato_tabla_2 as "titulo 2" -- solo el primer select lleva los alias
  FROM tabla1
  WHERE dato_tabla_2 <= 1
  
  MINUS
  
  SELECT dato_tabla_1, dato_tabla_2
  FROM tabla1
  WHERE dato_tabla_2 >= 1
  ~~~

  En este caso nos estarían devolviendo los datos (-1,0,1,1,2,3), como veras el 1 se repite y es por que a este no le importa que haya un dato repetido lo agregara igualmente.

  ---

Como tema importante deben recordar que los "sets" son prescindibles, de hecho en varias ocasiones es mejor pasar de ellos por que estos afectan negativamente al rendimiento de nuestro código dado que tenemos que por ejemplo ejecutar la misma acción en múltiples ocasiones a demás de que en ocasiones es muchísimo mas rap[ido y fácil de hacer.

por ejemplo:

~~~sql
-- lo que con sets seria asi (este es un ejemplo aplicado a unas tablas ya existentes de mi parte):
SELECT c.nro_patente, anio, count(id_arriendo)
FROM camion c join arriendo_camion ac on(c.nro_patente = ac.nro_patente)
WHERE EXTRACT(YEAR FROM fecha_ini_arriendo) >= extract(year from sysdate) - 2
GROUP BY c.nro_patente, anio
UNION
SELECT nro_patente, anio, 0
FROM camion
WHERE nro_patente not in (select nro_patente from arriendo_camion WHERE EXTRACT(YEAR FROM fecha_ini_arriendo) >= extract(year from sysdate) - 2)

ORDER BY 1;

-- en otro orden de factores podemos por ejemplo cambiar ese union por un left join y se veria de la siguiente forma:
SELECT c.nro_patente, anio, count(id_arriendo)
FROM camion c LEFT JOIN arriendo_camion ac on(c.nro_patente = ac.nro_patente AND EXTRACT(YEAR FROM fecha_ini_arriendo) >= extract(year from sysdate) -2)
GROUP BY c.nro_patente, anio
ORDER BY 1;
~~~

Como veras hay muchísimo menos código pero en efecto ambos hacen exactamente lo mismo.

En caso que quieras cambiar por ejemplo un MINUS por otra cosa puedes por ejemplo seguir lo siguiente con subquerys:

~~~sql
-- este es lo mismo que un minus pero aplicado a otro ejemplo
SELECT med_run as "RUT MEDICO", upper(pnombre || ' ' || apaterno || ' ' || amaterno) as "NOMBRE MEDICO"
FROM medico
where med_run not in (SELECT med_run FROM atencion WHERE TO_CHAR(fecha_atencion, 'mm-yyyy') = &&fecha_definida)
ORDER BY 1;
~~~

En otro caso para imitar por ejemplo un INTERSECT debemos hacerlo de la siguiente forma con joins:

~~~sql
SELECT p.pac_run as "RUT PACIENTE", upper(pnombre || ' ' || apaterno || ' ' ||amaterno) as "NOMBRE PACIENTE", TO_CHAR(fecha_atencion, 'dd/mm/yyyy') as "FECHA_ATENCION"
FROM paciente p join atencion a on(p.pac_run = a.pac_run AND to_char(fecha_atencion, 'mm-yyyy') = &&fecha_Seleccionada)
ORDER BY 3;
~~~

A parte de estas hay otras muchisimas formas de hacer esto con de otras formas.

---

## DML

Los dml son "sentencias sql que nos permiten interactuar en si con las tablas ya existentes", desde editarlas hasta crearlas desde 0 hay varias y en nuestro caso nos interesan los siguientes:

+ Insertar datos en una tabla: Para esto usamos la sentencia `INSERT INTO` esta va antes de un select y nos permite ingresar en una tabla lo que sea que recibamos desde ese select.

  ~~~sql
  INSERT INTO tabla_en_la_Que_insertamos_los_Datos
  SELECT dato1
  FROM tabla1;
  ~~~

+ Actualizar datos en una tabla: Para esto usamos la sentencia `UPDATE SET` en la que seleccionamos la tabla a editar, la forma en la que editaremos nuestros datos y si queremos una condición con la que estos se editaran, por ejemplo:

  ~~~sql
  UPDATE tabla1
  SET dato_1 = dato_1 + 2000
  WHERE dato_1 < 1000;
  ~~~

  Lo que aquí hacemos es "en la tabla 1, todos los dato_1 que sean menores a 1000 le sumaremos 2000".

  Aquí un ejemplo mas "complejo y realista" se libre de explorar las formas en las que puedes editar y actualizar tablas:

  ~~~sql
  UPDATE camion
  SET valor_arriendo_dia = valor_arriendo_dia + 2000, categoria = 'A'
  WHERE nro_patente IN(SELECT nro_patente FROM resumen_camion WHERE cantidad_arriendos >= 10);
  ~~~

+ Crear tablas: Esto te lo pasara la profe, no te preocupes, en medio de la prueba la profe entregara un codigo que va a crear esto, no debes preocuparte de mas.

---

  
