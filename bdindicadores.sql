CREATE DATABASE bdindicadores;
USE bdindicadores;
-- ===========================================
-- Tabla: Usuario
-- ===========================================
CREATE TABLE Usuario (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Contrasena NVARCHAR(255) NOT NULL,
    RutaAvatar NVARCHAR(MAX) NULL,
    Activo BIT NOT NULL DEFAULT 1
);

-- ===========================================
-- Tabla: TipoResponsable
-- ===========================================
CREATE TABLE TipoResponsable (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_TipoResponsable_Titulo UNIQUE (Titulo)
);

-- ===========================================
-- Tabla: Responsable
-- ===========================================
CREATE TABLE Responsable (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdTipoResponsable INT NOT NULL,
    IdUsuario INT NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    CONSTRAINT FK_Responsable_TipoResponsable FOREIGN KEY (IdTipoResponsable) REFERENCES TipoResponsable(Id),
    CONSTRAINT FK_Responsable_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: TipoProyecto
-- ===========================================
CREATE TABLE TipoProyecto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_TipoProyecto_Nombre UNIQUE (Nombre)
);

-- ===========================================
-- Tabla: Estado
-- ===========================================
CREATE TABLE Estado (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Descripcion NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_Estado_Nombre UNIQUE (Nombre)
);

-- ===========================================
-- Tabla: Proyecto
-- ===========================================
CREATE TABLE Proyecto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdProyectoPadre INT NULL,
    IdResponsable INT NOT NULL,
    IdTipoProyecto INT NOT NULL,
    Codigo NVARCHAR(50) NULL,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    FechaInicio DATE NULL,
    FechaFinPrevista DATE NULL,
    FechaModificacion DATE NULL,
    FechaFinalizacion DATE NULL,
    RutaLogo NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Proyecto_Responsable FOREIGN KEY (IdResponsable) REFERENCES Responsable(Id),
    CONSTRAINT FK_Proyecto_TipoProyecto FOREIGN KEY (IdTipoProyecto) REFERENCES TipoProyecto(Id)
);

-- ===========================================
-- Tabla: Estado_Proyecto
-- ===========================================
CREATE TABLE Estado_Proyecto (
    IdProyecto INT PRIMARY KEY,
    IdEstado INT NOT NULL,
    CONSTRAINT FK_EstadoProyecto_Proyecto FOREIGN KEY (IdProyecto) REFERENCES Proyecto(Id) ON DELETE CASCADE,
    CONSTRAINT FK_EstadoProyecto_Estado FOREIGN KEY (IdEstado) REFERENCES Estado(Id)
);

-- ===========================================
-- Tabla: TipoProducto
-- ===========================================
CREATE TABLE TipoProducto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(255) NOT NULL,
    CONSTRAINT UQ_TipoProducto_Nombre UNIQUE (Nombre)
);

-- ===========================================
-- Tabla: Producto
-- ===========================================
CREATE TABLE Producto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdTipoProducto INT NOT NULL,
    Codigo NVARCHAR(50) NULL,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    FechaInicio DATE NULL,
    FechaFinPrevista DATE NULL,
    FechaModificacion DATE NULL,
    FechaFinalizacion DATE NULL,
    RutaLogo NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Producto_TipoProducto FOREIGN KEY (IdTipoProducto) REFERENCES TipoProducto(Id)
);

-- ===========================================
-- Tabla: Proyecto_Producto (relaci�n N:M)
-- ===========================================
CREATE TABLE Proyecto_Producto (
    IdProyecto INT NOT NULL,
    IdProducto INT NOT NULL,
    FechaAsociacion DATE NULL,
    PRIMARY KEY (IdProyecto, IdProducto),
    CONSTRAINT FK_ProyectoProducto_Proyecto FOREIGN KEY (IdProyecto) REFERENCES Proyecto(Id) ON DELETE CASCADE,
    CONSTRAINT FK_ProyectoProducto_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Entregable
-- ===========================================
CREATE TABLE Entregable (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Codigo NVARCHAR(50) NULL,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    FechaInicio DATE NULL,
    FechaFinPrevista DATE NULL,
    FechaModificacion DATE NULL,
    FechaFinalizacion DATE NULL
);

-- ===========================================
-- Tabla: Producto_Entregable (relaci�n N:M)
-- ===========================================
CREATE TABLE Producto_Entregable (
    IdProducto INT NOT NULL,
    IdEntregable INT NOT NULL,
    FechaAsociacion DATE NULL,
    PRIMARY KEY (IdProducto, IdEntregable),
    CONSTRAINT FK_ProductoEntregable_Producto FOREIGN KEY (IdProducto) REFERENCES Producto(Id) ON DELETE CASCADE,
    CONSTRAINT FK_ProductoEntregable_Entregable FOREIGN KEY (IdEntregable) REFERENCES Entregable(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Responsable_Entregable (relaci�n N:M)
-- ===========================================
CREATE TABLE Responsable_Entregable (
    IdResponsable INT NOT NULL,
    IdEntregable INT NOT NULL,
    FechaAsociacion DATE NULL,
    PRIMARY KEY (IdResponsable, IdEntregable),
    CONSTRAINT FK_ResponsableEntregable_Responsable FOREIGN KEY (IdResponsable) REFERENCES Responsable(Id) ON DELETE CASCADE,
    CONSTRAINT FK_ResponsableEntregable_Entregable FOREIGN KEY (IdEntregable) REFERENCES Entregable(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Archivo
-- ===========================================
CREATE TABLE Archivo (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdUsuario INT NOT NULL,
    Ruta NVARCHAR(MAX) NOT NULL,
    Nombre NVARCHAR(255) NOT NULL,
    Tipo NVARCHAR(50) NULL,
    Fecha DATE NULL,
    CONSTRAINT FK_Archivo_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Archivo_Entregable (relaci�n N:M)
-- ===========================================
CREATE TABLE Archivo_Entregable (
    IdArchivo INT NOT NULL,
    IdEntregable INT NOT NULL,
    PRIMARY KEY (IdArchivo, IdEntregable),
    CONSTRAINT FK_ArchivoEntregable_Archivo FOREIGN KEY (IdArchivo) REFERENCES Archivo(Id) ON DELETE CASCADE,
    CONSTRAINT FK_ArchivoEntregable_Entregable FOREIGN KEY (IdEntregable) REFERENCES Entregable(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Actividad
-- ===========================================
CREATE TABLE Actividad (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdEntregable INT NOT NULL,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    FechaInicio DATE NULL,
    FechaFinPrevista DATE NULL,
    FechaModificacion DATE NULL,
    FechaFinalizacion DATE NULL,
    Prioridad INT NULL,
    PorcentajeAvance INT CHECK (PorcentajeAvance BETWEEN 0 AND 100),
    CONSTRAINT FK_Actividad_Entregable FOREIGN KEY (IdEntregable) REFERENCES Entregable(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Presupuesto
-- ===========================================
CREATE TABLE Presupuesto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdProyecto INT NOT NULL,
    MontoSolicitado DECIMAL(15,2) NOT NULL,
    Estado NVARCHAR(20) NOT NULL DEFAULT 'Pendiente' CHECK (Estado IN ('Pendiente','Aprobado','Rechazado')),
    MontoAprobado DECIMAL(15,2) NULL,
    PeriodoAnio INT NULL,
    FechaSolicitud DATE NULL,
    FechaAprobacion DATE NULL,
    Observaciones NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Presupuesto_Proyecto FOREIGN KEY (IdProyecto) REFERENCES Proyecto(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: DistribucionPresupuesto
-- ===========================================
CREATE TABLE DistribucionPresupuesto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdPresupuestoPadre INT NOT NULL,
    IdProyectoHijo INT NOT NULL,
    MontoAsignado DECIMAL(15,2) NOT NULL,
    CONSTRAINT FK_Distribucion_Presupuesto FOREIGN KEY (IdPresupuestoPadre) REFERENCES Presupuesto(Id) ON DELETE CASCADE,
    CONSTRAINT FK_Distribucion_Proyecto FOREIGN KEY (IdProyectoHijo) REFERENCES Proyecto(Id) ON DELETE NO ACTION
);

-- ===========================================
-- Tabla: EjecucionPresupuesto
-- ===========================================
CREATE TABLE EjecucionPresupuesto (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdPresupuesto INT NOT NULL,
    Anio INT NOT NULL,
    MontoPlaneado DECIMAL(15,2) NULL,
    MontoEjecutado DECIMAL(15,2) NULL,
    Observaciones NVARCHAR(MAX) NULL,
    CONSTRAINT FK_Ejecucion_Presupuesto FOREIGN KEY (IdPresupuesto) REFERENCES Presupuesto(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: VariableEstrategica
-- ===========================================
CREATE TABLE VariableEstrategica (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL
);

-- ===========================================
-- Tabla: ObjetivoEstrategico
-- ===========================================
CREATE TABLE ObjetivoEstrategico (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdVariable INT NOT NULL,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    CONSTRAINT FK_ObjetivoEstrategico_Variable FOREIGN KEY (IdVariable) REFERENCES VariableEstrategica(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: MetaEstrategica
-- ===========================================
CREATE TABLE MetaEstrategica (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdObjetivo INT NOT NULL,
    Titulo NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(MAX) NULL,
    CONSTRAINT FK_MetaEstrategica_Objetivo FOREIGN KEY (IdObjetivo) REFERENCES ObjetivoEstrategico(Id) ON DELETE CASCADE
);

-- ===========================================
-- Tabla: Meta_Proyecto (relaci�n N:M)
-- ===========================================
CREATE TABLE Meta_Proyecto (
    IdMeta INT NOT NULL,
    IdProyecto INT NOT NULL,
    FechaAsociacion DATE NULL,
    PRIMARY KEY (IdMeta, IdProyecto),
    CONSTRAINT FK_MetaProyecto_Meta FOREIGN KEY (IdMeta) REFERENCES MetaEstrategica(Id) ON DELETE CASCADE,
    CONSTRAINT FK_MetaProyecto_Proyecto FOREIGN KEY (IdProyecto) REFERENCES Proyecto(Id) ON DELETE CASCADE
);


-- TABLA: Usuario
INSERT INTO Usuario (Email, Contrasena, RutaAvatar, Activo) VALUES
('juan.perez@email.com', 'hash_secreto1', 'avatars/juan.jpg', 1),
('maria.gomez@email.com', 'hash_secreto2', 'avatars/maria.jpg', 1),
('carlos.ruiz@email.com', 'hash_secreto3', 'avatars/carlos.jpg', 1),
('ana.lopez@email.com', 'hash_secreto4', NULL, 1);

-- TABLA: TipoResponsable
INSERT INTO TipoResponsable (Titulo, Descripcion) VALUES
('Gerente de Proyecto', 'Líder principal y responsable de la ejecución del proyecto.'),
('Analista Funcional', 'Define los requisitos y el alcance del producto.'),
('Desarrollador Senior', 'Encargado de la implementación técnica.');

-- TABLA: Responsable
INSERT INTO Responsable (IdTipoResponsable, IdUsuario, Nombre) VALUES
(1, 1, 'Juan Pérez'), -- Gerente (Usuario 1)
(2, 2, 'María Gómez'), -- Analista (Usuario 2)
(3, 3, 'Carlos Ruiz'); -- Desarrollador (Usuario 3)

-- TABLA: TipoProyecto
INSERT INTO TipoProyecto (Nombre, Descripcion) VALUES
('Desarrollo Software', 'Proyectos enfocados en la creación de aplicaciones y sistemas.'),
('Infraestructura TI', 'Proyectos de actualización o implementación de hardware y redes.'),
('Investigación y Desarrollo', 'Proyectos de exploración de nuevas tecnologías o mercados.');

-- TABLA: Estado
INSERT INTO Estado (Nombre, Descripcion) VALUES
('Planificación', 'Fase inicial, definición de alcance y recursos.'),
('En Ejecución', 'El trabajo principal se está llevando a cabo.'),
('En Revisión', 'El producto está siendo validado por el cliente o QA.'),
('Completado', 'El proyecto o producto ha finalizado con éxito.'),
('Suspendido', 'El proyecto ha sido pausado temporalmente.');

-- TABLA: TipoProducto
INSERT INTO TipoProducto (Nombre, Descripcion) VALUES
('Módulo Web', 'Componente funcional de una aplicación web.'),
('API de Servicio', 'Interfaz de programación de aplicaciones para microservicios.'),
('Documentación Técnica', 'Manuales y especificaciones del sistema.');

-- TABLA: Entregable
INSERT INTO Entregable (Codigo, Titulo, Descripcion, FechaInicio, FechaFinPrevista) VALUES
('E001', 'Diseño UX/UI del Portal', 'Diseños de alta fidelidad para el portal web.', '2025-10-01', '2025-10-15'),
('E002', 'Back-end para Autenticación', 'Servicio REST para manejar el login y registro de usuarios.', '2025-10-10', '2025-10-25'),
('E003', 'Informe de Progreso Mensual', 'Documento resumen del avance del proyecto.', '2025-11-01', '2025-11-05');

-- TABLA: VariableEstrategica
INSERT INTO VariableEstrategica (Titulo, Descripcion) VALUES
('Eficiencia Operacional', 'Optimización de procesos internos para reducir costes.'),
('Satisfacción del Cliente', 'Mejora en la calidad del servicio y respuesta al usuario.'),
('Crecimiento del Mercado', 'Expansión a nuevas áreas geográficas o segmentos.');

-- TABLA: Producto
INSERT INTO Producto (IdTipoProducto, Codigo, Titulo, Descripcion, FechaInicio, FechaFinPrevista) VALUES
(1, 'P001', 'Portal de Clientes', 'Plataforma web para la gestión de cuentas de clientes.', '2025-10-01', '2026-03-30'),
(2, 'P002', 'API de Notificaciones', 'API que gestiona el envío de correos y SMS.', '2025-11-15', '2025-12-30'),
(3, 'P003', 'Manual de Integración v1.0', 'Documentación para desarrolladores que usen la API.', '2025-12-10', '2025-12-20');

-- TABLA: Proyecto
INSERT INTO Proyecto (IdResponsable, IdTipoProyecto, Codigo, Titulo, Descripcion, FechaInicio, FechaFinPrevista, FechaModificacion, RutaLogo) VALUES
(1, 1, 'PROJ-S01', 'Sistema de Gestión Interna v2', 'Proyecto principal para la modernización de los sistemas.', '2025-09-01', '2026-06-30', GETDATE(), 'logos/v2.png'),
(1, 2, 'PROJ-T02', 'Upgrade de Servidores Cloud', 'Actualización de la infraestructura de desarrollo.', '2025-11-01', '2025-12-31', GETDATE(), NULL),
(2, 1, 'PROJ-S01-01', 'Módulo de Facturación Electrónica', 'Sub-proyecto bajo el Sistema de Gestión Interna v2.', '2026-01-15', '2026-05-15', GETDATE(), NULL);

-- NOTA: Relacionando el sub-proyecto (Id 3) con el proyecto padre (Id 1)
UPDATE Proyecto SET IdProyectoPadre = 1 WHERE Id = 3;

-- TABLA: Estado_Proyecto
INSERT INTO Estado_Proyecto (IdProyecto, IdEstado) VALUES
(1, 2), -- Sistema de Gestión Interna v2: En Ejecución
(2, 1), -- Upgrade de Servidores Cloud: Planificación
(3, 1); -- Módulo de Facturación Electrónica: Planificación

-- TABLA: Proyecto_Producto
INSERT INTO Proyecto_Producto (IdProyecto, IdProducto, FechaAsociacion) VALUES
(1, 1, '2025-09-15'), -- Sistema V2 incluye Portal de Clientes
(1, 2, '2025-10-01'), -- Sistema V2 incluye API de Notificaciones
(3, 1, '2026-01-15'); -- Módulo de Facturación usa Portal de Clientes

-- TABLA: Producto_Entregable
INSERT INTO Producto_Entregable (IdProducto, IdEntregable, FechaAsociacion) VALUES
(1, 1, '2025-10-01'), -- Portal de Clientes necesita Diseño UX
(2, 2, '2025-10-10'); -- API de Notificaciones necesita Back-end Autenticación

-- TABLA: Responsable_Entregable
INSERT INTO Responsable_Entregable (IdResponsable, IdEntregable, FechaAsociacion) VALUES
(2, 1, '2025-10-01'), -- María (Analista) es responsable del Diseño UX
(3, 2, '2025-10-10'); -- Carlos (Desarrollador) es responsable del Back-end

-- TABLA: Archivo
INSERT INTO Archivo (IdUsuario, Ruta, Nombre, Tipo, Fecha) VALUES
(1, 'docs/SOW_V2.pdf', 'Statement of Work V2', 'PDF', '2025-09-01'),
(2, 'docs/Especificaciones_UX.docx', 'Especificaciones UX', 'DOCX', '2025-10-05'),
(3, 'docs/Log_DB.txt', 'Log de Producción', 'TXT', GETDATE());

-- TABLA: Archivo_Entregable
INSERT INTO Archivo_Entregable (IdArchivo, IdEntregable) VALUES
(2, 1); -- Especificaciones UX (Archivo 2) asociado al Diseño UX (Entregable 1)

-- TABLA: Actividad
INSERT INTO Actividad (IdEntregable, Titulo, Descripcion, FechaInicio, FechaFinPrevista, PorcentajeAvance) VALUES
(1, 'Wireframes de Login', 'Definición de flujos de usuario para el inicio de sesión.', '2025-10-01', '2025-10-05', 100),
(1, 'Prototipo Interactivo', 'Creación del prototipo navegable en Figma.', '2025-10-06', '2025-10-15', 80),
(2, 'Configuración de Servidor', 'Instalación de dependencias y base de datos para el microservicio.', '2025-10-10', '2025-10-12', 100),
(2, 'Implementación de Tokens JWT', 'Desarrollo de la lógica de autenticación con JWT.', '2025-10-13', '2025-10-25', 60);

-- TABLA: Presupuesto
INSERT INTO Presupuesto (IdProyecto, MontoSolicitado, Estado, MontoAprobado, PeriodoAnio, FechaSolicitud, FechaAprobacion) VALUES
(1, 50000.00, 'Aprobado', 45000.00, 2026, '2025-11-01', '2025-11-15'), -- Presupuesto Proyecto Principal (Id 1)
(2, 15000.00, 'Aprobado', 15000.00, 2026, '2025-12-01', '2025-12-10'), -- Presupuesto Upgrade Servidores (Id 2)
(3, 25000.00, 'Pendiente', NULL, 2026, '2026-01-01', NULL); -- Presupuesto Módulo Facturación (Id 3)

-- TABLA: DistribucionPresupuesto
INSERT INTO DistribucionPresupuesto (IdPresupuestoPadre, IdProyectoHijo, MontoAsignado) VALUES
(1, 3, 10000.00); -- Del Presupuesto (Id 1) se asignan 10,000 al Módulo Facturación (Proyecto 3)

-- TABLA: EjecucionPresupuesto
INSERT INTO EjecucionPresupuesto (IdPresupuesto, Anio, MontoPlaneado, MontoEjecutado) VALUES
(1, 2026, 45000.00, 5000.00), -- Ejecución inicial Proyecto 1
(2, 2026, 15000.00, 0.00); -- Ejecución inicial Proyecto 2

-- TABLA: ObjetivoEstrategico
INSERT INTO ObjetivoEstrategico (IdVariable, Titulo, Descripcion) VALUES
(1, 'Reducir el Tiempo de Despliegue', 'Disminuir el tiempo de puesta en producción en un 20%.'),
(2, 'Aumentar la Tasa de Retención', 'Lograr una tasa de retención de clientes del 95%.');

-- TABLA: MetaEstrategica
INSERT INTO MetaEstrategica (IdObjetivo, Titulo, Descripcion) VALUES
(1, 'Automatizar CI/CD', 'Implementar pipelines de integración y despliegue continuo antes de Q2 2026.'),
(2, 'Encuesta de Satisfacción > 4.5/5', 'Alcanzar un puntaje promedio de satisfacción de 4.5 en las encuestas semestrales.');

-- TABLA: Meta_Proyecto
INSERT INTO Meta_Proyecto (IdMeta, IdProyecto, FechaAsociacion) VALUES
(1, 1, '2025-10-01'), -- Proyecto Sistema V2 contribuye a Automatizar CI/CD
(1, 2, '2025-11-01'); -- Proyecto Upgrade Servidores contribuye a Automatizar CI/CD



