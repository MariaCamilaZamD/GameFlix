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

-- Volcando datos para la tabla gameflix.alquiler: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` (`id`, `username`, `fecha`) VALUES
	(1, 'camiari', '2022-09-29 02:06:02'),
	(1, 'camiari', '2022-09-29 02:10:10'),
	(1, 'camiari', '2022-09-29 02:20:01'),
	(1, 'camiari', '2022-09-29 02:33:55'),
	(1, 'camiari', '2022-09-29 02:34:37'),
	(1, 'camiari', '2022-09-29 02:58:25'),
	(1, 'carlos22', '2022-09-27 16:28:11'),
	(1, 'LuzAbril', '2022-09-28 17:01:33'),
	(1, 'LuzAbril', '2022-09-28 17:09:11'),
	(1, 'LuzAbril', '2022-09-28 17:10:25'),
	(2, 'camiari', '2022-09-29 02:59:29'),
	(2, 'LuzAbril', '2022-09-28 16:59:32');
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;

-- Volcando estructura para tabla gameflix.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `username` varchar(100) NOT NULL DEFAULT '',
  `contrasena` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `saldo` double(30,3) DEFAULT NULL,
  `premium` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gameflix.usuario: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`username`, `contrasena`, `nombre`, `apellidos`, `email`, `saldo`, `premium`) VALUES
	('camiari', '4321', 'Maria ', 'Zamora Diaz', 'mcami@gmail.com', 4997.300, 1),
	('Carlos22', '0000', 'Carlos', 'Roldan', 'carlos@gmail.com', 99.100, 1),
	('LuzAbril', '123456', 'Luz Marina', 'Abril Montaner', 'monabril@gmail.com', 872.500, 1),
	('Pepi23', '789456', 'Juana', 'Ardila', 'ardilaj@outlook.com', 900.000, 0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla gameflix.videojuego
CREATE TABLE IF NOT EXISTS `videojuego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `fecha_estreno` date NOT NULL,
  `genero` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `modo_juego` varchar(100) DEFAULT NULL,
  `clasificacion` varchar(100) DEFAULT NULL,
  `idioma` varchar(300) DEFAULT NULL,
  `copias` int(11) DEFAULT NULL,
  `novedad` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla gameflix.videojuego: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `videojuego` DISABLE KEYS */;
INSERT INTO `videojuego` (`id`, `nombre`, `fecha_estreno`, `genero`, `descripcion`, `modo_juego`, `clasificacion`, `idioma`, `copias`, `novedad`) VALUES
	(1, 'Monster Hunter Rise', '2021-03-26', 'Acción/Aventura', 'Juego de aventura que se desarrolla en la Aldea Kamura y te invita a explorar ecosistemas repletos de vida en los que les plantarás cara a monstruos imponentes para convertirte en el cazador definitivo', 'Solitario/Multijugador', 'TEEN', 'Plurilingüe', 0, 0),
	(2, 'Triangle Strategy', '2022-03-04', 'Estrategia/Rol táctico', 'Triangle Strategy es mucho más que un juego de estrategia táctica en 2D-HD: es una obra de arte que evoca los clásicos pixelados y que constantemente busca traspasar la barrera de los género a los que evoca base de introducir elementos roleros y darle peso a las decisiones del propio jugador.', 'Solitario', 'TEEN', 'Español', 4, 1),
	(3, 'Kirby y la tierra olvidada', '2022-03-25', 'Aventura de acción 3D', 'Kirby y la Tierra Olvidada tiene seis mundos con cinco niveles cada uno, además de una serie de desafíos secundarios en el mapa y objetivos dentro de los propios niveles. ', 'Solitario/Multijugador', 'EVERYONE 10+', 'Español', 0, 1),
	(4, 'Mario Kart 8 Deluxe', '2017-04-27', 'Carreras', 'El juego de Mario Kart con más personajes tiene 42 personajes para escoger, ¡La lista de personajes más grande en la historia de la serie!', 'Solitario/Multijugador', 'EVERYONE', 'Español', 20, 0),
	(5, 'Legen of Zelda', '2022-09-26', 'Fantasía', 'Juego sobre link', 'Solitario', 'EVERYONE', 'Español', 10, 0),
	(12, 'Diablo 2 resurrected', '2019-11-15', 'Videojuego de rol', 'son videojuegos de rol con elementos de aventura, presentados en tercera persona con un Mundo Semi Abierto debido al gran Área Silvestre, con perspectiva aérea. El jugador controla a un joven entrenador que va en una búsqueda de atrapar y entrenar a criaturas conocidas como Pokémon, y ganar batallas contra otros entrenadores.', 'Solitario/Multijugador', 'ESRB-USK', 'JAPONES-INGLES', 3, 0),
	(13, 'Triangle Strategy', '2022-03-04', 'Estrategia/Rol táctico', 'Triangle Strategy es mucho más que un juego de estrategia táctica en 2D-HD: es una obra de arte que evoca los clásicos pixelados y que constantemente busca traspasar la barrera de los género a los que evoca base de introducir elementos roleros y darle peso a las decisiones del propio jugador.', 'Solitario', 'TEEN', 'Español', 2, 1),
	(14, 'Kirby y la tierra olvidada', '2022-03-25', 'Aventura de acción 3D', 'Kirby y la Tierra Olvidada tiene seis mundos con cinco niveles cada uno, además de una serie de desafíos secundarios en el mapa y objetivos dentro de los propios niveles. ', 'Solitario/Multijugador', 'EVERYONE 10+', 'Español', 5, 1),
	(15, 'Mario Kart 8 Deluxe', '2017-04-27', 'Carreras', 'El juego de Mario Kart con más personajes tiene 42 personajes para escoger, ¡La lista de personajes más grande en la historia de la serie!', 'Solitario/Multijugador', 'EVERYONE', 'Español', 5, 0),
	(16, 'Axion Verge', '2017-04-07', 'videojuego de rol', 'Axiom Verge es un juego de acción y aventuras de desplazamiento lateral en el que el jugador controla a Trace, un científico que, después de sufrir una lesión incapacitante, se despierta en un mundo antiguo y de alta tecnología.', 'Solitario', 'ESRB', 'INGLES', 3, 0),
	(17, 'Party Arcade', '2018-11-09', 'Videojuego de accion, Videojuego de deportes, Juego de simulacion', 'Party Arcade es un juego grupal apto para toda la familia ambientado en un arcade virtual moderno. Con 13 juegos adictivos, los jugadores obtendrán boletos, desbloquearán distintos estilos de equipamiento y batallarán contra familiares y amigos en casa, ¡o por internet en todo el mundo!', 'Solitario/Multijugador', 'ESRB-USK', 'Español-INGLES', 2, 0),
	(18, 'DISNEY SPEEDSTORM', '2022-10-21', 'Juego de arcade/Carreras', 'Sumérgete en el último juego de carreras de combate basado en héroes, ambientado en circuitos de alta velocidad inspirados en los mundos de Disney y Pixar. ¡Domina las habilidades únicas de cada personaje en la pista de carreras y obtén la victoria en esta emocionante experiencia de carreras arcade de los creadores de la serie Asphalt!', 'Solitario/Multijugador', 'B+12', 'ingles-español', 5, 1),
	(19, 'Flying Neko Delivery', '2022-10-20', 'Carreras/Arcade', 'Conviértete en Onigiri, una gata bruja que vive en una casita de campo y entrega paquetes a bordo de su escoba voladora. Personaliza tu casa, explora nuevos mundos, recolecta plantas y setas, y conoce a peculiares aldeanos mientras disfrutas de la música de Mark Sparling, compositor de A Short Hike.', 'Solitario-Multijugador', 'A-todo el publico', 'Aleman, Español, Frances, Holandes, Ingles, Italiano', 5, 1),
	(20, 'NASCAR Rivals', '2022-12-14', 'Carreras/deportes', 'Incluye los equipos, los pilotos, el calendario y los vehículos oficiales de la competición de carreras de stock car más popular del mundo.', 'Solitario/Multijugador/Multijugador en línea', 'A-para todo el publico', 'Ingles', 5, 1),
	(21, 'Nickelodeon Kart Racers 3: Slime Speedway', '2022-10-14', 'carreras,juegos arcade, acción', 'Reconstruido y reimaginado desde cero, ¡Nickelodeon Kart Racers regresa más grande y mejor que nunca! Incluye un reparto de voces de más de 40 personajes icónicos. ¡Derrapa, desliza y acelera en tu camino hasta la meta en pistas inspiradas en las legendarias animaciones de Nickelodeon como SpongeBob SquarePants, Teenage Mutant Ninja Turtles, Avatar: The Last Airbender y más!', 'Solitario/Multijugador', 'A-Para todo el publico', 'Español', 5, 1),
	(22, 'Bus Driving Simulator 22', '2022-10-05', 'Carreras-accion', 'Ponte al volante y conviértete en un conductor de autobús profesional. Este sorprendente simulador de autobús te permitirá transportar pasajeros a través de tres ciudades diferentes (Río de Janeiro, Múnich y Los Ángeles) utilizando diferentes modelos de autobuses en un entorno realista integrado.', 'Solitario/En linea', 'A-todo el publico', 'Aleman, Español, Frances, Ingles, Italiano, Portugues', 5, 0),
	(23, 'One Hell of a Ride', '2022-09-30', 'Carreras', 'Juego de carreras lleno de acción, arcade y explosivo: esta es la mejor descripción para One Hell of a Ride. ¿Hay mejores candidatos para llenar las botas de títulos tan memorables, como Carm... ejem... Twiste... ejem... Bueno, conoces estos juegos sin ninguna pista nuestra.', 'Solitario/Multijugador', 'B15', 'Ingles', 5, 0),
	(24, 'PAW Patrol: Grand Prix', '2022-09-30', 'Carreras,accion', 'Compite en Bahía Aventura con tus cachorros favoritos de la patrulla con hasta 4 jugadores a la vez... ¡pero ten cuidado con los obstáculos que el travieso alcalde Humdinger dejó en el camino!', 'Solitario/Multijugador', 'A-para todo el publico', 'Aleman, Chino (simplificado), Coreano, Español, Frances, Holandes, Ingles, Italiano, Japones, Portugues', 5, 0),
	(25, 'The Zombie Smasher - Dead Apocalyptic Killer Car Driving & Parking Games Survival', '2022-09-27', 'Carreras, multijugador, accion', '¿Estás listo para conducir por tu vida? Zombis, zombis y aún más zombis parecen deambular libremente por la zona. Parece que eres el único ser humano que queda en todo este lío y si no quieres convertirte en un pedazo de carne andante, ¡solo tienes una forma de terminar con esta locura!', 'Solitario', 'B/+12', 'ingles', 5, 0),
	(26, 'Real Truck Simulator USA Car Games - Driving Games, Parking Sim, Car Speed Racing', '2022-09-22', 'Carreras, accion', '¡Conduce un camión real en Truck Simulator USA!Conviértase en un camionero estadounidense y demuestre sus habilidades de conductor.Elige la carga y condúcela. Transporte de carga a los almacenes de la ciudad.Mejora tu camión para conducir mejor y ganar más dinero. Reparar y repostar un camión americano en estaciones de servicio, estación de combustible.', 'Solitario/Multijugador', 'A-para todo el publico', 'Ingles', 5, 0),
	(27, 'Drift King', '2022-09-22', 'Carreras, accion, multijugador', 'LA DIVERSIÓN DEL DRIFTING: Mecánicas de derrape con controles fáciles, Pon el freno de mano empezar a moverte de lado y derrapar,¡MONTONES DE HUMO Y NEUMÁTICOS QUEMADOS!', 'Solitario/Multijugador/ En linea', 'A-para todo publico', 'Aleman, Español, Frances, Holandes, Ingles, Italiano, Japones, Portugues, Ruso', 5, 0),
	(28, 'Animal Drifters', '2022-09-16', 'Carreras, juego de arcade', 'Animal Drifters es un maravilloso juego de arcade donde tu enfoque es simple, debes conducir tu kart y llegar al final del nivel antes que los demás. Pero hay muchos bonos en el camino y muchas monedas para que las tomes. Además de eso, también encontrarás muchos obstáculos que debes evitar.', 'Solitario', 'A-para todo publico', 'Ingles', 5, 0),
	(29, 'Brutal Chase Turbo', '2022-09-16', 'Carreras, juedo de arcade', 'Brutal Chase Turbo es un juego de carreras arcade inspirado en los clásicos juegos de persecución de policías de finales de los 80. ¡Sube a tu coche de policía y embiste a tus enemigos hasta que se rindan!', 'Solitario', 'B/+12', 'Ingles, Japones', 5, 0),
	(30, 'Animals Transport Simulator - Car Driving & Parking Games Real Zoo Park', '2022-09-15', 'Carreras,acción', '¡La vida en la granja nunca ha sido más emocionante! Es su deber recolectar animales de las granjas y luego entregarlos a sus destinos.', 'Solitario/Multijugador', 'A-para todo el publico', 'Ingles', 5, 0);
/*!40000 ALTER TABLE `videojuego` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
