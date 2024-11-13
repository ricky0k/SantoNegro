-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-11-2024 a las 00:03:43
-- Versión del servidor: 5.7.44-log
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mechmake`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden del ??tem`
--

CREATE TABLE `orden del ??tem` (
  `id` int(8) NOT NULL,
  `producto_id` int(8) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `precio` int(11) NOT NULL,
  `order_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(8) NOT NULL,
  `usuario_id` int(8) NOT NULL,
  `monto_total` int(11) NOT NULL,
  `estado` text COLLATE utf8_spanish_ci NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(8) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `inventario` int(4) NOT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `inventario`, `imagen`, `creado_en`) VALUES
(1, 'Arduino Uno', 'Placa de desarrollo de microcontrolador.', 26, 100, '1.jpg', '2024-11-06 23:58:00'),
(2, 'Protoboard ', 'Tablero de pruebas para circuitos eléctricos.', 6, 200, '2.jpg', '2024-11-06 23:58:06'),
(3, 'Sensor de Ultrasonido ', 'Módulo para medir distancias.', 16, 150, '3.jpg', '2024-11-06 23:58:18'),
(4, 'LED RGB', 'Diodo emisor de luz de colores.', 2, 500, '4.jpg', '2024-11-06 23:58:23'),
(5, 'Resistencia 220? ', 'Componente electrónico para circuitos.', 0, 500, '5.png', '2024-01-15 06:00:00'),
(6, 'Servomotor', 'Motor controlable con precisión. ', 13, 1000, '6.png', '2024-01-15 06:00:00'),
(7, 'Módulo Bluetooth', 'Módulo para comunicación inalámbrica.', 10, 80, '7.png', '2024-01-15 06:00:00'),
(8, 'Pantalla LCD 16x2', 'Fuente de alimentación para proyectos. ', 15, 60, '8.png', '2024-01-15 06:00:00'),
(9, 'Batería 9V', '', 5, 60, '9.png', '2024-01-15 06:00:00'),
(10, 'Jumpers', 'Cables para conexiones rápidas.', 4, 150, '10.png', '2024-01-15 06:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechareg` datetime NOT NULL,
  `perfil` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'U'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `correo`, `clave`, `fechareg`, `perfil`) VALUES
(1, 'emiliano', 'emiliano.isola1845@alumnos.udg.mx', 'scrypt:32768:8:1$bJlMjf5fPoRdZdg5$0ea7403d9df9e2ce44520f5380df727b6b1af7495306e3707df54e8a19dfe6aec4559b72941a2bf534a957e2fa80ce009f8133c590ec150a7ba9b9a2ac1f4468', '2024-10-02 18:34:41', 'U'),
(2, 'alejandro', 'alejandro.rodriguez1753@alumnos.udg.mx', 'scrypt:32768:8:1$uKSYh9XrQGUGDByD$b4a3ea794086ad34b11c1167d6f215253435282a66b3fbf9624d9bc2ee1dd1a26787e06b486b45ae4079c70fae8d96c558eb479a9087b09161cbadb29d16974c', '2024-10-10 16:42:09', 'A'),
(3, 'Samuel3', 'samuel.navarro1847@alumnos.udg.mx', 'scrypt:32768:8:1$AW3AF6DZG2HFGlaP$1b9a613f9e3719604a9cb6adb58e30c01f631644f2e9c6aa3add7b4b70c65e9bfcd0a47d09fcf82fdabef2cef017c431802c04a7cc699683f97907f255db8e85', '2024-11-06 16:56:20', 'U');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orden del ??tem`
--
ALTER TABLE `orden del ??tem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario id` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orden del ??tem`
--
ALTER TABLE `orden del ??tem`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orden del ??tem`
--
ALTER TABLE `orden del ??tem`
  ADD CONSTRAINT `orden del ??tem_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `orden del ??tem` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
