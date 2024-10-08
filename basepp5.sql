-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-10-2024 a las 20:45:15
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
-- Base de datos: `basepp5`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` int DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `tipo_actividad` int DEFAULT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `nacimiento` date NOT NULL,
  `observaciones` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_04` (`tipo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `apellido`, `dni`, `correo`, `fecha_registro`, `tipo_actividad`, `telefono`, `direccion`, `nacimiento`, `observaciones`) VALUES
(1, 'Sebastian', 'Gutierrez', 41543765, 'sebasgutierrez@gmail.com', '2024-09-23', 2, '2345678901', 'Jujuy 223 sur', '2000-06-20', 'es barbero '),
(2, 'Jorge', 'Aguero', 34576871, 'jorgeaguero@gmail.com', '2024-09-16', 2, '', '', '0000-00-00', ''),
(5, 'Chelo', 'Delgado', 23556779, 'cheli@gmail.com', '2024-09-23', 1, '116778942', 'sarmiento 55', '1975-05-13', 'es del consejo del mate'),
(7, 'Fernando', 'Gago', 25789987, 'lagagoneta@gmail.com', '2024-09-30', 1, '0114689902', 'la boca', '1978-06-28', 'futuro dt de boca');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imc`
--

DROP TABLE IF EXISTS `imc`;
CREATE TABLE IF NOT EXISTS `imc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumno` int DEFAULT NULL,
  `peso` int DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `calculo` float DEFAULT NULL,
  `fecha_calculo` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno` (`alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imc`
--

INSERT INTO `imc` (`id`, `alumno`, `peso`, `altura`, `calculo`, `fecha_calculo`, `fecha_modificacion`) VALUES
(3, 1, 80, 1.82, 24.1517, '2024-09-22', '2024-09-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

DROP TABLE IF EXISTS `instructores`;
CREATE TABLE IF NOT EXISTS `instructores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `rutina` int DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_07` (`rutina`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`id`, `nombre`, `apellido`, `rutina`, `telefono`, `mail`) VALUES
(1, 'Luis', 'Gomez', 1, '2144002683', 'luisgomez@gmail.com'),
(2, 'Raul Alfredo', 'Cascini', 1, '2645678904', 'raul@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

DROP TABLE IF EXISTS `membresias`;
CREATE TABLE IF NOT EXISTS `membresias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_actividad` int DEFAULT NULL,
  `precio` varchar(255) DEFAULT NULL,
  `clases` varchar(255) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `turnos` int DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `alumno` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_actividad` (`tipo_actividad`),
  KEY `turnos` (`turnos`),
  KEY `fk_membresias_alumnos` (`alumno`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`id`, `tipo_actividad`, `precio`, `clases`, `fecha_alta`, `fecha_baja`, `turnos`, `estado`, `alumno`) VALUES
(1, 2, '12000', '9', '2024-09-16', '2024-10-15', 1, 'Activo', 1),
(7, 1, '12700', '8', '2024-09-24', '2024-10-23', 1, 'Activo', 2),
(14, 1, '16300', 'Pase Libre', '2024-09-03', '2024-10-02', 6, 'Activo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

DROP TABLE IF EXISTS `rutinas`;
CREATE TABLE IF NOT EXISTS `rutinas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumno` int DEFAULT NULL,
  `tipo_actividad` int DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(350) DEFAULT NULL,
  `archivo` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alumno` (`alumno`),
  KEY `tipo_actividad` (`tipo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutinas`
--

INSERT INTO `rutinas` (`id`, `alumno`, `tipo_actividad`, `titulo`, `descripcion`, `archivo`) VALUES
(1, 1, 1, 'Aeróbico', 'Entrenamiento para grupo de personas que hacen cardio.', '1726790758_f0ba2ab78eae9becb603.pdf'),
(2, NULL, 2, 'elllaes', 'jajddadasffd', '1726791010_TRABAJO PRACTICO 3 TSDS 23.pdf'),
(3, 7, 1, 'Fuchibol', 'La tiene atada', '1727814068_Certificado_nuevo_copia.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_actividad`
--

DROP TABLE IF EXISTS `tipo_actividad`;
CREATE TABLE IF NOT EXISTS `tipo_actividad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_actividad`
--

INSERT INTO `tipo_actividad` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Funcional', 'Entrenamiento de aeróbico para perder grasa, clases genéricas para todos. '),
(2, 'Crossfit', 'Entrenamiento personalizado para personas que buscan una definición. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

DROP TABLE IF EXISTS `turnos`;
CREATE TABLE IF NOT EXISTS `turnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_actividad` int DEFAULT NULL,
  `instructor` int DEFAULT NULL,
  `horario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instructor` (`instructor`),
  KEY `tipo_actividad` (`tipo_actividad`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id`, `tipo_actividad`, `instructor`, `horario`) VALUES
(1, 1, 1, '8.00am a 12.00'),
(6, 2, 2, '16 a 19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `usuario` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pass` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `usuario`, `pass`) VALUES
(1, 'Facundo', 'Simeoni', 'facu12', '1234'),
(3, 'Federico', 'Moran', 'fede', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
