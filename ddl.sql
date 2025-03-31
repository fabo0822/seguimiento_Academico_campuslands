-- Estructura de la base de datos para el Seguimiento Académico de CampusLands

-- Tabla Campus (entidad principal)
CREATE TABLE campus (
    id_campus INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL DEFAULT 'CampusLands',
    nit VARCHAR(20) UNIQUE NOT NULL,
    direccion_principal VARCHAR(100),
    telefono_principal VARCHAR(15),
    email_contacto VARCHAR(100),
    sitio_web VARCHAR(100),
    fecha_fundacion DATE,
    descripcion TEXT,
    logo_url VARCHAR(255),
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

-- Tabla Sedes (ubicaciones físicas de CampusLands)
CREATE TABLE sedes (
    id_sede INT PRIMARY KEY AUTO_INCREMENT,
    id_campus INT NOT NULL,
    nombre ENUM('Bucaramanga', 'Cúcuta', 'Bogotá') NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    capacidad_maxima INT NOT NULL,
    fecha_apertura DATE,
    director VARCHAR(100),
    estado ENUM('Activa', 'Inactiva', 'En expansión') DEFAULT 'Activa',
    FOREIGN KEY (id_campus) REFERENCES campus(id_campus)
);

-- Tabla Acudientes (para menores de edad)
CREATE TABLE acudientes (
    id_acudiente INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    tipo_identificacion ENUM('CC', 'CE', 'Pasaporte') NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL,
    telefono_principal VARCHAR(15) NOT NULL,
    telefono_alternativo VARCHAR(15),
    email VARCHAR(100),
    direccion VARCHAR(100) NOT NULL,
    parentesco ENUM('Padre', 'Madre', 'Abuelo', 'Abuela', 'Tío', 'Tía', 'Hermano', 'Hermana', 'Otro') NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (tipo_identificacion, numero_identificacion)
);

-- Tabla Campers (Estudiantes)
CREATE TABLE campers (
    id_camper INT PRIMARY KEY AUTO_INCREMENT,
    tipo_identificacion ENUM('TI', 'CC', 'CE', 'Pasaporte') NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad INT GENERATED ALWAYS AS (TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE())) STORED,
    direccion VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_acudiente INT NULL,
    estado ENUM('En proceso de ingreso', 'Inscrito', 'Aprobado', 'Cursando', 'Graduado', 'Expulsado', 'Retirado') NOT NULL DEFAULT 'En proceso de ingreso',
    nivel_riesgo ENUM('Bajo', 'Medio', 'Alto') DEFAULT 'Bajo',
    id_sede INT NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_acudiente) REFERENCES acudientes(id_acudiente),
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede),
    UNIQUE KEY (tipo_identificacion, numero_identificacion),
    CONSTRAINT chk_menor_acudiente CHECK ((edad < 18 AND id_acudiente IS NOT NULL) OR (edad >= 18))
);

-- Tabla Teléfonos de Camper
CREATE TABLE telefonos_camper (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo_telefono ENUM('Personal', 'Casa', 'Emergencia') NOT NULL,
    FOREIGN KEY (id_camper) REFERENCES campers(id_camper) ON DELETE CASCADE
);

-- Tabla Rutas de Entrenamiento
CREATE TABLE rutas_entrenamiento (
    id_ruta INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion_meses INT NOT NULL,
    estado ENUM('Activa', 'Inactiva') DEFAULT 'Activa'
);

-- Tabla Sistemas de Gestión de Bases de Datos
CREATE TABLE sgdb (
    id_sgdb INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    version VARCHAR(20),
    descripcion TEXT
);

-- Tabla de relación Rutas y SGDBs
CREATE TABLE rutas_sgdb (
    id_ruta INT NOT NULL,
    id_sgdb INT NOT NULL,
    tipo ENUM('Principal', 'Alternativo') NOT NULL,
    PRIMARY KEY (id_ruta, id_sgdb),
    FOREIGN KEY (id_ruta) REFERENCES rutas_entrenamiento(id_ruta),
    FOREIGN KEY (id_sgdb) REFERENCES sgdb(id_sgdb)
);

-- Tabla Módulos de Aprendizaje
CREATE TABLE modulos (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    porcentaje_teorico DECIMAL(5,2) DEFAULT 30.00,
    porcentaje_practico DECIMAL(5,2) DEFAULT 60.00,
    porcentaje_quizzes DECIMAL(5,2) DEFAULT 10.00,
    CONSTRAINT chk_porcentaje_total CHECK (porcentaje_teorico + porcentaje_practico + porcentaje_quizzes = 100.00)
);

-- Tabla relación Módulos y Rutas
CREATE TABLE modulos_ruta (
    id_modulo_ruta INT PRIMARY KEY AUTO_INCREMENT,
    id_ruta INT NOT NULL,
    id_modulo INT NOT NULL,
    orden INT NOT NULL,
    duracion_dias INT NOT NULL,
    FOREIGN KEY (id_ruta) REFERENCES rutas_entrenamiento(id_ruta),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo),
    UNIQUE KEY (id_ruta, id_modulo),
    UNIQUE KEY (id_ruta, orden)
);

-- Tabla Áreas de Entrenamiento
CREATE TABLE areas_entrenamiento (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    capacidad_maxima INT NOT NULL DEFAULT 33,
    id_sede INT NOT NULL,
    descripcion TEXT,
    estado ENUM('Activa', 'Inactiva', 'En mantenimiento') DEFAULT 'Activa',
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede)
);

-- Tabla Horarios
CREATE TABLE horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    descripcion VARCHAR(50),
    CONSTRAINT chk_hora_valida CHECK (hora_inicio < hora_fin)
);

-- Tabla relación Áreas y Horarios
CREATE TABLE areas_horarios (
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    disponible BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (id_area, id_horario),
    FOREIGN KEY (id_area) REFERENCES areas_entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES horarios(id_horario)
);

-- Tabla Trainers (Entrenadores)
CREATE TABLE trainers (
    id_trainer INT PRIMARY KEY AUTO_INCREMENT,
    tipo_identificacion ENUM('CC', 'CE', 'Pasaporte') NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    especialidad TEXT,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_sede INT NOT NULL,
    estado ENUM('Activo', 'Inactivo', 'De vacaciones') DEFAULT 'Activo',
    fecha_contratacion DATE NOT NULL,
    FOREIGN KEY (id_sede) REFERENCES sedes(id_sede),
    UNIQUE KEY (tipo_identificacion, numero_identificacion)
);

-- Tabla Teléfonos de Trainer
CREATE TABLE telefonos_trainer (
    id_telefono INT PRIMARY KEY AUTO_INCREMENT,
    id_trainer INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    tipo_telefono ENUM('Personal', 'Trabajo', 'Emergencia') NOT NULL,
    FOREIGN KEY (id_trainer) REFERENCES trainers(id_trainer) ON DELETE CASCADE
);

-- Tabla relación Trainers y Módulos (habilidades)
CREATE TABLE trainers_modulos (
    id_trainer INT NOT NULL,
    id_modulo INT NOT NULL,
    nivel_experiencia ENUM('Básico', 'Intermedio', 'Avanzado', 'Experto') NOT NULL,
    PRIMARY KEY (id_trainer, id_modulo),
    FOREIGN KEY (id_trainer) REFERENCES trainers(id_trainer),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);

-- Tabla Inscripciones
CREATE TABLE inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta INT NOT NULL,
    fecha_inscripcion DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_inicio DATE NOT NULL,
    fecha_fin_estimada DATE,
    estado ENUM('Activa', 'Completada', 'Cancelada', 'Suspendida') DEFAULT 'Activa',
    FOREIGN KEY (id_camper) REFERENCES campers(id_camper),
    FOREIGN KEY (id_ruta) REFERENCES rutas_entrenamiento(id_ruta),
    UNIQUE KEY (id_camper, id_ruta, fecha_inscripcion)
);

-- Tabla Asignaciones de Área
CREATE TABLE asignaciones_area (
    id_asignacion INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion),
    FOREIGN KEY (id_area) REFERENCES areas_entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES horarios(id_horario),
    CONSTRAINT chk_fecha_asignacion CHECK (fecha_inicio <= fecha_fin)
);

-- Tabla Evaluaciones
CREATE TABLE evaluaciones (
    id_evaluacion INT PRIMARY KEY AUTO_INCREMENT,
    id_inscripcion INT NOT NULL,
    id_modulo_ruta INT NOT NULL,
    id_trainer INT NOT NULL,
    nota_teorica DECIMAL(5,2) DEFAULT NULL,
    nota_practica DECIMAL(5,2) DEFAULT NULL,
    nota_quizzes DECIMAL(5,2) DEFAULT NULL,
    nota_final DECIMAL(5,2) GENERATED ALWAYS AS (
        (nota_teorica * (SELECT porcentaje_teorico/100 FROM modulos m 
         JOIN modulos_ruta mr ON m.id_modulo = mr.id_modulo 
         WHERE mr.id_modulo_ruta = id_modulo_ruta)) +
        (nota_practica * (SELECT porcentaje_practico/100 FROM modulos m 
         JOIN modulos_ruta mr ON m.id_modulo = mr.id_modulo 
         WHERE mr.id_modulo_ruta = id_modulo_ruta)) +
        (nota_quizzes * (SELECT porcentaje_quizzes/100 FROM modulos m 
         JOIN modulos_ruta mr ON m.id_modulo = mr.id_modulo 
         WHERE mr.id_modulo_ruta = id_modulo_ruta))
    ) STORED,
    estado ENUM('Aprobado', 'Reprobado', 'Pendiente') GENERATED ALWAYS AS (
        CASE 
            WHEN nota_final >= 60 THEN 'Aprobado'
            WHEN nota_final < 60 THEN 'Reprobado'
            ELSE 'Pendiente'
        END
    ) STORED,
    fecha_evaluacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion),
    FOREIGN KEY (id_modulo_ruta) REFERENCES modulos_ruta(id_modulo_ruta),
    FOREIGN KEY (id_trainer) REFERENCES trainers(id_trainer),
    UNIQUE KEY (id_inscripcion, id_modulo_ruta),
    CONSTRAINT chk_rango_notas CHECK (
        (nota_teorica IS NULL OR (nota_teorica >= 0 AND nota_teorica <= 100)) AND
        (nota_practica IS NULL OR (nota_practica >= 0 AND nota_practica <= 100)) AND
        (nota_quizzes IS NULL OR (nota_quizzes >= 0 AND nota_quizzes <= 100))
    )
);

-- Tabla Asignaciones de Trainer
CREATE TABLE asignaciones_trainer (
    id_asignacion_trainer INT PRIMARY KEY AUTO_INCREMENT,
    id_trainer INT NOT NULL,
    id_ruta INT NOT NULL,
    id_area INT NOT NULL,
    id_horario INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (id_trainer) REFERENCES trainers(id_trainer),
    FOREIGN KEY (id_ruta) REFERENCES rutas_entrenamiento(id_ruta),
    FOREIGN KEY (id_area) REFERENCES areas_entrenamiento(id_area),
    FOREIGN KEY (id_horario) REFERENCES horarios(id_horario),
    UNIQUE KEY (id_area, id_horario, fecha_inicio),
    CONSTRAINT chk_fecha_asignacion_trainer CHECK (fecha_inicio <= fecha_fin OR fecha_fin IS NULL)
);

-- Tabla Asistencias
CREATE TABLE asistencias (
    id_asistencia INT PRIMARY KEY AUTO_INCREMENT,
    id_asignacion INT NOT NULL,
    fecha DATE NOT NULL,
    asistio BOOLEAN DEFAULT TRUE,
    justificacion TEXT,
    FOREIGN KEY (id_asignacion) REFERENCES asignaciones_area(id_asignacion),
    UNIQUE KEY (id_asignacion, fecha)
);

-- Tabla Histórico de Estados del Camper
CREATE TABLE historico_estados_camper (
    id_historico INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    estado_anterior ENUM('En proceso de ingreso', 'Inscrito', 'Aprobado', 'Cursando', 'Graduado', 'Expulsado', 'Retirado') NOT NULL,
    estado_nuevo ENUM('En proceso de ingreso', 'Inscrito', 'Aprobado', 'Cursando', 'Graduado', 'Expulsado', 'Retirado') NOT NULL,
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    motivo TEXT,
    id_usuario_cambio INT,
    FOREIGN KEY (id_camper) REFERENCES campers(id_camper)
);

-- Tabla Egresados
CREATE TABLE egresados (
    id_egresado INT PRIMARY KEY AUTO_INCREMENT,
    id_camper INT NOT NULL,
    id_ruta INT NOT NULL,
    fecha_graduacion DATE NOT NULL,
    promedio_final DECIMAL(5,2) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_camper) REFERENCES campers(id_camper),
    FOREIGN KEY (id_ruta) REFERENCES rutas_entrenamiento(id_ruta),
    CONSTRAINT chk_promedio_egresado CHECK (promedio_final >= 60)


