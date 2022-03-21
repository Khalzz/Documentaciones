-- creacion de bloques anonimos

-- ejercicio 1
SET SERVEROUTPUT ON -- encendemos el "output del servidor"
-- esto se usa para poder ver lo que ejecutamos en el bloque

DECLARE -- aqui declaramos variables
    v_total NUMBER; -- este es un int
BEGIN -- aqui ejecutamos nuestra seleccion de datos yo codigo
-- OBTENER TOTAL DE CLIENTES
    SELECT COUNT(rutcliente)
    INTO v_total -- esto significa "donde se guarda el resultado del select" (en una variable) 
    FROM cliente;
    
-- IMPRIMIR TOTAL DE CLIENTES
    DBMS_OUTPUT.PUT_LINE('TOTAL DE CLIENTES' || v_total);
END;

-- ejercicio 2
DECLARE
    -- podemos tener varias variables en 1 declaracion0 
    valor_min NUMBER;
    valor_max NUMBER;
BEGIN
    -- cuando nos piden varios elementos podemos hacer lo siguiente:
    SELECT max(valorpeso), MIN(valorPeso)
    INTO valor_max, valor_min
    FROM producto;
    
    -- imprimir valores
    DBMS_OUTPUT.PUT_LINE('Valor minimo = ' || valor_min);
    DBMS_OUTPUT.PUT_LINE('Valor maximo =' || valor_max );
END;

-- ejercicio 3
DECLARE
    -- esta forma nos permite ingresar valores con el mismo tipo de dato aparecido en la tabla
    c_nombre cliente.nombre%TYPE;
    c_direccion cliente.nombre%TYPE;
    -- si en el select tenemos datos traidos de funciones, estos no van a funcionar
BEGIN
    -- OBTENER NOMBRE Y DIRECCION DE CLIENTE EPECIFICO
    SELECT nombre, direccion
    INTO c_nombre, c_direccion -- el into debe estar en orden segun las variables y datos del select
    FROM cliente
    WHERE rutcliente = '44567891-4';
    DBMS_OUTPUT.PUT_LINE('Nombre = ' || c_nombre );
    DBMS_OUTPUT.PUT_LINE('Direccion = ' || c_direccion );
END;

-- ejercio 4
SET VERIFY OFF -- esto "apaga" el que se escriba el codigo cuando haya una variable de sustitucion entre medias
DECLARE
    -- OPERADOR DE ASIGNACION := (variable de sustitucion)
    v_periodo VARCHAR2(7) := &PERIODO; -- creamos un varchar con un largo de 7 igual al input del usuario
    -- al ser un varchar cuando ingresamos datos estos deben llevar comillas
    
    v_total NUMBER; -- aqui guardamos el resultado de todo
BEGIN
    SELECT count(numfactura)
    INTO v_total
    FROM factura
    WHERE TO_CHAR(fecha, 'MM-YYYY') = v_periodo;
    DBMS_OUTPUT.PUT_LINE('Total de facturas el = ' || v_periodo || ' es ' || v_total);
END;