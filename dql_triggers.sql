DELIMITER //

-- 1 Trigger para calcular automáticamente la nota final al insertar una evaluación
CREATE TRIGGER calcular_nota_final
BEFORE INSERT ON evaluaciones
FOR EACH ROW
BEGIN
    SET NEW.nota_final = (NEW.nota_teorica + NEW.nota_practica + NEW.nota_trabajos) / 3;
END;
//

DELIMITER ;

--  Ejemplo de inserción de evaluación
INSERT INTO evaluaciones (camper_id, modulo_id, nota_teorica, nota_practica, nota_trabajos) 
VALUES (1, 1, 75, 80, 90);  -- Inserta una evaluación
-- Verificación de la nota final
SELECT nota_final FROM evaluaciones WHERE camper_id = 1;  -- Asegúrate de que el ID corresponda a una evaluación existente

DELIMITER //

-- 2 Trigger para verificar si el camper aprueba o reprueba al actualizar la nota final
CREATE TRIGGER verificar_aprobacion
AFTER UPDATE ON evaluaciones
FOR EACH ROW
BEGIN
    DECLARE nuevo_estado_id INT;  -- 3

    IF NEW.nota_final >= 60 THEN
        SET nuevo_estado_id = (SELECT id FROM estados WHERE nombre = 'Aprobado');  -- 4
    ELSE
        SET nuevo_estado_id = (SELECT id FROM estados WHERE nombre = 'Reprobado');  -- 5
    END IF;

    -- Actualiza el estado del camper  -- 6
    UPDATE campers SET estado_id = nuevo_estado_id WHERE id = NEW.camper_id;  -- 7

    -- Inserta un registro en la tabla campers_estados  -- 8
    INSERT INTO campers_estados (camper_id, estado_id, fecha_cambio)
    VALUES (NEW.camper_id, nuevo_estado_id, CURDATE());  -- 9
END;
//

DELIMITER ;

--   Ejemplo de actualización de evaluación
UPDATE evaluaciones
SET nota_teorica = 50, nota_practica = 40, nota_trabajos = 30
WHERE id = 1;  -- Asegúrate de que el ID corresponda a una evaluación existente
-- Verificación del estado del camper
SELECT estado_id FROM campers WHERE id = (SELECT camper_id FROM evaluaciones WHERE id = 1);  -- Asegúrate de que el ID corresponda a un camper existente

DELIMITER //

--  3 Trigger para cambiar el estado del camper a "Inscrito" al insertar una inscripción
CREATE TRIGGER cambiar_estado_inscripcion
AFTER INSERT ON matriculas
FOR EACH ROW
BEGIN
    UPDATE campers SET estado_id = (SELECT id FROM estados WHERE nombre = 'Inscrito') WHERE id = NEW.camper_id;  -- 10
END;
//

DELIMITER ;

-- Ejemplo de inserción de inscripción
INSERT INTO matriculas (camper_id, ruta_id, fecha_inicio, fecha_fin)
VALUES (1, 1, '2023-01-01', '2023-12-31');  -- Inserta una inscripción
-- Verificación del estado del camper
SELECT estado_id FROM campers WHERE id = 1;  -- Asegúrate de que el ID corresponda a un camper existente

DELIMITER //

-- 4 Trigger para recalcular el promedio inmediatamente al actualizar una evaluación
CREATE TRIGGER recalcular_promedio
AFTER UPDATE ON evaluaciones
FOR EACH ROW
BEGIN
    DECLARE nota_final DECIMAL(5,2);  -- 11
    SET nota_final = (NEW.nota_teorica + NEW.nota_practica + NEW.nota_trabajos) / 3;  -- 12
    UPDATE evaluaciones SET nota_final = nota_final WHERE id = NEW.id;  -- Asegúrate de que 'id' sea la clave primaria de la tabla  -- 13
END;
//

DELIMITER ;

-- Ejemplo de actualización de evaluación
UPDATE evaluaciones
SET nota_teorica = 70, nota_practica = 80, nota_trabajos = 90
WHERE id = 1;  -- Asegúrate de que el ID corresponda a una evaluación existente
-- Verificación de la nota final
SELECT nota_final FROM evaluaciones WHERE id = 1;  -- Asegúrate de que el ID corresponda a una evaluación existente

DELIMITER //

-- 5 Trigger para marcar al camper como "Retirado" al eliminar una inscripción
CREATE TRIGGER marcar_retirado
AFTER DELETE ON matriculas
FOR EACH ROW
BEGIN
    UPDATE campers SET estado_id = (SELECT id FROM estados WHERE nombre = 'Retirado') WHERE id = OLD.camper_id;  -- 14
END;
//

DELIMITER ;

-- Ejemplo de eliminación de inscripción
DELETE FROM matriculas WHERE camper_id = 1 AND ruta_id = 1;  -- Asegúrate de que el ID corresponda a una inscripción existente
-- Verificación del estado del camper
SELECT estado_id FROM campers WHERE id = 1;  -- Asegúrate de que el ID corresponda a un camper existente

DELIMITER //

-- 6 Trigger para registrar automáticamente el SGDB asociado al insertar un nuevo módulo
CREATE TRIGGER registrar_sgdb
AFTER INSERT ON modulos
FOR EACH ROW
BEGIN
    INSERT INTO tecnologias (nombre, descripcion) VALUES (CONCAT('SGDB de ', NEW.nombre), 'SGDB asociado al módulo ' + NEW.nombre);  -- 15
END;
//

DELIMITER ;

-- Ejemplo de inserción de módulo
INSERT INTO modulos (nombre, descripcion) VALUES ('Módulo de Programación', 'Descripción del módulo de programación');  -- Inserta un nuevo módulo
-- Verificación de la tabla de tecnologías
SELECT * FROM tecnologias WHERE nombre LIKE 'SGDB de Módulo de Programación%';  -- Verifica que el SGDB se haya creado

DELIMITER //

--  7 Trigger para verificar duplicados por identificación al insertar un nuevo trainer
CREATE TRIGGER verificar_duplicado_trainer
BEFORE INSERT ON trainers
FOR EACH ROW
BEGIN
    DECLARE duplicado INT;  -- 16
    SELECT COUNT(*) INTO duplicado FROM trainers WHERE identificacion = NEW.identificacion;  -- 17
    IF duplicado > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El trainer ya existe con esa identificación.';  -- 18
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de inserción de trainer
INSERT INTO trainers (identificacion, nombres, apellidos) VALUES ('123456789', 'Juan', 'Pérez');  -- Inserta un nuevo trainer
-- Verificación de la tabla de trainers
SELECT * FROM trainers WHERE identificacion = '123456789';  -- Verifica que el trainer se haya creado

DELIMITER //

-- 8 Trigger para validar que no exceda la capacidad al asignar un área
CREATE TRIGGER validar_capacidad_area
BEFORE INSERT ON camper_area
FOR EACH ROW
BEGIN
    DECLARE capacidad_actual INT;  -- 19
    SELECT COUNT(*) INTO capacidad_actual FROM camper_area WHERE area_id = NEW.area_id;  -- 20
    IF capacidad_actual >= (SELECT capacidad FROM area WHERE id = NEW.area_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Capacidad del área excedida.';  -- 21
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de inserción en camper_area
INSERT INTO camper_area (camper_id, area_id) VALUES (1, 1);  -- Asegúrate de que el ID corresponda a un camper y un área existentes
-- Verificación de la capacidad
SELECT * FROM camper_area WHERE area_id = 1;  -- Verifica que el camper se haya asignado al área

DELIMITER //

-- 9 Trigger para marcar al camper como "Bajo rendimiento" al insertar una evaluación con nota < 60
CREATE TRIGGER marcar_bajo_rendimiento
AFTER INSERT ON evaluaciones
FOR EACH ROW
BEGIN
    IF NEW.nota_final < 60 THEN
        UPDATE campers SET estado_id = (SELECT id FROM estados WHERE nombre = 'Bajo rendimiento') WHERE id = NEW.camper_id;  -- 22
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de inserción de evaluación con baja nota
INSERT INTO evaluaciones (camper_id, modulo_id, nota_teorica, nota_practica, nota_trabajos) VALUES (1, 1, 40, 50, 30);  -- Inserta una evaluación
-- Verificación del estado del camper
SELECT estado_id FROM campers WHERE id = 1;  -- Asegúrate de que el ID corresponda a un camper existente

DELIMITER //

-- 10 Trigger para mover registro a la tabla de egresados al cambiar el estado a "Graduado"
CREATE TRIGGER mover_a_egresados
AFTER UPDATE ON campers
FOR EACH ROW
BEGIN
    IF NEW.estado_id = (SELECT id FROM estados WHERE nombre = 'Graduado') THEN
        INSERT INTO egresados (camper_id, fecha_graduacion) VALUES (NEW.id, CURDATE());  -- 23
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de actualización del estado del camper
UPDATE campers SET estado_id = (SELECT id FROM estados WHERE nombre = 'Graduado') WHERE id = 1;  -- Asegúrate de que el ID corresponda a un camper existente
-- Verificación de la tabla de egresados
SELECT * FROM egresados WHERE camper_id = 1;  -- Verifica que el registro se haya creado

DELIMITER //

-- 11 Trigger para verificar solapamiento de horarios al modificar horarios de trainer
CREATE TRIGGER verificar_solapamiento_horarios
BEFORE UPDATE ON horarios
FOR EACH ROW
BEGIN
    DECLARE solapamiento INT;  -- 24
    SELECT COUNT(*) INTO solapamiento FROM asignaciones_trainer WHERE horario_id != NEW.id AND (hora_inicio < NEW.hora_fin AND hora_fin > NEW.hora_inicio);  -- 25
    IF solapamiento > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El horario se solapa con otra asignación.';  -- 26
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de actualización de horarios
UPDATE horarios SET hora_inicio = '10:00:00', hora_fin = '12:00:00' WHERE id = 1;  -- Asegúrate de que el ID corresponda a un horario existente
-- Verificación de solapamiento
SELECT * FROM asignaciones_trainer WHERE horario_id = 1;  -- Verifica que no haya solapamientos

DELIMITER //

-- 12 Trigger para liberar horarios y rutas asignadas al eliminar un trainer
CREATE TRIGGER liberar_horarios_y_rutas
AFTER DELETE ON trainers
FOR EACH ROW
BEGIN
    DELETE FROM asignaciones_trainer WHERE trainer_id = OLD.id;  -- 27
END;
//

DELIMITER ;

-- Ejemplo de eliminación de trainer
DELETE FROM trainers WHERE id = 1;  -- Asegúrate de que el ID corresponda a un trainer existente
-- Verificación de la tabla de asignaciones
SELECT * FROM asignaciones_trainer WHERE trainer_id = 1;  -- Verifica que las asignaciones se hayan eliminado

DELIMITER //

-- 13 Trigger para actualizar automáticamente los módulos al cambiar la ruta de un camper
CREATE TRIGGER actualizar_modulos_camper
AFTER UPDATE ON matriculas
FOR EACH ROW
BEGIN
    UPDATE evaluaciones SET modulo_id = (SELECT modulo_id FROM ruta_modulo WHERE ruta_id = NEW.ruta_id) WHERE camper_id = NEW.camper_id;  -- 28
END;
//

DELIMITER ;

-- Ejemplo de actualización de matrícula
UPDATE matriculas SET ruta_id = 2 WHERE camper_id = 1;  -- Asegúrate de que el ID corresponda a una matrícula existente
-- Verificación de la tabla de evaluaciones
SELECT * FROM evaluaciones WHERE camper_id = 1;  -- Verifica que los módulos se hayan actualizado

DELIMITER //

-- 14 Trigger para verificar si ya existe un camper por número de documento al insertar un nuevo camper
CREATE TRIGGER verificar_existencia_camper
BEFORE INSERT ON campers
FOR EACH ROW
BEGIN
    DECLARE existe INT;  -- 29
    SELECT COUNT(*) INTO existe FROM campers WHERE identificacion = NEW.identificacion;  -- 30
    IF existe > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El camper ya existe con ese número de documento.';  -- 31
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de inserción de camper
INSERT INTO campers (identificacion, nombres, apellidos) VALUES ('123456789', 'Juan', 'Pérez');  -- Inserta un nuevo camper
-- Verificación de la tabla de campers
SELECT * FROM campers WHERE identificacion = '123456789';  -- Verifica que el camper se haya creado

DELIMITER //

-- 15 Trigger para recalcular el estado del módulo automáticamente al actualizar la nota final
CREATE TRIGGER recalcular_estado_modulo
AFTER UPDATE ON evaluaciones
FOR EACH ROW
BEGIN
    IF NEW.nota_final >= 60 THEN
        UPDATE modulos SET estado = 'Aprobado' WHERE id = NEW.modulo_id;  -- 32
    ELSE
        UPDATE modulos SET estado = 'Reprobado' WHERE id = NEW.modulo_id;  -- 33
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de actualización de evaluación
UPDATE evaluaciones SET nota_final = 65 WHERE id = 1;  -- Asegúrate de que el ID corresponda a una evaluación existente
-- Verificación del estado del módulo
SELECT estado FROM modulos WHERE id = (SELECT modulo_id FROM evaluaciones WHERE id = 1);  -- Verifica que el estado se haya actualizado

DELIMITER //

-- 16 Trigger para verificar que el trainer tenga el conocimiento al asignar un módulo
CREATE TRIGGER verificar_conocimiento_trainer
BEFORE INSERT ON asignaciones_trainer
FOR EACH ROW
BEGIN
    DECLARE tiene_conocimiento INT;  -- 34
    SELECT COUNT(*) INTO tiene_conocimiento FROM trainer_tecnologia WHERE trainer_id = NEW.trainer_id AND tecnologia_id = (SELECT tecnologia_id FROM modulo_tecnologia WHERE modulo_id = NEW.modulo_id);  -- 35
    IF tiene_conocimiento = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El trainer no tiene el conocimiento requerido para este módulo.';  -- 36
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de inserción en asignaciones_trainer
INSERT INTO asignaciones_trainer (trainer_id, modulo_id, area_id) VALUES (1, 1, 1);  -- Asegúrate de que el ID corresponda a un trainer y un módulo existentes
-- Verificación de la tabla de asignaciones_trainer
SELECT * FROM asignaciones_trainer WHERE trainer_id = 1;  -- Verifica que la asignación se haya creado

DELIMITER //

-- 17 Trigger para liberar campers asignados al cambiar el estado de un área a inactiva
CREATE TRIGGER liberar_campers_area_inactiva
AFTER UPDATE ON area
FOR EACH ROW
BEGIN
    IF NEW.estado = 'Inactiva' THEN
        DELETE FROM camper_area WHERE area_id = NEW.id;  -- 37
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de actualización de área
UPDATE area SET estado = 'Inactiva' WHERE id = 1;  -- Asegúrate de que el ID corresponda a un área existente
-- Verificación de la tabla de camper_area
SELECT * FROM camper_area WHERE area_id = 1;  -- Verifica que los campers se hayan liberado

DELIMITER //

-- 18 Trigger para clonar la plantilla base de módulos y SGDBs al crear una nueva ruta
CREATE TRIGGER clonar_modulos_y_sgdb
AFTER INSERT ON rutas
FOR EACH ROW
BEGIN
    INSERT INTO modulos (nombre, descripcion) SELECT CONCAT('Módulo de ', NEW.nombre), descripcion FROM modulos WHERE nombre = 'Plantilla Base';  -- 38
    INSERT INTO tecnologias (nombre, descripcion) SELECT CONCAT('SGDB de ', NEW.nombre), 'SGDB asociado a la nueva ruta ' + NEW.nombre;  -- 39
END;
//

DELIMITER ;

-- Ejemplo de inserción de ruta
INSERT INTO rutas (nombre, descripcion) VALUES ('Ruta de Verano', 'Descripción de la ruta de verano');  -- Inserta una nueva ruta
-- Verificación de la tabla de módulos
SELECT * FROM modulos WHERE nombre LIKE 'Módulo de Ruta de Verano%';  -- Verifica que los módulos se hayan creado

DELIMITER //

-- 19 Trigger para verificar que la nota práctica no supere 60% del total al registrar la nota práctica
CREATE TRIGGER verificar_nota_practica
BEFORE INSERT ON evaluaciones
FOR EACH ROW
BEGIN
    IF NEW.nota_practica > (NEW.nota_final * 0.6) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La nota práctica no puede superar el 60% del total.';  -- 40
    END IF;
END;
//

DELIMITER ;

-- Ejemplo de inserción de evaluación con nota práctica alta
INSERT INTO evaluaciones (camper_id, modulo_id, nota_teorica, nota_practica, nota_trabajos) VALUES (1, 1, 70, 50, 60);  -- Inserta una evaluación
-- Verificación de la tabla de evaluaciones
SELECT * FROM evaluaciones WHERE camper_id = 1;  -- Verifica que la evaluación se haya creado

DELIMITER //

-- 20 Trigger para notificar cambios a los trainers asignados al modificar una ruta
CREATE TRIGGER notificar_cambios_ruta
AFTER UPDATE ON rutas
FOR EACH ROW
BEGIN
    -- Aquí puedes agregar la lógica para enviar notificaciones a los trainers asignados  -- 41
    -- Por ejemplo, insertar en una tabla de notificaciones o enviar un correo  -- 42
END;
//

DELIMITER ;

-- Ejemplo de actualización de ruta
UPDATE rutas SET nombre = 'Ruta de Invierno' WHERE id = 1;  -- Asegúrate de que el ID corresponda a una ruta existente
-- Verificación de la tabla de rutas
SELECT * FROM rutas WHERE id = 1;  -- Verifica que la ruta se haya actualizado

DELIMITER ;