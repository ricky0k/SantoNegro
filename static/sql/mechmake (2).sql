-- Crear base de datos (opcional)
CREATE DATABASE IF NOT EXISTS registro_usuarios;
USE registro_usuarios;

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- ID único para cada usuario
    nombre VARCHAR(100) NOT NULL,               -- Nombre del usuario
    email VARCHAR(100) NOT NULL UNIQUE,         -- Email único
    password VARCHAR(255) NOT NULL,             -- Contraseña encriptada
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Fecha automática de registro
);

-- Insertar un usuario de ejemplo
INSERT INTO usuarios (nombre, email, password) 
VALUES 
('Juan Pérez', 'juan@example.com', 'contraseña_encriptada');

-- Consultar los usuarios registrados
SELECT * FROM usuarios;
