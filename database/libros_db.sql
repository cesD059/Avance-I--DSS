-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 05-05-2024 a las 07:37:04
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
        libros.estado_id AS estado_id,
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
  `nacimiento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nacionalidad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `descripcion` text,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `nombre`, `nacimiento`, `nacionalidad`, `descripcion`, `id_usuario`) VALUES
(11, 'Frank Herbert', '8 de octubre de 1920', 'Estadounidense', NULL, 1),
(18, 'Patrick Rothfuss', '6 de junio de 1973', 'Estadounidense', NULL, 1),
(19, 'Rick Yancey', '4 de noviembre de 1962', 'Estadounidense', NULL, 1),
(20, 'Neil Gaiman', '10 de noviembre de 1960', 'Británico', NULL, 1),
(21, 'NATASHA PRESTON', '5 de enero de 1988', 'Británica', NULL, 1),
(22, 'VV.AA.', '', '', NULL, 1),
(23, 'Edgar Allan Poe', '19 de enero de 1809', 'Estadounidense', NULL, 1),
(24, 'Margaret Mitchell', '8 de noviembre de 1900', 'Estadounidense', NULL, 1),
(25, 'CHARISSA WEAKS', '', '', NULL, 1),
(26, 'Stephen Chbosky', '	25 de enero de 1970', 'Estadounidense', NULL, 1),
(27, 'Stephen Edwin King', '21 de septiembre de 1947', 'Estadounidense', NULL, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(15, 'Las Pruebas de Apolo', 'img/img.cate/cienciaficcion15.jpg', 'En esta emocionante serie de libros, Rick Riordan nos presenta a Apolo, el dios griego castigado a vivir como un adolescente mortal. Seguimos sus aventuras mientras intenta recuperar su lugar en el Olimpo, enfrentándose a monstruos y desafíos heroicos en el proceso.', 'Rick Riordan', '5 de junio de 1964', 'Estadounidense', 5),
(16, 'El baile de los muertos', 'img/img.cate/el-baile-de-los-muertos-de-care-santos-cross-books-.jpg.webp', 'Isabel, una joven reina traicionada, Lilia, una ladrona de tumbas con un sueño de escapar, y Fidel, un huérfano acosado por el fantasma de su doble, se unen por el azar. Juntos, se embarcan en una trama de intrigas de poder y sociedades secretas, luchando contra fuerzas maléficas que amenazan con controlar el futuro de la humanidad desde las tinieblas.', 'Care Santos', '8 de abril de 1970', 'Peruana', 7),
(17, 'CORALINE', 'img/img.cate/3e490b88329a95bd96c5f77968010106.jpg', 'Después de mudarse, Coraline descubre en su nueva casa una puerta secreta que la lleva a un lugar idéntico, pero habitado por una madre y padre alternativos. Estos la quieren retener para siempre. Pronto se da cuenta de que estos padres alternativos han capturado a otros niños. Coraline debe salvarlos y encontrar una manera de volver a su vida anterior.', 'Neil Gaiman', '10 de noviembre de 1960', 'Británico', 7),
(18, 'LA SANGRE MANDA', 'img/img.cate/Portada-La-Sangre-MAnda.jpg', 'Holly Gibney, detective heredera de Bill Hodges, se ve atraída por una masacre en un instituto, enfrentándose sola a sus miedos. \"El teléfono del señor Harrigan\" explora una amistad inquietante entre personas de distintas edades. \"La vida de Chuck\" ofrece una reflexión profunda sobre la existencia. En \"La rata\", un escritor enfrenta su lado más oscuro. Stephen King sorprende con cuatro relatos que llevan a los lectores a lugares intrigantes y sobrecogedores.', 'Stephen Edwin King', '21 de septiembre de 1947', 'Estadounidense', 7),
(19, 'EL MONJE', 'img/img.cate/19-El-monje-autor-Matthew-G.-Lewis.webp', '\"El Monje\" de Matthew G. Lewis, una obra maestra de la novela gótica, ha cautivado a los lectores durante doscientos años con su prosa hipnótica y su moral venenosa. Narra la historia de Ambrosio, un monje español que cae en la tentación del demonio y es condenado por la Inquisición. H. P. Lovecraft la considera una obra maestra del terror gótico.', 'Matthew Gregory Lewis', '9 de julio de 1775', 'Británica', 7),
(20, 'EL FANTASMA DE LA OPERA', 'img/img.cate/El-fantasma-de-la-ópera.jpg', 'La obra, publicada en 1910, revolucionó el género de la novela de misterio al introducir el arquetipo del genio desfigurado que se esconde en la ciudad, se enamora y busca venganza. Esta mezcla de romanticismo y novela gótica ha inspirado numerosas adaptaciones en teatro y cine, convirtiendo a Erik y su máscara en iconos de la cultura popular.', 'Gaston Leroux', '6 de mayo de 1868', 'Francesa', 7),
(21, 'EL LABERINTO DEL FAUNO', 'img/img.cate/fauno.webp', 'En un reino subterráneo sin mentiras ni dolor, una princesa sueña con humanos. Escapa a nuestro mundo, pierde sus recuerdos y muere, pero su espíritu es inmortal. Su padre, el rey, espera su regreso en otro cuerpo, tiempo o lugar. Inspirada en una película ganadora del Oscar, esta novela expande la historia, mostrando cómo la fantasía revela los milagros y terrores de la realidad. La crítica elogia la habilidad de los autores para adaptar el complejo relato cinematográfico con destreza y elegancia, hechizando a los lectores aficionados a la fantasía.', 'Guillermo Del Toro', '9 de octubre de 1964', 'Mexicana', 7),
(22, 'NARRACIONES EXTRAORDINARIAS', 'img/poe.jpeg', 'Edgar Allan Poe fue un pionero del relato corto y el género policial, famoso por sus historias de terror y misterio. Este libro recopila sus mejores cuentos y poesías, incluyendo \"El cuervo\", acompañados de ilustraciones inquietantes diseñadas para esta edición. Poe exploró las regiones más oscuras del alma humana en sus obras.', 'Edgar Allan Poe', '19 de enero de 1809', 'Estadounidense', 7),
(23, 'CUENTOS MACABROS', 'img/cuentos-poe.webp', 'La adaptación de Lacombe del clásico de Poe es el complemento perfecto para su estilo tétrico. La edición de lujo de los cuentos de Poe, con traducción de Cortázar e ilustraciones de Lacombe, ofrece una experiencia única para los amantes de la ilustración y el terror.', 'Edgar Allan Poe', '19 de enero de 1809', 'Estadounidense', 7),
(24, 'Los Crímenes Del Lago', 'img/img.cate/images.jpg', 'Después de la tragedia de tres niños muertos en el lago Champlain en 2001, Eric pierde a su amor y es atormentado por los fantasmas de las víctimas. Sus padres lo alejan del pueblo para que olvide, pero quince años después, encuentra un libro escrito por Anne Austen que detalla los crímenes. Las apariciones vuelven, desafiando su creencia de que todo fue producto de su imaginación.', 'Gemma Herrero', 'junio de 1974', 'Española', 7),
(25, 'LOS MITOS DE CTHULHU (VOL. II)', 'img/img.cate/imagesterror.jpg', 'Este segundo volumen de \"Los mitos de Cthulhu\" ofrece siete escalofriantes relatos que son un clásico de la literatura de terror. Destaca \"En las montañas\", una novela que ejemplifica el estilo de Lovecraft, fusionando terror y ciencia ficción mientras científicos exploradores descubren seres primordiales que crearon la humanidad por aburrimiento o error. Es una lectura imprescindible para amantes del género.', 'H. P. Lovecraft', '20 de agosto de 1890', 'Estadounidense', 7),
(26, 'AMIGO IMAGINARIO', 'img/img.cate/descarga.jpg', 'Christopher, un niño de 7 años con un amigo imaginario, desaparece en un pueblo aparentemente tranquilo. Cuando regresa, algo ha cambiado: guarda un secreto sobre una voz interior que lo guía hacia la construcción de una casa en un árbol para liberar a su amigo imaginario. Este evento desencadena una serie de eventos que llevan al pueblo a enfrentarse a una batalla entre el bien y el mal.', 'Stephen Chbosky', '	25 de enero de 1970', 'Estadounidense', 7),
(27, 'KAIKI: CUENTOS DE TERROR Y LOCURA', 'img/img.cate/imagesterror2.jpg', 'Este libro ofrece una colección de historias escalofriantes ambientadas en un país lleno de mitos, leyendas y supersticiones, donde los habitantes creen en la existencia de diversos tipos de monstruos, tanto imaginarios como reales.', 'VV.AA.', '', '', 7),
(28, 'EL BAZAR DE LOS MALOS SUEÑOS', 'img/img.cate/1623690065-41g78YLimnL._SL500_.jpg', 'En \"El bazar de los malos sueños\", Stephen King ofrece una colección excepcional de relatos, algunos nuevos y otros revisados, cada uno precedido por una introducción donde explica sus orígenes y motivaciones. Abordando temas como moralidad, vida después de la muerte, culpa y el deseo de corregir el pasado, King sigue demostrando su maestría en el género después de treinta y cinco años desde su primera colección.', 'Stephen Edwin King', '21 de septiembre de 1947', 'Estadounidense', 7),
(29, 'It (Eso) \"Tú también flotarás\"', 'img/img.cate/it-terror.jpg', 'En \"It\", los protagonistas regresan a Derry, un pueblo donde un malvado payaso aterroriza y mata a los niños. Decididos a enfrentar sus miedos del pasado, se comprometen a destruir la fuente del horror que los persiguió en su juventud. Esta novela de Stephen King explora el terror y la amistad en un relato ambicioso y personal.', 'Stephen Edwin King', '21 de septiembre de 1947', 'Estadounidense', 7),
(30, 'HAY ALGO MATANDO NIÑOS Nº 01', 'img/img.cate/images3.jpg', 'En Archer/\'s Peak, niños desaparecen y aquellos que regresan cuentan historias horripilantes sobre criaturas. La forastera Erica Slaughter llega para enfrentar la amenaza, creyendo a los niños y dispuesta a eliminar a las criaturas.', 'James Tynion IV', '14 de Diciembre de 1987', 'Americana', 7),
(31, 'WONDER. LA LECCION DE AUGUST', 'img/img.cate/novela1.jpg', 'August (Auggie) Pullman nació con una grave deformidad facial y ha debido someterse a muchas operaciones, lo que le ha impedido ir a la escuela hasta ahora, que tiene diez años y está a punto de comenzar quinto grado en la escuela Beecher. Su desafío es lograr que sus compañeros lo acepten a pesar de ser diferente.', 'Raquel Palacio', '13 de julio de 1963', 'Estadounidense', 2),
(32, 'UN CUENTO PERFECTO', 'img/img.cate/novela2.jpg', '\"Un cuento perfecto\" de Elisabet Benavent es una novela emotiva que sigue la historia de Margot, una mujer exitosa de 32 años que aparenta tener una vida perfecta, pero que en realidad se siente vacía, explorando así la búsqueda de la felicidad y el amor verdadero.', 'Elisabet Benavent', '3 de julio de 1984', 'Española', 2),
(33, 'TRENZA DEL MAR ESMERALDA (NOVELA SECRETA 1)', 'img/img.cate/novela3.webp', 'Trenza vive una vida tranquila en una isla, coleccionando tazas y escuchando historias. Pero cuando su amigo Charlie desaparece en busca de esposa, Trenza se embarca en una aventura para encontrarlo, enfrentándose a peligros en el mar de Medianoche. En un mundo de piratas y peligros mortales, Trenza busca cambiar su destino y encontrar su lugar.', 'Brandon Sanderson', '19 de diciembre de 1975', 'Estadounidense', 2),
(34, 'EL TALLER DE MUÑECAS', 'img/img.cate/novela4.jpg', 'En 1850, en Londres, Iris trabaja en un taller de muñecas pero sueña con ser pintora. Su destino cambia cuando el taxidermista Silas se obsesiona con ella y busca convertirla en la pieza principal de su colección morbosa, tras descubrirla durante la Gran Exposición Universal.', 'ELIZABETH MACNEAL', '16 de octubre de 1988', 'Edimburgo ', 2),
(35, 'NOVELA DE AJEDREZ', 'img/img.cate/novela5.jpeg', '\"Mientras Mirko Czentovicz es un prodigio del ajedrez sin habilidades intelectuales fuera del tablero, su encuentro en un barco con el misterioso señor B., un noble vienés escapando de los nazis, desencadena un duelo épico. Esta confrontación en \"Novela de ajedrez\" no solo muestra el choque entre dos personalidades opuestas, sino también la resistencia humana bajo presión extrema, todo envuelto en intriga y maestría literaria.\"', 'STEFAN ZWEIG', '28 de noviembre de 1881', 'Austrohúngara', 2),
(36, 'EL HOMBRE QUE PASEABA CON LIBROS', 'img/img.cate/novela6.jpg', 'El librero Carl Kollhoff, de setenta y un años, entrega personalmente libros a clientes especiales todas las tardes. Tras perder su trabajo, el poder de los libros y una niña de nueve años los ayuda a superar sus problemas y acercarse unos a otros. Su historia se convierte en un inesperado best seller en Alemania, con más de 150,000 ejemplares vendidos y próxima publicación en toda Europa.', 'SEBASTIAN HENN CARSTEN', '29 de octubre de 1973', 'Aleman', 2),
(37, 'A DOS METROS DE TI', 'img/img.cate/novela7.jpg', 'Stella Grant lucha por controlar su entorno para protegerse de infecciones debido a su enfermedad pulmonar. Por otro lado, Will Newman anhela libertad y escapar del hospital para explorar el mundo. Su cercanía podría poner en peligro la vida de Stella debido a su necesidad de mantenerse alejados para evitar contagios.', 'Rachael Lippincott', '5 de diciembre de 1994', 'Estadounidense', 2),
(38, 'BAJO LA MISMA ESTRELLA', 'img/BajoLaMismaEstrella.webp', '\"Una novela emotiva y sarcástica que aborda la capacidad humana de soñar en medio de la tragedia. Hazel y Gus, dos adolescentes con cáncer, deciden cumplir el mayor deseo de Hazel: conocer a su escritor favorito en Amsterdam. Este viaje contrarreloj se convierte en una aventura catártica y desgarradora que desafía las circunstancias difíciles de la vida.\"', 'John Green', '24 de agosto de 1977', 'Estadounidense', 2),
(39, 'LO QUE EL VIENTO SE LLEVO', 'img/img.cate/novela8.webp', 'Scarlett O Hara vive en la plantación Tara en Georgia, enamorada de Ashley Wilkes, quien se compromete con Melanie Hamilton. En los prolegómenos de la guerra civil, los jóvenes sureños ansían el combate, excepto Rhett Butler, quien se siente atraído por Scarlett. Despechada por el compromiso de Ashley, Scarlett acepta casarse con Charles, hermano de Melanie.', 'Margaret Mitchell', '8 de noviembre de 1900', 'Estadounidense', 2),
(40, 'CARTAS DE AMOR A LOS MUERTOS', 'img/img.cate/novela10.jpg', 'Laurel escribe cartas a personas fallecidas, incluyendo a Kurt Cobain, como parte de un trabajo escolar. Estas cartas se convierten en un diario donde ella reflexiona sobre la vida, el amor, y la ruptura de su familia tras la muerte de su hermana. Aunque inicialmente no las entrega a su profesora, el libro revela su proceso de sanación y crecimiento personal. Autores como Emma Watson y Stephen Chbosky elogian la obra por su profundidad y valentía, mientras que se destaca su capacidad para abordar el tema del duelo y la superación.', 'Ava Dellaira', '', 'Estadounidense', 2),
(41, 'CIUDADES DE PAPEL', 'img/img.cate/novela11.png', 'En su último año de instituto, Quentin, quien no ha tenido éxito en popularidad ni en romance, experimenta un giro inesperado cuando su vecina, Margo, lo recluta para un plan de venganza. Tras una noche reveladora, Margo desaparece, dejando a Quentin pistas para descifrar. John Green, autor de \"Bajo la misma estrella\", presenta una historia emotiva sobre amistad, amor e identidad en \"Ciudades de papel\", que cuestiona nuestra percepción de los demás y de nosotros mismos.', 'John Green', '24 de agosto de 1977', 'Estadounidense', 2),
(42, 'EL COLOR DE LAS COSAS INVISIBLES', 'img/img.cate/novela12.webp', 'Rain y Jack, de planetas diferentes y con poco en común, se odian pero siguen cruzándose en distintos momentos de sus vidas. A pesar de sus diferencias, comparten encuentros inesperados que desafían la lógica, incluyendo una noche juntos en el bosque. Mientras Rain cree en la causalidad, Jack cuestiona las coincidencias. Ambos luchan por tener razón, pero saben que en el amor no hay explicaciones científicas que valgan.', 'Andrea Longarela', '', '', 2),
(43, 'ELEANOR Y PARK', 'img/img.cate/novela13.jpg', 'Eleanor y Park, dos adolescentes outsiders, se encuentran en el instituto y comienzan una historia de amor a pesar de sus diferencias. Aunque son conscientes de que el primer amor rara vez perdura, deciden intentarlo. Su relación se desarrolla entre conversaciones sarcásticas y momentos de ternura, enfrentándose a los desafíos de sus difíciles vidas familiares y la presión social del instituto. A pesar de todo, su valentía les lleva a luchar por su amor, desafiando las expectativas y los obstáculos que se les presentan.', 'Rainbow Rowell', '24 de febrero de 1973 ', 'Estadounidense', 2),
(44, 'UN REINO DE PROMESAS MALDITAS', 'img/img.cate/novela14.webp', 'Brie se ve atrapada entre dos cortes en un reino lleno de fae y príncipes seductores. Para salvar a su hermana, acepta un peligroso pacto con el rey fae y se embarca en una misión para robar reliquias mágicas. En el camino, se ve envuelta en un triángulo amoroso y debe decidir en quién puede confiar, mientras lucha contra sus propios sentimientos. La novela, llena de acción, intriga y romance, es el tipo de fantasía cautivadora que promete sorpresas y giros inesperados.', 'Lexi Ryan', '', 'Estadounidense', 2),
(45, 'LA GUERRA DE LAS DOS REINAS. LIBRO 4', 'img/img.cate/novela15.jpg', 'La guerra es solo el comienzo en el cuarto libro de la saga \"De sangre y cenizas\" de Jennifer L. Armentrout. Casteel y Poppy enfrentan revelaciones impactantes mientras luchan por unir a sus reinos y enfrentar un poder ancestral que amenaza con destruirlo todo. Poppy debe aceptar su destino como portadora de Muerte y Destrucción para detener a la Reina de Sangre y asegurar un futuro de paz.', 'Jennifer L. Armentrout', '11 de junio de 1980', 'Estadounidense', 2),
(46, 'CASA DE TIERRA Y SANGRE (CIUDAD MEDIALUNA 1)', 'img/img.cate/fantasia1.jpg', 'Bryce Quinlan busca vengar la muerte de sus amigos a manos de un demonio, y para ello hace un trato con Hunt Athalar, un ángel caído. Juntos, investigan en Ciudad Medialuna, donde descubren una amenaza oscura y una atracción intensa entre ellos.', 'SARAH J. MAAS', '5 de marzo de 1986', 'Estadounidense', 3),
(47, 'EL ÚLTIMO SUEÑO', 'img/img.cate/fantasia2.jpg', 'En una ciudad dominada por bandas, Los Abandonados encuentran a Kemi, una esclava con un secreto mortal. Su huida desesperada se convierte en la única oportunidad para estos pandilleros de encontrar un futuro en una ciudad que los rechaza.', 'GUILLEM LOPEZ', '', 'ESPAÑOL', 3),
(48, 'REINO DE LADRONES', 'img/img.cate/fantasia3.jpg', 'Kaz Brekker y su equipo, tras un arriesgado golpe, se encuentran traicionados y debilitados, enfrentando la escasez de recursos y aliados. En medio de una lucha por sus vidas, deben enfrentarse a poderosas fuerzas que buscan desentrañar el secreto de una peligrosa droga. Con viejos rivales y nuevos enemigos emergiendo, la ciudad de Ketterdam se convierte en escenario de una guerra por la venganza y la redención, que determinará el destino del mundo Grisha.', 'LEIGH BARDUGO', '6 de abril de 1975', 'Israeli (Jerusalen)', 3),
(49, 'EL REINO DE LOS MALDITOS VOL. 1', 'img/img.cate/fantasia4.webp', '\"Emilia y su gemela Vittoria, brujas viviendo entre humanos, enfrentan un brutal asesinato que desata una búsqueda de venganza y un encuentro con Ira, un príncipe del infierno. Con elementos de magia oscura y un romance intrigante, la trama se teje en un festín embriagador para los sentidos, lleno de suspense y complejidad.\"', 'KERRI MANISCALCO', '', 'Estadounidense', 3),
(50, 'LA FORMA DEL AGUA', 'img/forma.jpg', '\"La forma del agua\" es una emotiva historia de amor entre un hombre anfibio capturado en el Amazonas y una mujer muda que trabaja en un centro de investigación durante la Guerra Fría. Escrita por Guillermo del Toro y Daniel Kraus, la historia se desarrolla en Baltimore y combina fantasía, terror y romance. Tanto la novela como la película ofrecen una experiencia única y cautivadora.', 'Guillermo Del Toro', '9 de octubre de 1964', 'Mexicano', 3),
(51, 'EL CORAZON DEL MAGO', 'img/img.cate/fantasia6.jpg', 'En la academia mágica Merrythought, un viaje en tren hacia un torneo se convierte en una lucha por la supervivencia cuando un pasajero es asesinado de manera brutal. Los sobrevivientes, entre magos, ángeles y demonios, deben descubrir al culpable antes de convertirse en su próxima víctima. \"El corazón del mago\" es una intrigante novela de misterio que invita al lector a convertirse en detective en un mundo de fantasía lleno de personajes poderosos y misteriosos.', 'JULIO J. MEDINA', '2 de noviembre de 1952', 'Puerto Riqueño', 3),
(52, 'Fénix', 'img/img.cate/fantasia7.png', 'En la batalla final, los obicuos controlan el poder y los humanos están en peligro. Luna debe proteger a sus seres queridos incluso si eso significa sacrificar su vida. Nuevas alianzas se formarán para salvar a la humanidad, mientras un tercer maestro surge y Luna enfrenta una decisión crucial. ¿Podrán salvar a los humanos de los obicuos? ¿Sobrevivirán los Transportadores y los estables ante esta amenaza?', 'Alejandra Pinzón', '10 de febrero de 1986', 'Colombiana', 3),
(53, 'EL COLECCIONISTA DE BRUJAS', 'img/img.cate/fantasia8.avif', 'En cada Luna de cosecha, el Coleccionista de Brujas, Alexus Thibault, entrega brujas al Rey de la Escarcha. Raina Bloodgood planea vengarse por la desaparición de su hermana, pero cuando el Príncipe del Este ataca, debe unirse a Alexus para salvarlo. Ahora, enfrentados a una antigua maldición, deben decidir hasta dónde están dispuestos a llegar por la familia y el amor.', 'CHARISSA WEAKS', '', '', 3),
(54, 'LOS SEIS DE ATLAS', 'img/img.cate/fantasia9.jpg', 'Se trata del inicio de una trilogía de \"dark academia\" que también atrae a los fans de \"The Umbrella Academy\". La historia sigue a seis magos seleccionados para la iniciación en la Sociedad Alejandrina, una sociedad secreta de académicos de magia. Tienen un año para cumplir los requisitos y demostrar que son los mejores entre ellos. Pero solo la mayoría de ellos lo logrará, mientras que uno será eliminado.', 'OLIVIE BLAKE', '27 de agosto de 1988', 'Estadounidense', 3),
(55, 'LA ESTRELLA MÁS OSCURA', 'img/img.cate/fantasia10.jpg', 'Evie Dasher, una adolescente, queda atrapada en una redada en una discoteca donde humanos y Luxen se mezclan. Allí conoce a Luc, quien parece un Luxen pero es más poderoso. Su atracción por él la lleva a un mundo desconocido, desafiando sus creencias.', 'ARMENTROUT JENNIFER', '11 de junio de 1980', 'Estadounidense', 3),
(56, 'LOS JARDINES DE LA LUNA (MALAZ: EL LIBRO DE LOS CAÍDOS 1)', 'img/img.cate/fantasia11.jpg', 'El Imperio de Malaz está sumido en el descontento después de guerras internas y externas. La emperatriz Laseen busca expandirse, desafiando incluso a su propio ejército exhausto. El sargento Whiskeyjack y su escuadrón se ven obligados a marchar hacia Darujhistan, mientras fuerzas oscuras y conspiraciones amenazan desde todos los frentes, incluso entre los dioses.', 'STEVEN ERIKSON', '7 de octubre de 1959', 'Canadiense', 3),
(57, 'ASESINO REAL ', 'img/img.cate/fantasia12.jpg', 'Traspi# ha sobrevivido a su primera misión como asesino del rey a pesar de ser despreciado en la corte por ser bastardo. Decide quedarse en las montañas, pero noticias urgentes y un amor inalcanzable lo llevan de vuelta a Torre del Alce. Allí se enfrenta a las mortíferas intrigas de la familia real y a los ataques de los Corsarios de la Vela Roja, que llevan al reino al borde de la guerra. La salvación depende de Traspi# si está dispuesto a hacer el mayor sacrificio.', 'ROBIN HOBB', '5 de marzo de 1952', 'Estadounidense', 3),
(58, 'EL TEMOR DE UN HOMBRE SABIO (CRÓNICA DEL ASESINO DE REYES 2)', 'img/img.cate/fantasia13.jpg', 'Después de desaparecer, Kvothe, un personaje multifacético, rehúsa regresar a pesar de ser encontrado. Su historia, llena de aventuras y misterio, continúa mientras él busca revelar la verdad detrás de su propia leyenda.', 'PATRICK ROTHFUSS', '6 de junio de 1973', 'Estadounidense ', 3),
(59, 'LA CÚPULA DE HIELO', 'img/img.cate/fantasia14.jpg', 'En un reino en guerra, Eleaine, dotada de poderes peligrosos, vive recluida en un castillo junto a su familia. Cuando el enemigo ataca, debe elegir entre ocultar sus habilidades o usarlas para proteger a los suyos en medio del conflicto, enfrentando su destino como su única esperanza.', 'PATRICIA GARCIA FERRER', '', 'Española', 3),
(60, 'LAS PRUEBAS DE APOLO 1 : EL ORACULO OCULTO', 'img/img.cate/cienciaficcion15.jpg', 'Después de enojar a Zeus, Apolo es desterrado del Olimpo y llega a Nueva York como un adolescente normal. Sin sus poderes divinos y ocultando su verdadera edad, debe adaptarse al mundo moderno y recuperar la confianza de Zeus. Pero enfrenta numerosos enemigos que no quieren que regrese al Olimpo. En apuros, recurre al Campamento Mestizo, un refugio de semidioses modernos.', 'RICK RIORDAN', '5 de junio de 1964', 'Estadounidense', 3),
(61, 'UN MUNDO OSCURO', 'img/img.cate/drama1.webp', 'Phoenix \"Nix\" Loring vive con la culpa de sobrevivir a la muerte de sus padres y su hermana gemela en accidentes ocurridos en Halloween. Sumida en la depresión, renuncia a su talento artístico hasta que su tío desaparece en la misma fecha. Junto a su amigo Clarey, atraviesa un portal hacia Mystiquiel, un mundo de sus propios dibujos animados. En esta búsqueda, descubre secretos sobre la maldición de su familia y su propio talento.', 'A.G. HOWARD', '9 de junio de 1970', 'Estadounidense', 8),
(62, 'EL OLOR DEL MIEDO ', 'img/img.cate/drama2.webp', 'Elena, una veterinaria apasionada del zoológico de Valencia, protege a sus queridos animales de un misterioso tirador. Con la ayuda de su pareja, Cristina, y su compañero del parque, Sidy, investiga para descubrir al culpable, enfrentando dilemas morales y peligros. ¿Será ella la próxima víctima?', 'MANUEL RÍOS SAN MARTÍN', '20 de diciembre de 1965', 'Española', 8),
(63, 'LA LADRONA DE LIBROS ', 'img/img.cate/drama3.jpg', 'En un pueblo marcado por la guerra, una niña se convierte en ladrona de libros para escapar del horror. Con las palabras robadas, crea una historia hermosa y cruel, que se convierte en una novela inolvidable.', 'MARKUS ZUSAK', '23 de junio de 1975', 'Australiana', 8),
(64, 'BUSCANDO A ALASKA ', 'img/img.cate/drama4.jpg', 'Miles busca emoción y significado en la vida al obsesionarse con las últimas palabras de personas famosas. Su encuentro con la enigmática Alaska en un internado cambia su perspectiva, llevándolo a cuestionar el propósito de la existencia y si es posible encontrar plenitud después de enfrentar tragedias sin resolver.', 'John Green', '24 de agosto de 1977', 'Estadounidense', 8),
(65, 'CRIMEN Y CASTIGO ', 'img/crimen-y-castigo.jpg', 'La obra \"Crimen y castigo\" de Dostoyevski sigue la trama de un estudiante, Raskolnikof, quien comete un crimen para solventar sus problemas económicos. Sin embargo, las repercusiones psicológicas lo llevan a una crisis que afecta profundamente su mundo y a quienes lo rodean. La novela, reconocida por su complejidad psicológica y exploración de la naturaleza humana, es una de las más celebradas en la literatura universal, traducida a numerosos idiomas y adaptada en diversos medios.', 'FIODOR DOSTOYEVSKI', '11 de noviembre de 1821', 'Rusa', 8),
(66, 'SOY LEYENDA', 'img/soy_leyenda.webp', '\"Robert Neville, el último sobreviviente de una pandemia que convirtió a la humanidad en vampiros, lucha por su vida matando a estos seres durante el día y enfrentando su asedio nocturno. En este clásico del género, se explora la soledad, el aislamiento y la reflexión sobre la normalidad y la anormalidad, el bien y el mal, como meras convenciones derivadas del miedo y la incomodidad hacia lo diferente.\"', 'RICHARD MATHESON', '20 de febrero de 1926', 'Estadounidense', 8),
(67, 'LA CABAÑA', 'img/cabaña.jpeg', 'Un fin de semana de juerga en una cabaña se convierte en una pesadilla cuando dos amigos de Mackenzie son asesinados. Sin signos de entrada forzada, las sospechas recaen en el grupo, donde cada uno guarda secretos oscuros.', 'NATASHA PRESTON', '5 de enero de 1988', 'Británica', 8),
(68, 'MIL SOLES ESPLÉNDIDOS', 'img/Mil-soles-espléndidos.webp', 'La segunda novela de Khaled Hosseini, un éxito mundial, cuenta la historia de Mariam y Laila, cuyas vidas se cruzan en Afganistán a lo largo de tres décadas de convulsiones. Mariam se casa joven con un hombre mayor, Rashid, mientras que Laila, sin hogar, encuentra refugio en su casa. Entre ellas surge una fuerte amistad que les da esperanza para superar las adversidades.', 'KHALED HOSSEINI', '4 de marzo de 1965', 'Estadounidense', 8),
(69, 'BOULEVARD. LIBRO 1', 'img/img.cate/drama9.jpg', 'En una edición revisada por la autora, regresa el exitoso fenómeno literario, con la historia de Luke, lleno de problemas, y Hasley, optimista pero despistada, quienes no encajan como pareja perfecta. A pesar de ser opuestos, deciden nombrar lo que han creado juntos: un boulevard con tonos grisáceos y eléctricos, preparándose para la tormenta. Una historia de amor única que dejará una marca duradera.', 'Flor M. Salvador', '25 de diciembre de 1998', 'Mexicana', 8),
(70, 'LA METAMORFOSIS', 'img/img.cate/drama10.webp', '\"La Metamorfosis\" de Franz Kafka narra la historia de Gregorio Samsa, quien despierta un día convertido en un insecto monstruoso, explorando su alienación y distanciamiento de la humanidad. Este relato inquietante y cómico ahonda en las angustias existenciales del protagonista, acompañado de otros relatos como \"Un artista del hambre\" y \"Un artista del trapecio\".', 'FRANZ KAFKA', '3 de julio de 1883', 'Checoslovaca', 8),
(71, 'BAJO LA PUERTA DE LOS SUSURROS', 'img/img.cate/drama11.webp', 'En \"Bajo la puerta de los susurros\", de TJ Klune, Wallace Price se encuentra asistiendo a su propio funeral y descubre que está muerto. Sin embargo, decide aprovechar la semana que le queda en este mundo con la ayuda de Hugo, el barquero del Más Allá. Es una historia conmovedora y divertida sobre vivir la vida al máximo y apreciar los detalles, escrita con la calidez y empatía característica de Klune.', 'TJ KLUNE', '20 de mayo de 1982', 'Estadounidense', 8),
(72, 'ASESINO REAL ', 'img/img.cate/fantasia12.jpg', 'Traspi# ha sobrevivido a su primera misión como asesino del rey a pesar de ser despreciado en la corte por ser bastardo. Decide quedarse en las montañas, pero noticias urgentes y un amor inalcanzable lo llevan de vuelta a Torre del Alce. Allí se enfrenta a las mortíferas intrigas de la familia real y a los ataques de los Corsarios de la Vela Roja, que llevan al reino al borde de la guerra. La salvación depende de Traspi# si está dispuesto a hacer el mayor sacrificio.', 'ROBIN HOBB', '5 de marzo de 1952', 'Estadounidense', 8),
(73, 'EL TEMOR DE UN HOMBRE SABIO (CRÓNICA DEL ASESINO DE REYES 2)', 'img/img.cate/fantasia13.jpg', 'Después de desaparecer, Kvothe, un personaje multifacético, rehúsa regresar a pesar de ser encontrado. Su historia, llena de aventuras y misterio, continúa mientras él busca revelar la verdad detrás de su propia leyenda.', 'PATRICK ROTHFUSS', '6 de junio de 1973', 'Estadounidense', 8),
(74, 'EL DÍA QUE SE PERDIÓ LA CORDURA', 'img/img.cate/drama14.webp', 'Una novela llena de amor, odio y destino, donde un hombre desnudo lleva la cabeza decapitada de una joven en Boston. La investigación del doctor Jenkins y Stella Hyden del FBI los lleva a un pueblo enigmático, explorando sucesos del pasado. Con un estilo ágil y referencias literarias, Javier Castillo teje un thriller romántico que desafía los límites humanos y reinventa el suspense.', 'JAVIER CASTILLO', '26 de agosto de 1987', 'Española', 8),
(75, 'HERIDAS ABIERTAS', 'img/img.cate/drama15.png', '\"Heridas abiertas\" es el debut de Gillian Flynn en el thriller psicológico, siguiendo a Camille Preaker, una reportera que investiga asesinatos en su ciudad natal mientras enfrenta traumas familiares y desafía normas sociales. La novela explora las complejas relaciones familiares y la violencia subyacente en ellas.', 'GILLIAN FLYNN', '24 de febrero de 1971', 'Estadounidense', 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `url_img`, `descripcion`, `reseña`, `autor_id`, `categoria_id`, `estado_id`, `id_usuario`, `fechaAñadido`, `fechaCompra`) VALUES
(69, 'Dune', 'img/img.cate/cienciaficcion1.jpg', 'En un futuro lejano, en un universo donde las familias nobles controlan planetas enteros, surge una lucha por el control del recurso más valioso del universo: la especia melange. Esta es la trama central de \"Dune\", una obra maestra de la ciencia ficción escrita por Frank Herbert.', NULL, 11, 5, 1, 1, '2024-05-02 22:55:50', NULL),
(77, 'El nombre del viento', 'img/img.cate/cienciaficcion6.webp', 'En el reino de Temerant, el joven Kvothe narra su extraordinaria vida, desde sus humildes comienzos como músico callejero hasta convertirse en una leyenda viva. Patrick Rothfuss nos transporta a un mundo de magia, música y aventura en esta apasionante historia.', NULL, 18, 5, 1, 1, '2024-05-02 23:05:30', NULL),
(78, 'La quinta Ola', 'img/img.cate/cienciaficcion4.jpg', 'En un mundo devastado por una serie de ataques alienígenas, Cassie Sullivan lucha por sobrevivir y encontrar a su hermano. \"La quinta Ola\" de Rick Yancey es una emocionante historia de resistencia humana y sacrificio en medio de la adversidad.', NULL, 19, 5, 2, 1, '2024-05-03 17:31:42', NULL),
(84, 'CORALINE', 'img/img.cate/3e490b88329a95bd96c5f77968010106.jpg', 'Después de mudarse, Coraline descubre en su nueva casa una puerta secreta que la lleva a un lugar idéntico, pero habitado por una madre y padre alternativos. Estos la quieren retener para siempre. Pronto se da cuenta de que estos padres alternativos han capturado a otros niños. Coraline debe salvarlos y encontrar una manera de volver a su vida anterior.', NULL, 20, 7, 1, 1, '2024-05-04 23:34:41', NULL),
(85, 'LA CABAÑA', 'img/cabaña.jpeg', 'Un fin de semana de juerga en una cabaña se convierte en una pesadilla cuando dos amigos de Mackenzie son asesinados. Sin signos de entrada forzada, las sospechas recaen en el grupo, donde cada uno guarda secretos oscuros.', NULL, 21, 8, 2, 1, '2024-05-04 23:36:24', NULL),
(86, 'KAIKI: CUENTOS DE TERROR Y LOCURA', 'img/img.cate/imagesterror2.jpg', 'Este libro ofrece una colección de historias escalofriantes ambientadas en un país lleno de mitos, leyendas y supersticiones, donde los habitantes creen en la existencia de diversos tipos de monstruos, tanto imaginarios como reales.', NULL, 22, 7, 1, 1, '2024-05-05 00:03:13', NULL),
(87, 'CUENTOS MACABROS', 'img/cuentos-poe.webp', 'La adaptación de Lacombe del clásico de Poe es el complemento perfecto para su estilo tétrico. La edición de lujo de los cuentos de Poe, con traducción de Cortázar e ilustraciones de Lacombe, ofrece una experiencia única para los amantes de la ilustración y el terror.', NULL, 23, 7, 2, 1, '2024-05-05 00:27:04', NULL),
(88, 'LO QUE EL VIENTO SE LLEVO', 'img/img.cate/novela8.webp', 'Scarlett O Hara vive en la plantación Tara en Georgia, enamorada de Ashley Wilkes, quien se compromete con Melanie Hamilton. En los prolegómenos de la guerra civil, los jóvenes sureños ansían el combate, excepto Rhett Butler, quien se siente atraído por Scarlett. Despechada por el compromiso de Ashley, Scarlett acepta casarse con Charles, hermano de Melanie.', NULL, 24, 2, 1, 1, '2024-05-05 00:27:27', NULL),
(89, 'EL COLECCIONISTA DE BRUJAS', 'img/img.cate/fantasia8.avif', 'En cada Luna de cosecha, el Coleccionista de Brujas, Alexus Thibault, entrega brujas al Rey de la Escarcha. Raina Bloodgood planea vengarse por la desaparición de su hermana, pero cuando el Príncipe del Este ataca, debe unirse a Alexus para salvarlo. Ahora, enfrentados a una antigua maldición, deben decidir hasta dónde están dispuestos a llegar por la familia y el amor.', NULL, 25, 3, 2, 1, '2024-05-05 00:29:18', NULL),
(90, 'AMIGO IMAGINARIO', 'img/img.cate/descarga.jpg', 'Christopher, un niño de 7 años con un amigo imaginario, desaparece en un pueblo aparentemente tranquilo. Cuando regresa, algo ha cambiado: guarda un secreto sobre una voz interior que lo guía hacia la construcción de una casa en un árbol para liberar a su amigo imaginario. Este evento desencadena una serie de eventos que llevan al pueblo a enfrentarse a una batalla entre el bien y el mal.', NULL, 26, 7, 2, 1, '2024-05-05 00:29:36', NULL),
(91, 'EL BAZAR DE LOS MALOS SUEÑOS', 'img/img.cate/1623690065-41g78YLimnL._SL500_.jpg', 'En \"El bazar de los malos sueños\", Stephen King ofrece una colección excepcional de relatos, algunos nuevos y otros revisados, cada uno precedido por una introducción donde explica sus orígenes y motivaciones. Abordando temas como moralidad, vida después de la muerte, culpa y el deseo de corregir el pasado, King sigue demostrando su maestría en el género después de treinta y cinco años desde su primera colección.', NULL, 27, 7, 2, 1, '2024-05-05 00:32:28', NULL);

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
