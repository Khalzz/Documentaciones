-- ejercicios
-- ejercicio 1
SET SERVEROUTPUT ON;
DECLARE
    v_digito NUMBER := &DIGITO;
    v_total NUMBER;
BEGIN
    SELECT COUNT(nro_patente)
    INTO v_total
    FROM camion
    WHERE nro_patente LIKE '%' || v_digito;
    DBMS_OUTPUT.PUT_LINE('total de camiones con una patente terminada en ' || v_digito || ' es ' || v_total);
END;


-- ejercicio 2
-- creacion de tabla
CREATE TABLE revisiontecnica (
    digito NUMBER PRIMARY KEY,
    total_camiones NUMBER NOT NULL
);

-- creacion de bloques
DECLARE
    v_total NUMBER;
BEGIN
    FOR v_digito IN 0 .. 9 LOOP
        SELECT COUNT(nro_patente)
        INTO v_total
        FROM camion
        WHERE nro_patente LIKE '%' || v_digito;
        
        -- insertar en la tabla
        INSERT INTO revisiontecnica
        VALUES (v_digito, v_total);
    END LOOP;
END;

DROP TABLE revisiontecnica;

-- prueba con while
-- creacion de bloques
DECLARE
    v_total NUMBER;
    v_digito NUMBER;
BEGIN
    WHILE v_digito <= 9 LOOP
        SELECT COUNT(nro_patente)
        INTO v_total
        FROM camion
        WHERE nro_patente LIKE '%' || v_digito;
        
        -- insertar en la tabla
        INSERT INTO revisiontecnica
        VALUES (v_digito, v_total);
        v_digito := v_digito + 1;
    END LOOP;
END;

-- EJERCICIO 3
DECLARE
    v_marca marca.nombre_marca%TYPE := &MARCA;
    v_total NUMBER;
    v_mas_antiguo NUMBER;
BEGIN
    -- obtener el año minimo de la marca
    SELECT MIN(anio)
    INTO v_mas_antiguo
    FROM camion c join marca m ON(c.id_marca = m.id_marca)
    WHERE UPPER(nombre_marca) = UPPER(v_marca);
    
    SELECT COUNT(nro_patente)
    INTO v_total
    FROM camion c JOIN marca m ON(c.id_marca = m.id_marca)
    WHERE UPPER(nombre_marca) = UPPER(v_marca);
    
    DBMS_OUTPUT.PUT_LINE('total de camiones mas viejos de la marca ' || v_marca || ' son ' || v_total || ' y son del año: ' || v_mas_antiguo);
END;