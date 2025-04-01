USE mi_base_datos;

-- Aquí irán los eventos
DELIMITER //

CREATE EVENT ejemplo_evento
ON SCHEDULE EVERY 1 DAY
DO BEGIN
    -- Lógica del evento
    SELECT 'Evento ejecutado';
END //

DELIMITER ; 