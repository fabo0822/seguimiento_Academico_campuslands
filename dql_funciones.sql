USE mi_base_datos;

-- Aquí irán las funciones
DELIMITER //

CREATE FUNCTION ejemplo_funcion() 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN 'Ejemplo de función';
END //

DELIMITER ; 