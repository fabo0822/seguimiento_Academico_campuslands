-- 1. Registrar un nuevo camper con toda su información personal y estado inicial.
DELIMITER //
CREATE PROCEDURE registrar_camper(
    IN p_identificacion VARCHAR(20),
    IN p_nombres VARCHAR(50),
    IN p_apellidos VARCHAR(50),
    IN p_direccion VARCHAR(100),
    IN p_estado_id INT,
    IN p_nivel_riesgo_id INT,
    IN p_sede_id INT,
    IN p_acudiente_id INT
)
BEGIN
    INSERT INTO campers (identificacion, nombres, apellidos, direccion, estado_id, nivel_riesgo_id, sede_id, acudiente_id)
    VALUES (p_identificacion, p_nombres, p_apellidos, p_direccion, p_estado_id, p_nivel_riesgo_id, p_sede_id, p_acudiente_id);
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL registrar_camper('1006454347', 'Juan', 'Pérez', 'Calle 10 #23-45', 1, 2, 1, 1);

-- 2. Actualizar el estado de un camper luego de completar el proceso de ingreso.
DELIMITER //
CREATE PROCEDURE actualizar_estado_camper(
    IN p_camper_id INT,
    IN p_nuevo_estado_id INT
)
BEGIN
    UPDATE campers
    SET estado_id = p_nuevo_estado_id
    WHERE id = p_camper_id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL actualizar_estado_camper(1, 2);  -- Cambiar el estado del camper con ID 1 a 'Inscrito'

-- 3. Procesar la inscripción de un camper a una ruta específica.
DELIMITER //
CREATE PROCEDURE procesar_inscripcion(
    IN p_camper_id INT,
    IN p_ruta_id INT,
    IN p_fecha_inicio DATE
)
BEGIN
    INSERT INTO matriculas (camper_id, ruta_id, fecha_inicio)
    VALUES (p_camper_id, p_ruta_id, p_fecha_inicio);
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL procesar_inscripcion(1, 2, '2023-10-01');  -- Inscribir al camper con ID 1 en la ruta con ID 2

-- 4. Registrar una evaluación completa (teórica, práctica y quizzes) para un camper.
DELIMITER //
CREATE PROCEDURE registrar_evaluacion(
    IN p_camper_id INT,
    IN p_modulo_id INT,
    IN p_nota_teorica DECIMAL(5,2),
    IN p_nota_practica DECIMAL(5,2),
    IN p_nota_trabajos DECIMAL(5,2)
)
BEGIN
    DECLARE p_nota_final DECIMAL(5,2);
    SET p_nota_final = (p_nota_teorica * 0.3) + (p_nota_practica * 0.5) + (p_nota_trabajos * 0.2);
    
    INSERT INTO evaluaciones (camper_id, modulo_id, nota_teorica, nota_practica, nota_trabajos, nota_final, fecha_evaluacion)
    VALUES (p_camper_id, p_modulo_id, p_nota_teorica, p_nota_practica, p_nota_trabajos, p_nota_final, CURDATE());
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL registrar_evaluacion(1, 1, 85.00, 90.00, 80.00);  -- Registrar evaluación para el camper con ID 1 en el módulo con ID 1

-- 5. Calcular y registrar automáticamente la nota final de un módulo.
DELIMITER //
CREATE PROCEDURE calcular_nota_final(
    IN p_evaluacion_id INT
)
BEGIN
    DECLARE p_nota_teorica DECIMAL(5,2);
    DECLARE p_nota_practica DECIMAL(5,2);
    DECLARE p_nota_trabajos DECIMAL(5,2);
    DECLARE p_nota_final DECIMAL(5,2);
    
    SELECT nota_teorica, nota_practica, nota_trabajos INTO p_nota_teorica, p_nota_practica, p_nota_trabajos
    FROM evaluaciones
    WHERE id = p_evaluacion_id;

    SET p_nota_final = (p_nota_teorica * 0.3) + (p_nota_practica * 0.5) + (p_nota_trabajos * 0.2);
    
    UPDATE evaluaciones
    SET nota_final = p_nota_final
    WHERE id = p_evaluacion_id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL calcular_nota_final(1);  -- Calcular la nota final para la evaluación con ID 1

-- 6. Asignar campers aprobados a una ruta de acuerdo con la disponibilidad del área.
DELIMITER //
CREATE PROCEDURE asignar_camper_a_ruta(
    IN p_camper_id INT,
    IN p_ruta_id INT
)
BEGIN
    DECLARE p_area_id INT;
    SELECT area_id INTO p_area_id FROM rutas WHERE id = p_ruta_id;

    IF (SELECT COUNT(*) FROM camper_area WHERE area_id = p_area_id) < (SELECT capacidad FROM area WHERE id = p_area_id) THEN
        INSERT INTO camper_area (camper_id, area_id, fecha_inicio)
        VALUES (p_camper_id, p_area_id, CURDATE());
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay disponibilidad en el área asignada.';
    END IF;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL asignar_camper_a_ruta(1, 2);  -- Asignar al camper con ID 1 a la ruta con ID 2

-- 7. Asignar un trainer a una ruta y área específica, validando el horario.
DELIMITER //
CREATE PROCEDURE asignar_trainer(
    IN p_trainer_id INT,
    IN p_ruta_id INT,
    IN p_area_id INT,
    IN p_horario_id INT
)
BEGIN
    DECLARE p_horario_ocupado INT;
    SELECT COUNT(*) INTO p_horario_ocupado
    FROM asignaciones_trainer
    WHERE area_id = p_area_id AND horario_id = p_horario_id;

    IF p_horario_ocupado = 0 THEN
        INSERT INTO asignaciones_trainer (trainer_id, ruta_id, area_id, horario_id)
        VALUES (p_trainer_id, p_ruta_id, p_area_id, p_horario_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El horario ya está ocupado.';
    END IF;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL asignar_trainer(1, 2, 1, 1);  -- Asignar el trainer con ID 1 a la ruta con ID 2 y área con ID 1

-- 8. Registrar una nueva ruta con sus módulos y SGDB asociados.
DELIMITER //
CREATE PROCEDURE registrar_ruta(
    IN p_nombre VARCHAR(100),
    IN p_sgdb_id INT,
    IN p_modulos TEXT
)
BEGIN
    DECLARE p_ruta_id INT;
    
    INSERT INTO rutas (nombre, sgdb_id) VALUES (p_nombre, p_sgdb_id);
    SET p_ruta_id = LAST_INSERT_ID();
    
    -- Asumimos que p_modulos es una lista de IDs de módulos separados por comas
    SET @sql = CONCAT('INSERT INTO ruta_modulo (ruta_id, modulo_id) VALUES ', p_modulos);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL registrar_ruta('Ruta de Ejemplo', 1, '1,2,3');  -- Registrar una nueva ruta con ID de SGDB 1 y módulos 1, 2, 3

-- 9. Registrar una nueva área de entrenamiento con su capacidad y horarios.
DELIMITER //
CREATE PROCEDURE registrar_area(
    IN p_nombre VARCHAR(100),
    IN p_capacidad INT,
    IN p_horarios TEXT
)
BEGIN
    DECLARE p_area_id INT;
    
    INSERT INTO area (nombre, capacidad) VALUES (p_nombre, p_capacidad);
    SET p_area_id = LAST_INSERT_ID();
    
    -- Asumimos que p_horarios es una lista de horarios separados por comas
    SET @sql = CONCAT('INSERT INTO horarios (hora_inicio, hora_fin) VALUES ', p_horarios);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL registrar_area('Área de Ejemplo', 30, '08:00-10:00,10:00-12:00');  -- Registrar un área con capacidad 30 y horarios

-- 10. Consultar disponibilidad de horario en un área determinada.
DELIMITER //
CREATE PROCEDURE consultar_disponibilidad_horario(
    IN p_area_id INT,
    IN p_horario_id INT
)
BEGIN
    SELECT COUNT(*) AS ocupacion
    FROM asignaciones_trainer
    WHERE area_id = p_area_id AND horario_id = p_horario_id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL consultar_disponibilidad_horario(1, 1);  -- Consultar disponibilidad del horario con ID 1 en el área con ID 1

-- 11. Reasignar a un camper a otra ruta en caso de bajo rendimiento.
DELIMITER //
CREATE PROCEDURE reasignar_camper(
    IN p_camper_id INT,
    IN p_nueva_ruta_id INT
)
BEGIN
    DELETE FROM matriculas WHERE camper_id = p_camper_id;
    INSERT INTO matriculas (camper_id, ruta_id, fecha_inicio) VALUES (p_camper_id, p_nueva_ruta_id, CURDATE());
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL reasignar_camper(1, 3);  -- Reasignar al camper con ID 1 a la nueva ruta con ID 3

-- 12. Cambiar el estado de un camper a "Graduado" al finalizar todos los módulos.
DELIMITER //
CREATE PROCEDURE cambiar_estado_a_graduado(
    IN p_camper_id INT
)
BEGIN
    UPDATE campers
    SET estado_id = (SELECT id FROM estados WHERE nombre = 'Graduado')
    WHERE id = p_camper_id AND NOT EXISTS (
        SELECT * FROM evaluaciones e WHERE e.camper_id = p_camper_id AND e.nota_final < 60
    );
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL cambiar_estado_a_graduado(1);  -- Cambiar el estado del camper con ID 1 a 'Graduado'

-- 13. Consultar y exportar todos los datos de rendimiento de un camper.
DELIMITER //
CREATE PROCEDURE consultar_datos_rendimiento(
    IN p_camper_id INT
)
BEGIN
    SELECT c.nombres, c.apellidos, m.nombre AS modulo, e.nota_final
    FROM campers c
    INNER JOIN evaluaciones e ON c.id = e.camper_id
    INNER JOIN modulos m ON e.modulo_id = m.id
    WHERE c.id = p_camper_id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL consultar_datos_rendimiento(1);  -- Consultar rendimiento del camper con ID 1

-- 14. Registrar la asistencia a clases por área y horario.
DELIMITER //
CREATE PROCEDURE registrar_asistencia(
    IN p_camper_id INT,
    IN p_area_id INT,
    IN p_horario_id INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO asistencia (camper_id, area_id, horario_id, fecha)
    VALUES (p_camper_id, p_area_id, p_horario_id, p_fecha);
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL registrar_asistencia(1, 1, 1, '2023-10-15');  -- Registrar asistencia del camper con ID 1 en el área con ID 1 y horario con ID 1

-- 15. Generar reporte mensual de notas por ruta.
DELIMITER //
CREATE PROCEDURE reporte_mensual_notas(
    IN p_ruta_id INT,
    IN p_mes INT,
    IN p_anio INT
)
BEGIN
    SELECT c.nombres, c.apellidos, AVG(e.nota_final) AS promedio_nota
    FROM campers c
    INNER JOIN matriculas m ON c.id = m.camper_id
    INNER JOIN evaluaciones e ON c.id = e.camper_id
    WHERE m.ruta_id = p_ruta_id AND MONTH(e.fecha_evaluacion) = p_mes AND YEAR(e.fecha_evaluacion) = p_anio
    GROUP BY c.id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL reporte_mensual_notas(2, 10, 2023);  -- Generar reporte de notas para la ruta con ID 2 en octubre de 2023

-- 16. Validar y registrar la asignación de un salón a una ruta sin exceder la capacidad.
DELIMITER //
CREATE PROCEDURE asignar_salon_a_ruta(
    IN p_ruta_id INT,
    IN p_salon_id INT
)
BEGIN
    DECLARE p_capacidad INT;
    DECLARE p_ocupacion INT;

    SELECT capacidad INTO p_capacidad FROM salones WHERE id = p_salon_id;
    SELECT COUNT(*) INTO p_ocupacion FROM matriculas WHERE ruta_id = p_ruta_id;

    IF p_ocupacion < p_capacidad THEN
        INSERT INTO ruta_salon (ruta_id, salon_id) VALUES (p_ruta_id, p_salon_id);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El salón está lleno.';
    END IF;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL asignar_salon_a_ruta(2, 1);  -- Asignar el salón con ID 1 a la ruta con ID 2

-- 17. Registrar cambio de horario de un trainer.
DELIMITER //
CREATE PROCEDURE cambiar_horario_trainer(
    IN p_trainer_id INT,
    IN p_nuevo_horario_id INT
)
BEGIN
    UPDATE asignaciones_trainer
    SET horario_id = p_nuevo_horario_id
    WHERE trainer_id = p_trainer_id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL cambiar_horario_trainer(1, 2);  -- Cambiar el horario del trainer con ID 1 al horario con ID 2

-- 18. Eliminar la inscripción de un camper a una ruta (en caso de retiro).
DELIMITER //
CREATE PROCEDURE eliminar_inscripcion(
    IN p_camper_id INT,
    IN p_ruta_id INT
)
BEGIN
    DELETE FROM matriculas
    WHERE camper_id = p_camper_id AND ruta_id = p_ruta_id;
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL eliminar_inscripcion(1, 2);  -- Eliminar la inscripción del camper con ID 1 en la ruta con ID 2

-- 19. Recalcular el estado de todos los campers según su rendimiento acumulado.
DELIMITER //
CREATE PROCEDURE recalcular_estado_campers()
BEGIN
    UPDATE campers c
    SET estado_id = (CASE
        WHEN (SELECT AVG(e.nota_final) FROM evaluaciones e WHERE e.camper_id = c.id) < 60 THEN (SELECT id FROM estados WHERE nombre = 'Retirado')
        ELSE (SELECT id FROM estados WHERE nombre = 'Aprobado')
    END);
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL recalcular_estado_campers();  -- Recalcular el estado de todos los campers

-- 20. Asignar horarios automáticamente a trainers disponibles según sus áreas.
DELIMITER //
CREATE PROCEDURE asignar_horarios_trainers()
BEGIN
    INSERT INTO asignaciones_trainer (trainer_id, ruta_id, area_id, horario_id)
    SELECT t.id, r.id, a.id, h.id
    FROM trainers t
    CROSS JOIN rutas r
    CROSS JOIN area a
    CROSS JOIN horarios h
    WHERE NOT EXISTS (
        SELECT 1 FROM asignaciones_trainer at
        WHERE at.trainer_id = t.id AND at.horario_id = h.id
    );
END //
DELIMITER ;

-- Ejemplo de uso:
-- CALL asignar_horarios_trainers();  -- Asignar horarios automáticamente a trainers disponibles
