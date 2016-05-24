-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-04-2016 a las 23:46:07
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `CasaBeltrami`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content`
--

CREATE TABLE IF NOT EXISTS `content` (
  `id_content` int(11) NOT NULL,
  `tittle` varchar(45) NOT NULL,
  `route` text,
  `url` varchar(45) DEFAULT NULL,
  `description` text,
  `status` varchar(10) NOT NULL,
  `creation_date` date NOT NULL,
  `modification_date` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `content`
--

INSERT INTO `content` (`id_content`, `tittle`, `route`, `url`, `description`, `status`, `creation_date`, `modification_date`) VALUES
(1, 'algo', 'Captura de pantalla de 2016-01-04 00:24:08.png', NULL, ' algo', 'true', '2016-04-06', NULL),
(2, 'prueba', 'ubuntu005.jpg', NULL, ' prueba', 'true', '2016-04-06', NULL),
(3, 'prueba', 'front-image.jpg', NULL, ' prueba', 'true', '2016-04-06', NULL),
(4, 'casa beltrami', 'Captura de pantalla de 2015-10-16 19:44:31.png', NULL, ' casa beltrami', 'true', '2016-04-06', NULL),
(5, 'captura ', 'IDEADEV', NULL, ' casa beltrami', 'true', '2016-04-06', NULL),
(6, 'Fulanitos 6', 'front-image.jpg', NULL, 'LGO', 'true', '2016-04-06', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content_party_room`
--

CREATE TABLE IF NOT EXISTS `content_party_room` (
  `id` int(11) NOT NULL,
  `id_content` int(11) NOT NULL,
  `id_party_room` int(11) NOT NULL,
  `id_decoration` int(11) NOT NULL,
  `id_service` tinyint(1) DEFAULT NULL,
  `id_sub_service` int(11) NOT NULL,
  `id_event` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `content_party_room`
--

INSERT INTO `content_party_room` (`id`, `id_content`, `id_party_room`, `id_decoration`, `id_service`, `id_sub_service`, `id_event`) VALUES
(1, 6, 1, 1, NULL, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `decorations`
--

CREATE TABLE IF NOT EXISTS `decorations` (
  `id_decoration` int(11) NOT NULL,
  `name_decoration` varchar(45) NOT NULL,
  `id_party` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `decorations`
--

INSERT INTO `decorations` (`id_decoration`, `name_decoration`, `id_party`) VALUES
(1, 'Fachada', 1),
(2, 'Interiores', 1),
(3, 'Exteriores', 1),
(4, 'Cuarto de la novia', 1),
(5, 'Baños', 1),
(6, 'Cocina', 1),
(7, 'Exteriores', 2),
(8, 'Interiores', 2),
(9, 'Baños', 2),
(10, 'Cocina', 2),
(11, 'Exteriores', 3),
(12, 'Juegos interiores y exteriores', 3),
(13, 'Salón', 3),
(14, 'Baños y cocina', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id_event` int(11) NOT NULL,
  `name_event` varchar(25) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `events`
--

INSERT INTO `events` (`id_event`, `name_event`) VALUES
(1, 'Bautizo'),
(2, 'Baby Shower'),
(3, 'Boda'),
(4, 'Comunión'),
(5, 'Iglesias'),
(6, 'Despedida de soltera'),
(7, 'Evento empresarial'),
(8, 'Fiesta infantil'),
(9, 'Fiesta privada'),
(10, 'Graduación'),
(11, 'XV años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `party_room`
--

CREATE TABLE IF NOT EXISTS `party_room` (
  `id_party_room` int(11) NOT NULL,
  `party_room_name` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `party_room`
--

INSERT INTO `party_room` (`id_party_room`, `party_room_name`) VALUES
(1, 'L’incanto'),
(2, 'Farfala'),
(3, 'Bambinos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `id_service` int(11) NOT NULL,
  `name_service` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id_service`, `name_service`) VALUES
(1, 'Renta de mobiliario'),
(2, 'Mesas de dulces y quesos'),
(3, 'Diseño floral');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sub_services`
--

CREATE TABLE IF NOT EXISTS `sub_services` (
  `id_sub_service` int(11) NOT NULL,
  `name_sub_service` varchar(20) NOT NULL,
  `id_service` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sub_services`
--

INSERT INTO `sub_services` (`id_sub_service`, `name_sub_service`, `id_service`) VALUES
(1, 'Mesas', 1),
(2, 'Sillas', 1),
(3, 'Mantelería', 1),
(4, 'Mesa de postres', 2),
(5, 'Mesa de quesos', 2),
(6, 'Carrito de dulces', 2),
(7, 'Carrito de hospital', 2),
(8, 'Decoración floral', 3),
(9, 'Centros de mesa', 3),
(10, 'Arreglos florales', 3),
(11, 'Ramos de novia', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Users`
--

INSERT INTO `Users` (`id`, `nombre`, `user`, `password`) VALUES
(0, 'Castro Esparza Jose Antonio', 'tonoescom@gmail.com', '2011301308');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id_content`);

--
-- Indices de la tabla `content_party_room`
--
ALTER TABLE `content_party_room`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `decorations`
--
ALTER TABLE `decorations`
  ADD PRIMARY KEY (`id_decoration`);

--
-- Indices de la tabla `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id_event`);

--
-- Indices de la tabla `party_room`
--
ALTER TABLE `party_room`
  ADD PRIMARY KEY (`id_party_room`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`);

--
-- Indices de la tabla `sub_services`
--
ALTER TABLE `sub_services`
  ADD PRIMARY KEY (`id_sub_service`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `content`
--
ALTER TABLE `content`
  MODIFY `id_content` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `content_party_room`
--
ALTER TABLE `content_party_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `decorations`
--
ALTER TABLE `decorations`
  MODIFY `id_decoration` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `events`
--
ALTER TABLE `events`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `party_room`
--
ALTER TABLE `party_room`
  MODIFY `id_party_room` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `sub_services`
--
ALTER TABLE `sub_services`
  MODIFY `id_sub_service` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
