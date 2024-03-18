-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-03-2024 a las 22:45:35
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libros_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `nacimiento` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  `descripcion` text,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Romance\r\n'),
(2, 'Novela\r\n'),
(3, 'Fantasía'),
(4, 'Misterio'),
(5, 'Ciencia ficción'),
(6, 'Biografía'),
(7, 'Terror'),
(8, 'Drama'),
(9, 'Aventura'),
(10, 'Historia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`) VALUES
(1, 'Obtenido'),
(2, 'Deseado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `url_img` varchar(300) DEFAULT NULL,
  `descripcion` text,
  `autor_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autor_id` (`autor_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `estado_id` (`estado_id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(100) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `Usuario`, `Correo`, `Password`) VALUES
(1, 'usuario1', 'usuario@gmail.com', '12345678'),
(2, 'usuario2', 'paola@gmail.com', 'abcd1234'),
(3, 'usuario3', 'perez@gmail.com', 'tsd78902');
(4, 'usuario4', 'usuario1@gmail.com', '132465'),
(5, 'usuario5', 'mena09@gmail.com', 'rrrr34'),
(6, 'usuario6', 'bruno@gmail.com', 'abc123'),
(7, 'usuario7', 'carlosp@gmail.com', 'abcd12'),
(8, 'usuario8', 'fernanda@gmail.com', '123abc'),
(9, 'usuario9', 'cristian@gmail.com', '123456ab'),
(10, 'usuario10', 'usuario@gmail.com', '12121212');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autores`
--
ALTER TABLE `autores`
INSERT INTO autores (nombre, nacimiento, nacionalidad, descripcion, id_usuario) VALUES
('George Orwell', '25/06/1903', 'Británico', 'George Orwell fue un escritor y periodista británico...', 1),
('F. Scott Fitzgerald', '24/09/1896', 'Estadounidense', 'F. Scott Fitzgerald fue un escritor estadounidense...', 2),
('Gabriel García Márquez', '06/03/1927', 'Colombiano', 'Gabriel García Márquez fue un escritor colombiano...', 3),
('Harper Lee', '28/04/1926', 'Estadounidense', 'Harper Lee fue una novelista estadounidense...', 4),
('Julio Cortázar', '26/08/1914', 'Argentino', 'Julio Cortázar fue un escritor, traductor e intelectual...', 5);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  INSERT INTO libros (titulo, url_img, descripcion, autor_id, categoria_id, estado_id, id_usuario) VALUES
('1984', '1984.jpg', '1984 es una novela política de ficción distópica...', 1, 2, 1, 1),
('El Gran Gatsby', 'el_gran_gatsby.jpg', 'El Gran Gatsby es una novela que se desarrolla...', 2, 1, 1, 2),
('Cien años de soledad', 'cien_anios_de_soledad.jpg', 'Cien años de soledad es una novela escrita por...', 3, 1, 1, 3),
('Matar a un ruiseñor', 'matar_a_un_ruisenor.jpg', 'Matar a un ruiseñor es una novela escrita por...', 4, 4, 1, 4),
('1984', '1984.jpg', '1984 es una novela política de ficción distópica...', 5, 2, 1, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

