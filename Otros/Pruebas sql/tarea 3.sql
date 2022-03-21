-- ejemplo 1

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    -- a las variables con ampersam tambien se les conoce como "variables vim"
    v_proporcion NUMBER(5,2) := &PROPORCION; -- PARA QUE UN NUMBER TRABAJE CON DECUMALES DEBEMOS USAR ESTO
    v_comuna cliente.codcomuna%TYPE := &COD_COMUNA;
BEGIN
    -- ACTUALIZAR EL CREDITO DE LOS CLIENTES DE UNA DETERMINADA COMUNA
    UPDATE cliente
    SET credito = credito*(1 + v_proporcion)
    WHERE codcomuna = v_comuna;
    -- IMPRIMIR LA CANTIDAD DE REGISTROS ACTUALIZADOS
    
    -- HAY UNA PROPIEDAD QUE DEVUELVE LOS REGISTROS ACTUALIZADOS, INSERTADOS, ETC...
    DBMS_OUTPUT.PUT_LINE('TOTAL DE REGISTROS ACTUALIZADOS ES ' || SQL%ROWCOUNT);
    -- ROWCOUNT cuenta las "filas actualizadas" (agregadas, actualizadas o eliminadas)
    DECLARE
        v_nro_factura detalle_factura.numfactura%TYPE := &NRO_FACTURA;
    BEGIN
        DELETE FROM detalle_factura
        WHERE numfactura = v_nro_factura;
        
        IF SQL%FOUND THEN -- SQL FOUND REVISA SI EL DML ANTERIOR RESULTA SER EXCITOSO O NO
            DBMS_OUTPUT.PUT_LINE('CANTIDAD DE REGISTROS ELIMINADOS ES ' || SQL%ROWCOUNT);
        ELSE
            DBMS_OUTPUT.PUT_LINE('NO HAN HABIDO REGISTROS ELIMINADOS');
        END IF;
    END;
END;

-- EJERCICIO 2
-- CREATE TABLE
CREATE TABLE resumenciudad(
    cod_ciudad NUMBER PRIMARY KEY,
    total_comunas NUMBER NOT NULL
);

DECLARE
    v_codciudad comuna.codciudad%TYPE := &COD_CIUDAD;
    v_total NUMBER;
BEGIN
    SELECT COUNT(codcomuna)
    INTO v_total
    FROM comuna
    WHERE codciudad = v_codciudad;
    
    INSERT INTO resumenciudad
    VALUES(v_codciudad, v_total);
END;