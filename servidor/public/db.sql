-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-07-2014 a las 16:36:44
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `kstudio0_gdi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `metadatos` text NOT NULL,
  `analytics` text NOT NULL,
  `contacto` varchar(168) NOT NULL,
  `contacto_copia` varchar(168) NOT NULL,
  `latitud` decimal(10,8) NOT NULL,
  `longitud` decimal(11,8) NOT NULL,
  `url_facebook` varchar(255) NOT NULL,
  `url_twitter` varchar(255) NOT NULL,
  `url_googleplus` varchar(255) NOT NULL,
  `url_linkedin` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `titulo`, `descripcion`, `metadatos`, `analytics`, `contacto`, `contacto_copia`, `latitud`, `longitud`, `url_facebook`, `url_twitter`, `url_googleplus`, `url_linkedin`, `created_at`, `updated_at`) VALUES
(1, 'testx', 'asdasdx', 'asdasdx', 'asdasd', 'asd@asd.com', 'asd@asd.com.ar', 1.00000000, 2.00000000, 'http://www.x.com.ar', 'http://www.x.com.ar', 'http://www.x.com.ar', 'http://www.x.com.ar', '2014-07-11 00:00:00', '2014-07-11 20:12:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas`
--

CREATE TABLE IF NOT EXISTS `fichas` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(32) NOT NULL,
  `imagen_principal` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `copete` text NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `ficha` text NOT NULL,
  `info` text NOT NULL,
  `web` varchar(255) NOT NULL,
  `blog` varchar(255) NOT NULL,
  `orden` int(2) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_fotos`
--

CREATE TABLE IF NOT EXISTS `ficha_fotos` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `ficha_id` int(5) unsigned NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `orden` int(3) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha_id` (`ficha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `correo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE IF NOT EXISTS `perfiles` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `admin`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador', 'Tiene acceso total al sitio y todos sus sub-sitios, así también al área de traducción de contenidos.', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 0, 'Standard', 'Usuarios standard del sistema', '2014-05-01 00:00:00', '2014-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolios`
--

CREATE TABLE IF NOT EXISTS `portfolios` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int(2) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `subtitulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `orden` int(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `portfolios`
--

INSERT INTO `portfolios` (`id`, `categoria_id`, `titulo`, `subtitulo`, `descripcion`, `orden`, `created_at`, `updated_at`) VALUES
(4, 1, 'xxx', 'xxx', 'xxx', 1, '2014-07-18 20:32:25', '2014-07-18 20:32:25'),
(5, 2, 'experience 1', 'experience 1', 'asdasdasd', 1, '2014-07-18 21:39:53', '2014-07-18 21:39:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolio_categorias`
--

CREATE TABLE IF NOT EXISTS `portfolio_categorias` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `portfolio_categorias`
--

INSERT INTO `portfolio_categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Entertaiment', '2014-07-14 00:00:00', '2014-07-14 00:00:00'),
(2, 'Experience', '2014-07-14 00:00:00', '2014-07-14 00:00:00'),
(3, 'Media', '2014-07-14 00:00:00', '2014-07-14 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolio_fotos`
--

CREATE TABLE IF NOT EXISTS `portfolio_fotos` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(5) unsigned NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `orden` int(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`,`portfolio_id`),
  KEY `portfolio_id` (`portfolio_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `portfolio_fotos`
--

INSERT INTO `portfolio_fotos` (`id`, `portfolio_id`, `fuente`, `orden`, `created_at`, `updated_at`) VALUES
(1, 5, '/storage/temporales/12043877ef1acddc9337e8a6b3600fa5d546fd3d.png', 0, '2014-07-18 21:39:53', '2014-07-18 21:39:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolio_tag`
--

CREATE TABLE IF NOT EXISTS `portfolio_tag` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(5) unsigned NOT NULL,
  `tag_id` int(3) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_id` (`portfolio_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `portfolio_tag`
--

INSERT INTO `portfolio_tag` (`id`, `portfolio_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(5, 4, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 4, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 5, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 5, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portfolio_videos`
--

CREATE TABLE IF NOT EXISTS `portfolio_videos` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `portfolio_id` int(5) unsigned NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `sitio` varchar(32) NOT NULL,
  `orden` int(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `portfolio_id` (`portfolio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(64) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'clientes', '2014-07-16 20:48:24', '2014-07-16 20:48:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slider_fotos`
--

CREATE TABLE IF NOT EXISTS `slider_fotos` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(5) unsigned NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `orden` int(5) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_id` (`slider_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `slider_fotos`
--

INSERT INTO `slider_fotos` (`id`, `slider_id`, `fuente`, `url`, `orden`, `created_at`, `updated_at`) VALUES
(1, 1, '/storage/temporales/df4d8dd5ebb21fc655b2793a76ebffa25e82691e.png', 'http://www.google.com/', 0, '2014-07-16 20:48:24', '2014-07-16 20:48:24'),
(2, 1, '/storage/temporales/58a20ddf48f8a94a741b2a072b92cef11f135573.png', 'http://www.google.com/', 0, '2014-07-16 20:48:24', '2014-07-16 20:48:24'),
(3, 1, '/storage/temporales/8ca84c836e553acff5cda237dd9ca7ecfa098c84.png', '', 0, '2014-07-16 20:48:24', '2014-07-16 20:48:24'),
(4, 1, '/storage/temporales/4b18e65d087ff1131cea86fa8fa92ec5c0772bdb.png', 'http://www.google.com/', 0, '2014-07-16 20:48:24', '2014-07-16 20:48:24'),
(5, 1, '/storage/temporales/3bb5ce24c12118c89532b519f9bfbbd6db40e827.png', 'http://www.google.com/', 0, '2014-07-16 20:48:24', '2014-07-16 20:48:24'),
(6, 1, '/storage/temporales/8c706eb6a24b66fbf03355e99d5f87d82df9dd0b.png', 'http://www.google.com/', 0, '2014-07-16 20:48:24', '2014-07-16 20:48:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(2, 'Art', '2014-07-18 12:30:12', '2014-07-18 12:30:12'),
(3, 'Photography', '2014-07-18 12:30:24', '2014-07-18 12:30:24'),
(4, 'Video', '2014-07-18 12:30:32', '2014-07-18 12:30:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporales`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `perfil_id`, `username`, `password`, `nombre`, `apellido`, `email`, `last_login`, `last_ip`, `active`, `recovery`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '$2y$10$9bQgkOTfzXzYivOn6aOL/.m570XKhjhQkGiqRVpFYx0XGPR/a9VqK', 'Administrador', 'Kood Studio', 'admin@koodstudio.com.ar', 1390317603, '127.0.0.1', 1, 0, 'elTCTQJ6MMf11Ag0xVCAZnqzi7SJ4whezE6cwfAiuGZlccfzbOFFVxFGVUvi', '2014-01-21 00:00:00', '2014-07-16 20:23:58');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ficha_fotos`
--
ALTER TABLE `ficha_fotos`
  ADD CONSTRAINT `ficha_fotos_ibfk_1` FOREIGN KEY (`ficha_id`) REFERENCES `fichas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `portfolio_categorias` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `portfolio_fotos`
--
ALTER TABLE `portfolio_fotos`
  ADD CONSTRAINT `portfolio_fotos_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `portfolio_tag`
--
ALTER TABLE `portfolio_tag`
  ADD CONSTRAINT `portfolio_tag_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `portfolio_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `portfolio_videos`
--
ALTER TABLE `portfolio_videos`
  ADD CONSTRAINT `portfolio_videos_ibfk_1` FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `slider_fotos`
--
ALTER TABLE `slider_fotos`
  ADD CONSTRAINT `slider_fotos_ibfk_1` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
