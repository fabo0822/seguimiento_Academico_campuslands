-- Insertar el campus principal
INSERT INTO campus (nombre, nit, direccion_principal, telefono_principal, email_contacto, sitio_web, fecha_fundacion) 
VALUES ('CampusLands', '901.220.683-5', 'Calle Principal #123', '6076000000', 'info@campuslands.com', 'www.campuslands.com', '2018-01-01');

-- Insertar las sedes
INSERT INTO sedes (id_campus, nombre, direccion, telefono, email, capacidad_maxima, fecha_apertura) VALUES 
(1, 'Bucaramanga', 'Calle 104 #14-155 Floridablanca, Centro Empresarial OIKOS', '6076000001', 'bucaramanga@campuslands.com', 500, '2018-01-15'),
(1, 'Cúcuta', 'Av. 0 #0-00, Edificio Torre Norte', '6076000002', 'cucuta@campuslands.com', 350, '2019-03-01'),
(1, 'Bogotá', 'Carrera 7 #71-21, Torre B', '6076000003', 'bogota@campuslands.com', 450, '2020-02-01');

-- Insertar SGDBs
INSERT INTO sgdb (nombre, version, descripcion) VALUES 
('MySQL', '8.0', 'Sistema de gestión de bases de datos relacional'),
('MongoDB', '6.0', 'Base de datos NoSQL orientada a documentos'),
('PostgreSQL', '15', 'Sistema de gestión de bases de datos relacional orientado a objetos'),
('SQL Server', '2022', 'Sistema de gestión de bases de datos relacional de Microsoft'),
('Oracle', '21c', 'Sistema de gestión de bases de datos relacional empresarial');

-- Insertar módulos básicos
INSERT INTO modulos (nombre, descripcion) VALUES 
('Introducción a la algoritmia', 'Fundamentos de programación y lógica'),
('PSeInt', 'Aprendizaje de pseudocódigo'),
('Python', 'Programación básica con Python'),
('HTML', 'Desarrollo de páginas web con HTML'),
('CSS', 'Estilos para páginas web'),
('Bootstrap', 'Framework CSS para desarrollo web'),
('Java', 'Programación orientada a objetos con Java'),
('JavaScript', 'Programación para la web'),
('C#', 'Desarrollo de aplicaciones con C#'),
('MySQL Básico', 'Introducción a bases de datos relacionales'),
('MongoDB Básico', 'Introducción a bases de datos NoSQL'),
('PostgreSQL Básico', 'Gestión de bases de datos avanzadas'),
('NetCore', 'Desarrollo backend con .NET'),
('Spring Boot', 'Framework Java para desarrollo backend'),
('NodeJS', 'Entorno de ejecución para JavaScript'),
('Express', 'Framework para NodeJS');

-- Insertar horarios estándar
INSERT INTO horarios (hora_inicio, hora_fin, descripcion) VALUES 
('08:00:00', '12:00:00', 'Mañana'),
('13:00:00', '17:00:00', 'Tarde'),
('18:00:00', '22:00:00', 'Noche');

-- Insertar rutas de entrenamiento
INSERT INTO rutas_entrenamiento (nombre, descripcion, duracion_meses) VALUES
('Desarrollo Web Full Stack', 'Formación completa en desarrollo web front-end y back-end', 9),
('Desarrollo Java', 'Especialización en desarrollo de aplicaciones Java', 6),
('Desarrollo .NET', 'Especialización en desarrollo con tecnologías Microsoft', 6),
('Desarrollo NodeJS', 'Especialización en desarrollo backend con NodeJS', 5);

-- Crear áreas de entrenamiento
INSERT INTO areas_entrenamiento (nombre, capacidad_maxima, id_sede) VALUES
('Artemis', 33, 1),
('Apolo', 33, 1),
('Sputnik', 33, 1),
('Skylab', 33, 2),
('Challenger', 33, 2),
('Discovery', 33, 3),
('Enterprise', 33, 3);

-- Conectar las áreas con horarios
INSERT INTO areas_horarios (id_area, id_horario, disponible) VALUES
(1, 1, TRUE), (1, 2, TRUE), (1, 3, TRUE),
(2, 1, TRUE), (2, 2, TRUE), (2, 3, TRUE),
(3, 1, TRUE), (3, 2, TRUE), (3, 3, TRUE),
(4, 1, TRUE), (4, 2, TRUE), (4, 3, TRUE),
(5, 1, TRUE), (5, 2, TRUE), (5, 3, TRUE),
(6, 1, TRUE), (6, 2, TRUE), (6, 3, TRUE),
(7, 1, TRUE), (7, 2, TRUE), (7, 3, TRUE);

-- Conectar rutas con SGDBs
INSERT INTO rutas_sgdb (id_ruta, id_sgdb, tipo) VALUES
(1, 1, 'Principal'), (1, 3, 'Alternativo'),
(2, 1, 'Principal'), (2, 5, 'Alternativo'),
(3, 4, 'Principal'), (3, 1, 'Alternativo'),
(4, 2, 'Principal'), (4, 1, 'Alternativo');

-- Asociar módulos a rutas
INSERT INTO modulos_ruta (id_ruta, id_modulo, orden, duracion_dias) VALUES
-- Ruta Desarrollo Web Full Stack
(1, 1, 1, 15), -- Introducción a la algoritmia
(1, 2, 2, 15), -- PSeInt
(1, 3, 3, 30), -- Python
(1, 4, 4, 15), -- HTML
(1, 5, 5, 15), -- CSS
(1, 6, 6, 15), -- Bootstrap
(1, 8, 7, 30), -- JavaScript
(1, 10, 8, 30), -- MySQL Básico
(1, 16, 9, 30), -- Express

-- Ruta Desarrollo Java
(2, 1, 1, 15), -- Introducción a la algoritmia
(2, 7, 2, 45), -- Java
(2, 10, 3, 30), -- MySQL Básico
(2, 14, 4, 45), -- Spring Boot

-- Ruta Desarrollo .NET
(3, 1, 1, 15), -- Introducción a la algoritmia
(3, 9, 2, 45), -- C#
(3, 10, 3, 30), -- MySQL Básico
(3, 13, 4, 45), -- NetCore

-- Ruta Desarrollo NodeJS
(4, 1, 1, 15), -- Introducción a la algoritmia
(4, 8, 2, 30), -- JavaScript
(4, 11, 3, 30), -- MongoDB Básico
(4, 15, 4, 30), -- NodeJS
(4, 16, 5, 30); -- Express