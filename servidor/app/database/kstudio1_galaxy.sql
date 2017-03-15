-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 30, 2015 at 01:24 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kstudio1_galaxy`
--

-- --------------------------------------------------------

--
-- Table structure for table `perfiles`
--

CREATE TABLE IF NOT EXISTS `perfiles` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `perfiles`
--

INSERT INTO `perfiles` (`id`, `admin`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador', 'Tiene acceso total al sitio y todos sus sub-sitios, as', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 0, 'Standard', 'Usuarios standard del sistema', '2014-05-01 00:00:00', '2014-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `registros`
--

CREATE TABLE IF NOT EXISTS `registros` (
  `id` int(11) NOT NULL,
  `id_registro` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `dia` varchar(255) NOT NULL,
  `mes` varchar(255) NOT NULL,
  `ano` varchar(255) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `operador` varchar(255) NOT NULL,
  `origen` varchar(255) NOT NULL,
  `qrespuestas` int(11) NOT NULL,
  `tiempo` int(11) NOT NULL,
  `created_at_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at_registro` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registros`
--

INSERT INTO `registros` (`id`, `id_registro`, `nombre`, `apellido`, `correo`, `dia`, `mes`, `ano`, `fechanacimiento`, `telefono`, `marca`, `modelo`, `operador`, `origen`, `qrespuestas`, `tiempo`, `created_at_registro`, `update_at_registro`, `created_at`, `update_at`) VALUES
(0, '', 'test', 'erere', 'dwedwe@ewefr.com', '', '', '', '0000-00-00', '', '', '', '', '', 0, 0, '2015-06-30 14:05:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `temporales`
--

CREATE TABLE IF NOT EXISTS `temporales` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `modulo` varchar(64) NOT NULL,
  `tipo` varchar(16) NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  `data_a` varchar(255) NOT NULL,
  `data_b` varchar(255) NOT NULL,
  `orden` int(3) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `perfil_id` int(5) unsigned NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` int(11) NOT NULL,
  `last_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) DEFAULT NULL,
  `recovery` tinyint(1) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `perfil_id` (`perfil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `perfil_id`, `username`, `password`, `nombre`, `apellido`, `email`, `last_login`, `last_ip`, `active`, `recovery`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin@koodstudio.com.ar', '$2y$10$9bQgkOTfzXzYivOn6aOL/.m570XKhjhQkGiqRVpFYx0XGPR/a9VqK', 'Administrador', 'Kood Studio', 'admin@koodstudio.com.ar', 1390317603, '127.0.0.1', 1, 0, 'gS1L2Yf8myqgm7NDGAGY8d85r7eCFnAmPRvjO1En5LS0W5hiyaKtf7KIjrnY', '2014-01-21 00:00:00', '2015-06-30 13:54:06'),
(2, 1, 'admin@p-per.com.ar', '$2y$10$1nwbHE.IkJomCT6ysNdK4uz9ZNJd.hPtVISf8cvJyVY2Y0iec1H3u', 'Admin', 'P-PPER', 'admin@p-per.com.ar', 0, '', NULL, 0, NULL, '2015-06-29 23:19:02', '2015-06-29 23:19:02');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
