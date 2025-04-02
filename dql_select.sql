-- 1. Obtener todos los campers inscritos actualmente
SELECT  c.nombres as nombre, c.apellidos as apellido, e.nombre as estado
FROM campers c
INNER JOIN estados e ON c.estado_id = e.id
WHERE e.nombre = 'Inscrito';

-- 2. Listar los campers con estado "Aprobado"
SELECT c.identificacion, c.nombres, c.apellidos, e.nombre as estado
FROM campers c
INNER JOIN estados e ON c.estado_id = e.id
WHERE e.nombre = 'Aprobado';

-- 3. Mostrar los campers que ya están cursando alguna ruta
SELECT c.identificacion, c.nombres, c.apellidos, r.nombre as ruta
FROM campers c
INNER JOIN matriculas m ON c.id = m.camper_id
INNER JOIN rutas r ON m.ruta_id = r.id
INNER JOIN estados e ON c.estado_id = e.id
WHERE e.nombre = 'Cursando';

-- 4. Consultar los campers graduados por cada ruta
SELECT r.nombre as ruta, c.nombres, c.apellidos, e.nombre as estado
FROM campers c
INNER JOIN matriculas m ON c.id = m.camper_id
INNER JOIN rutas r ON m.ruta_id = r.id
INNER JOIN estados e ON c.estado_id = e.id
WHERE e.nombre = 'Graduado'
ORDER BY r.nombre;

-- 5. Obtener los campers que se encuentran en estado "Expulsado" o "Retirado"
SELECT c.identificacion, c.nombres, c.apellidos, e.nombre as estado
FROM campers c
INNER JOIN estados e ON c.estado_id = e.id
WHERE e.nombre IN ('Expulsado', 'Retirado');

-- 6. Listar campers con nivel de riesgo "Alto"
SELECT c.identificacion, c.nombres, c.apellidos, nr.nivel as nivel_riesgo
FROM campers c
INNER JOIN niveles_riesgo nr ON c.nivel_riesgo_id = nr.id
WHERE nr.nivel = 'Alto';

-- 7. Mostrar el total de campers por cada nivel de riesgo
SELECT nr.nivel, COUNT(c.id) as total_campers
FROM niveles_riesgo nr
LEFT JOIN campers c ON nr.id = c.nivel_riesgo_id
GROUP BY nr.id, nr.nivel;

-- 8. Obtener campers con más de un número telefónico registrado
SELECT c.identificacion, c.nombres, c.apellidos, COUNT(t.id) as total_telefonos
FROM campers c
INNER JOIN telefono_camper t ON c.id = t.camper_id
GROUP BY c.id, c.identificacion, c.nombres, c.apellidos
HAVING COUNT(t.id) > 1;

-- 9. Listar los campers y sus respectivos acudientes y teléfonos
SELECT  c.nombres, c.apellidos, t.telefono, ac.nombres as acudiente, ac.telefono as telefono_acudiente
FROM campers c
LEFT JOIN telefono_camper t ON c.id = t.camper_id 
INNER JOIN acudiente ac ON c.acudiente_id = ac.id;

-- 10. Mostrar campers que aún no han sido asignados a una ruta
SELECT c.identificacion, c.nombres, c.apellidos, e.nombre as estado, nr.nivel as nivel_riesgo, s.nombre as sede
FROM campers c
LEFT JOIN matriculas m ON c.id = m.camper_id
INNER JOIN estados e ON c.estado_id = e.id
INNER JOIN niveles_riesgo nr ON c.nivel_riesgo_id = nr.id
INNER JOIN sedes s ON c.sede_id = s.id
WHERE m.id IS NULL;

-- Consultas de Evaluaciones --

-- 1. Obtener notas por tipo y módulo para cada camper
SELECT c.nombres, c.apellidos, m.nombre as modulo, e.nota_teorica, e.nota_practica, e.nota_trabajos
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
INNER JOIN modulos m ON e.modulo_id = m.id;

-- 2. Calcular nota final por módulo
SELECT  c.nombres, c.apellidos, m.nombre as modulo, e.nota_final
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
INNER JOIN modulos m ON e.modulo_id = m.id;


-- 3. Campers que reprobaron módulos
SELECT  c.nombres, c.apellidos, m.nombre as modulo, e.nota_final
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
INNER JOIN modulos m ON e.modulo_id = m.id
WHERE e.nota_final < 60;


-- 4. Módulos con más campers en bajo rendimiento
SELECT  m.nombre as modulo,
COUNT(c.id) as campers_bajo_rendimiento
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
INNER JOIN campers c ON e.camper_id = c.id
WHERE e.nota_final < 60
GROUP BY m.id, m.nombre
ORDER BY campers_bajo_rendimiento DESC;

-- 5. Promedio de notas por módulo
SELECT 
    m.nombre as modulo,
    AVG(e.nota_final) as promedio_final
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre;

-- 6. Rendimiento por ruta
SELECT 
    r.nombre as ruta,
    AVG(e.nota_final) as promedio_ruta
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulos m ON rm.modulo_id = m.id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY r.id, r.nombre;


-- 7. Trainers con campers de bajo rendimiento
SELECT DISTINCT
    t.nombres,
    t.apellidos
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
INNER JOIN matriculas m ON at.ruta_id = m.ruta_id
INNER JOIN campers c ON m.camper_id = c.id
INNER JOIN evaluaciones e ON c.id = e.camper_id
WHERE e.nota_final < 60;

-- 8. Promedio de rendimiento por trainer
SELECT 
    t.nombres,
    t.apellidos,
    AVG(e.nota_final) as promedio_trainer
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
INNER JOIN matriculas m ON at.ruta_id = m.ruta_id
INNER JOIN campers c ON m.camper_id = c.id
INNER JOIN evaluaciones e ON c.id = e.camper_id
GROUP BY t.id, t.nombres, t.apellidos;

-- 9. Top 5 campers por ruta
SELECT 
    r.nombre as ruta,
    c.nombres,
    c.apellidos,
    AVG(e.nota_final) as promedio_final
FROM rutas r
INNER JOIN matriculas m ON r.id = m.ruta_id
INNER JOIN campers c ON m.camper_id = c.id
INNER JOIN evaluaciones e ON c.id = e.camper_id
GROUP BY r.id, r.nombre, c.id, c.nombres, c.apellidos
ORDER BY r.nombre, promedio_final DESC
LIMIT 5;

-- 10. Campers aprobados por módulo y ruta
SELECT 
    r.nombre as ruta,
    m.nombre as modulo,
    COUNT(DISTINCT c.id) as campers_aprobados
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulos m ON rm.modulo_id = m.id
INNER JOIN evaluaciones e ON m.id = e.modulo_id
INNER JOIN campers c ON e.camper_id = c.id
WHERE e.nota_final >= 60
GROUP BY r.id, r.nombre, m.id, m.nombre;

-- Consultas de Rutas y Áreas de Entrenamiento --

-- 1. Mostrar todas las rutas de entrenamiento disponibles
SELECT  r.id, r.nombre, r.descripcion
FROM rutas r;

-- 2. Obtener las rutas con su SGDB principal y alternativo
SELECT 
    r.nombre as ruta,
    GROUP_CONCAT(
        CASE 
            WHEN mt.es_principal = 1 THEN t.nombre
        END
    ) as sgbd_principal,
    GROUP_CONCAT(
        CASE 
            WHEN mt.es_principal = 0 THEN t.nombre
        END
    ) as sgbd_alternativo
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulos m ON rm.modulo_id = m.id
INNER JOIN modulo_tecnologia mt ON m.id = mt.modulo_id
INNER JOIN tecnologias t ON mt.tecnologia_id = t.id
GROUP BY r.id, r.nombre;

-- 3. Listar los módulos asociados a cada ruta
SELECT 
    r.nombre as ruta,
    GROUP_CONCAT(m.nombre ORDER BY rm.orden) as modulos
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulos m ON rm.modulo_id = m.id
GROUP BY r.id, r.nombre;

-- 4. Consultar cuántos campers hay en cada ruta
SELECT 
    r.nombre as ruta,
    COUNT(DISTINCT m.camper_id) as total_campers
FROM rutas r
LEFT JOIN matriculas m ON r.id = m.ruta_id
GROUP BY r.id, r.nombre;



-- 5. Mostrar las áreas de entrenamiento y su capacidad máxima
SELECT  a.nombre as area, a.capacidad,  s.nombre as sede
FROM area a
INNER JOIN sedes s ON a.sede_id = s.id;



-- 6. Obtener las áreas que están ocupadas al 100%
SELECT 
    a.nombre as area,
    a.capacidad,
    COUNT(ca.camper_id) as ocupacion_actual
FROM area a
INNER JOIN camper_area ca ON a.id = ca.area_id
GROUP BY a.id, a.nombre, a.capacidad
HAVING COUNT(ca.camper_id) >= a.capacidad;



-- 7. Verificar la ocupación actual de cada área
SELECT 
    a.nombre as area,
    a.capacidad,
    COUNT(ca.camper_id) as ocupacion_actual,
    ROUND((COUNT(ca.camper_id) * 100.0 / a.capacidad), 2) as porcentaje_ocupacion
FROM area a
LEFT JOIN camper_area ca ON a.id = ca.area_id 
GROUP BY a.id, a.nombre, a.capacidad;

-- 8. Consultar los horarios disponibles por cada área
SELECT 
    a.nombre as area,
    h.hora_inicio,
    h.hora_fin
FROM area a
CROSS JOIN horarios h
LEFT JOIN asignaciones_trainer at ON a.id = at.area_id 
    AND h.id = at.horario_id
WHERE at.id IS NULL
ORDER BY a.nombre, h.hora_inicio;

-- 9. Mostrar las áreas con más campers asignados
SELECT 
    a.nombre as area,
    COUNT(ca.camper_id) as total_campers
FROM area a
INNER JOIN camper_area ca ON a.id = ca.area_id
GROUP BY a.id, a.nombre
ORDER BY total_campers DESC
limit 5;

-- 10. Listar las rutas con sus respectivos trainers y áreas asignadas

SELECT 
 r.nombre as ruta,
CONCAT(t.nombres, ' ', t.apellidos) as trainer,  a.nombre as area
FROM rutas r
LEFT JOIN asignaciones_trainer at ON r.id = at.ruta_id
LEFT JOIN trainers t ON at.trainer_id = t.id
LEFT JOIN area a ON at.area_id = a.id
ORDER BY r.nombre;

-- Consultas Avanzadas con Subconsultas --

--REVISAR APARECE SOLO UN CAMPER
-- 1. Obtener los campers con la nota más alta en cada módulo
SELECT  m.nombre as modulo, c.nombres, c.apellidos, e.nota_final
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
WHERE (e.modulo_id, e.nota_final) IN (
    SELECT modulo_id, MAX(nota_final)
    FROM evaluciones
    GROUP BY modulo_id
);
--revisar
-- 2. Promedio por ruta vs promedio global
SELECT 
    r.nombre as ruta,
    AVG(e.nota_final) as promedio_ruta,
    (SELECT AVG(nota_final) FROM evaluaciones) as promedio_global,
    AVG(e.nota_final) - (SELECT AVG(nota_final) FROM evaluaciones) as diferencia
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN evaluaciones e ON rm.modulo_id = e.modulo_id
GROUP BY r.id, r.nombre;

--agregar insert para esta consulta
-- 3. Áreas con más del 80% de ocupación
SELECT 
    a.nombre as area,
    a.capacidad,
    COUNT(ca.camper_id) as ocupacion_actual,
    (COUNT(ca.camper_id) * 100.0 / a.capacidad) as porcentaje_ocupacion
FROM area a
LEFT JOIN camper_area ca ON a.id = ca.area_id AND ca.fecha_fin IS NULL
GROUP BY a.id, a.nombre, a.capacidad
HAVING porcentaje_ocupacion > 80;

--agregar insert para esta consulta
-- 4. Trainers con menos del 70% de rendimiento promedio
SELECT 
    t.nombres,
    t.apellidos,
    AVG(e.nota_final) as promedio_trainer
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
INNER JOIN matriculas m ON at.ruta_id = m.ruta_id
INNER JOIN evaluaciones e ON m.camper_id = e.camper_id
GROUP BY t.id, t.nombres, t.apellidos
HAVING promedio_trainer < (SELECT AVG(nota_final) * 0.7 FROM evaluaciones);

--revisar
-- 5. Campers bajo el promedio general
SELECT 
    c.nombres,
    c.apellidos,
    AVG(e.nota_final) as promedio_camper
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
GROUP BY c.id, c.nombres, c.apellidos
HAVING promedio_camper < (SELECT AVG(nota_final) FROM evaluaciones);

--revisar
-- 6. Módulos con menor tasa de aprobación
SELECT 
    m.nombre as modulo,
    COUNT(e.id) as total_evaluaciones,
    SUM(CASE WHEN e.nota_final >= 60 THEN 1 ELSE 0 END) as aprobados,
    (SUM(CASE WHEN e.nota_final >= 60 THEN 1 ELSE 0 END) * 100.0 / COUNT(e.id)) as tasa_aprobacion
FROM modulos m
LEFT JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
ORDER BY tasa_aprobacion ASC;

-- 7. Campers que aprobaron todos sus módulos
SELECT 
    c.nombres,
    c.apellidos
FROM campers c
WHERE NOT EXISTS (
    SELECT 1
    FROM matriculas m
    INNER JOIN ruta_modulo rm ON m.ruta_id = rm.ruta_id
    LEFT JOIN evaluaciones e ON c.id = e.camper_id AND rm.modulo_id = e.modulo_id
    WHERE m.camper_id = c.id AND (e.nota_final < 60 OR e.nota_final IS NULL)
);


-- 8. Rutas con más de 10 campers en bajo rendimiento
SELECT 
    r.nombre as ruta,
    COUNT(DISTINCT e.camper_id) as campers_bajo_rendimiento
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN evaluaciones e ON rm.modulo_id = e.modulo_id
WHERE e.nota_final < 60
GROUP BY r.id, r.nombre
HAVING campers_bajo_rendimiento > 10;

-- 9. Promedio por SGDB principal
SELECT 
    t.nombre as tecnologia,
    AVG(e.nota_final) as promedio_rendimiento
FROM tecnologias t
INNER JOIN modulo_tecnologia mt ON t.id = mt.tecnologia_id
INNER JOIN evaluaciones e ON mt.modulo_id = e.modulo_id
WHERE mt.es_principal = 1
GROUP BY t.id, t.nombre;


--agregar  -'empty'
-- 10. Módulos con 30% o más de reprobados
SELECT 
    m.nombre as modulo,
    COUNT(e.id) as total_evaluaciones,
    SUM(CASE WHEN e.nota_final < 60 THEN 1 ELSE 0 END) as reprobados,
    (SUM(CASE WHEN e.nota_final < 60 THEN 1 ELSE 0 END) * 100.0 / COUNT(e.id)) as porcentaje_reprobados
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
HAVING porcentaje_reprobados >= 30;

--agregar el riesgo para estar seguro
-- 11. Módulo más cursado por campers con riesgo alto
SELECT 
    m.nombre as modulo,
    COUNT(DISTINCT e.camper_id) as total_campers
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN niveles_riesgo nr ON c.nivel_riesgo_id = nr.id
WHERE nr.nivel = 'Alto'
GROUP BY m.id, m.nombre
ORDER BY total_campers DESC
LIMIT 1;

--asignar mas de una rauta al trainer
-- 12. Trainers con más de 3 rutas asignadas
SELECT 
    t.nombres,
    t.apellidos,
    COUNT(DISTINCT at.ruta_id) as total_rutas
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
GROUP BY t.id, t.nombres, t.apellidos
HAVING total_rutas > 3;

-- 13. Horarios más ocupados por áreas
SELECT 
    h.hora_inicio,
    h.hora_fin,
    COUNT(at.id) as total_asignaciones
FROM horarios h
INNER JOIN asignaciones_trainer at ON h.id = at.horario_id
GROUP BY h.id, h.hora_inicio, h.hora_fin
ORDER BY total_asignaciones DESC;

-- 14. Rutas con mayor número de módulos
SELECT 
    r.nombre as ruta,
    COUNT(rm.modulo_id) as total_modulos
FROM rutas r
LEFT JOIN ruta_modulo rm ON r.id = rm.ruta_id
GROUP BY r.id, r.nombre
ORDER BY total_modulos DESC;

-- crear tabla estados_campers por ende tambien necesito trainers_revisar la anterior
-- 15. Campers con múltiples cambios de estado
SELECT 
    c.nombres,
    c.apellidos,
    COUNT(DISTINCT c.estado_id) as cambios_estado
FROM campers c
GROUP BY c.id, c.nombres, c.apellidos
HAVING cambios_estado > 1;


--agregar insert 'emtpy'
-- 16. Evaluaciones con nota teórica mayor a práctica
SELECT 
    c.nombres,
    c.apellidos,
    m.nombre as modulo,
    e.nota_teorica,
    e.nota_practica
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
WHERE e.nota_teorica > e.nota_practica;



-- 17. Módulos con media de trabajos superior a 9
SELECT 
    m.nombre as modulo,
    AVG(e.nota_trabajos) as promedio_trabajos
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
GROUP BY m.id, m.nombre
HAVING promedio_trabajos > 9;


-- mal mal mal
-- 18. Ruta con mayor tasa de graduación
SELECT 
    r.nombre as ruta,
    COUNT(DISTINCT m.camper_id) as total_campers,
    SUM(CASE WHEN m.estado = 'Graduado' THEN 1 ELSE 0 END) as graduados,
    (SUM(CASE WHEN m.estado = 'Graduado' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT m.camper_id)) as tasa_graduacion
FROM rutas r
INNER JOIN matriculas m ON r.id = m.ruta_id
GROUP BY r.id, r.nombre
ORDER BY tasa_graduacion DESC
LIMIT 1;

-- 19. Módulos cursados por campers de riesgo medio o alto
SELECT DISTINCT
    m.nombre as modulo,
    nr.nivel as nivel_riesgo
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN niveles_riesgo nr ON c.nivel_riesgo_id = nr.id
WHERE nr.nivel IN ('Medio', 'Alto');

-- 20. Diferencia entre capacidad y ocupación por área
SELECT 
    a.nombre as area,
    a.capacidad,
    COUNT(ca.camper_id) as ocupacion_actual,
    (a.capacidad - COUNT(ca.camper_id)) as espacios_disponibles
FROM area a
LEFT JOIN camper_area ca ON a.id = ca.area_id AND ca.fecha_fin IS NULL
GROUP BY a.id, a.nombre, a.capacidad;

-- Consultas con JOINs Básicos --

-- 1. Nombres completos de campers y sus rutas
SELECT 
    c.identificacion,
    c.nombres,
    c.apellidos,
    r.nombre as ruta
FROM campers c
LEFT JOIN matriculas m ON c.id = m.camper_id
LEFT JOIN rutas r ON m.ruta_id = r.id
WHERE m.estado != 'Finalizado' OR m.estado IS NULL;

-- 2. Campers con sus evaluaciones por módulo
SELECT 
    c.nombres,
    c.apellidos,
    m.nombre as modulo,
    e.nota_teorica,
    e.nota_practica,
    e.nota_trabajos,
    e.nota_final
FROM campers c
INNER JOIN evaluaciones e ON c.id = e.camper_id
INNER JOIN modulos m ON e.modulo_id = m.id
ORDER BY c.nombres, c.apellidos, m.nombre;

-- 3. Módulos por ruta de entrenamiento
SELECT 
    r.nombre as ruta,
    m.nombre as modulo,
    rm.orden
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulos m ON rm.modulo_id = m.id
ORDER BY r.nombre, rm.orden;

-- 4. Rutas con trainers y áreas asignadas
SELECT 
    r.nombre as ruta,
    t.nombres as trainer_nombres,
    t.apellidos as trainer_apellidos,
    a.nombre as area,
    CONCAT(h.hora_inicio, ' - ', h.hora_fin) as horario
FROM rutas r
INNER JOIN asignaciones_trainer at ON r.id = at.ruta_id
INNER JOIN trainers t ON at.trainer_id = t.id
INNER JOIN area a ON at.area_id = a.id
INNER JOIN horarios h ON at.horario_id = h.id;

--revisar mal estructurada
-- 5. Campers con su trainer responsable
SELECT 
    c.nombres as camper_nombres,
    c.apellidos as camper_apellidos,
    r.nombre as ruta,
    t.nombres as trainer_nombres,
    t.apellidos as trainer_apellidos
FROM campers c
INNER JOIN matriculas m ON c.id = m.camper_id
INNER JOIN rutas r ON m.ruta_id = r.id
INNER JOIN asignaciones_trainer at ON r.id = at.ruta_id
INNER JOIN trainers t ON at.trainer_id = t.id
WHERE m.estado = 'En curso';

-- 6. Evaluaciones con detalles de camper, módulo y ruta
SELECT 
    c.nombres,
    c.apellidos,
    r.nombre as ruta,
    m.nombre as modulo,
    e.nota_final,
    e.fecha_evaluacion
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
INNER JOIN ruta_modulo rm ON m.id = rm.modulo_id
INNER JOIN rutas r ON rm.ruta_id = r.id;

-- 7. Trainers con horarios y áreas asignadas
SELECT 
    t.nombres,
    t.apellidos,
    a.nombre as area,
    CONCAT(h.hora_inicio, ' - ', h.hora_fin) as horario
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
INNER JOIN area a ON at.area_id = a.id
INNER JOIN horarios h ON at.horario_id = h.id
ORDER BY t.nombres, t.apellidos, h.hora_inicio;

-- 8. Campers con estado y nivel de riesgo
SELECT 
    c.nombres,
    c.apellidos,
    e.nombre as estado,
    nr.nivel as nivel_riesgo
FROM campers c
INNER JOIN estados e ON c.estado_id = e.id
LEFT JOIN niveles_riesgo nr ON c.nivel_riesgo_id = nr.id;

-- 9. Módulos por ruta con sus porcentajes de evaluación
SELECT 
    r.nombre as ruta,
    m.nombre as modulo,
    pe.porcentaje_teorico,
    pe.porcentaje_practico,
    pe.porcentaje_quices
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulos m ON rm.modulo_id = m.id
INNER JOIN porcentajes_evaluacion pe ON m.id = pe.modulo_id
ORDER BY r.nombre, rm.orden;

-- 10. Áreas con campers asignados
SELECT 
    a.nombre as area,
    c.nombres,
    c.apellidos
FROM area a
INNER JOIN camper_area ca ON a.id = ca.area_id
INNER JOIN campers c ON ca.camper_id = c.id;

-- JOINs con condiciones específicas

-- 1. Listar los campers que han aprobado todos los módulos de su ruta (nota_final >= 60).
SELECT c.nombres, c.apellidos, r.nombre AS ruta
FROM campers c
INNER JOIN matriculas m ON c.id = m.camper_id
INNER JOIN rutas r ON m.ruta_id = r.id
INNER JOIN ruta_modulo rm ON m.ruta_id = rm.ruta_id
INNER JOIN evaluaciones e ON c.id = e.camper_id AND rm.modulo_id = e.modulo_id
GROUP BY c.id, r.id
HAVING MIN(e.nota_final) >= 60;

-- 2. Mostrar las rutas que tienen más de 10 campers inscritos actualmente.
SELECT r.nombre AS ruta, COUNT(m.camper_id) AS total_campers
FROM rutas r
INNER JOIN matriculas m ON r.id = m.ruta_id
GROUP BY r.id
HAVING COUNT(m.camper_id) > 10;

-- 3. Consultar las áreas que superan el 80% de su capacidad con el número actual de campers asignados.
SELECT a.nombre AS area, a.capacidad, COUNT(ca.camper_id) AS ocupacion_actual,
       ROUND((COUNT(ca.camper_id) * 100.0 / a.capacidad), 2) AS porcentaje_ocupacion
FROM area a
LEFT JOIN camper_area ca ON a.id = ca.area_id AND ca.fecha_fin IS NULL
GROUP BY a.id
HAVING porcentaje_ocupacion > 80;

-- 4. Obtener los trainers que imparten más de una ruta diferente.
SELECT t.nombres, t.apellidos, COUNT(DISTINCT at.ruta_id) AS total_rutas
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
GROUP BY t.id
HAVING total_rutas > 1;

-- 5. Listar las evaluaciones donde la nota práctica es mayor que la nota teórica.
SELECT c.nombres, c.apellidos, m.nombre AS modulo, e.nota_teorica, e.nota_practica
FROM evaluaciones e
INNER JOIN campers c ON e.camper_id = c.id
INNER JOIN modulos m ON e.modulo_id = m.id
WHERE e.nota_practica > e.nota_teorica;

-- 6. Mostrar campers que están en rutas cuyo SGDB principal es MySQL.
SELECT c.nombres, c.apellidos, r.nombre AS ruta
FROM campers c
INNER JOIN matriculas m ON c.id = m.camper_id
INNER JOIN rutas r ON m.ruta_id = r.id
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
INNER JOIN modulo_tecnologia mt ON rm.modulo_id = mt.modulo_id
INNER JOIN tecnologias t ON mt.tecnologia_id = t.id
WHERE mt.es_principal = 1 AND t.nombre = 'MySQL';

-- 7. Obtener los nombres de los módulos donde los campers han tenido bajo rendimiento.
SELECT DISTINCT m.nombre AS modulo
FROM modulos m
INNER JOIN evaluaciones e ON m.id = e.modulo_id
WHERE e.nota_final < 60;

-- 8. Consultar las rutas con más de 3 módulos asociados.
SELECT r.nombre AS ruta, COUNT(rm.modulo_id) AS total_modulos
FROM rutas r
INNER JOIN ruta_modulo rm ON r.id = rm.ruta_id
GROUP BY r.id
HAVING COUNT(rm.modulo_id) > 3;

-- 9. Listar las inscripciones realizadas en los últimos 30 días con sus respectivos campers y rutas.
SELECT c.nombres, c.apellidos, r.nombre AS ruta, m.fecha_inicio
FROM matriculas m
INNER JOIN campers c ON m.camper_id = c.id
INNER JOIN rutas r ON m.ruta_id = r.id
WHERE m.fecha_inicio >= CURDATE() - INTERVAL 30 DAY;

-- 10. Obtener los trainers que están asignados a rutas con campers en estado de "Alto Riesgo".
SELECT DISTINCT t.nombres, t.apellidos
FROM trainers t
INNER JOIN asignaciones_trainer at ON t.id = at.trainer_id
INNER JOIN matriculas m ON at.ruta_id = m.ruta_id
INNER JOIN campers c ON m.camper_id = c.id
WHERE c.nivel_riesgo_id = (SELECT id FROM niveles_riesgo WHERE nivel = 'Alto');

--  JOINs con funciones de agregación