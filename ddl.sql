-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS campuslands;
USE campuslands;

-- Tabla de Empresa
CREATE TABLE empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    nit VARCHAR(20) UNIQUE NOT NULL,
    direccion_principal VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    sitio_web VARCHAR(100),
    fecha_fundacion DATE
);

-- Tabla de Estados
CREATE TABLE estados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de Ciudades
CREATE TABLE ciudades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de Sedes Campus
CREATE TABLE sedes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    ciudad_id INT,
    empresa_id INT,
    FOREIGN KEY (ciudad_id) REFERENCES ciudades(id),
    FOREIGN KEY (empresa_id) REFERENCES empresa(id)
);

-- Tabla de Niveles de Riesgo
CREATE TABLE niveles_riesgo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nivel VARCHAR(20) NOT NULL
);

-- tabla acuediente
CREATE TABLE acudiente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

-- tabla tipo documento
CREATE TABLE tipo_documento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo ENUM('Cédula de Ciudadanía', 'Tarjeta de Identidad', 'Cédula de Extranjería') NOT NULL
);


-- Tabla Campers
CREATE TABLE campers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    acudiente_id INT,
    estado_id INT,
    nivel_riesgo_id INT,
    sede_id INT,
    tipo_documento_id INT,
    FOREIGN KEY (estado_id) REFERENCES estados(id),
    FOREIGN KEY (nivel_riesgo_id) REFERENCES niveles_riesgo(id),
    FOREIGN KEY (sede_id) REFERENCES sedes(id),
    FOREIGN KEY (acudiente_id) REFERENCES acudiente(id),
    FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento(id)
);


-- Tabla de Teléfonos de Campers
CREATE TABLE telefono_camper (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo_telefono ENUM('Principal', 'Secundario', 'Emergencia') NOT NULL,
    FOREIGN KEY (camper_id) REFERENCES campers(id)
);

-- Tabla de area(salones)
CREATE TABLE area (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    sede_id INT,
    capacidad INT DEFAULT 33,
    FOREIGN KEY (sede_id) REFERENCES sedes(id)
);

-- Tabla intermedia para Campers y Áreas
CREATE TABLE camper_area (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT NOT NULL,
    area_id INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (area_id) REFERENCES area(id)
);

-- Tabla de Módulos
CREATE TABLE modulos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de Tecnologías
CREATE TABLE tecnologias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Tabla de Rutas
CREATE TABLE rutas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Tabla de relación Rutas-Módulos
CREATE TABLE ruta_modulo (
    ruta_id INT,
    modulo_id INT,
    orden INT NOT NULL,
    PRIMARY KEY (ruta_id, modulo_id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);

-- Tabla de relación Módulos-Tecnologías
CREATE TABLE modulo_tecnologia (
    modulo_id INT,
    tecnologia_id INT,
    es_principal BOOLEAN DEFAULT false,
    PRIMARY KEY (modulo_id, tecnologia_id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    FOREIGN KEY (tecnologia_id) REFERENCES tecnologias(id)
);





-- Tabla de Horarios
CREATE TABLE horarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

-- Tabla de Trainers
CREATE TABLE trainers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    identificacion VARCHAR(20) UNIQUE NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    especialidad VARCHAR(100),
    sede_id INT,
    FOREIGN KEY (sede_id) REFERENCES sedes(id)
);

-- Tabla de Asignaciones de Trainers
CREATE TABLE asignaciones_trainer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    trainer_id INT,
    ruta_id INT,
    area_id INT,
    horario_id INT,
    FOREIGN KEY (trainer_id) REFERENCES trainers(id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (area_id) REFERENCES area(id),
    FOREIGN KEY (horario_id) REFERENCES horarios(id)

);

-- Tabla de Evaluaciones
CREATE TABLE evaluaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT,
    modulo_id INT,
    nota_teorica DECIMAL(5,2),
    nota_practica DECIMAL(5,2),
    nota_trabajos DECIMAL(5,2),
    nota_final DECIMAL(5,2),
    fecha_evaluacion DATE,
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (modulo_id) REFERENCES modulos(id)
);

-- Tabla de Matriculas
CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    camper_id INT,
    ruta_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20),
    FOREIGN KEY (camper_id) REFERENCES campers(id),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id)
);

-- Tabla intermedia para Trainers y Tecnologías
CREATE TABLE trainer_tecnologia (
    trainer_id INT,
    tecnologia_id INT,
    nivel_experiencia ENUM('Junior', 'Middle', 'Senior') NOT NULL,
    PRIMARY KEY (trainer_id, tecnologia_id),
    FOREIGN KEY (trainer_id) REFERENCES trainers(id),
    FOREIGN KEY (tecnologia_id) REFERENCES tecnologias(id)
);

-- Tabla de Porcentajes de Evaluación por Módulo
CREATE TABLE porcentajes_evaluacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modulo_id INT NOT NULL,
    porcentaje_teorico DECIMAL(5,2) DEFAULT 30.00,
    porcentaje_practico DECIMAL(5,2) DEFAULT 60.00,
    porcentaje_quices DECIMAL(5,2) DEFAULT 10.00,
    FOREIGN KEY (modulo_id) REFERENCES modulos(id),
    CHECK (porcentaje_teorico + porcentaje_practico + porcentaje_quices = 100.00)
);


