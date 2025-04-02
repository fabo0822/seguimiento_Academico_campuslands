-- 1. Calcular el promedio ponderado de evaluaciones de un camper.
DELIMITER //
CREATE FUNCTION calcular_promedio_ponderado(camper_id INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(nota_final) INTO promedio
    FROM evaluaciones
    WHERE camper_id = camper_id;
    RETURN promedio;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT calcular_promedio_ponderado(1);  -- Calcular el promedio ponderado del camper con ID 1

-- 2. Determinar si un camper aprueba o no un módulo específico.
DELIMITER //
CREATE FUNCTION aprobar_modulo(camper_id INT, modulo_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE resultado BOOLEAN;
    SELECT (nota_final >= 60) INTO resultado
    FROM evaluaciones
    WHERE camper_id = camper_id AND modulo_id = modulo_id;
    RETURN resultado;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT aprobar_modulo(1, 1);  -- Verificar si el camper con ID 1 aprueba el módulo con ID 1

-- 3. Evaluar el nivel de riesgo de un camper según su rendimiento promedio.
DELIMITER //
CREATE FUNCTION evaluar_nivel_riesgo(camper_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(nota_final) INTO promedio
    FROM evaluaciones
    WHERE camper_id = camper_id;

    IF promedio < 60 THEN
        RETURN 'Alto';
    ELSEIF promedio < 75 THEN
        RETURN 'Medio';
    ELSE
        RETURN 'Bajo';
    END IF;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT evaluar_nivel_riesgo(1);  -- Evaluar el nivel de riesgo del camper con ID 1

-- 4. Obtener el total de campers asignados a una ruta específica.
DELIMITER //
CREATE FUNCTION total_campers_ruta(ruta_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM matriculas
    WHERE ruta_id = ruta_id;
    RETURN total;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT total_campers_ruta(2);  -- Obtener el total de campers asignados a la ruta con ID 2

-- 5. Consultar la cantidad de módulos que ha aprobado un camper.
DELIMITER //
CREATE FUNCTION modulos_aprobados(camper_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM evaluaciones
    WHERE camper_id = camper_id AND nota_final >= 60;
    RETURN total;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT modulos_aprobados(1);  -- Consultar cuántos módulos ha aprobado el camper con ID 1

-- 6. Validar si hay cupos disponibles en una determinada área.
DELIMITER //
CREATE FUNCTION hay_cupos_disponibles(area_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE ocupacion INT;
    DECLARE capacidad INT;

    SELECT COUNT(*) INTO ocupacion FROM camper_area WHERE area_id = area_id;
    SELECT capacidad INTO capacidad FROM area WHERE id = area_id;

    RETURN ocupacion < capacidad;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT hay_cupos_disponibles(1);  -- Verificar si hay cupos disponibles en el área con ID 1

-- 7. Calcular el porcentaje de ocupación de un área de entrenamiento.
DELIMITER //
CREATE FUNCTION porcentaje_ocupacion(area_id INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE ocupacion INT;
    DECLARE capacidad INT;

    SELECT COUNT(*) INTO ocupacion FROM camper_area WHERE area_id = area_id;
    SELECT capacidad INTO capacidad FROM area WHERE id = area_id;

    RETURN ROUND((ocupacion * 100.0 / capacidad), 2);
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT porcentaje_ocupacion(1);  -- Calcular el porcentaje de ocupación del área con ID 1

-- 8. Determinar la nota más alta obtenida en un módulo.
DELIMITER //
CREATE FUNCTION nota_mas_alta(modulo_id INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE nota DECIMAL(5,2);
    SELECT MAX(nota_final) INTO nota
    FROM evaluaciones
    WHERE modulo_id = modulo_id;
    RETURN nota;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT nota_mas_alta(1);  -- Obtener la nota más alta en el módulo con ID 1

-- 9. Calcular la tasa de aprobación de una ruta.
DELIMITER //
CREATE FUNCTION tasa_aprobacion(ruta_id INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE total_campers INT;
    DECLARE total_aprobados INT;

    SELECT COUNT(*) INTO total_campers FROM matriculas WHERE ruta_id = ruta_id;
    SELECT COUNT(*) INTO total_aprobados 
    FROM evaluaciones e
    INNER JOIN matriculas m ON e.camper_id = m.camper_id
    WHERE m.ruta_id = ruta_id AND e.nota_final >= 60;

    RETURN ROUND((total_aprobados * 100.0 / total_campers), 2);
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT tasa_aprobacion(2);  -- Calcular la tasa de aprobación de la ruta con ID 2

-- 10. Verificar si un trainer tiene horario disponible.
DELIMITER //
CREATE FUNCTION horario_disponible(trainer_id INT, horario_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE ocupado INT;
    SELECT COUNT(*) INTO ocupado
    FROM asignaciones_trainer
    WHERE trainer_id = trainer_id AND horario_id = horario_id;

    RETURN ocupado = 0;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT horario_disponible(1, 1);  -- Verificar si el trainer con ID 1 tiene horario disponible con ID 1

-- 11. Obtener el promedio de notas por ruta.
DELIMITER //
CREATE FUNCTION promedio_notas_por_ruta(ruta_id INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(e.nota_final) INTO promedio
    FROM evaluaciones e
    INNER JOIN matriculas m ON e.camper_id = m.camper_id
    WHERE m.ruta_id = ruta_id;
    RETURN promedio;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT promedio_notas_por_ruta(2);  -- Obtener el promedio de notas para la ruta con ID 2

-- 12. Calcular cuántas rutas tiene asignadas un trainer.
DELIMITER //
CREATE FUNCTION rutas_asignadas(trainer_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT ruta_id) INTO total
    FROM asignaciones_trainer
    WHERE trainer_id = trainer_id;
    RETURN total;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT rutas_asignadas(1);  -- Calcular cuántas rutas tiene asignadas el trainer con ID 1

-- 13. Verificar si un camper puede ser graduado.
DELIMITER //
CREATE FUNCTION puede_ser_graduado(camper_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE total_modulos INT;
    DECLARE modulos_aprobados INT;

    SELECT COUNT(*) INTO total_modulos FROM evaluaciones WHERE camper_id = camper_id;
    SELECT COUNT(*) INTO modulos_aprobados FROM evaluaciones WHERE camper_id = camper_id AND nota_final >= 60;

    RETURN total_modulos = modulos_aprobados;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT puede_ser_graduado(1);  -- Verificar si el camper con ID 1 puede ser graduado

-- 14. Obtener el estado actual de un camper en función de sus evaluaciones.
DELIMITER //
CREATE FUNCTION estado_actual(camper_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE estado VARCHAR(20);
    SELECT CASE
        WHEN AVG(nota_final) < 60 THEN 'En Riesgo'
        WHEN AVG(nota_final) >= 60 AND AVG(nota_final) < 75 THEN 'Cursando'
        ELSE 'Aprobado'
    END INTO estado
    FROM evaluaciones
    WHERE camper_id = camper_id;

    RETURN estado;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT estado_actual(1);  -- Obtener el estado actual del camper con ID 1

-- 15. Calcular la carga horaria semanal de un trainer.
DELIMITER //
CREATE FUNCTION carga_horaria_trainer(trainer_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE carga INT;
    SELECT SUM(h.duracion) INTO carga
    FROM asignaciones_trainer at
    INNER JOIN horarios h ON at.horario_id = h.id
    WHERE at.trainer_id = trainer_id;
    RETURN carga;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT carga_horaria_trainer(1);  -- Calcular la carga horaria semanal del trainer con ID 1

-- 16. Determinar si una ruta tiene módulos pendientes por evaluación.
DELIMITER //
CREATE FUNCTION tiene_modulos_pendientes(ruta_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE pendientes INT;
    SELECT COUNT(*) INTO pendientes
    FROM ruta_modulo rm
    LEFT JOIN evaluaciones e ON rm.modulo_id = e.modulo_id
    WHERE rm.ruta_id = ruta_id AND e.nota_final IS NULL;

    RETURN pendientes > 0;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT tiene_modulos_pendientes(2);  -- Verificar si la ruta con ID 2 tiene módulos pendientes

-- 17. Calcular el promedio general del programa.
DELIMITER //
CREATE FUNCTION promedio_general() 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(5,2);
    SELECT AVG(nota_final) INTO promedio
    FROM evaluaciones;
    RETURN promedio;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT promedio_general();  -- Calcular el promedio general del programa

-- 18. Verificar si un horario choca con otros entrenadores en el área.
DELIMITER //
CREATE FUNCTION horario_choca(area_id INT, horario_id INT) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE choca INT;
    SELECT COUNT(*) INTO choca
    FROM asignaciones_trainer
    WHERE area_id = area_id AND horario_id = horario_id;

    RETURN choca > 0;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT horario_choca(1, 1);  -- Verificar si el horario con ID 1 choca con otros entrenadores en el área con ID 1

-- 19. Calcular cuántos campers están en riesgo en una ruta específica.
DELIMITER //
CREATE FUNCTION campers_en_riesgo(ruta_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT m.camper_id) INTO total
    FROM matriculas m
    INNER JOIN campers c ON m.camper_id = c.id
    WHERE m.ruta_id = ruta_id AND c.nivel_riesgo_id = (SELECT id FROM niveles_riesgo WHERE nivel = 'Alto');
    RETURN total;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT campers_en_riesgo(2);  -- Calcular cuántos campers están en riesgo en la ruta con ID 2

-- 20. Consultar el número de módulos evaluados por un camper.
DELIMITER //
CREATE FUNCTION modulos_evaluados(camper_id INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT modulo_id) INTO total
    FROM evaluaciones
    WHERE camper_id = camper_id;
    RETURN total;
END //
DELIMITER ;

-- Ejemplo de uso:
-- SELECT modulos_evaluados(1);  -- Consultar el número de módulos evaluados por el camper con ID 1
