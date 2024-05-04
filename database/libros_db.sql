-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-05-2024 a las 01:57:54
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

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `obtener_libros`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_libros` ()   BEGIN
    SELECT 
        libros.id AS id,
        libros.titulo AS titulo,
        libros.url_img AS url_img,
        libros.descripcion AS descripcion,
        libros.id_usuario AS usuario,
        autores.nombre AS autor,
        categorias.nombre AS categoria,
        estados.nombre AS estado
    FROM libros
    INNER JOIN autores ON libros.autor_id = autores.id
    INNER JOIN categorias ON libros.categoria_id = categorias.id
    INNER JOIN estados ON libros.estado_id = estados.id;
END$$

DROP PROCEDURE IF EXISTS `obtener_libros_por_categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtener_libros_por_categoria` (IN `categoria_id` INT)   BEGIN
    SELECT 
        libros.id AS id,
        libros.titulo AS titulo,
        libros.url_img AS url_img,
        libros.descripcion AS descripcion,
        libros.id_usuario AS usuario,
        autores.nombre AS autor,
        categorias.nombre AS categoria,
        estados.nombre AS estado
    FROM libros
    INNER JOIN autores ON libros.autor_id = autores.id
    INNER JOIN categorias ON libros.categoria_id = categorias.id
    INNER JOIN estados ON libros.estado_id = estados.id
    WHERE categorias.id = categoria_id;
END$$

DELIMITER ;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `nombre`, `nacimiento`, `nacionalidad`, `descripcion`, `id_usuario`) VALUES
(11, 'Frank Herbert', '8 de octubre de 1920', 'Estadounidense', NULL, 1),
(18, 'Patrick Rothfuss', '6 de junio de 1973', 'Estadounidense', NULL, 1),
(19, 'Rick Yancey', '4 de noviembre de 1962', 'Estadounidense', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
CREATE TABLE IF NOT EXISTS `catalogo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `url_img` varchar(300) NOT NULL,
  `descripcion` text NOT NULL,
  `autor_nombre` varchar(255) NOT NULL,
  `autor_nacimiento` varchar(255) NOT NULL,
  `autor_nacionalidad` varchar(255) NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`id`, `titulo`, `url_img`, `descripcion`, `autor_nombre`, `autor_nacimiento`, `autor_nacionalidad`, `categoria_id`) VALUES
(1, 'Dune', 'img/img.cate/cienciaficcion1.jpg', 'En un futuro lejano, en un universo donde las familias nobles controlan planetas enteros, surge una lucha por el control del recurso más valioso del universo: la especia melange. Esta es la trama central de \"Dune\", una obra maestra de la ciencia ficción escrita por Frank Herbert.', 'Frank Herbert', '8 de octubre de 1920', 'Estadounidense', 5),
(2, 'El nuevo orden de las cosas', 'img/img.cate/cienciaficcion2.jpg', 'Juan José Millás nos sumerge en un mundo donde la rutina de un oficinista común se ve alterada por la aparición de un objeto peculiar en su lugar de trabajo. Esta novela desafía la percepción de la realidad y la lucha por la identidad en la sociedad moderna.', 'Juan José Millás', '31 de enero de 1946', 'Española', 5),
(3, 'Un mundo Invertido', 'img/img.cate/cienciaficcion3.jpg', 'Christopher Priest nos presenta un mundo donde la realidad se entrelaza con los sueños. Dos amigos, obsesionados con una misteriosa casa en la playa, se embarcan en una búsqueda que los llevará a cuestionar su propia existencia y los límites de la percepción humana.', 'Christopher Priest', '14 de julio de 1943', 'Británica', 5),
(4, 'La quinta Ola', 'img/img.cate/cienciaficcion4.jpg', 'En un mundo devastado por una serie de ataques alienígenas, Cassie Sullivan lucha por sobrevivir y encontrar a su hermano. \"La quinta Ola\" de Rick Yancey es una emocionante historia de resistencia humana y sacrificio en medio de la adversidad.', 'Rick Yancey', '4 de noviembre de 1962', 'Estadounidense', 5),
(5, 'Panteon', 'img/img.cate/cienciaficcion5.jpg', 'Carlos Sisí nos lleva a un mundo oscuro donde los dioses antiguos despiertan de su letargo para sembrar el caos en la Tierra. \"Panteon\" es un thriller sobrenatural lleno de misterio, terror y acción.', 'Carlos Sisí', '12 de junio de 1971', 'Española', 5),
(6, 'El nombre del viento', 'img/img.cate/cienciaficcion6.webp', 'En el reino de Temerant, el joven Kvothe narra su extraordinaria vida, desde sus humildes comienzos como músico callejero hasta convertirse en una leyenda viva. Patrick Rothfuss nos transporta a un mundo de magia, música y aventura en esta apasionante historia.', 'Patrick Rothfuss', '6 de junio de 1973', 'Estadounidense', 5),
(7, 'Divergente', 'img/img.cate/cienciaficcion7.jpeg', 'En una sociedad dividida en facciones basadas en las virtudes humanas, Tris Prior descubre que ella es una divergente, alguien que no encaja en ninguna categoría. Veronica Roth teje una trama de acción y romance en un mundo distópico donde la divergencia es considerada una amenaza.', 'Veronica Roth', '19 de agosto de 1988', 'Estadounidense', 5),
(8, 'El corredor del laberinto', 'img/img.cate/cienciaficcion8.jpg', 'Thomas despierta en un lugar llamado El Claro, rodeado por un laberinto gigante y habitado por otros chicos. James Dashner crea un thriller lleno de suspense y misterio en esta emocionante saga donde Thomas y sus amigos luchan por descubrir la verdad detrás de su encierro.', 'James Dashner', '26 de noviembre de 1972', 'Estadounidense', 5),
(9, 'Los juegos del hambre', 'img/img.cate/cienciaficcion9.webp', 'En un futuro distópico, Katniss Everdeen se ofrece como voluntaria para los Juegos del Hambre, una competencia mortal transmitida por televisión donde los jóvenes luchan por sobrevivir. Suzanne Collins crea un mundo fascinante lleno de acción, intriga política y dilemas morales.', 'Suzanne Collins', '10 de agosto de 1962', 'Estadounidense', 5),
(10, 'Arena Roja', 'img/img.cate/cienciaficcion10.jpeg', 'Gema Bonnín nos sumerge en un mundo donde la lucha por la supervivencia se convierte en un espectáculo para las masas. En un futuro distópico, los gladiadores se enfrentan en una arena sangrienta en busca de la libertad y la redención.', 'Gema Bonnín', '22 de mayo de 1978', 'Española', 5),
(11, 'El hobbit', 'img/img.cate/cienciaficcion11.jpg', 'Bilbo Bolsón, un hobbit tranquilo y casero, es arrastrado a una emocionante aventura cuando el mago Gandalf y un grupo de enanos lo reclutan para recuperar un tesoro robado por el dragón Smaug. J.R.R. Tolkien nos lleva a la Tierra Media en esta encantadora historia llena de peligros y maravillas.', 'J.R.R. Tolkien', '3 de enero de 1892', 'Británica', 5),
(12, 'La guerra de los mundos', 'img/img.cate/cienciaficcion12.jpg', 'H.G. Wells nos transporta a una Inglaterra victoriana invadida por extraterrestres marcianos. A través de la historia de un periodista solitario, presenciamos la devastación y el caos causado por la invasión extraterrestre en esta obra maestra de la ciencia ficción.', 'H.G. Wells', '21 de septiembre de 1866', 'Británica', 5),
(13, 'Carbono modificado', 'img/img.cate/cienciaficcion13.jpg', 'En un futuro donde la conciencia humana puede ser almacenada y transferida entre cuerpos, Takeshi Kovacs es resucitado para investigar un asesinato en un mundo lleno de corrupción y desigualdad. Richard K. Morgan nos ofrece un thriller ciberpunk lleno de acción y reflexión filosófica.', 'Richard K. Morgan', '24 de septiembre de 1965', 'Británica', 5),
(14, 'Los 100', 'img/img.cate/cienciaficcion14.jpg', 'Después de un holocausto nuclear, la humanidad se refugia en una estación espacial. Cuando los recursos escasean, 100 jóvenes delincuentes son enviados de regreso a la Tierra para determinar si es habitable. Kass Morgan presenta una emocionante historia de supervivencia y redención en un mundo postapocalíptico.', 'Kass Morgan', '21 de julio de 1984', 'Estadounidense', 5),
(15, 'Las Pruebas de Apolo', 'img/img.cate/cienciaficcion15.jpg', 'En esta emocionante serie de libros, Rick Riordan nos presenta a Apolo, el dios griego castigado a vivir como un adolescente mortal. Seguimos sus aventuras mientras intenta recuperar su lugar en el Olimpo, enfrentándose a monstruos y desafíos heroicos en el proceso.', 'Rick Riordan', '5 de junio de 1964', 'Estadounidense', 5);

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
  `reseña` text,
  `autor_id` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `estado_id` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `fechaAñadido` datetime DEFAULT CURRENT_TIMESTAMP,
  `fechaCompra` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `autor_id` (`autor_id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `estado_id` (`estado_id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `url_img`, `descripcion`, `reseña`, `autor_id`, `categoria_id`, `estado_id`, `id_usuario`, `fechaAñadido`, `fechaCompra`) VALUES
(69, 'Dune', 'img/img.cate/cienciaficcion1.jpg', 'En un futuro lejano, en un universo donde las familias nobles controlan planetas enteros, surge una lucha por el control del recurso más valioso del universo: la especia melange. Esta es la trama central de \"Dune\", una obra maestra de la ciencia ficción escrita por Frank Herbert.', NULL, 11, 5, 1, 1, '2024-05-02 22:55:50', NULL),
(77, 'El nombre del viento', 'img/img.cate/cienciaficcion6.webp', 'En el reino de Temerant, el joven Kvothe narra su extraordinaria vida, desde sus humildes comienzos como músico callejero hasta convertirse en una leyenda viva. Patrick Rothfuss nos transporta a un mundo de magia, música y aventura en esta apasionante historia.', NULL, 18, 5, 1, 1, '2024-05-02 23:05:30', NULL),
(78, 'La quinta Ola', 'img/img.cate/cienciaficcion4.jpg', 'En un mundo devastado por una serie de ataques alienígenas, Cassie Sullivan lucha por sobrevivir y encontrar a su hermano. \"La quinta Ola\" de Rick Yancey es una emocionante historia de resistencia humana y sacrificio en medio de la adversidad.', NULL, 19, 5, 2, 1, '2024-05-03 17:31:42', NULL);

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

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autores`
--
ALTER TABLE `autores`
  ADD CONSTRAINT `autores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `libros_ibfk_3` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`),
  ADD CONSTRAINT `libros_ibfk_4` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
