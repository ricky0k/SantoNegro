-- Crear tabla de platillos
CREATE TABLE platillos (
    id INT AUTO_INCREMENT PRIMARY KEY,          -- ID único para cada platillo
    nombre VARCHAR(100) NOT NULL,               -- Nombre del platillo
    descripcion TEXT NOT NULL,                  -- Descripción del platillo
    precio DECIMAL(10, 2) NOT NULL              -- Precio del platillo
);

-- Insertar platillos de ejemplo
INSERT INTO platillos (nombre, descripcion, precio) 
VALUES 
('Carne en su jugo', 'Delicioso platillo típico con carne, frijoles y tocino.', 120.00),
('Torta Santo Negro', 'Torta especial con ingredientes frescos.', 85.00),
('Aguachile Camarones', 'Camarones frescos preparados con chile y limón.', 150.00),
('Tequila Maestro Doble', 'Tequila premium ideal para acompañar.', 250.00);

-- Consultar los platillos registrados
SELECT * FROM platillos;
