USE mi_base_datos;

-- Aquí irán los triggers
DELIMITER //

CREATE TRIGGER ejemplo_trigger
BEFORE INSERT ON ejemplo
FOR EACH ROW
BEGIN
    SET NEW.nombre = UPPER(NEW.nombre);
END //

DELIMITER ; 