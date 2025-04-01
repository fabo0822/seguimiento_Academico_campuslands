USE mi_base_datos;

-- Aquí irán los procedimientos almacenados
DELIMITER //

CREATE PROCEDURE ejemplo_procedimiento()
BEGIN
    SELECT 'Ejemplo de procedimiento';
END //

DELIMITER ; 