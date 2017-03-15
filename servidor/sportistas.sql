-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-02-2017 a las 11:42:21
-- Versión del servidor: 5.7.17-0ubuntu0.16.04.1
-- Versión de PHP: 5.6.30-5+deb.sury.org~xenial+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sportistas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(1) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `metadatos` text NOT NULL,
  `analytics` text NOT NULL,
  `correo_nuevo_registro` varchar(255) NOT NULL,
  `correo_alertas` varchar(255) NOT NULL,
  `memo_test` int(1) NOT NULL,
  `que_fue` int(1) NOT NULL,
  `que_es` int(1) NOT NULL,
  `trivia` int(1) NOT NULL,
  `video_promo` varchar(255) NOT NULL,
  `video_buen_resultado` varchar(255) NOT NULL,
  `video_mal_resultado` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `titulo`, `descripcion`, `metadatos`, `analytics`, `correo_nuevo_registro`, `correo_alertas`, `memo_test`, `que_fue`, `que_es`, `trivia`, `video_promo`, `video_buen_resultado`, `video_mal_resultado`, `created_at`, `updated_at`) VALUES
(1, 'DirecTv - Sportistas', 'test', 'teest m', 'ana', 'test1@kood.com.ar', 'test2@kood.com.ar', 0, 0, 0, 1, '5eda28417f79ae6312ef3e2f31364f5c.mp4', 'cfacfc6f92d638f31073c650ce689037.mp4', '6fa60609ab1892c1c067f14cc7c67695.mp4', '2014-07-11 00:00:00', '2017-02-28 14:23:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `memotest`
--

CREATE TABLE `memotest` (
  `id` int(11) NOT NULL,
  `tema` varchar(255) NOT NULL,
  `img1` varchar(255) NOT NULL,
  `img2` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `memotest`
--

INSERT INTO `memotest` (`id`, `tema`, `img1`, `img2`, `created_at`, `updated_at`) VALUES
(1, 'jugadores editado', '', '', '2017-02-27 20:51:54', '2017-02-27 20:52:00'),
(2, 'tema2 mod', 'ef474b711f7a6d78a131883d0dddc351.png', 'fa705d371ff71c3bc58e5f068bdb7d00.png', '2017-02-27 21:15:24', '2017-02-27 21:25:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(5) UNSIGNED NOT NULL,
  `admin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `admin`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador', 'Tiene acceso total al sitio y todos sus sub-sitios, as', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 0, 'Standard', 'Usuarios standard del sistema', '2014-05-01 00:00:00', '2014-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quefue`
--

CREATE TABLE `quefue` (
  `id` int(11) NOT NULL,
  `tema` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `fue` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `quefue`
--

INSERT INTO `quefue` (`id`, `tema`, `video`, `fue`, `created_at`, `updated_at`) VALUES
(1, 'dwedewdwe', '4054601caaca032b7d1cf6bc3c9ad377.mp4', 1, '2017-02-28 00:00:41', '2017-02-28 12:46:09'),
(2, 'modi', '60337ac07a6473f9f8b99d475898516c.mp4', 1, '2017-02-28 00:08:22', '2017-02-28 12:47:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quienes`
--

CREATE TABLE `quienes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `res_1` varchar(255) NOT NULL,
  `res_2` varchar(255) NOT NULL,
  `res_3` varchar(255) NOT NULL,
  `res_4` varchar(255) NOT NULL,
  `correcta` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `quienes`
--

INSERT INTO `quienes` (`id`, `nombre`, `img`, `res_1`, `res_2`, `res_3`, `res_4`, `correcta`, `created_at`, `updated_at`) VALUES
(1, 'test mod', 'b0fdc6317a010b1ba45b779de9b0b76d.png', 'r1 m', 'r2', 'r3 mod', 'r4', 3, '2017-02-27 22:47:46', '2017-02-27 22:48:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `id` int(11) NOT NULL,
  `id_registro_device` int(11) DEFAULT NULL,
  `id_origen_device` int(11) DEFAULT NULL,
  `id_juego` int(1) NOT NULL,
  `tiempo` datetime NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `proveedor_cable` varchar(255) DEFAULT NULL,
  `proveedor_internet` varchar(255) DEFAULT NULL,
  `recibe_info` int(11) DEFAULT NULL,
  `created_at_device` datetime DEFAULT NULL,
  `updated_at_device` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporales`
--

CREATE TABLE `temporales` (
  `id` int(3) UNSIGNED NOT NULL,
  `modulo` varchar(64) NOT NULL,
  `tipo` varchar(16) NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `time` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `data_a` varchar(255) NOT NULL,
  `data_b` varchar(255) NOT NULL,
  `orden` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trivia`
--

CREATE TABLE `trivia` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `res_1` varchar(255) NOT NULL,
  `res_2` varchar(255) NOT NULL,
  `res_3` varchar(255) NOT NULL,
  `res_4` varchar(255) NOT NULL,
  `correcta` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `trivia`
--

INSERT INTO `trivia` (`id`, `pregunta`, `res_1`, `res_2`, `res_3`, `res_4`, `correcta`, `created_at`, `updated_at`) VALUES
(1, 'De que color es el sol a la tarde?', '', '', '', '', 0, '2017-02-26 00:06:15', '2017-02-26 00:08:16'),
(2, 'primer', '', '', '', '', 0, '2017-02-27 15:52:10', '2017-02-27 15:52:10'),
(4, 't2', 't1', '5y45y4', 't3', 't48888', 3, '2017-02-27 15:58:46', '2017-02-27 15:59:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `perfil_id` int(5) UNSIGNED NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` int(11) NOT NULL,
  `last_ip` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(1) DEFAULT NULL,
  `recovery` tinyint(1) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `perfil_id`, `username`, `password`, `nombre`, `apellido`, `email`, `last_login`, `last_ip`, `active`, `recovery`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin@koodstudio.com.ar', '$2y$10$9bQgkOTfzXzYivOn6aOL/.m570XKhjhQkGiqRVpFYx0XGPR/a9VqK', 'Administrador', 'Kood Studio', 'admin@koodstudio.com.ar', 1390317603, '127.0.0.1', 1, 0, 'tN7Ghw9en7CCgr4ceFQMGBuOg1hsbyC4Ugl4OdgyIoT1gi1iAzairla8PAQy', '2014-01-21 00:00:00', '2017-02-25 23:36:04'),
(2, 2, 'tesst@gll.com', '$2y$10$lZXSHwtuuMAee079odugTefLasXL.SMycb5kQhHo0GH.gR/EL8IqO', 'test', 'test', 'tesst@gll.com', 0, '', 2, 0, NULL, '2017-02-25 21:50:20', '2017-02-25 23:40:47'),
(3, 2, 'tesst@gll.com.ar', '$2y$10$lq7arMpV68EPYvxOd2ua8eraGjtbKAHnf.juV3IGSeS8uozNLwOQO', 'dos', 'dewdew', 'tesst@gll.com.ar', 0, '', 0, 0, NULL, '2017-02-25 23:41:18', '2017-02-25 23:41:27');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `memotest`
--
ALTER TABLE `memotest`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `quefue`
--
ALTER TABLE `quefue`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `quienes`
--
ALTER TABLE `quienes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `temporales`
--
ALTER TABLE `temporales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trivia`
--
ALTER TABLE `trivia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `perfil_id` (`perfil_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `memotest`
--
ALTER TABLE `memotest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `quefue`
--
ALTER TABLE `quefue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `quienes`
--
ALTER TABLE `quienes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `temporales`
--
ALTER TABLE `temporales`
  MODIFY `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `trivia`
--
ALTER TABLE `trivia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
