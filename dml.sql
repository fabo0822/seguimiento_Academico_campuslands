-- Insertar datos en la tabla Empresa
INSERT INTO empresa (nombre, nit, direccion_principal, telefono, email, sitio_web, fecha_fundacion)
VALUES 
('CampusLands', '900123456-7', 'km 4 anillo vial', '5551234567', 'info@campuslands.com', 'www.campuslands.com', '2018-01-15');


-- Insertar datos en la tabla Estados
INSERT INTO estados (nombre)
VALUES 
('En proceso de ingreso'),
('Inscrito'),
('Aprobado'),
('Cursando'),
('Graduado'),
('Expulsado'),
('Retirado');

-- Insertar datos en la tabla Ciudades
INSERT INTO ciudades (nombre)
VALUES 
('Bucaramanga'),
('Bogotá'),
('Medellín'),
('Cali'),
('Barranquilla');

-- Insertar datos en la tabla Sedes
INSERT INTO sedes (nombre, direccion, ciudad_id, empresa_id)
VALUES 
('Campus Bucaramnga', 'km 4 anillo vial', 1, 1),
('Campus cucuta', 'Av. Principal 234', 2, 1),
('Campus bogota', 'Carrera 56 #78-90', 3, 1);


-- Insertar datos en la tabla Niveles de Riesgo
INSERT INTO niveles_riesgo (nivel)
VALUES 
('Bajo'),
('Medio'),
('Alto');

-- insertar datos acudiente
INSERT INTO acudiente (nombres, apellidos, telefono) VALUES
('Juan', 'Pérez', '3001111111'),
('Ana', 'Gómez', '3002222222'),
('Pedro', 'Rodríguez', '3003333333'),
('Sofía', 'Martínez', '3004444444'),
('Carlos', 'López', '3005555555'),
('Valentina', 'Sánchez', '3006666666'),
('Diego', 'Torres', '3007777777'),
('Isabella', 'Ramírez', '3008888888'),
('Alejandro', 'Hernández', '3009999999'),
('Camila', 'Díaz', '3010000000'),
('Mateo', 'García', '3011111111'),
('María', 'Martínez', '3012222222'),
('Julián', 'López', '3013333333'),
('Valeria', 'Sánchez', '3014444444'),
('Santiago', 'Torres', '3015555555'),
('Luciana', 'Ramírez', '3016666666'),
('Emiliano', 'Hernández', '3017777777'),
('Antonella', 'Díaz', '3018888888'),
('Emilio', 'García', '3019999999'),
('Mariana', 'Martínez', '3020000000'),
('Benjamín', 'López', '3021111111'),
('Isidora', 'Sánchez', '3022222222'),
('Emiliano', 'Torres', '3023333333'),
('Antonella', 'Ramírez', '3024444444'),
('Emilio', 'Hernández', '3025555555'),
('Mariana', 'Díaz', '3026666666'),
('Benjamín', 'García', '3027777777'),
('Isidora', 'Martínez', '3028888888'),
('Emiliano', 'López', '3029999999'),
('Antonella', 'Sánchez', '3030000000'),
('Emilio', 'Torres', '3031111111'),
('Mariana', 'Ramírez', '3032222222'),
('Benjamín', 'Hernández', '3033333333'),
('Isidora', 'Díaz', '3034444444'),
('Emiliano', 'García', '3035555555'),
('Antonella', 'Martínez', '3036666666'),
('Emilio', 'López', '3037777777'),
('Mariana', 'Sánchez', '3038888888'),
('Benjamín', 'Torres', '3039999999'),
('Carlos', 'Fernández', '3105678901'),
('Laura', 'Rojas', '3126789012'),
('Andrés', 'Gómez', '3157890123'),
('Patricia', 'López', '3188901234'),
('Ricardo', 'Torres', '3209012345'),
('Fernando', 'Martínez', '3210123456'),
('Gabriela', 'Sánchez', '3221234567'),
('Hugo', 'Pérez', '3232345678'),
('Inés', 'García', '3243456789'),
('Jorge', 'Hernández', '3254567890'),
('Karla', 'Ramírez', '3265678901'),
('Luis', 'Torres', '3276789012'),
('Marta', 'Díaz', '3287890123'),
('Nicolás', 'López', '3298901234'),
('Olga', 'Gómez', '3309012345'),
('Pablo', 'Rodríguez', '3310123456'),
('Quintín', 'Sánchez', '3321234567'),
('Rosa', 'Martínez', '3332345678'),
('Samuel', 'Hernández', '3343456789'),
('Teresa', 'García', '3354567890'),
('Ulises', 'Pérez', '3365678901'),
('Verónica', 'Torres', '3376789012'),
('Walter', 'Ramírez', '3387890123'),
('Ximena', 'Díaz', '3398901234'),
('Yolanda', 'López', '3409012345'),
('Zacarías', 'Gómez', '3410123456');

-- Insertar datos en la tabla Campers
INSERT INTO campers (identificacion, nombres, apellidos, direccion, estado_id, nivel_riesgo_id, sede_id, acudiente_id)
VALUES 
('1001234567', 'Juan', 'Pérez', 'Calle 10 #23-45', 2, 1, 1, 1),
('1002345678', 'Ana', 'Gómez', 'Av. 5 #12-34', 2, 3, 1, 2),
('1003456789', 'Pedro', 'Rodríguez', 'Carrera 15 #45-67', 1, 2, 2, 3),
('1004567890', 'Sofía', 'Martínez', 'Calle 20 #56-78', 2, 1, 2, 4),
('1005678901', 'Carlos', 'López', 'Av. 30 #67-89', 4, 3, 1, 5),
('1006789012', 'Valentina', 'Sánchez', 'Diagonal 25 #12-34', 5, 1, 3, 6),
('1007890123', 'Diego', 'Torres', 'Carrera 40 #23-45', 6, 3, 3, 7),
('1008901234', 'Isabella', 'Ramírez', 'Calle 50 #34-56', 2, 2, 1, 8),
('1009012345', 'Alejandro', 'Hernández', 'Av. 60 #45-67', 4, 3, 2, 9),
('1010123456', 'Camila', 'Díaz', 'Carrera 70 #56-78', 4, 2, 3, 10),
('1011234567', 'Mateo', 'García', 'Calle 80 #67-89', 1, 3, 1, 11),
('1012345678', 'María', 'Martínez', 'Diagonal 90 #12-34', 3, 3, 2, 12),
('1013456789', 'Julián', 'López', 'Carrera 100 #23-45', 3, 1, 3, 13),
('1014567890', 'Valeria', 'Sánchez', 'Av. 110 #34-56', 4, 2, 1, 14),
('1015678901', 'Santiago', 'Torres', 'Calle 120 #45-67', 2, 3, 2, 15),
('1016789012', 'Luciana', 'Ramírez', 'Carrera 130 #56-78', 4, 2, 3, 16),
('1017890123', 'Emiliano', 'Hernández', 'Av. 140 #67-89', 2, 1, 1, 17),
('1018901234', 'Antonella', 'Díaz', 'Diagonal 150 #12-34', 4, 2, 2, 18),
('1019012345', 'Emilio', 'García', 'Carrera 160 #23-45', 2, 3, 3, 19),
('1020123456', 'Mariana', 'Martínez', 'Av. 170 #34-56', 3, 2, 1, 20),
('1021234567', 'Benjamín', 'López', 'Calle 180 #45-67', 5, 1, 2, 21),
('1022345678', 'Isidora', 'Sánchez', 'Carrera 190 #56-78', 5, 3, 3, 22),
('1023456789', 'Emiliano', 'Torres', 'Av. 200 #67-89', 5, 1, 1, 23),
('1024567890', 'Antonella', 'Ramírez', 'Diagonal 210 #12-34', 6, 2, 2, 24),
('1025678901', 'Emilio', 'Hernández', 'Carrera 220 #12-36' , 6, 2, 2, 25),
('1026789012', 'Mariana', 'Díaz', 'Av. 230 #34-56', 4, 2, 1, 26),
('1027890123', 'Benjamín', 'García', 'Calle 240 #45-67', 4, 1, 2, 27),
('1028901234', 'Isidora', 'Martínez', 'Carrera 250 #56-78', 6, 2, 3, 28),
('1029012345', 'Emiliano', 'López', 'Av. 260 #67-89', 7, 1, 1, 29),
('1030123456', 'Antonella', 'Sánchez', 'Diagonal 270 #12-34', 4, 2, 2, 30),
('1031234567', 'Emilio', 'Torres', 'Carrera 280 #23-45', 3, 1, 3, 31),
('1032345678', 'Mariana', 'Ramírez', 'Av. 290 #34-56', 5, 2, 1, 32),
('1033456789', 'Benjamín', 'Hernández', 'Calle 300 #45-67', 4, 1, 2, 33),
('1034567890', 'Isidora', 'Díaz', 'Carrera 310 #56-78', 2, 2, 3, 34),
('1035678901', 'Emiliano', 'García', 'Av. 320 #67-89', 4, 1, 1, 35),
('1036789012', 'Antonella', 'Martínez', 'Diagonal 330 #12-34', 4, 2, 2, 36),
('1037890123', 'Emilio', 'López', 'Carrera 340 #23-45', 1, 1, 3, 37),
('1038901234', 'Mariana', 'Sánchez', 'Av. 350 #34-56', 7, 2, 1, 38),
('1039012345', 'Benjamín', 'Torres', 'Calle 360 #45-67', 1, 1, 2, 39),
('1045678901', 'Lucas', 'Fernández', 'Calle 45 #10-20', 1, 1, 1,  40),
('1046789012', 'Samantha', 'Rojas', 'Carrera 12 #34-56', 1, 1, 2,  41),
('1047890123', 'Martín', 'Gómez', 'Av. Principal #78-90', 1, 1, 3,  42),
('1048901234', 'Gabriela', 'López', 'Diagonal 25 #12-34', 1, 1, 1,  43),
('1049012345', 'Joaquín', 'Torres', 'Calle 30 #45-67', 1, 1, 2,  44),
('1050123456', 'Natalia', 'Cruz', 'Calle 50 #10-20', 1, 1, 1,  45),
('1051234567', 'Fernando', 'Salazar', 'Calle 60 #20-30', 1, 1, 2,  46),
('1052345678', 'Patricia', 'Mendoza', 'Calle 70 #30-40', 1, 1, 3,  47),
('1053456789', 'Ricardo', 'Pérez', 'Calle 80 #40-50', 1, 1, 1,  48),
('1054567890', 'Cecilia', 'González', 'Calle 90 #50-60', 1, 1, 2,  49),
('1055678901', 'Hugo', 'Alvarez', 'Calle 100 #60-70', 1, 1, 3,  50);






-- Insertar datos en la tabla Teléfonos de Campers
INSERT INTO telefono_camper (camper_id, telefono, tipo_telefono)
VALUES 
(1, '3001234567', 'Principal'),
(1, '3101234567', 'Emergencia'),
(2, '3002345678', 'Principal'),
(3, '3003456789', 'Principal'),
(3, '3103456789', 'Secundario'),
(4, '3004567890', 'Principal'),
(5, '3005678901', 'Principal'),
(6, '3006789012', 'Principal'),
(7, '3007890123', 'Principal'),
(8, '3008901234', 'Principal'),
(9, '3009012345', 'Principal'),
(10, '3010123456', 'Principal'),
(11, '3011234567', 'Principal'),
(12, '3012345678', 'Principal'),
(13, '3013456789', 'Principal'),
(14, '3014567890', 'Principal'),
(15, '3015678901', 'Principal'),
(16, '3016789012', 'Principal'),
(17, '3017890123', 'Principal'),
(18, '3018901234', 'Principal'),
(19, '3019012345', 'Principal'),
(20, '3020123456', 'Principal'),
(21, '3021234567', 'Principal'),
(22, '3022345678', 'Principal'),
(23, '3023456789', 'Principal'),
(24, '3024567890', 'Principal'),
(25, '3025678901', 'Principal'),
(26, '3026789012', 'Principal'),
(27, '3027890123', 'Principal'),
(28, '3028901234', 'Principal'),
(29, '3030123456', 'Principal'),
(30, '3031234567', 'Principal'),
(31, '3032345678', 'Principal'),
(32, '3033456789', 'Principal'),
(33, '3034567890', 'Principal'),
(34, '3035678901', 'Principal'),
(35, '3036789012', 'Principal'),
(36, '3037890123', 'Principal'),
(37, '3038901234', 'Principal'),
(38, '3039012345', 'Principal'),
(39, '3040123456', 'Principal'),
(40, '3041234567', 'Principal'),
(41, '3042345678', 'Principal'),
(42, '3043456789', 'Principal'),
(43, '3044567890', 'Principal'),
(44, '3045678901', 'Principal'),
(45, '3046789012', 'Principal'),
(46, '3047890123', 'Principal'),
(47, '3048901234', 'Principal'),
(48, '3049012345', 'Principal'),
(49, '3050123456', 'Principal'),
(50, '3051234567', 'Principal');

-- Insertar datos en la tabla Salones
INSERT INTO area (nombre, sede_id, capacidad)
VALUES 
('apolo', 1, 33),
('artemis', 1, 33),
('sputnik', 1, 33),
('apolo2', 2, 33),
('artemis2', 2, 33),
('sputnik2', 2, 33),
('apolo3', 3, 33),
('artemis3', 3, 33),
('sputnik3', 3, 33);



-- Insertar datos en la tabla Camper por Área
INSERT INTO camper_area (camper_id, area_id, fecha_inicio, fecha_fin)
VALUES 
(1, 1, '2023-01-01', '2023-11-01'),
(2, 1, '2023-01-01', NULL),
(3, 1, '2023-01-01', '2023-11-01'),
(4, 1, '2023-01-01', NULL),
(5, 1, '2023-01-01', '2023-11-01'),
(6, 1, '2023-01-01', '2023-11-01'),
(7, 1, '2023-01-01', NULL),
(8, 1, '2023-01-01', '2023-11-01'),
(9, 1, '2023-01-01', NULL),
(10, 1, '2023-01-01', '2023-11-01'),
(11, 1, '2023-01-01', '2023-11-01'),
(12, 1, '2023-01-01', NULL),
(13, 1, '2023-01-01', '2023-11-01'),
(14, 1, '2023-01-01', NULL),
(15, 1, '2023-01-01', '2023-11-01'),
(16, 1, '2023-01-01', '2023-11-01'),
(17, 1, '2023-01-01', NULL),
(18, 1, '2023-01-01', '2023-11-01'),
(19, 1, '2023-01-01', NULL),
(20, 1, '2023-01-01', '2023-11-01'),
(21, 1, '2023-01-01', '2023-11-01'),
(22, 1, '2023-01-01', NULL),
(23, 1, '2023-01-01', '2023-11-01'),
(24, 1, '2023-01-01', NULL),
(25, 1, '2023-01-01', '2023-11-01'),
(26, 1, '2023-01-01', '2023-11-01'),
(27, 1, '2023-01-01', NULL),
(28, 1, '2023-01-01', '2023-11-01'),
(29, 1, '2023-01-01', NULL),
(30, 1, '2023-01-01', '2023-11-01'),
(31, 1, '2023-01-01', '2023-11-01'),
(32, 1, '2023-01-01', NULL),
(33, 1, '2023-01-01', '2023-11-01'),
(34, 2, '2023-01-01', NULL),
(35, 2, '2023-01-01', '2023-11-01'),
(36, 2, '2023-01-01', '2023-11-01'),
(37, 3, '2023-01-01', NULL),
(38, 3, '2023-01-01', '2023-11-01'),
(39, 4, '2023-01-01', NULL),
(40, 4, '2023-01-01', '2023-11-01'),
(41, 5, '2023-01-01', '2023-11-01'),
(42, 5, '2023-01-01', NULL),
(43, 6, '2023-01-01', '2023-11-01'),
(44, 6, '2023-01-01', NULL),
(45, 7, '2023-01-01', '2023-11-01'),
(46, 7, '2023-01-01', '2023-11-01'),
(47, 8, '2023-01-01', NULL),
(48, 8, '2023-01-01', '2023-11-01'),
(49, 9, '2023-01-01', NULL),
(50, 9, '2023-01-01', '2023-11-01');



-- Insertar datos en la tabla Módulos
INSERT INTO modulos (nombre, descripcion)
VALUES 
('Fundamentos de Programación', 'Conceptos básicos de programación y algoritmos'),
('HTML y CSS', 'Desarrollo de interfaces con HTML5 y CSS3'),
('JavaScript Básico', 'Fundamentos de JavaScript y DOM'),
('JavaScript Avanzado', 'Asincronía, APIs y patrones avanzados'),
('React', 'Desarrollo de aplicaciones con React'),
('Node.js', 'Desarrollo backend con Node.js'),
('Python Básico', 'Fundamentos de programación con Python'),
('Data Science', 'Análisis de datos con Python y bibliotecas especializadas'),
('DevOps Fundamentals', 'Introducción a DevOps y CI/CD'),
('Seguridad Informática', 'Principios de ciberseguridad');

-- Insertar datos en la tabla Tecnologías
INSERT INTO tecnologias (nombre, descripcion)
VALUES 
('HTML', 'Lenguaje de marcado para desarrollo web'),
('CSS', 'Hojas de estilo en cascada'),
('JavaScript', 'Lenguaje de programación para web'),
('React', 'Biblioteca para interfaces de usuario'),
('Node.js', 'Entorno de ejecución para JavaScript'),
('Python', 'Lenguaje de programación de alto nivel'),
('MySQL', 'Sistema de gestión de bases de datos'),
('MongoDB', 'Base de datos NoSQL'),
('Git', 'Sistema de control de versiones'),
('Docker', 'Plataforma de contenedores');

-- Insertar datos en la tabla Rutas
INSERT INTO rutas (nombre, descripcion)
VALUES 
('Desarrollo Web Frontend', 'Ruta para convertirse en desarrollador frontend'),
('Desarrollo Web Full Stack', 'Ruta completa para desarrollo web'),
('Data Science', 'Ruta para análisis y ciencia de datos'),
('DevOps', 'Ruta para ingeniería DevOps'),
('Ciberseguridad', 'Ruta para especialista en seguridad informática');

-- Insertar datos en la tabla Relación Rutas-Módulos
INSERT INTO ruta_modulo (ruta_id, modulo_id, orden)
VALUES 
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 4),
(1, 5, 5),
(2, 1, 1),
(2, 2, 2),
(2, 3, 3),
(2, 4, 4),
(2, 5, 5),
(2, 6, 6),
(3, 1, 1),
(3, 7, 2),
(3, 8, 3),
(4, 1, 1),
(4, 9, 2),
(5, 1, 1),
(5, 10, 2);

-- Insertar datos en la tabla Relación Módulos-Tecnologías
INSERT INTO modulo_tecnologia (modulo_id, tecnologia_id, es_principal)
VALUES 
(1, 3, 0),
(2, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 6, 1),
(8, 6, 1),
(9, 9, 0),
(9, 10, 1),
(10, 6, 0);




-- Insertar datos en la tabla Horarios
INSERT INTO horarios (hora_inicio, hora_fin)
VALUES 
('06:00:00', '09:00:00'),
('10:00:00', '01:00:00'),
('14:00:00', '17:00:00'),
('18:00:00', '21:00:00');

-- Insertar datos en la tabla Trainers
INSERT INTO trainers (identificacion, nombres, apellidos, especialidad, sede_id)
VALUES 
('2001234567', 'jholver', 'pardo', 'Desarrollo Web', 1),
('2002345678', 'albahad', 'mamad', 'Inteligencia Artificial', 1),
('2003456789', 'Andrés', 'Vargas', 'Desarrollo Móvil', 2),
('2004567890', 'Carolina', 'Jiménez', 'DevOps', 3),
('2005678901', 'Javier', 'Rojas', 'Ciberseguridad', 2);

-- Insertar datos en la tabla Asignaciones de Trainers
INSERT INTO asignaciones_trainer (trainer_id, ruta_id, area_id, horario_id)
VALUES 
(1, 1, 1, 1),
(1, 2, 1, 2),
(2, 1, 2, 1),
(2, 3, 2, 2),
(3, 2, 1, 1),
(3, 3, 1, 2),
(4, 4, 3, 1),
(5, 5, 3, 2);

-- Insertar datos en la tabla Evaluaciones
INSERT INTO evaluaciones (camper_id, modulo_id, nota_teorica, nota_practica, nota_trabajos, nota_final, fecha_evaluacion)
VALUES 
(1, 1, 55.50, 60.00, 58.00, 58.60, '2023-02-15'),
(1, 2, 60.00, 62.50, 61.00, 61.65, '2023-03-20'),
(2, 1, 48.50, 50.00, 49.00, 49.35, '2023-02-15'),
(3, 1, 72.00, 75.50, 74.00, 74.25, '2023-03-01'),
(4, 1, 68.00, 71.50, 70.00, 70.25, '2023-03-15'),
(5, 1, 46.50, 49.00, 48.00, 48.05, '2023-02-15'),
(6, 1, 85.00, 87.50, 86.00, 86.65, '2022-08-01'),
(7, 1, 38.50, 41.00, 40.00, 40.05, '2022-09-01'),
(8, 1, 67.00, 69.50, 68.00, 68.65, '2022-10-01'),
(9, 1, 53.50, 56.00, 55.00, 55.15, '2023-04-01'),
(10, 1, 61.00, 63.50, 62.00, 62.65, '2023-04-15'),
(11, 1, 72.50, 77.00, 75.00, 75.45, '2023-05-01'),
(12, 1, 49.00, 53.50, 51.00, 51.70, '2023-05-01'),
(13, 1, 58.00, 62.50, 60.00, 60.85, '2023-05-15'),
(14, 1, 74.50, 79.00, 77.00, 77.45, '2023-05-15'),
(15, 1, 37.00, 41.50, 39.00, 39.70, '2023-06-01'),
(16, 1, 80.50, 84.00, 82.00, 82.70, '2023-03-01'),
(17, 1, 66.00, 70.50, 68.00, 69.00, '2023-03-15'),
(18, 1, 71.50, 76.00, 73.00, 74.25, '2023-04-01'),
(19, 1, 48.00, 52.50, 50.00, 50.85, '2023-04-15'),
(20, 1, 82.50, 86.00, 84.00, 84.70, '2023-05-01'),
(21, 1, 73.00, 76.50, 74.00, 75.15, '2023-02-15'),
(21, 2, 61.50, 65.00, 63.00, 63.65, '2023-03-20'),
(22, 1, 59.00, 62.50, 60.00, 61.15, '2023-02-15'),
(22, 2, 57.50, 61.00, 59.00, 59.65, '2023-03-20'),
(23, 1, 65.00, 68.50, 66.00, 67.15, '2023-03-01'),
(24, 1, 52.50, 56.00, 54.00, 54.70, '2023-03-15'),
(25, 1, 70.00, 73.50, 71.00, 72.15, '2023-04-01'),
(26, 1, 76.50, 80.00, 78.00, 78.70, '2023-02-15'),
(26, 2, 64.00, 67.50, 65.00, 66.15, '2023-03-20'),
(26, 3, 68.00, 71.50, 69.00, 70.15, '2023-04-25'),
(27, 1, 50.50, 54.00, 52.00, 52.70, '2023-02-15'),
(28, 1, 57.00, 60.50, 58.00, 59.15, '2023-03-01'),
(29, 1, 63.50, 67.00, 65.00, 65.70, '2023-03-15'),
(30, 1, 73.00, 76.50, 74.00, 75.15, '2023-04-01'),
(31, 1, 85.00, 88.00, 86.00, 86.90, '2022-02-15'),
(31, 2, 84.50, 87.50, 85.00, 86.40, '2022-03-20'),
(31, 3, 73.00, 76.00, 74.00, 74.90, '2022-04-25'),
(31, 4, 61.50, 64.50, 62.00, 63.35, '2022-05-30'),
(32, 1, 72.00, 75.00, 73.00, 74.00, '2022-02-15'),
(33, 1, 71.50, 74.50, 72.00, 73.35, '2022-03-01'),
(34, 1, 70.00, 73.00, 71.00, 71.80, '2022-03-15'),
(35, 1, 63.50, 66.50, 64.00, 65.35, '2022-04-01'), 
(36, 1, 45.00, 48.00, 46.00, 46.80, '2022-05-01'),
(37, 1, 38.50, 41.50, 39.00, 39.70, '2022-05-15'),
(38, 1, 55.00, 58.00, 56.00, 56.80, '2022-06-01'),
(39, 1, 62.50, 65.50, 63.00, 64.35, '2022-06-15');



-- Insertar datos en la tabla Matrículas
INSERT INTO matriculas (camper_id, ruta_id, fecha_inicio, fecha_fin, estado)
VALUES 
(1, 1, '2023-01-15', '2023-06-15', 'Completada'),
(2, 1, '2023-01-15', NULL, 'En curso'),
(3, 3, '2023-02-01', NULL, 'En curso'),
(4, 2, '2023-02-15', NULL, 'En curso'),
(5, 1, '2023-01-15', '2023-06-15', 'Completada'),
(6, 4, '2022-07-01', '2022-12-20', 'Completada'),
(7, 5, '2022-08-01', '2023-01-10', 'Cancelada'),
(8, 3, '2022-09-01', '2023-02-01', 'Completada'),
(9, 2, '2023-03-01', NULL, 'En curso'),
(10, 4, '2023-03-15', NULL, 'En curso'),
(11, 1, '2023-04-01', NULL, 'En curso'),
(12, 3, '2023-04-01', NULL, 'En curso'),
(13, 2, '2023-04-15', NULL, 'En curso'),
(14, 4, '2023-04-15', NULL, 'En curso'),
(15, 5, '2023-05-01', NULL, 'En curso'),
(16, 1, '2023-02-01', NULL, 'En curso'),
(17, 3, '2023-02-15', NULL, 'En curso'),
(18, 2, '2023-03-01', NULL, 'En curso'),
(19, 4, '2023-03-15', NULL, 'En curso'),
(20, 5, '2023-04-01', NULL, 'En curso'),
(21, 1, '2023-01-15', '2023-06-15', 'Completada'),
(22, 3, '2023-01-15', '2023-06-15', 'Completada'),
(23, 2, '2023-02-01', '2023-07-01', 'Completada'),
(24, 4, '2023-02-15', '2023-07-15', 'Completada'),
(25, 5, '2023-03-01', '2023-08-01', 'Completada'),
(26, 1, '2023-01-15', NULL, 'En curso'),
(27, 3, '2023-01-15', NULL, 'En curso'),
(28, 2, '2023-02-01', NULL, 'En curso'),
(29, 4, '2023-02-15', NULL, 'En curso'),
(30, 5, '2023-03-01', NULL, 'En curso'),
(31, 1, '2022-01-15', '2022-06-15', 'Completada'),
(32, 3, '2022-01-15', '2022-06-15', 'Completada'),
(33, 2, '2022-02-01', '2022-07-01', 'Completada'),
(34, 4, '2022-02-15', '2022-07-15', 'Completada'),
(35, 5, '2022-03-01', '2022-08-01', 'Completada'),
(36, 1, '2022-04-01', '2022-06-15', 'Cancelada'),
(37, 3, '2022-04-15', '2022-06-01', 'Cancelada'),
(38, 2, '2022-05-01', '2022-07-10', 'Cancelada'),
(39, 4, '2022-05-15', '2022-07-20', 'Cancelada');


-- Insertar datos en la tabla Relación Trainers-Tecnologías
INSERT INTO trainer_tecnologia (trainer_id, tecnologia_id, nivel_experiencia)
VALUES 
(1, 1, 'Senior'),
(1, 2, 'Senior'),
(1, 3, 'Senior'),
(1, 4, 'Middle'),
(2, 6, 'Senior'),
(2, 7, 'Middle'),
(3, 3, 'Senior'),
(3, 4, 'Middle'),
(3, 5, 'Junior'),
(4, 9, 'Senior'),
(4, 10, 'Senior'),
(5, 6, 'Middle'),
(5, 9, 'Senior');

-- Insertar datos en la tabla Porcentajes de Evaluación
INSERT INTO porcentajes_evaluacion (modulo_id, porcentaje_teorico, porcentaje_practico, porcentaje_quices)
VALUES 
(1, 30.00, 60.00, 10.00),
(2, 25.00, 65.00, 10.00),
(3, 30.00, 60.00, 10.00),
(4, 20.00, 70.00, 10.00),
(5, 20.00, 70.00, 10.00),
(6, 25.00, 65.00, 10.00),
(7, 35.00, 55.00, 10.00),
(8, 30.00, 60.00, 10.00),
(9, 40.00, 50.00, 10.00),
(10, 40.00, 50.00, 10.00);

-- Insertar datos en la tabla campers_estados
INSERT INTO campers_estados (camper_id, estado_id, fecha_cambio)
VALUES 
(1, 1, '2023-01-01'),  -- En proceso de ingreso
(1, 2, '2023-02-01'),  -- Inscrito
(1, 3, '2023-03-01'),  -- Aprobado
(2, 1, '2023-01-01'),  -- En proceso de ingreso
(2, 2, '2023-09-20'),  -- Inscrito (actualizado)
(3, 1, '2023-01-01'),  -- En proceso de ingreso
(3, 2, '2023-10-05'),  -- Inscrito (actualizado)
(3, 3, '2023-03-01'),  -- Aprobado
(4, 1, '2023-01-01'),  -- En proceso de ingreso
(4, 2, '2023-10-10'),  -- Inscrito (actualizado)
(5, 1, '2023-01-01'),  -- En proceso de ingreso
(5, 2, '2023-09-15'),  -- Inscrito (actualizado)
(6, 1, '2023-01-01'),  -- En proceso de ingreso
(6, 2, '2023-10-01'),  -- Inscrito (actualizado)
(7, 1, '2023-01-01'),  -- En proceso de ingreso
(7, 2, '2023-10-12'),  -- Inscrito (actualizado)
(8, 1, '2023-01-01'),  -- En proceso de ingreso
(8, 2, '2023-09-30'),  -- Inscrito (actualizado)
(9, 1, '2023-01-01'),  -- En proceso de ingreso
(9, 2, '2023-10-02'),  -- Inscrito (actualizado)
(10, 1, '2023-01-01'), -- En proceso de ingreso
(10, 2, '2023-10-03'), -- Inscrito (actualizado)
(11, 1, '2023-01-01'), -- En proceso de ingreso
(11, 2, '2023-10-04'), -- Inscrito (actualizado)
(12, 1, '2023-01-01'), -- En proceso de ingreso
(12, 2, '2023-10-06'), -- Inscrito (actualizado)
(13, 1, '2023-01-01'), -- En proceso de ingreso
(13, 2, '2023-10-07'), -- Inscrito (actualizado)
(14, 1, '2023-01-01'), -- En proceso de ingreso
(14, 2, '2023-10-08'), -- Inscrito (actualizado)
(15, 1, '2023-01-01'), -- En proceso de ingreso
(15, 2, '2023-10-09'), -- Inscrito (actualizado)
(16, 1, '2023-01-01'), -- En proceso de ingreso
(16, 2, '2023-10-11'), -- Inscrito (actualizado)
(17, 1, '2023-01-01'), -- En proceso de ingreso
(17, 2, '2023-10-13'), -- Inscrito (actualizado)
(18, 1, '2023-01-01'), -- En proceso de ingreso
(18, 2, '2023-10-14'), -- Inscrito (actualizado)
(19, 1, '2023-01-01'), -- En proceso de ingreso
(19, 2, '2023-10-15'), -- Inscrito (actualizado)
(20, 1, '2023-01-01'), -- En proceso de ingreso
(20, 2, '2023-10-15'), -- Inscrito (actualizado)
(21, 1, '2023-01-01'), -- En proceso de ingreso
(21, 2, '2023-10-15'), -- Inscrito (actualizado)
(22, 1, '2023-01-01'), -- En proceso de ingreso
(22, 2, '2023-10-15'), -- Inscrito (actualizado)
(23, 1, '2023-01-01'), -- En proceso de ingreso
(23, 2, '2023-10-15'), -- Inscrito (actualizado)
(24, 1, '2023-01-01'), -- En proceso de ingreso
(24, 2, '2023-10-15'), -- Inscrito (actualizado)
(25, 1, '2023-01-01'), -- En proceso de ingreso
(25, 2, '2023-10-15'), -- Inscrito (actualizado)
(26, 1, '2023-01-01'), -- En proceso de ingreso
(26, 2, '2023-10-15'), -- Inscrito (actualizado)
(27, 1, '2023-01-01'), -- En proceso de ingreso
(27, 2, '2023-10-15'), -- Inscrito (actualizado)
(28, 1, '2023-01-01'), -- En proceso de ingreso
(28, 2, '2023-10-15'), -- Inscrito (actualizado)
(29, 1, '2023-01-01'), -- En proceso de ingreso
(29, 2, '2023-10-15'), -- Inscrito (actualizado)
(30, 1, '2023-01-01'), -- En proceso de ingreso
(30, 2, '2023-10-15'), -- Inscrito (actualizado)
(31, 1, '2023-01-01'), -- En proceso de ingreso
(31, 2, '2023-10-15'), -- Inscrito (actualizado)
(32, 1, '2023-01-01'), -- En proceso de ingreso
(32, 2, '2023-10-15'), -- Inscrito (actualizado)
(33, 1, '2023-01-01'), -- En proceso de ingreso
(33, 2, '2023-10-15'), -- Inscrito (actualizado)
(34, 1, '2023-01-01'), -- En proceso de ingreso
(34, 2, '2023-10-15'), -- Inscrito (actualizado)
(35, 1, '2023-01-01'), -- En proceso de ingreso
(35, 2, '2023-10-15'), -- Inscrito (actualizado)
(36, 1, '2023-01-01'), -- En proceso de ingreso
(36, 2, '2023-10-15'), -- Inscrito (actualizado)
(37, 1, '2023-01-01'), -- En proceso de ingreso
(37, 2, '2023-10-15'), -- Inscrito (actualizado)
(38, 1, '2023-01-01'), -- En proceso de ingreso
(38, 2, '2023-10-15'), -- Inscrito (actualizado)
(39, 1, '2023-01-01'), -- En proceso de ingreso
(39, 2, '2023-10-15'), -- Inscrito (actualizado)
(40, 1, '2023-01-01'), -- En proceso de ingreso
(40, 2, '2023-10-15'), -- Inscrito (actualizado)
(41, 1, '2023-01-01'), -- En proceso de ingreso
(41, 2, '2023-10-15'), -- Inscrito (actualizado)
(42, 1, '2023-01-01'), -- En proceso de ingreso
(42, 2, '2023-10-15'), -- Inscrito (actualizado)
(43, 1, '2023-01-01'), -- En proceso de ingreso
(43, 2, '2023-10-15'), -- Inscrito (actualizado)
(44, 1, '2023-01-01'), -- En proceso de ingreso
(44, 2, '2023-10-15'), -- Inscrito (actualizado)
(45, 1, '2023-01-01'), -- En proceso de ingreso
(45, 2, '2023-10-15'), -- Inscrito (actualizado)
(46, 1, '2023-01-01'), -- En proceso de ingreso
(46, 2, '2023-10-15'), -- Inscrito (actualizado)
(47, 1, '2023-01-01'), -- En proceso de ingreso
(47, 2, '2023-10-15'), -- Inscrito (actualizado)
(48, 1, '2023-01-01'), -- En proceso de ingreso
(48, 2, '2023-10-15'), -- Inscrito (actualizado)
(49, 1, '2023-01-01'), -- En proceso de ingreso
(49, 2, '2023-10-15'), -- Inscrito (actualizado)
(50, 1, '2023-01-01'), -- En proceso de ingreso
(50, 2, '2023-10-15'); -- Inscrito (actualizado)


