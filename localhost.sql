-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-03-2014 a las 19:39:49
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `codeigniter`
--
CREATE DATABASE IF NOT EXISTS `codeigniter` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `codeigniter`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mireservacion`
--

CREATE TABLE IF NOT EXISTS `mireservacion` (
  `id_mireservacion` int(10) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(50) DEFAULT NULL,
  `fechareserva` varchar(50) DEFAULT NULL,
  `hora` varchar(50) DEFAULT NULL,
  `descripcion` mediumtext,
  PRIMARY KEY (`id_mireservacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla eq`
--

CREATE TABLE IF NOT EXISTS `tabla eq` (
  `id_equipo` int(10) NOT NULL AUTO_INCREMENT,
  `refequipo` int(10) DEFAULT NULL,
  `sistoperativo` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla usr`
--

CREATE TABLE IF NOT EXISTS `tabla usr` (
  `id_usr` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `identificacion` varchar(50) DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  PRIMARY KEY (`id_usr`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
--
-- Base de datos: `face`
--
CREATE DATABASE IF NOT EXISTS `face` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `face`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calif`
--

CREATE TABLE IF NOT EXISTS `calif` (
  `id_calif` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(45) NOT NULL,
  `c1` int(10) unsigned NOT NULL,
  `c2` int(10) unsigned NOT NULL,
  `c3` int(10) unsigned NOT NULL,
  `docente` varchar(45) NOT NULL,
  PRIMARY KEY (`id_calif`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `calif`
--

INSERT INTO `calif` (`id_calif`, `id_usuario`, `c1`, `c2`, `c3`, `docente`) VALUES
(1, '1', 8, 8, 9, '001'),
(2, '2', 6, 8, 7, '001'),
(3, '3', 9, 8, 10, '001'),
(4, '4', 8, 8, 8, '002'),
(5, '5', 10, 10, 10, '002'),
(6, '6', 10, 9, 5, '002'),
(7, '7', 9, 6, 5, '003'),
(8, '8', 6, 6, 7, '003'),
(9, '1', 4, 4, 6, '002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `face`
--

CREATE TABLE IF NOT EXISTS `face` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `url` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `face`
--

INSERT INTO `face` (`id`, `nombre`, `direccion`, `url`) VALUES
(1, 'Juan Hernandez Barrera', 'Estado de Mexico', 'fotos/1.jpg'),
(2, 'Cesar Cabrera fernandez', 'Texcoco', 'fotos/2.jpg'),
(3, 'Luis Flores Magon', 'Guadalajara', 'fotos/3.jpg'),
(4, 'Martin Flores Alvarez', 'Estado de Mexico', 'fotos/4.jpg'),
(5, 'Hernesto de Jesus', 'Tamaulipas', 'fotos/5.jpg'),
(6, 'Fernanda Alvarez Martinez', 'Distrito Federal', 'fotos/6.jpg'),
(7, 'Brenda Martinez Carmona', 'Ixtapaluca', 'fotos/7.jpg'),
(8, 'Ricardo Jimenez Bandera', 'Durango', 'fotos/8.jpg');
--
-- Base de datos: `inventario`
--
CREATE DATABASE IF NOT EXISTS `inventario` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `inventario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografia`
--

CREATE TABLE IF NOT EXISTS `fotografia` (
  `foto` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`foto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fotografia`
--

INSERT INTO `fotografia` (`foto`) VALUES
(1),
(2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `producto` varchar(200) DEFAULT NULL,
  `foto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_fotografia` (`foto`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `producto`, `foto`) VALUES
(2, 'cerveza', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_fotografia` FOREIGN KEY (`foto`) REFERENCES `fotografia` (`foto`);
--
-- Base de datos: `networksocial`
--
CREATE DATABASE IF NOT EXISTS `networksocial` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `networksocial`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE IF NOT EXISTS `amigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `amigos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`id`, `usuario`, `amigos`) VALUES
(11, 7, 15),
(12, 15, 7),
(13, 7, 5),
(14, 5, 7),
(15, 7, 13),
(16, 13, 7),
(21, 7, 17),
(22, 17, 7),
(25, 7, 20),
(26, 20, 7),
(27, 7, 23),
(28, 23, 7),
(29, 7, 22),
(30, 22, 7),
(31, 7, 16),
(32, 16, 7),
(33, 1, 7),
(34, 7, 1),
(35, 8, 7),
(36, 7, 8),
(37, 4, 7),
(38, 7, 4),
(39, 4, 15),
(40, 15, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `friendship_requests`
--

CREATE TABLE IF NOT EXISTS `friendship_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL,
  `recipient` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=129 ;

--
-- Volcado de datos para la tabla `friendship_requests`
--

INSERT INTO `friendship_requests` (`id`, `sender`, `recipient`) VALUES
(76, 9, 16),
(47, 2, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `site_members`
--

CREATE TABLE IF NOT EXISTS `site_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(11) NOT NULL,
  `fotoperfil` varchar(255) NOT NULL,
  `fotoportada` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcado de datos para la tabla `site_members`
--

INSERT INTO `site_members` (`id`, `username`, `password`, `fotoperfil`, `fotoportada`) VALUES
(1, 'test', '1234', 'fotos/1.jpg', ''),
(2, 'Danny', '1234', 'fotos/2.jpg', ''),
(3, 'chuck', '1234', 'fotos/3.jpg', ''),
(4, 'joaquin', '1234', 'fotos/4.jpg', ''),
(5, 'william', '1234', 'fotos/5.jpg', ''),
(6, 'marcos', '1234', 'fotos/6.jpg', ''),
(7, 'david', '1234', 'fotos/7.jpg', ''),
(8, 'robin', '1234', 'fotos/8.jpg', ''),
(9, 'javier', '1234', '', ''),
(10, 'lucas', '1234', '', ''),
(11, 'Judas', '1234', '', ''),
(12, 'matias', '1234', '', ''),
(13, 'clara', '1234', '', ''),
(14, 'Ryan', '1234', '', ''),
(15, 'Eder', '1234', '', ''),
(16, 'Rosio', '1234', '', ''),
(17, 'Victor', '1234', '', ''),
(18, 'yenny', '1234', '', ''),
(19, 'valentina', '1234', '', ''),
(20, 'oscar', '1234', '', ''),
(21, 'duvan', '1234', '', ''),
(22, 'ambar', '1234', '', ''),
(23, 'luisa', '1234', '', '');
--
-- Base de datos: `paginacion`
--
CREATE DATABASE IF NOT EXISTS `paginacion` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `paginacion`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` int(40) DEFAULT NULL,
  `edad` int(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `direccion`, `telefono`, `edad`) VALUES
(1, 'Ryan', 'calle 5 # 6-70', 2147483647, 20),
(2, 'Oscar', 'calle 6 # 8-90', 2147483647, 21),
(3, 'Ryan', 'calle 5 # 6-70', 2147483647, 20),
(4, 'Oscar', 'calle 6 # 8-90', 2147483647, 21),
(5, 'robert', 'calle 7 # 8-10', 2147483647, 25),
(6, 'diego', 'calle 9 # 9 -40', 2147483647, 28),
(7, 'william', 'calle 19 # 20-39', 2147483647, 50),
(8, 'carolina', 'calle 80  # 20 - 30', 2147483647, 79),
(9, 'keith alexander', 'calle 70 # 80 -10', 2147483647, 40),
(10, 'victor', 'carrera 28 # 40-10', 2147483647, 74),
(11, 'Margalida', 'calle 5 # 6-70', 2147483647, 33),
(12, 'zeus', 'calle 80  # 20 - 30', 2147483647, 988);
--
-- Base de datos: `pensamientos`
--
CREATE DATABASE IF NOT EXISTS `pensamientos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pensamientos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pensamiento`
--

CREATE TABLE IF NOT EXISTS `pensamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(200) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `pensamiento`
--

INSERT INTO `pensamiento` (`id`, `mensaje`, `hora`) VALUES
(45, ' canavis ', '09:37:40');
--
-- Base de datos: `redsocial`
--
CREATE DATABASE IF NOT EXISTS `redsocial` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `redsocial`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE IF NOT EXISTS `amigos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL,
  `amigos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

CREATE TABLE IF NOT EXISTS `avatar` (
  `id_avatar` int(11) NOT NULL AUTO_INCREMENT,
  `id_miembro` int(11) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_avatar`),
  KEY `id_miembro` (`id_miembro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `avatar`
--

INSERT INTO `avatar` (`id_avatar`, `id_miembro`, `url`) VALUES
(1, 1, 'albums/dibujo-para-pintar-de-bart-simpson-monopatin.gif');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colegio`
--

CREATE TABLE IF NOT EXISTS `colegio` (
  `id_colegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombrecolegio` varchar(255) NOT NULL,
  PRIMARY KEY (`id_colegio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` text,
  `emisor` int(11) DEFAULT NULL,
  `receptor` int(11) DEFAULT NULL,
  `fechacomentario` date DEFAULT NULL,
  `horacomentario` time DEFAULT NULL,
  `idpublicacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariosfotos`
--

CREATE TABLE IF NOT EXISTS `comentariosfotos` (
  `id_comentariosfotos` int(11) NOT NULL AUTO_INCREMENT,
  `comentariofoto` text NOT NULL,
  `ubicacionfoto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_comentariosfotos`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `comentariosfotos`
--

INSERT INTO `comentariosfotos` (`id_comentariosfotos`, `comentariofoto`, `ubicacionfoto`) VALUES
(1, 'cool', 'foto en espringfield'),
(2, 'foto 2', ' ub 2'),
(3, 'foto 3', 'ub 3'),
(4, 'foto 4', 'ub 4'),
(5, 'foto 5', 'ub 5'),
(6, 'foto 6', 'ub 7'),
(7, 'foto 7', 'ub 7'),
(8, 'foto 8', 'ub 8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariosvideos`
--

CREATE TABLE IF NOT EXISTS `comentariosvideos` (
  `id_comentariosvideos` int(11) NOT NULL AUTO_INCREMENT,
  `comentariovideo` int(11) NOT NULL,
  `ubicacionvideo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_comentariosvideos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correos`
--

CREATE TABLE IF NOT EXISTS `correos` (
  `id_correoopcional` int(11) NOT NULL AUTO_INCREMENT,
  `correoopcional` varchar(255) NOT NULL,
  PRIMARY KEY (`id_correoopcional`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `correos`
--

INSERT INTO `correos` (`id_correoopcional`, `correoopcional`) VALUES
(1, 'david@');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` text,
  `usuario` int(11) DEFAULT NULL,
  `fechaestado` date DEFAULT NULL,
  `horaestado` time DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estado`, `estado`, `usuario`, `fechaestado`, `horaestado`) VALUES
(62, ' estado 1 ', NULL, NULL, '12:39:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `foto`
--

INSERT INTO `foto` (`id`, `url`) VALUES
(18, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografias`
--

CREATE TABLE IF NOT EXISTS `fotografias` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `nombrealbum` varchar(255) NOT NULL,
  `comentarioalbum` text NOT NULL,
  `ubicacionfotos` varchar(255) NOT NULL,
  `colaboradores` text NOT NULL,
  `fechasfotos` date NOT NULL,
  `privacidadfotos` text NOT NULL,
  PRIMARY KEY (`id_album`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `fotografias`
--

INSERT INTO `fotografias` (`id_album`, `nombrealbum`, `comentarioalbum`, `ubicacionfotos`, `colaboradores`, `fechasfotos`, `privacidadfotos`) VALUES
(1, 'fotosperfil', '', '', '', '0000-00-00', ''),
(2, 'fotos perfil', '', '', '', '0000-00-00', ''),
(3, 'fotos perfil', '', '', '', '0000-00-00', ''),
(4, 'fotos perfil', '', '', '', '0000-00-00', ''),
(5, 'fotos perfil', '', '', '', '0000-00-00', ''),
(6, 'fotos perfil', '', '', '', '0000-00-00', ''),
(7, 'fotos perfil', '', '', '', '0000-00-00', ''),
(8, 'fotos perfil', '', '', '', '0000-00-00', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotos`
--

CREATE TABLE IF NOT EXISTS `fotos` (
  `id_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_album` int(11) NOT NULL,
  `urlfoto` varchar(255) NOT NULL,
  `id_comentariosfotos` int(11) NOT NULL,
  `id_miembro` int(11) NOT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `fk_idcomentariosfotos` (`id_comentariosfotos`),
  KEY `fk_idalbumfotos` (`id_album`),
  KEY `fk_idmiembrofotos` (`id_miembro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `fotos`
--

INSERT INTO `fotos` (`id_foto`, `id_album`, `urlfoto`, `id_comentariosfotos`, `id_miembro`) VALUES
(4, 1, 'fotos/1.jpg', 1, 1),
(11, 2, 'fotos/2.jpg', 2, 2),
(12, 3, 'fotos/3.jpg', 3, 3),
(15, 4, 'fotos/4.jpg', 4, 4),
(16, 5, 'fotos/5.jpg', 5, 5),
(17, 6, 'fotos/6.jpg', 6, 6),
(18, 7, 'fotos/7.jpg', 7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infcontacto`
--

CREATE TABLE IF NOT EXISTS `infcontacto` (
  `id_infcontacto` int(11) NOT NULL AUTO_INCREMENT,
  `id_correoopcional` int(11) NOT NULL,
  `id_miembro` int(11) DEFAULT NULL,
  `id_telefono` int(11) NOT NULL,
  `id_mensajeriainstantanea` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL DEFAULT '',
  `ciudad` varchar(255) NOT NULL,
  `codigopostal` int(11) NOT NULL,
  `vecindario` varchar(255) NOT NULL,
  `sitioweb` varchar(255) NOT NULL,
  PRIMARY KEY (`id_infcontacto`,`direccion`),
  KEY `fk_idcorreoopcional` (`id_correoopcional`),
  KEY `fk_idmiembro` (`id_miembro`),
  KEY `fk_idtelefono` (`id_telefono`),
  KEY `fk_idmensajeriainstantanea` (`id_mensajeriainstantanea`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `infcontacto`
--

INSERT INTO `infcontacto` (`id_infcontacto`, `id_correoopcional`, `id_miembro`, `id_telefono`, `id_mensajeriainstantanea`, `direccion`, `ciudad`, `codigopostal`, `vecindario`, `sitioweb`) VALUES
(1, 0, 1, 0, 0, 'calle 50 ', '', 0, '', ''),
(16, 0, 2, 0, 0, 'calle 1', '', 0, '', ''),
(17, 0, 3, 0, 0, 'calle 2', '', 0, '', ''),
(18, 0, 4, 0, 0, 'calle 4', '', 0, '', ''),
(19, 0, 5, 0, 0, 'calle 5', '', 0, '', ''),
(20, 0, 6, 0, 0, 'calle 6', '', 0, '', ''),
(21, 0, 7, 0, 0, 'calle 7', '', 0, '', ''),
(22, 0, 8, 0, 0, 'calle 8', '', 0, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infeducacion`
--

CREATE TABLE IF NOT EXISTS `infeducacion` (
  `id_infeducacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_miembro` int(111) NOT NULL,
  `id_colegio` int(11) NOT NULL,
  `id_programacolegio` int(11) NOT NULL,
  `fechaentrada` date NOT NULL,
  `fechafin` date NOT NULL,
  PRIMARY KEY (`id_infeducacion`),
  KEY `fk_idcolegio` (`id_colegio`),
  KEY `fk_idprogramacolegio` (`id_programacolegio`),
  KEY `fk_idmiembroinfeducacion` (`id_miembro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infpersonal`
--

CREATE TABLE IF NOT EXISTS `infpersonal` (
  `id_infpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `id_miembro` int(11) DEFAULT NULL,
  `id_relacion` int(11) NOT NULL,
  `sexo` varchar(255) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `ciudadnatal` varchar(255) NOT NULL,
  `paisnatal` varchar(255) NOT NULL,
  `interes` varchar(255) NOT NULL,
  `idiomas` text NOT NULL,
  `religion` varchar(255) NOT NULL,
  `ideologiapolitica` varchar(255) NOT NULL,
  `sobremi` text NOT NULL,
  PRIMARY KEY (`id_infpersonal`),
  KEY `fk_idmiembroinfpersonal` (`id_miembro`),
  KEY `fk_idrelacion` (`id_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inftrabajo`
--

CREATE TABLE IF NOT EXISTS `inftrabajo` (
  `id_inftrabajo` int(11) NOT NULL AUTO_INCREMENT,
  `id_miembro` int(11) NOT NULL,
  `id_trabajo` int(11) NOT NULL,
  `fechaentrada` date NOT NULL,
  `fechafin` date NOT NULL,
  PRIMARY KEY (`id_inftrabajo`),
  KEY `fk_idtrabajo` (`id_trabajo`),
  KEY `fk_idmiembroinftrabajo` (`id_miembro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `megusta`
--

CREATE TABLE IF NOT EXISTS `megusta` (
  `id_megusta` int(11) NOT NULL AUTO_INCREMENT,
  `id_publicacion` int(11) DEFAULT NULL,
  `emisor` int(11) DEFAULT NULL,
  `receptor` int(11) DEFAULT NULL,
  `fechamegusta` date NOT NULL,
  `horamegusta` date NOT NULL,
  PRIMARY KEY (`id_megusta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajeriainstantanea`
--

CREATE TABLE IF NOT EXISTS `mensajeriainstantanea` (
  `id_mensajeriainstantanea` int(11) NOT NULL AUTO_INCREMENT,
  `usuariomensajeriainstantanea` varchar(255) NOT NULL,
  PRIMARY KEY (`id_mensajeriainstantanea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajesbiografia`
--

CREATE TABLE IF NOT EXISTS `mensajesbiografia` (
  `id_mensajebiografia` int(11) NOT NULL AUTO_INCREMENT,
  `mensajebiografia` text,
  `emisor` int(11) DEFAULT NULL,
  `receptor` int(11) DEFAULT NULL,
  `fechapublicacion` date DEFAULT NULL,
  `horapublicacion` time DEFAULT NULL,
  PRIMARY KEY (`id_mensajebiografia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `mensajesbiografia`
--

INSERT INTO `mensajesbiografia` (`id_mensajebiografia`, `mensajebiografia`, `emisor`, `receptor`, `fechapublicacion`, `horapublicacion`) VALUES
(1, ' probando mensaje 2 biografia ', 1, NULL, NULL, '03:12:21'),
(7, ' Hola yo soy rosita ', 2, NULL, NULL, '03:16:54'),
(8, ' probando mensaje 2 ', 1, NULL, NULL, '10:53:09'),
(9, ' probando mensaje 5 ', 1, NULL, NULL, '10:54:52'),
(10, ' probando mensaje 5 ', 1, NULL, NULL, '10:57:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembros`
--

CREATE TABLE IF NOT EXISTS `miembros` (
  `id_miembro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `correo` varchar(60) NOT NULL DEFAULT '',
  `fechacreacioncuenta` date NOT NULL,
  PRIMARY KEY (`id_miembro`,`correo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `miembros`
--

INSERT INTO `miembros` (`id_miembro`, `nombre`, `apellido`, `contrasena`, `correo`, `fechacreacioncuenta`) VALUES
(1, 'david fernando ', 'ramirez', '1234', 'david', '2014-01-19'),
(2, 'Rosita', 'gonzalez', '1234', 'Rosita@', '2014-01-19'),
(3, 'javier', 'ramirez', '1234', 'javier@', '2014-01-22'),
(4, 'roberto', 'aristizabal', '1234', 'roberto@', '0000-00-00'),
(5, 'teresa', 'montenegro', '1234', 'teresa@', '0000-00-00'),
(6, 'lucas', 'garcia', '1234', 'lucas@', '2014-03-01'),
(7, 'maria teresa', 'agudelo', '1234', 'teresa@', '2014-03-01'),
(8, 'clara ', 'ramirez', '1234', 'clarita@', '2014-03-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacolegio`
--

CREATE TABLE IF NOT EXISTS `programacolegio` (
  `id_programacolegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombreprograma` varchar(255) NOT NULL,
  PRIMARY KEY (`id_programacolegio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `relaciones`
--

CREATE TABLE IF NOT EXISTS `relaciones` (
  `id_relacion` int(11) NOT NULL AUTO_INCREMENT,
  `pareja` int(11) DEFAULT NULL,
  `estadorelacion` enum('soltero','en una relacion','casado','es complicado') DEFAULT NULL,
  PRIMARY KEY (`id_relacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudesdeamistad`
--

CREATE TABLE IF NOT EXISTS `solicitudesdeamistad` (
  `id_solicitudamistad` int(11) NOT NULL AUTO_INCREMENT,
  `remitente` int(11) DEFAULT NULL,
  `beneficiario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_solicitudamistad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE IF NOT EXISTS `telefonos` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `telefonomobil` int(50) NOT NULL,
  `telefonoopcional` int(50) NOT NULL,
  PRIMARY KEY (`id_telefono`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`id_telefono`, `telefonomobil`, `telefonoopcional`) VALUES
(1, 311240, 2580444);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajo`
--

CREATE TABLE IF NOT EXISTS `trabajo` (
  `id_trabajo` int(11) NOT NULL AUTO_INCREMENT,
  `compañia` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE IF NOT EXISTS `videos` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `urlvideo` varchar(255) NOT NULL,
  `titulovideo` varchar(255) NOT NULL,
  `fechavideo` date NOT NULL,
  `id_comentariosvideos` int(11) NOT NULL,
  PRIMARY KEY (`id_video`),
  KEY `fk_idcomentariovideo` (`id_comentariosvideos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videosusuario`
--

CREATE TABLE IF NOT EXISTS `videosusuario` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_miembro` int(11) NOT NULL,
  PRIMARY KEY (`id_video`),
  KEY `fk_idmiembrovideosusuario` (`id_miembro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avatar`
--
ALTER TABLE `avatar`
  ADD CONSTRAINT `fk_avatar` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`);

--
-- Filtros para la tabla `fotos`
--
ALTER TABLE `fotos`
  ADD CONSTRAINT `fk_idmiembrofotos` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`),
  ADD CONSTRAINT `fk_idalbumfotos` FOREIGN KEY (`id_album`) REFERENCES `fotografias` (`id_album`),
  ADD CONSTRAINT `fk_idcomentariosfotos` FOREIGN KEY (`id_comentariosfotos`) REFERENCES `comentariosfotos` (`id_comentariosfotos`);

--
-- Filtros para la tabla `infcontacto`
--
ALTER TABLE `infcontacto`
  ADD CONSTRAINT `fk_idmiembro` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`);

--
-- Filtros para la tabla `infeducacion`
--
ALTER TABLE `infeducacion`
  ADD CONSTRAINT `fk_idmiembroinfeducacion` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`),
  ADD CONSTRAINT `fk_idcolegio` FOREIGN KEY (`id_colegio`) REFERENCES `colegio` (`id_colegio`),
  ADD CONSTRAINT `fk_idprogramacolegio` FOREIGN KEY (`id_programacolegio`) REFERENCES `programacolegio` (`id_programacolegio`);

--
-- Filtros para la tabla `infpersonal`
--
ALTER TABLE `infpersonal`
  ADD CONSTRAINT `fk_idrelacion` FOREIGN KEY (`id_relacion`) REFERENCES `relaciones` (`id_relacion`),
  ADD CONSTRAINT `fk_idmiembroinfpersonal` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`);

--
-- Filtros para la tabla `inftrabajo`
--
ALTER TABLE `inftrabajo`
  ADD CONSTRAINT `fk_idmiembroinftrabajo` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`),
  ADD CONSTRAINT `fk_idtrabajo` FOREIGN KEY (`id_trabajo`) REFERENCES `trabajo` (`id_trabajo`);

--
-- Filtros para la tabla `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk_idcomentariovideo` FOREIGN KEY (`id_comentariosvideos`) REFERENCES `comentariosvideos` (`id_comentariosvideos`);

--
-- Filtros para la tabla `videosusuario`
--
ALTER TABLE `videosusuario`
  ADD CONSTRAINT `fk_idmiembrovideosusuario` FOREIGN KEY (`id_miembro`) REFERENCES `miembros` (`id_miembro`),
  ADD CONSTRAINT `fk_idvideo` FOREIGN KEY (`id_video`) REFERENCES `videos` (`id_video`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
