-- Insertar datos en la tabla Empresa
INSERT INTO empresa (nombre, nit, direccion_principal, telefono, email, sitio_web, fecha_fundacion)
VALUES 
('CampusLands', '900123456-7', 'Av. Siempre Viva 123', '5551234567', 'info@campuslands.com', 'www.campuslands.com', '2018-01-15'),
('Tech Academy', '900987654-3', 'Calle Innovación 456', '5559876543', 'contacto@techacademy.com', 'www.techacademy.com', '2019-03-20');

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
('Campus Central', 'Calle 123 #45-67', 1, 1),
('Campus Norte', 'Av. Principal 234', 2, 1),
('Campus Sur', 'Carrera 56 #78-90', 3, 1),
('Tech Academy HQ', 'Carrera 45 #12-34', 2, 2);

-- Insertar datos en la tabla Niveles de Riesgo
INSERT INTO niveles_riesgo (nivel)
VALUES 
('Bajo'),
('Medio'),
('Alto');

-- Insertar datos en la tabla Campers
INSERT INTO campers (identificacion, nombres, apellidos, direccion, acudiente, estado_id, nivel_riesgo_id, sede_id)
VALUES 
('1001234567', 'Juan', 'Pérez', 'Calle 10 #23-45', 'María Pérez', 4, 1, 1),
('1002345678', 'Ana', 'Gómez', 'Av. 5 #12-34', 'Carlos Gómez', 3, 1, 1),
('1003456789', 'Pedro', 'Rodríguez', 'Carrera 15 #45-67', 'Laura Rodríguez', 1, 2, 2),
('1004567890', 'Sofía', 'Martínez', 'Calle 20 #56-78', 'Jorge Martínez', 2, 1, 2),
('1005678901', 'Carlos', 'López', 'Av. 30 #67-89', 'Patricia López', 4, 2, 1),
('1006789012', 'Valentina', 'Sánchez', 'Diagonal 25 #12-34', 'Roberto Sánchez', 5, 1, 3),
('1007890123', 'Diego', 'Torres', 'Carrera 40 #23-45', 'Claudia Torres', 6, 3, 3),
('1008901234', 'Isabella', 'Ramírez', 'Calle 50 #34-56', 'Fernando Ramírez', 7, 2, 1),
('1009012345', 'Alejandro', 'Hernández', 'Av. 60 #45-67', 'Mónica Hernández', 4, 1, 2),
('1010123456', 'Camila', 'Díaz', 'Carrera 70 #56-78', 'Eduardo Díaz', 4, 2, 3),
('1011234567', 'Fernando', 'Aguilar', 'Calle 15 #10-25', 'Mariana Aguilar', 1, 1, 1),
('1012345678', 'Marcela', 'Velasco', 'Av. 8 #22-14', 'Jaime Velasco', 1, 2, 2),
('1013456789', 'Gabriel', 'Orozco', 'Carrera 25 #45-12', 'Luz Orozco', 1, 1, 3),
('1014567890', 'Daniela', 'Paredes', 'Calle 30 #16-28', 'Miguel Paredes', 1, 3, 1),
('1015678901', 'Ricardo', 'Quintero', 'Diagonal 45 #27-39', 'Carmen Quintero', 1, 2, 2),
('1016789012', 'Natalia', 'Bedoya', 'Carrera 22 #33-67', 'Pablo Bedoya', 2, 1, 3),
('1017890123', 'Julián', 'Castaño', 'Av. 40 #21-54', 'Martha Castaño', 2, 2, 1),
('1018901234', 'Mariana', 'Duarte', 'Calle 65 #14-26', 'Luis Duarte', 2, 1, 2),
('1019012345', 'Santiago', 'Restrepo', 'Diagonal 35 #49-71', 'Sara Restrepo', 2, 3, 3),
('1020123456', 'Valentina', 'Montoya', 'Carrera 50 #66-88', 'Héctor Montoya', 2, 2, 1),
('1021234567', 'Andrés', 'Zapata', 'Calle 75 #30-42', 'Ángela Zapata', 3, 1, 2),
('1022345678', 'Laura', 'Bernal', 'Av. 32 #82-59', 'Roberto Bernal', 3, 2, 3),
('1023456789', 'Sebastián', 'Giraldo', 'Carrera 37 #12-84', 'Isabel Giraldo', 3, 1, 1),
('1024567890', 'Catalina', 'Morales', 'Diagonal 42 #23-67', 'Andrés Morales', 3, 3, 2),
('1025678901', 'Esteban', 'Hurtado', 'Calle 55 #41-29', 'Teresa Hurtado', 3, 2, 3),
('1026789012', 'Valeria', 'Castro', 'Carrera 62 #13-75', 'Diego Castro', 4, 1, 1),
('1027890123', 'Mateo', 'Vargas', 'Av. 28 #71-36', 'Natalia Vargas', 4, 2, 2),
('1028901234', 'Camila', 'Correa', 'Calle 85 #24-58', 'Juan Correa', 4, 1, 3),
('1029012345', 'Felipe', 'Ospina', 'Diagonal 33 #67-91', 'Paula Ospina', 4, 3, 1),
('1030123456', 'Isabella', 'Jaramillo', 'Carrera 44 #36-63', 'Carlos Jaramillo', 4, 2, 2),
('1031234567', 'Santiago', 'Cardona', 'Calle 92 #30-47', 'Marcela Cardona', 5, 1, 3),
('1032345678', 'María', 'González', 'Av. 38 #22-59', 'Fernando González', 5, 2, 1),
('1033456789', 'Juan', 'Salazar', 'Carrera 27 #52-84', 'Ana Salazar', 5, 1, 2),
('1034567890', 'Paula', 'Mejía', 'Diagonal 42 #63-17', 'Julián Mejía', 5, 3, 3),
('1035678901', 'David', 'Ruiz', 'Calle 55 #81-29', 'Lucía Ruiz', 5, 2, 1),
('1036789012', 'Alejandra', 'Vélez', 'Carrera 62 #43-75', 'Hernando Vélez', 6, 1, 2),
('1037890123', 'Samuel', 'Mendoza', 'Av. 78 #31-36', 'Carolina Mendoza', 6, 2, 3),
('1038901234', 'Gabriela', 'Uribe', 'Calle 85 #24-58', 'Mauricio Uribe', 6, 1, 1),
('1039012345', 'Lucas', 'Arango', 'Diagonal 33 #67-91', 'Patricia Arango', 6, 3, 2),
('1040123456', 'Manuela', 'Escobar', 'Carrera 44 #36-63', 'Ricardo Escobar', 6, 2, 3),
('1041234567', 'José', 'Patiño', 'Calle 32 #20-47', 'Claudia Patiño', 7, 1, 1),
('1042345678', 'Sara', 'Osorio', 'Av. 58 #42-59', 'Andrés Osorio', 7, 2, 2),
('1043456789', 'Daniel', 'Botero', 'Carrera 67 #22-84', 'Margarita Botero', 7, 1, 3),
('1044567890', 'Luciana', 'Valencia', 'Diagonal 72 #13-17', 'Esteban Valencia', 7, 3, 1),
('1045678901', 'Tomás', 'Bueno', 'Calle 45 #31-29', 'Valentina Bueno', 7, 2, 2);

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
(29, '3029012345', 'Principal'),
(30, '3030123456', 'Principal'),
(31, '3031234567', 'Principal'),
(32, '3032345678', 'Principal'),
(33, '3033456789', 'Principal'),
(34, '3034567890', 'Principal'),
(35, '3035678901', 'Principal'),
(36, '3036789012', 'Principal'),
(37, '3037890123', 'Principal'),
(38, '3038901234', 'Principal'),
(39, '3039012345', 'Principal'),
(40, '3040123456', 'Principal'),
(41, '3041234567', 'Principal'),
(42, '3042345678', 'Principal'),
(43, '3043456789', 'Principal'),
(44, '3044567890', 'Principal'),
(45, '3045678901', 'Principal');

-- Insertar datos en la tabla Áreas de Entrenamiento
INSERT INTO areas_entrenamiento (nombre, capacidad_maxima, sede_id)
VALUES 
('Desarrollo Web', 30, 1),
('Inteligencia Artificial', 25, 1),
('Desarrollo Móvil', 28, 2),
('DevOps', 20, 3),
('Ciberseguridad', 22, 2);

-- Insertar datos en la tabla Camper por Área
INSERT INTO camper_area (camper_id, area_id, fecha_inicio, fecha_fin)
VALUES 
(1, 1, '2023-01-15', '2023-06-15'),
(2, 1, '2023-01-15', NULL),
(3, 2, '2023-02-01', NULL),
(4, 3, '2023-02-15', NULL),
(5, 1, '2023-01-15', '2023-06-15'),
(6, 4, '2022-07-01', '2022-12-20'),
(7, 5, '2022-08-01', '2023-01-10'),
(8, 2, '2022-09-01', '2023-02-01'),
(9, 3, '2023-03-01', NULL),
(10, 4, '2023-03-15', NULL),
(11, 1, '2023-04-01', NULL),
(12, 2, '2023-04-01', NULL),
(13, 3, '2023-04-15', NULL),
(14, 4, '2023-04-15', NULL),
(15, 5, '2023-05-01', NULL),
(16, 1, '2023-02-01', NULL),
(17, 2, '2023-02-15', NULL),
(18, 3, '2023-03-01', NULL),
(19, 4, '2023-03-15', NULL),
(20, 5, '2023-04-01', NULL),
(21, 1, '2023-01-15', '2023-06-15'),
(22, 2, '2023-01-15', '2023-06-15'),
(23, 3, '2023-02-01', '2023-07-01'),
(24, 4, '2023-02-15', '2023-07-15'),
(25, 5, '2023-03-01', '2023-08-01'),
(26, 1, '2023-01-15', NULL),
(27, 2, '2023-01-15', NULL),
(28, 3, '2023-02-01', NULL),
(29, 4, '2023-02-15', NULL),
(30, 5, '2023-03-01', NULL),
(31, 1, '2022-01-15', '2022-06-15'),
(32, 2, '2022-01-15', '2022-06-15'),
(33, 3, '2022-02-01', '2022-07-01'),
(34, 4, '2022-02-15', '2022-07-15'),
(35, 5, '2022-03-01', '2022-08-01'),
(36, 1, '2022-04-01', '2022-06-15'),
(37, 2, '2022-04-15', '2022-06-01'),
(38, 3, '2022-05-01', '2022-07-10'),
(39, 4, '2022-05-15', '2022-07-20'),
(40, 5, '2022-06-01', '2022-08-15'),
(41, 1, '2022-03-01', '2022-05-15'),
(42, 2, '2022-03-15', '2022-05-01'),
(43, 3, '2022-04-01', '2022-06-10'),
(44, 4, '2022-04-15', '2022-06-20'),
(45, 5, '2022-05-01', '2022-07-15');


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

-- Insertar datos en la tabla Salones
INSERT INTO salones (nombre, area_id, capacidad)
VALUES 
('Turing', 1, 30),
('Jobs', 1, 25),
('Gates', 2, 25),
('Lovelace', 3, 28),
('Hopper', 4, 20),
('Berners-Lee', 5, 22);

-- Insertar datos en la tabla Horarios
INSERT INTO horarios (hora_inicio, hora_fin)
VALUES 
('08:00:00', '12:00:00'),
('14:00:00', '18:00:00'),
('18:00:00', '22:00:00');

-- Insertar datos en la tabla Trainers
INSERT INTO trainers (identificacion, nombres, apellidos, especialidad, sede_id)
VALUES 
('2001234567', 'Roberto', 'García', 'Desarrollo Web', 1),
('2002345678', 'Lucía', 'Fernández', 'Inteligencia Artificial', 1),
('2003456789', 'Andrés', 'Vargas', 'Desarrollo Móvil', 2),
('2004567890', 'Carolina', 'Jiménez', 'DevOps', 3),
('2005678901', 'Javier', 'Rojas', 'Ciberseguridad', 2);

-- Insertar datos en la tabla Asignaciones de Trainers
INSERT INTO asignaciones_trainer (trainer_id, ruta_id, area_id, horario_id, salon_id)
VALUES 
(1, 1, 1, 1, 1),
(1, 2, 1, 2, 2),
(2, 3, 2, 1, 3),
(3, 2, 3, 2, 4),
(4, 4, 4, 3, 5),
(5, 5, 5, 3, 6);

-- Insertar datos en la tabla Evaluaciones
INSERT INTO evaluaciones (camper_id, modulo_id, nota_teorica, nota_practica, nota_trabajos, nota_final, fecha_evaluacion)
VALUES 
(1, 1, 85.50, 90.00, 88.00, 88.60, '2023-02-15'),
(1, 2, 90.00, 92.50, 91.00, 91.65, '2023-03-20'),
(2, 1, 78.50, 80.00, 79.00, 79.35, '2023-02-15'),
(3, 1, 82.00, 85.50, 84.00, 84.25, '2023-03-01'),
(4, 1, 88.00, 91.50, 90.00, 90.25, '2023-03-15'),
(5, 1, 76.50, 79.00, 78.00, 78.05, '2023-02-15'),
(6, 1, 95.00, 97.50, 96.00, 96.65, '2022-08-01'),
(7, 1, 68.50, 71.00, 70.00, 70.05, '2022-09-01'),
(8, 1, 87.00, 89.50, 88.00, 88.65, '2022-10-01'),
(9, 1, 83.50, 86.00, 85.00, 85.15, '2023-04-01'),
(10, 1, 91.00, 93.50, 92.00, 92.65, '2023-04-15'),
(11, 1, 82.50, 87.00, 85.00, 85.45, '2023-05-01'),
(12, 1, 79.00, 83.50, 81.00, 81.70, '2023-05-01'),
(13, 1, 88.00, 92.50, 90.00, 90.85, '2023-05-15'),
(14, 1, 84.50, 89.00, 87.00, 87.45, '2023-05-15'),
(15, 1, 77.00, 81.50, 79.00, 79.70, '2023-06-01'),
(16, 1, 90.50, 94.00, 92.00, 92.70, '2023-03-01'),
(17, 1, 86.00, 90.50, 88.00, 89.00, '2023-03-15'),
(18, 1, 81.50, 86.00, 83.00, 84.25, '2023-04-01'),
(19, 1, 78.00, 82.50, 80.00, 80.85, '2023-04-15'),
(20, 1, 92.50, 96.00, 94.00, 94.70, '2023-05-01'),
(21, 1, 93.00, 96.50, 94.00, 95.15, '2023-02-15'),
(21, 2, 91.50, 95.00, 93.00, 93.65, '2023-03-20'),
(22, 1, 89.00, 92.50, 90.00, 91.15, '2023-02-15'),
(22, 2, 87.50, 91.00, 89.00, 89.65, '2023-03-20'),
(23, 1, 85.00, 88.50, 86.00, 87.15, '2023-03-01'),
(24, 1, 82.50, 86.00, 84.00, 84.70, '2023-03-15'),
(25, 1, 90.00, 93.50, 91.00, 92.15, '2023-04-01'),
(26, 1, 86.50, 90.00, 88.00, 88.70, '2023-02-15'),
(26, 2, 84.00, 87.50, 85.00, 86.15, '2023-03-20'),
(26, 3, 88.00, 91.50, 89.00, 90.15, '2023-04-25'),
(27, 1, 90.50, 94.00, 92.00, 92.70, '2023-02-15'),
(28, 1, 87.00, 90.50, 88.00, 89.15, '2023-03-01'),
(29, 1, 83.50, 87.00, 85.00, 85.70, '2023-03-15'),
(30, 1, 93.00, 96.50, 94.00, 95.15, '2023-04-01'),
(31, 1, 95.00, 98.00, 96.00, 96.90, '2022-02-15'),
(31, 2, 94.50, 97.50, 95.00, 96.40, '2022-03-20'),
(31, 3, 93.00, 96.00, 94.00, 94.90, '2022-04-25'),
(31, 4, 91.50, 94.50, 92.00, 93.35, '2022-05-30'),
(32, 1, 92.00, 95.00, 93.00, 94.00, '2022-02-15'),
(33, 1, 91.50, 94.50, 92.00, 93.35, '2022-03-01'),
(34, 1, 90.00, 93.00, 91.00, 91.80, '2022-03-15'),
(35, 1, 93.50, 96.50, 94.00, 95.35, '2022-04-01');

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
(39, 4, '2022-05-15', '2022-07-20', 'Cancelada'),
(40, 5, '2022-06-01', '2022-08-15', 'Cancelada'),
(41, 1, '2022-03-01', '2022-05-15', 'Cancelada'),
(42, 3, '2022-03-15', '2022-05-01', 'Cancelada'),
(43, 2, '2022-04-01', '2022-06-10', 'Cancelada'),
(44, 4, '2022-04-15', '2022-06-20', 'Cancelada'),
(45, 5, '2022-05-01', '2022-07-15', 'Cancelada');

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


INSERT INTO campers (identificacion, nombres, apellidos, direccion, acudiente, estado_id, nivel_riesgo_id, sede_id)
VALUES 
('1046789012', 'Elena', 'Suárez', 'Calle 90 #30-20', 'Luis Suárez', 3, 1, 1),
('1047890123', 'Martín', 'López', 'Carrera 15 #50-80', 'Clara López', 3, 1, 1),
('1048901234', 'Raúl', 'Fernández', 'Diagonal 60 #22-33', 'Esteban Fernández', 3, 1, 1),
('1049012345', 'Lucía', 'Ramírez', 'Av. 18 #40-70', 'Patricia Ramírez', 3, 1, 2),
('1050123456', 'Eduardo', 'González', 'Carrera 80 #10-90', 'Fernando González', 3, 1, 1);
