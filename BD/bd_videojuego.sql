-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.9.1-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gameflix
CREATE DATABASE IF NOT EXISTS `gameflix` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gameflix`;

-- Volcando estructura para tabla gameflix.alquiler
CREATE TABLE IF NOT EXISTS `alquiler` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`,`username`,`fecha`) USING BTREE,
  KEY `FK_usuario` (`username`),
  CONSTRAINT `FK_usuario` FOREIGN KEY (`username`) REFERENCES `usuario` (`username`),
  CONSTRAINT `FK_videojuego` FOREIGN KEY (`id`) REFERENCES `videojuego` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gameflix.alquiler: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;

-- Volcando estructura para tabla gameflix.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `username` varchar(100) NOT NULL DEFAULT '',
  `contrasena` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `saldo` double(30,3) DEFAULT NULL,
  `premium` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gameflix.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla gameflix.videojuego
CREATE TABLE IF NOT EXISTS `videojuego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_estreno` date NOT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `modo_juego` varchar(100) DEFAULT NULL,
  `clasificacion` varchar(100) DEFAULT NULL,
  `idioma` varchar(100) DEFAULT NULL,
  `copias` int(11) DEFAULT NULL,
  `novedad` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gameflix.videojuego: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `videojuego` DISABLE KEYS */;
INSERT INTO `videojuego` (`id`, `nombre`, `fecha_estreno`, `genero`, `descripcion`, `modo_juego`, `clasificacion`, `idioma`, `copias`, `novedad`) VALUES
	(1, 'Monster Hunter Rise', '2021-03-26', 'Acción/Aventura ', 'Juego de aventura que se desarrolla en la Aldea Kamura y te invita a explorar ecosistemas repletos de vida en los que les plantarás cara a monstruos imponentes para convertirte en el cazador definitivo', 'Solitario/Multijugador', 'TEEN', 'Plurilingüe', 3, 0),
	(2, 'Triangle Strategy', '2022-03-04', 'Estrategia/Rol táctico', 'Triangle Strategy es mucho más que un juego de estrategia táctica en 2D-HD: es una obra de arte que evoca los clásicos pixelados y que constantemente busca traspasar la barrera de los género a los que evoca base de introducir elementos roleros y darle peso a las decisiones del propio jugador.', 'Solitario', 'TEEN', 'Español', 2, 1),
	(3, 'Kirby y la tierra olvidada', '2022-03-25', 'Aventura de acción 3D', 'Kirby y la Tierra Olvidada tiene seis mundos con cinco niveles cada uno, además de una serie de desafíos secundarios en el mapa y objetivos dentro de los propios niveles. ', 'Solitario/Multijugador', 'EVERYONE 10+', 'Español', 5, 1),
	(4, 'Mario Kart 8 Deluxe', '2017-04-27', 'Carreras', 'El juego de Mario Kart con más personajes tiene 42 personajes para escoger, ¡La lista de personajes más grande en la historia de la serie!', 'Solitario/Multijugador', 'EVERYONE', 'Español', 5, 0);
/*!40000 ALTER TABLE `videojuego` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
