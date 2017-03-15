-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-08-2014 a las 15:07:02
-- Versión del servidor: 5.5.36
-- Versión de PHP: 5.4.25

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `kstudio0_gdi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_tag`
--

CREATE TABLE IF NOT EXISTS `categoria_tag` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int(2) unsigned NOT NULL,
  `tag_id` int(3) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `categoria_tag`
--

INSERT INTO `categoria_tag` (`id`, `categoria_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 4, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 2, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 3, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 3, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `video` varchar(255) NOT NULL,
  `metadatos` text NOT NULL,
  `analytics` text NOT NULL,
  `telefono` varchar(32) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `titulo`, `descripcion`, `video`, `metadatos`, `analytics`, `telefono`, `contacto`, `contacto_copia`, `latitud`, `longitud`, `url_facebook`, `url_twitter`, `url_googleplus`, `url_linkedin`, `created_at`, `updated_at`) VALUES
(1, 'GDI :: Generación de Ideas', 'GDI Generacion de ideas', 'yeC3AisTs2Y', '', '', '(+54) 11-5199-8315', 'nfo@generaciondeideas.com.ar', '', -34.59733220, -58.37284460, 'http://www.facebook.com/pages/GDI-Generaci%C3%B3n-de-Ideas/134468673244511?ref=hl', 'https://twitter.com/GDIcontenidos', '', 'http://www.linkedin.com/company/generacion-de-ideas', '2014-07-11 00:00:00', '2014-07-30 15:55:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichas`
--

CREATE TABLE IF NOT EXISTS `fichas` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `categoria_id` int(2) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente` varchar(255) NOT NULL,
  `imagen_principal` varchar(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `copete` text NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `presentacion` varchar(255) DEFAULT NULL,
  `ficha` text NOT NULL,
  `info` text NOT NULL,
  `web` varchar(255) NOT NULL,
  `blog` varchar(255) NOT NULL,
  `destacada` tinyint(1) NOT NULL DEFAULT '0',
  `orden_home` int(3) unsigned NOT NULL DEFAULT '0',
  `orden_interior` int(3) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Volcado de datos para la tabla `fichas`
--

INSERT INTO `fichas` (`id`, `categoria_id`, `fecha`, `cliente`, `imagen_principal`, `titulo`, `copete`, `banner`, `presentacion`, `ficha`, `info`, `web`, `blog`, `destacada`, `orden_home`, `orden_interior`, `created_at`, `updated_at`) VALUES
(3, 2, '0000-00-00 00:00:00', '', 'caso_santander.jpg', 'SANTANDER RIO', 'Por tercer año consecutivo desarrollamos una plataforma de shows con beneficios exclusivos', 'santander900x123_1.jpg', '', 'La activación diseñada incluye preventa exclusiva, descuentos y cuotas en la compra de tickets y canje premios Superclub. La plataforma 2012 comenzó con Mayumaná, Ivete Sangalo;Chayanne y Marc Anthony; continúa con Joss Stone, Radio Disney Vivo, Serrat y Sabina, entre otros.', '', '', '', 0, 103, 103, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(4, 3, '0000-00-00 00:00:00', '', 'BRUNCH173X150.jpg', 'BRUNCH', 'El desayuno almuerzo del domingo. Nicolás Artusi y Ernesto Martelli.', 'brunch900x123.jpg', 'PRESENTACION_BRUNCH.pdf', '<p>Ni desayuno, ni almuerzo, Brunch, la mejor combinaci&oacute;n de los dos. Actualidad de alta producci&oacute;n period&iacute;stica. Informaci&oacute;n sobre h&aacute;bitos, consumo y novedades de la cultura pop. Brunch, el desayuno almuerzo del domingo. Conducen Nicol&aacute;s Artusi y Ernesto Martelli.</p>', '<p>Conducen: Nicolas Artusi y Ernesto Martelli Domingos 11 a 13 hs., Metro 95.1 Powered by GDI</p>', 'http://www.metro951.com/', 'http://brunch.metro951.com/', 0, 2, 2, '2014-07-22 17:16:25', '2014-08-28 16:05:06'),
(5, 1, '0000-00-00 00:00:00', '', 'FB173x150.jpg', 'FUERZA BRUTA WAYRA TOUR 2012', 'Fuerza Bruta redimensiona su espectáculo y recorre Argentina con un show infartante.', 'fb900x123.jpg', 'PRESENTACION_FUERZA_BRUTA.pdf', 'Después de la exitosa temporada Buenos Aires 2011 presentándose por primera vez en el Luna Park, con un nuevo espectáculo de estadio (12 funciones sold out). Fuerza Bruta recorre el interior de nuestro pais. Mayo y junio estuvimos en Rosario y Córdoba con entradas agotadas.', 'Fuerza Bruta Wayra Tour 2012 Próximas presentaciones: Neuquén, Estadio Ruca Che, del 25 al 28 de Octubre. Mendoza, Estadio Arena Maipú, del 1ro. al 8 de Noviembre y Mar del Plata, Polideportivo del 13 al 18 de Noviembre.', '', '', 0, 76, 76, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(6, 1, '0000-00-00 00:00:00', '', 'disney173x150.jpg', 'LA CASA DE DISNEY JUNIOR CON TOPA Y MUNI', 'Hasta el 20 de agosto,con nuevo espectáculo y una invitada muy especial: Clarilu', 'disney1900x123.jpg', '', 'En la temporada anterior,el público de todo el pais lo convirtió en el show infantil más visto del 2011. Desde el 23 de Junio y hasta el 20 de Agosto, en el teatro El Nacional. En vacaciones de invierno funciones de martes a domingos.', 'Por segundo año consecutivo, se consagró como el show infantil mas visto.', '', '', 0, 90, 90, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(7, 1, '0000-00-00 00:00:00', '', 'chayanne173x150.jpg', 'CHAYANNE Y MARC ANTHONY', 'Los embajadores más glamorosos de la música latina, juntos por primera vez en Argentina.', 'chayanne900x123_copia.jpg', 'PRESENTACION_GIGANTES.pdf', 'Los embajadores más glamorosos de la música latina, juntos por primera vez en Argentina en un show sin precedentes. Un espectáculo imperdible, donde interpretarán sus mayores éxitos y se los podrá ver realizando un dueto muy especial.', 'GIGANTES 20 de Octubre, Estadio Velez Sarsfield. Buenos Aires.', '', '', 0, 78, 78, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(10, 1, '0000-00-00 00:00:00', '', 'ivete_173X150.jpg', 'IVETE SANGALO', 'La número uno de Brasil, se presentó por primera vez en nuestro país con entradas agotadas', 'ivete_900x123.jpg', 'ivete_800X533_1.jpg', 'Luego de sus mega presentaciones en el Estadio Maracaná, en el Madison Square Garden y en el Rock in Rio de Lisboa, la artista número uno de Brasil que triunfa en todo el mundo llegó por primera vez a nuestro país a un único concierto con entradas agotadas.', 'Con un estadio sold out. Mas de 7.500 personas se reunieron el pasado 10 de Agosto,en el Estadio Luna Park.', '', '', 0, 80, 80, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(11, 2, '0000-00-00 00:00:00', '', 'activacionesclunpersonal152x175.jpg', 'PERSONAL', 'Club Personal acompaña la Gira Nacional de Fuerza Bruta.', 'personal_fuerza_bruta_900x123.jpg', '', 'Se desarrollaron herramientas de fidelización a través de un paquete de beneficios exclusivos donde los clientes de Club Personal obtienen descuentos en la compra de tickets, participación en sorteos de entradas y merchandising y un espacio de recepción previo al show.', 'Club Personal acompaña la Gira Nacional de Fuerza Bruta con su Wayra Tour por las ciudades de Rosario, Córdoba, Neuquén, Mendoza y Mar del Plata.', '', '', 0, 102, 102, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(12, 3, '0000-00-00 00:00:00', '', 'logo_crm.jpg', 'COMO ROBAR EL MUNDO', 'Un programa de historias pop. Sebastián de Caro, Sábados de 10 a 13 hs., Metro 95.1', 'Comorobarelmundo900x123.jpg', 'COMO_ROBAR_EL_MUNDO_PRESENTACION.pdf', '<p>Un programa de historias pop. Un personaje, una historia, pel&iacute;cula, o an&eacute;cdota destacada son ejes que solo De Caro puede conectar a trav&eacute;s de su mundo. La m&uacute;sica, los oyentes, el invitado, navegan por un mar de historias Pop. Adem&aacute;s actualidad, deportes, tecnolog&iacute;a, cine y muchos otros temas.</p>', '<p>Conducci&oacute;n: Sebastian de Caro. Coconducci&oacute;n: Diego Fernandez S&aacute;bados 10 a 13 hs. Fm Metro 95.1 Powered by GDI</p>', 'www,metro951.com', 'http://comorobarelmundo.metro951.com/', 0, 5, 5, '2014-07-22 17:16:25', '2014-08-28 16:04:52'),
(13, 2, '0000-00-00 00:00:00', '', 'fbgillette_152x175.jpg', 'GILLETTE', 'Generamos una impactante activación para la marca bajo el concepto ?levanta los brazos?. ', 'fbgillette_900x123.jpg', '', '<p>El p&uacute;blico que asisti&oacute; a las funciones de Fuerza Bruta Wayra Tour, en el Luna Park fue gratamente sorprendido por esta ? brand experience? cuyo objetivo fue el de vincularse con el target, transmitiendo los atributos y conceptos del producto desde el coraz&oacute;n mismo del evento.</p>', '<p>M&aacute;s de 60.000 personas que asistieron a las 12 presentaciones de Fuerza Bruta Wayra Tour en el Luna Park durante junio del 2011, fueron sorprendidas con esta brand experience.</p>', '', '', 0, 107, 107, '2014-07-22 17:16:25', '2014-08-28 16:00:13'),
(14, 3, '0000-00-00 00:00:00', '', 'LAFLIADT173X150.jpg', 'LA FAMILIA DEL DT', 'Desde Agosto durante las 24hs por Fox Sports', 'LAFLIADT1900X123.jpg', 'PRESENTACION_LA_FAMILIA_DEL_DT.pdf', '<p>El cartoon que cuenta las aventuras de los particulares habitantes de una ciudad, donde todo gira alrededor del futbol. Una comedia animada donde 2 personajes antag&oacute;nicos mantienen una relaci&oacute;n muy tirante aunque los une la misma pasi&oacute;n por el futbol.</p>', '<p>Desde Julio durante las 24 hs, a trav&eacute;s de la pantalla de Fox Sport</p>', 'http://www.youtube.com/user/LaFamiliaDelDT', '', 0, 7, 7, '2014-07-22 17:16:25', '2014-08-28 16:03:58'),
(15, 3, '0000-00-00 00:00:00', '', 'latin173x150.jpg', 'LATINSPOTS', 'La plataforma de actualización en creatividad, publicidad, comunicación y marketing.', 'Latinspots__900X123.jpg', 'PRESENTACION_LATINSPOTS.pdf', '<p>La plataforma de actualizaci&oacute;n en creatividad, publicidad, comunicaci&oacute;n y marketing m&aacute;s importante de Iberoam&eacute;rica. Fuente de informaci&oacute;n y herramienta de trabajo para los profesionales de la industria publicitaria en todos sus formatos. Revista + Site + El Ojo de Iberoam&eacute;rica + El Ojo News.</p>', '<p>El pasado 14,15,16 de Noviembre; se realizo la XV Edici&oacute;n del Festival el Ojo de Iberoam&eacute;rica que reuni&oacute; a los m&aacute;s brillantes pensadores, creativos y referentes de la publicidad, el marketing y las comunicaciones.</p>', 'http://www.latinspots.com/site/sp', '', 0, 6, 6, '2014-07-22 17:16:25', '2014-08-28 16:03:50'),
(16, 3, '0000-00-00 00:00:00', '', 'notio153x170.jpg', 'NOTIO', 'Periodismo de patas largas. El portal de noticias que se caracteriza por su independencia ', 'notio900x123.jpg', 'PRESENTACION_NOTIO.pdf', 'Periodismo de patas largas. El portal de noticias que se caracteriza por su independencia ideológica y federalismo. La más completa información del día desplegada en secciones: política, economía, sociedad, ecología, agro, deportes, cultura, turismo, tecnología. Etc. ', 'Visitas: 3.483.628 Usuarios Unicos: 2.974.952 Páginas Vistas	19.714.011 Fuente: Comscore', '', '', 0, 8, 8, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(18, 3, '0000-00-00 00:00:00', '', '8990_173x150_jpg.jpg', 'FM 89.90', 'Una nueva propuesta para acompañar a una ciudad que no se detiene. FM89.90 The radio City.', '8990_900x123.jpg', 'PRESENTACION_FM_8990.pdf', '<p>La personalidad de la radio est&aacute; marcada por su estilo musical que abarca desde el Pop al Rock Internacional de principios de los 90&acute;s a la actualidad y por quienes representan su voz.Ivan de Pineda en el Prime Time, con su Coffe Break acompa&ntilde;ado por Paula Varela y Rama Pantorotto.</p>', '<p>Pensada para oyentes de 25 a 45 a&ntilde;os que disfrutan de la buena m&uacute;sica.</p>', 'http://www.fm8990.com.ar/', '', 0, 4, 4, '2014-07-22 17:16:25', '2014-08-28 16:04:27'),
(19, 3, '0000-00-00 00:00:00', '', 'og173x150.jpg', 'OBSERVADOR GLOBAL', 'Noticias internacionales para el mundo de habla hispana.', 'og900x123.jpg', 'PRESENTACION_OBSERVADOR_GLOBAL.pdf', 'Una mirada del mundo para comprenderlo. Reconocer lo importante, para entender lo urgente. Información detallada del acontecer global. Noticias internacionales para el mundo de habla hispana.', 'Visitas 3.526.803 Usuarios Unicos 3.009.568 Páginas Vistas 18.415.126	Fuente: Comscore', '', '', 0, 9, 9, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(20, 3, '0000-00-00 00:00:00', '', 'viajeroglobalprev.jpg', 'VIAJERO GLOBAL', 'El portal de la comunidad de viajes y turismo, a un click de distancia. ', 'vg900x123.jpg', 'PRESENTACION_VIAJERO_GLOBAL.pdf', 'Ya no hay destinos inalcanzables, el mundo está lleno de posibilidades y Viajero Global te los acerca. Un referente indispensable a la hora de planificar un viaje. Grandes ciudades, destinos tradicionales, exóticos, viajes para todos los gustos.', 'Visitas 3.317.834 Usuarios Unicos 2.835.799 Páginas vistas 11.809.511 Fuente: Comscore', '', '', 0, 10, 10, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(21, 2, '0000-00-00 00:00:00', '', 'IVETAP.jpg', 'ALTO PALERMO JUNTO A IVETE SANGALO', 'Desarrollamos una importante activación bajo el claim ?Música para apasionarse".', 'ap900x123.jpg', 'CASO_ALTO_PALERMO.pdf', 'Desarrollamos una importante activación bajo el claim ?Música para Apasionarse?, a través de las redes sociales, las consumidoras podían participan por Tickets Vip para asistir al show, o ganar pases de acceso exclusivo a la conferencia de prensa o participar para acceder a un Meet&Greet exclusivo.', 'Alto Palermo, Ivete Sangalo, Agosto 2012', '', '', 0, 101, 101, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(22, 1, '0000-00-00 00:00:00', '', 'radiodisney173x150.jpg', 'RADIO DISNEY VIVO', 'Uno de los shows musicales en vivo más importantes de Latinoamérica, vuelve a Buenos Aires', 'radiodisney900x123_copia.jpg', 'Presentacion_Radio_Disney_Vivo.pdf', 'La emoción, calidez, cercanía y credibilidad del entretenimiento y diversión que Radio Disney ofrece día a día a sus oyentes de Latinoamérica. Una nueva propuesta que permitirá a la audiencia disfrutar de la música y de su artistas preferidos, más cerca que nunca.', 'VIOLETTA, MIRANDA, JESSE&JOY, CHINO Y NACHO. RADIO DISNEY VIVO, 9 de Noviembre, Estadio Luna Park, Buenos Aires.', '', '', 0, 77, 77, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(23, 1, '0000-00-00 00:00:00', '', 'axel173x150.jpg', 'AXEL - UN NUEVO SOL ', 'Espectacular cierre del Tour con un show único en el estadio Velez en Buenos Aires.', 'axel1900x123.jpg', 'PRESENTACION_AXEL.pdf', 'Luego de recorrer el país y Latinoamérica, Un Nuevo Sol Tour culminará en un show en el Estadio de Vélez Sarsfield coronando así un año de exitosas presentaciones.', 'AXEL,UN NUEVO SOL TOUR 8 de Diciembre Estadio Velez Sarfierd Buenos Aires', '', '', 0, 74, 74, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(24, 1, '0000-00-00 00:00:00', '', 'cher1173x150.jpg', 'MUJERES QUE INSPIRAN', 'Mujeres reales con una visión transformadora y una ambición reparadora.', 'cher900x123.jpg', 'PRESENTACION_MARIA_CHER.pdf', 'Dirigido hacia mujeres emprendedoras, que buscan inspiración en liderazgos femeninos. Cuatro disertantes, cada una trabaja sobre una temática diferente; teniendo un objetivo común: trabajar para mejorar la calidad de vida de otras mujeres, sus hijos y la sociedad.', 'MARIA CHER. MUJERES QUE INSPIRAN 10 de Octubre. Sheraton Hotel, Buenos Aires.', 'www.mujeresqueinspiran.com.ar', '', 0, 79, 79, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(25, 1, '0000-00-00 00:00:00', '', 'archivo_12.jpg', 'SHOWS ANTERIORES', 'Mirá todo lo que hicimos.', '', '', '', '', '', '', 0, 72, 72, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(28, 1, '0000-00-00 00:00:00', '', 'jstone173x150.jpg', 'JOSS STONE', 'Una de las voces del Soul más destacada de los últimos años, vuelve a Argentina.', 'jstone900x123.jpg', 'PRESENTACION_JOSS_STONE.pdf', 'Joss Stone, regresa a nuestro país con ?The Soul Sessions: World Tour 2012? para presentar su nuevo disco. La inglesa volverá a reunirse con su público para presentar sus nuevas canciones y lo mejor de su repertorio.', 'Única presentación, 22 de Noviembre, Estadio Luna Park.', '', '', 0, 75, 75, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(29, 1, '0000-00-00 00:00:00', '', 'joecocker175x150.jpg', 'JOE COCKER', 'Vuelve el legendario del rock para presentar sus grandes clásicos.  ', 'joecocker900x123.jpg', '', 'Consagrado mundialmente como una de las mejores voces de todas las épocas, el interprete, lleva mas de 40 años en la musica, habiendo editado 21 álbumes de estudio y 4 en vivo.  ', 'Unica Presentación, 19 de marzo, Estadio Luna Park.', '', '', 0, 96, 96, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(30, 1, '0000-00-00 00:00:00', '', 'mute_173x150.jpg', 'MUTE CLUB DE MAR', 'Un parador boutique, que invita a disfrutar la mejor experiencia de playa.', 'mute900x123.jpg', 'Mute_Temporada_2013.pdf', 'Gran superficie de playa. Gastronomia de nivel internacional. Dos piscinas exclusivas, bares de playa, estacionamiento privado, bajada 4x4 y nautica, shows en vivo, fiestas nocturnas, zona wifi, cabina de dj. Todo lo que necesitas está en Mute.', 'Mute Club de Mar. La primera playa al sur del faro. Ruta 11, paraje alfar, Mar del Plata.', '', '', 0, 71, 71, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(33, 1, '0000-00-00 00:00:00', '', 'SS173X150.jpg', 'SERRAT&SABINA', 'Ultima oportunidad de verlos juntos. Serrat y Sabina cierran su gira mundial en Argentina.', 'SS900X123.jpg', 'PRESENTACION_SERRATSABINA.pdf', 'Después del tour "Dos pájaros de un tiro" de 2007, editaron el disco La orquesta del "Titanic". Los músicos llevan hasta hoy 200 shows, vendieron más de 200 mil discos de esa producción y el recital fue presenciado por casi medio millón de personas en Uruguay, Chile, Paraguay y Argentina.', 'Gira Nacional MENDOZA, 11/12, Estadio Mundialista. MAR DEL PLATA, 13/12, Estadio Polideportivo. BUENOS AIRES, 15/12, Estadio Boca Juniors.', '', '', 0, 73, 73, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(34, 1, '0000-00-00 00:00:00', '', 'umf173x150.jpg', 'ULTRA 2013', 'Llega la segunda edición del Festival mas importante del mundo. UMF Buenos Aires.', 'umf900x123_copia.jpg', 'PRESENTACION_ULTRA_BUENOS_AIRES_2013.pdf', 'La edición 2013 se realizará en dos fechas. Avicii,Tiesto, Hardwell,Armin Van Buuren,Carl Kox,Skrillex, son algunos de djs. que se harán presentes en esta segunda edición.', 'UMF BUENOS AIRES, Costanera Sur, Puerto Madero. 19 y 23 de Febrero.', 'http://ultrabuenosaires.com/', '', 0, 70, 70, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(36, 1, '0000-00-00 00:00:00', '', 'Crosby_PREVIEW_ENTRETENIMIENTO_173X150_copia.jpg', 'CROSBY STILL & NASH', 'Este importantísimo grupo de Folk, marco un antes y un después en este género. ', 'CROSBY_BANNER_900x123_copia.jpg', '', 'Inventores de un estilo musical basado en una perfecta sincronización vocal, estilizados y armónicos. Contundentes acordes y melodías con guitarras acústicas. Algunas de sus canciones más importantes son "Suite: Judy blue eyes", "Our house", "Teach your children" y "Deja vú". ', 'Crosby, Still & Nash. 6 de Mayo en el Estadio Luna Park. Buenos Aires', '', '', 0, 91, 91, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(37, 1, '0000-00-00 00:00:00', '', 'Umf_PREVIEW_ENT_copia.jpg', 'UMF PRIMERA EDICION', 'Llega por primera vez a Bs. As. ULTRA MUSIC FESTIVAL. El Festival mas importante del mundo', 'Umf_BANNER_900X123_copia.jpg', '', 'Tres escenarios en simultáneo, una puesta de luces y pantallas de alta tecnología sumado a un importante line up, con Justice, John Digweed, Popof y Len Faki entre otros.', '5 de Mayo, Costanera Sur, Puerto Madero', '', '', 0, 92, 92, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(38, 1, '0000-00-00 00:00:00', '', 'Paul_PREVIEW_ENTRE_copia.jpg', 'PAUL McCARTNEY', 'Paul McCartney completa su gira, on presentaciones en Uruguay, Paraguay y Colombia.', 'Paul_Mc_BANNER_900X123_copia.jpg', '', 'Su gira ON THE RUN en la cual se incluyeron a Uruguay, Paraguay y Colombia, incluyó sus hits "Hey Jude?, ?Yesterday?, ?Fine Line? ?Blackbird? y ?Let it Be? que hicieron emocionar a todo el público.', 'Su gira ON THE RUN incluyó Montevideo-Uruguay (15 de Abril), Asunción-Paraguay (17 de Abril) y Bogotá-Colombia (19 de Abril) ', '', '', 0, 93, 93, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(39, 1, '0000-00-00 00:00:00', '', 'Mayumana_PREVIEW_ENTR_copia_copia.jpg', 'MAYUMANA', 'Mayumana presento su nuevo espectáculo MOMENTUM en Buenos Aires.', 'MAYUMANA_Bannner_900x123_prinicpio_copia.jpg', '', 'Dos años después de su último show, Mayumana presentó un nuevo espectáculo basado nuevamente en esa mezcla de movimiento y tecnología. En la percepción del tiempo y su sincronización, integrando nuevos elementos artísticos con una combinación de ritmo, energía y humor.', 'Teatro Gran Rex. Del 20 al 22 de Abril. 5 Funciones Sold Out.', '', '', 0, 94, 94, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(40, 1, '0000-00-00 00:00:00', '', 'Bunbury_PREVIEW_ENTRETENIMIENTO_173X150_copia.jpg', 'ENRIQUE BUNBURY', 'El regreso del ex lider de HEROES DEL SILECIO presentando ?Licenciado Cantinas"', 'Bunbury_BANNER_900x123_copia.jpg', '', 'Enrique Bunbury regreso a Argentina para presentar su octavo disco en una gira por Buenos Aires y Córdoba, que espera ansiosa su llegada.', 'Presentaciones: 2 de Marzo, Orfeo Superdomo (Córdoba) y 3 de Marzo. Estadio Ferrocarril Oeste (Buenos Aires).', '', '', 0, 97, 97, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(41, 2, '0000-00-00 00:00:00', '', 'aa2000_prev.jpg', 'AEROPUERTOS ARGENTINA 2000', 'Desarrollamos una importante plataforma de shows para Aeropuertos Argentina 2000.', 'aa2000_900x123.jpg', '', 'La activación diseñada para Aeropuertos incluye tickets para invitados, además de la presencia de los artistas en el Vip del Aeropuerto. La plataforma diseñada incluye entre otros los shows de Joe Cocker, Mayumana, Fuerza Bruta, Juanes, Chayanne y Marc Anthony, Joss Stone, entre otros.', '', '', '', 0, 104, 104, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(42, 2, '0000-00-00 00:00:00', '', 'creamprev.jpg', 'FORD KINETIC DESIGN', 'Activamos en Creamfields 2010 el lanzamiento del nuevo Ford Fiesta Kinetic Design.', 'cream900x123.jpg', '', 'Implementamos la presencia del nuevo Ford Fiesta a través de distintas estaciones de exhibición, donde el público pudo conocer las prestaciones y características del nuevo modelo. La marca contó con un espacio vip exclusivo, donde distintos invitados pudieron conocer más de cerca el nuevo auto. ', 'Al evento asistieron 50 mil personas y contó con la actuación de los referentes del movimiento electrónico: David Guetta, Fatboy Slim, Faithless, Carl Cox, Paul Van Dyk y Hernán Cattaneo, entre otros. ', '', '', 0, 109, 109, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(43, 2, '0000-00-00 00:00:00', '', 'speedy_prev.jpg', 'CLUB SPEEDY', 'Club Speedy en La Casa de Disney Junior en el Teatro, Chayanne y Stone Temple Pilots.', 'speedy900x123.jpg', '', 'Club Speedy, Sponsor Invitador de la Gira de La Casa de Disney Junior con Topa y Muni. También es invitador en los shows de Chayanne y Stone Temple Pilots en el Luna Park. En los 3 contenidos se desarrolló una acción promocional con los clientes que se registraron en la web.', 'La Casa de Disney recorrió más de 20 localidades y fue visto por más de 35 mil personas. Chayanne alcanzo una asistencia de más de 25 mil personas, mientras que Stone Temple Pilots agotó una fecha en el Luna Park.', '', '', 0, 105, 105, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(44, 3, '0000-00-00 00:00:00', '', 'aguante173x150.jpg', 'EL AGUANTE ', 'Una mirada diferente del futbol y del mundo del rock. La mirada de los hinchas, por R&P.', 'aguante900x123.jpg', '', '<p>Mart&iacute;n Souto y Pablo Gonzalez; recuperan para los hinchas de fulbol un espacio perdido. Con la participaci&oacute;n de m&uacute;sicos, futbolistas, famosos y obviamente hinchas an&oacute;nimos.</p>', '<p>Durante 2011, El Aguante, estuvo en Rock&amp;Pop, todos los s&aacute;bados de 11 a 13 hs.</p>', '', '', 0, 11, 11, '2014-07-22 17:16:25', '2014-08-28 16:04:37'),
(46, 3, '0000-00-00 00:00:00', '', 'alo173x150.jpg', 'ABRI LOS OJOS', 'Un espacio para tener otra mirada. El programa marcario de Infinit producido por GDI.', 'alo900x123.jpg', '', '<p>Abr&iacute; los ojos, una invitaci&oacute;n a despertar a los hechos y situaciones cotidianas, que est&aacute;n all&iacute;, latentes de ser descubiertos o esperando ser vividos. Un llamado a reflexionar y disfrutar, a no quedarnos quietos, participar y evolucionar en nuestras experiencias. Otra mirada de la vida.</p>', '<p>Un programa conducido por Diego Scott, junto a Dalia Gutmann y Pablo F&aacute;bregas; los s&aacute;bados de 10 a 13 hs. por Metro 95.1</p>', '', '', 1, 12, 12, '2014-07-22 17:16:25', '2014-08-28 15:37:53'),
(47, 2, '0000-00-00 00:00:00', '', 'elojovw152x175.jpg', 'VW JUNTO AL OJO DE IBEROAMERICA', 'Desarrollamos para VW una activación en el XV Festival El Ojo de Iberoamérica.', 'elojovw900x123.jpg', 'EL_OJO_2012_VW_CLIPPING.pdf', 'La acción estuvo vinculada a el auspicio del premio El Ojo Innovador que se complementó con presencia de la marca en el programa de conferencias, en el Ojo News, los sites de Latinspots y el Ojo de Iberoamérica, entre otros beneficios.', 'XV Festival el Ojo de Iberoamérica se desarrolló entre el 14/15/16 de Noviembre 2012. en el Hilton Bs.As y convocó a más de 4.000 referentes de la industria. ', 'www.elojodeiberoamerica.com', '', 0, 100, 100, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(48, 2, '0000-00-00 00:00:00', '', 'elojopersonal152x175.jpg', 'PERSONAL EN EL OJO DE IBEROAMERICA', 'Realizamos para Personal una importante activación cuyo eje fue el nuevo premio Ojo Mobile', 'elojopersonal900x123.jpg', '', 'El Ojo Mobile es la nueva categoría de premios que estuvo auspiciada por Personal. Durante la ceremonia, representantes de la marca hicieron entrega de este premio. La acción de la marca incluyó además de la presencia en el festival, presencia en la web y en el programa del festival.', 'La XV edición del Ojo de Iberoamérica se realizó en el Hilton Buenos Aires durante el 14, 15 y 16 de Noviembre, contando con la asistencia de más de 4.000 personas vinculadas a la industria.', 'www.elojodeiberoamerica.com', '', 0, 99, 99, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(49, 2, '0000-00-00 00:00:00', '', 'apjs152x175.jpg', 'ALTO PALERMO JUNTO A JOSS STONE', 'Seguimos activando para Alto Palermo el concepto "Música para apasionarse".', 'ap900x1232.jpg', '', 'La acción incluía un concurso de tickets y pases al meet&greet que se activaron a través de las redes sociales. Además se incluyó una acción de prensa con celebrities que disfrutaron de este increible show, invitados por la marca.', 'Joss Stone se presentó en el Luna Park el 20 y 22 de Noviembre 2012.', '', '', 0, 98, 98, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(50, 1, '0000-00-00 00:00:00', '', 'stp173x150.jpg', 'STONE TEMPLE PILOT', 'La banda liderada por Scott Weiland, regresó a Buenos Aires presentando su último disco.', 'stp900x123.jpg', '', 'El estandarte del grunge volvió a encender la adrenalina del rock con sus mas grandes éxitos. Energía transformada para una banda que tomo el lado más rockero del grunge y lo hizo un estilo propio. ', 'Stone Temple Pilot, con entradas agotadas, el 16 de Noviembre, de 2011. Estadio Luna Park.', 'www.stonetemplepilots.com', '', 0, 99, 99, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(51, 1, '0000-00-00 00:00:00', '', 'bs173x150.jpg', 'BELLE&SEBASTIAN', 'Por primera vez, Belle & Sebastian, la banda oriunda de Glasgow piso suelo argentino.', 'bs900x123.jpg', '', 'Presentaron su recientemente editado octavo material de estudio, Write About Love y además, repasaron su carrera, tocando alguno de sus temas más rememorados.', 'Belle & Sebastian, Estadio Luna Park. 15 de Noviembre, 2011', 'www.belleandsebastian.com', '', 0, 100, 100, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(52, 1, '0000-00-00 00:00:00', '', 'sade173x150.jpg', 'SADE', 'La cantante nigeriana-británica se presentó por primera vez en nuestro país.', 'sade900x123.jpg', '', 'La banda que en la década de los 80 fue muy reconocida, llegó por primera vez a Buenos Aires, en el marco de una gira sudamericana. Sade volvió a los escenarios y llegó a Argentina para presentar su último trabajo ?', 'Sade en Argentina, 15 de Octubre de 2011 en el PREDIO VICENTE LÓPEZ AL RIO.', 'www.sade.com', '', 0, 101, 101, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(53, 1, '0000-00-00 00:00:00', '', 'Chayu_173x150.jpg', 'CHAYANNE', 'Continuando con su exitosa gira No hay imposible, Chayanne deslumbró a su público.', 'Chayu_900x123.jpg', '', 'Chayanne demostró una vez más que tiene el encanto y la simpatía de siempre. Cantó y bailó dejando a sus fans más que satisfechas. Hizo vibrar un estadio que sin dudas lo disfruto a pleno. ', 'Con 5 funciones agotadas, se presentó el 20, 21, 23, 24 y 25 de Septiembre, de 2011, en el Estadio Luna Park.', 'www.chayanne.com', '', 0, 102, 102, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(54, 1, '0000-00-00 00:00:00', '', 'archivo_11.jpg', '', 'Mira todo lo que hicimos', '', '', '', '', '', '', 0, 98, 98, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(55, 1, '0000-00-00 00:00:00', '', 'LimpBizkit_173x150_copia.jpg', 'LIMP BIZKIT', 'Por primera vez Se presento en el Malvinas Argentinas la banda pionera de Rap Metal.', 'limp900x123.jpg', '', '15 años después de su creación Limp Bizkit se presentó en Argentina con su último disco ?Gold Cobra?. Con un show alucinante, esta banda de Florida, terminó el show de la misma forma que lo empezó, con mucha fuerza.', '1 de Agosto de 2011. Estadio Cubierto Malvinas Argentinas.', '', '', 0, 103, 103, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(56, 1, '0000-00-00 00:00:00', '', 'wayra_tour_173x150.jpg', 'FUERZA BRUTA WAYRA TOUR', 'Estreno mundial de "Wayra Tour", el nuevo espectáculo de Fuerza Bruta.', 'wayra_tour_900x123.jpg', '', 'Un nuevo espectáculo, un show que va directo al cuerpo, a todos tus sentidos, donde sos protagonista. Las luces, la escenografía, la tecnología, la música y los efectos especiales te llevan por un mundo visual soñado.', 'Nuevo Show de Estadio, estreno mundial, Junio 2011; 12 únicas funciones. Estadio Luna Park.', '', '', 0, 104, 104, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(57, 1, '0000-00-00 00:00:00', '', 'Miley_Cyrus_173x150_copia.jpg', 'MILEY CYRUS', 'En el marco de la gira Corazón Gitano, la estrella juvenil se presentó en el monumental.', 'mileycyrus900x123.jpg', '', 'El estadio River Plate estaba ansioso por escuchar por primera vez a Miley Cyrus. Un escenario amplio y un despliegue técnico realmente complejo anticipaban lo que iba a ser una noche muy bailada. Adolescentes fanatizados gritaron desde todas las áreas del estadio.', 'Unica presentación en argentina, con entradas agostadas. Miley Cyrus, 6 de mayo 2011, River Plate.', '', '', 0, 106, 106, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(58, 4, '0000-00-00 00:00:00', '', '30seconds175x150.jpg', '30 SECONDS TO MARS', 'La banda liderada por Jared Leto se presentó por segunda vez en nuestro país.', '30seconds900x123.jpg', '', '<p>La banda nacida en los &Aacute;ngeles hace casi 15 a&ntilde;os volvi&oacute; a la Argentina y desat&oacute; la histeria colectiva con una guerra rel&aacute;mpago de emociones adolescentes.La banda nacida en los &Aacute;ngeles hace casi 15 a&ntilde;os volvi&oacute; a la Argentina y desat&oacute; la histeria colectiva con una guerra rel&aacute;mpago de emociones adolescentes.La banda nacida en los &Aacute;ngeles hace casi 15 a&ntilde;os volvi&oacute; a la Argentina y desat&oacute; la histeria colectiva con una guerra rel&aacute;mpago de emociones adolescentes.La banda nacida en los &Aacute;ng', '<p>Unica presentaci&oacute;n 1 de abril, 2011 Estadio Luna Park</p>', '', '', 0, 108, 108, '2014-07-22 17:16:25', '2014-08-20 19:44:46'),
(59, 1, '0000-00-00 00:00:00', '', 'carreras173x150.jpg', 'JOSE CARRERAS', 'El gran tenor español considerado uno de los tres mejores del mundo vuelve a nuestro pais', 'carreras900x123.jpg', '', 'El tenor español José Carreras volvió a la Argentina acompañado por la soprano mexicana Rebeca Olivera, bajo la dirección del maestro David Giménez.', 'Unica presentación, 24 de abril 2011, Estadio Luna Park.', '', '', 0, 107, 107, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(60, 1, '0000-00-00 00:00:00', '', 'disney2011_173X150.jpg', 'LA CASA DE DISNEY JUNIOR', 'La casa de Disney Junior con Topa y Muni, en vacaciones de invierno. No te lo podes perder', 'disney1900x123.jpg', '', 'La casa de Disney Junior, salió de gira. En vacaciones de invierno, en la calle corrientes y después recorre las principales localidades del gran Buenos Aires.Del 20 de agosto al 11 de noviembre, en gran Bs.As.', 'Del 18 de Junio al 15 de Agosto, 2011, Teatro Metropolitan, 52 funciones agotadas.', '', '', 0, 105, 105, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(61, 1, '0000-00-00 00:00:00', '', 'Journey_173x150.jpg', 'JOURNEY', 'De la mano de Arnel Pineda, el quinteto californiano, volvió a nuestro pais.', 'journey900x123.jpg', '', 'Al apagarse las luces, todo el público de Journey supo que les esperaba un show tallado a la medida de sus expectativas. De la mano de Arnel Pineda, el quinteto californiano desarrolló dos horas de rock n roll clásico, incluyendo los hits ?Don´t Stop believing? y ?Open Arms?.', 'Journey, 28 de marzo, 2011. Estadio Luna Park', '', '', 0, 109, 109, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(62, 1, '0000-00-00 00:00:00', '', 'Morcheeba_173x150.jpg', 'MORCHEEBA', 'Una de las bandas pioneras del trip hop mundial se hizo presente en nuestro país.', 'morcheeba900x123.jpg', '', 'Morcheeba creada por los hermanos Godfrey se unieron a Skye Edwards como vocalista grabo cinco álbumes y más tarde, en el 2003, Edwards dejó la banda. En el 2005 Morcheeba grabó otro álbum junto a Daisy Martey quien reemplazo a Edwards como vocalista. ', 'Morcheeba, Estadio Luna Park, 21 de marzo, 2011', '', '', 0, 110, 110, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(63, 1, '0000-00-00 00:00:00', '', 'sanz_173x150.jpg', 'ALEJANDRO SANZ', 'En el marco de su gira Paraiso Express, vuelve con un show mucho más intimista.', 'alesanz900.jpg', '', '<p>Alejandro Sanz ha vendido en total m&aacute;s de 21.000.000 de copias de sus discos por todo el mundo. Sanz ha ganado 17 Grammys, entre ellos dos de la academia norteamericana. Regresa a Argentina para presentar su nuevo trabajo Paraiso Express.</p>', '<p>Alejandro Sanz, 2,3,5 y 6 de marzo 2011, Estadio Luna Park.</p>', '', '', 0, 111, 111, '2014-07-22 17:16:25', '2014-08-28 15:52:44'),
(64, 2, '0000-00-00 00:00:00', '', 'actividades06.jpg', 'TARJETA COOL STANDARD BANK', 'Generamos un programa de participación en shows de música para Tarjeta Cool.', 'tarjetacool900x123.jpg', '', 'El objetivo de la activación, fue generar un vínculo de interés para el target, dotado de un contenido de alto valor percibido para clientes actuales y potenciales y con beneficios de uso tangible como descuentos en la compra y sorteo de tickets sin cargo, meet&greet y sound checks con artistas.', 'El primer show de este ciclo fue el que la banda norteamericana LIMP BIZKIT, dio el 1 de Agosto de 2011, con un formidable éxito de convocatoria. La siguiente parada fue el 16 de Noviembre de 2011 con el show de los STONE TEMPLE PILOTS.', '', '', 0, 106, 106, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(65, 1, '0000-00-00 00:00:00', '', 'Cranberries_173x150.jpg', 'THE CRANBERRIES', 'El grupo irlandés liderado por Dolores O''riordan llega a la Argentina por primera vez. ', 'cranberrys900x123.jpg', '', 'La banda irlandesa, una de las más exitosas de los ?90 la cual lleva vendidos más de 40 millones de discos presentará sus grandes éxitos y temas solistas de su vocalista Dolores O?Riordan. ', 'The Cranberries, 5 de febrero, 2010 Luna Park. Por localidades agotadas, nueva función 6 de Febrero.', '', '', 0, 124, 124, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(66, 1, '0000-00-00 00:00:00', '', 'FB173X150.jpg', 'FUERZA BRUTA', 'Con ocho meses de permanencia y a pedido del público, vamos por más! FUERZA BRUTA, 2014!!', 'FB900X123.jpg', 'FB_2014_Presentacin_Generica.pdf', 'El trabajo de jóvenes talentos dentro de la música, el teatro, la danza y las artes plásticas renueva la apuesta ofreciendo a sus espectadores aún más. Fuerza Bruta Buenos Aires 2014.', 'Nueva Temporada. Enero a Agosto 2014 Centro Cultural Recoleta Sala Villa Villa Funciones de Jueves a Domingos.', 'http://www.fuerzabruta.com', '', 0, 34, 34, '2014-07-22 17:16:25', '2014-07-28 19:47:57'),
(67, 2, '0000-00-00 00:00:00', '', 'bimbomiley152x175.jpg', 'BIMBO JUNTO A MILEY CYRUS', 'Desarrollamos una importante activación para Roll Marinela en el show de Miley Cyrus.', 'bimbomiley900x123.jpg', '', 'La marca invitaba a través de la promo "Hace algo distinto" a participar por tickets para el show de Miley Cyrus, en el Estadio River y acceder a meet&greet exclusivos con la artista. Dentro del estadio promotoras de Roll Marinela invitaban a degustar estas ricas golosinas.', 'La activación se realizó en el show de Miley Cyrus en el estadio River, el 6 de mayo del 2011, ante 50.000 espectadores, en un show sold out.', '', '', 0, 108, 108, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(68, 1, '0000-00-00 00:00:00', '', 'ivete173x150.jpg', 'IVETE SANGALO', 'Ivete Sangalo, la mundialmente exitosa cantante bahiana, vuelve a la Argentina.', 'is900x123.jpg', 'PRESENTACION_IVETE_SANGALO.pdf', 'Luego de su espectacular presentación el pasado 10 de Agosto del 2012 en el Estadio Luna Park, con entradas agotadas en solo dos semanas, y un show que cautivo al público local, regresa a Argentina para seguir deslumbrando con su encanto, gracia y exquisita voz. ', 'Próximo 15 de Marzo, 2013. En el Estadio Luna Park.', '', '', 0, 69, 69, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(69, 3, '0000-00-00 00:00:00', '', 'argentinos173x150.jpg', 'ARGENTINOS POR SU NOMBRE', 'Andy Kusnetzoff, intenta reflejar los distintos sectores y momentos de la sociedad,', 'argentinos900x123.jpg', '', '<p>Andy transita la ciudad en su auto en busca de historias donde la realidad supere toda ficci&oacute;n y donde se muestre, a modo de contraste, las distintas vivencias de los argentinos, que se ponen a prueba en cr&oacute;nicas semanales que cruzan la pol&iacute;tica, el espect&aacute;culo, lo social, la actualidad, etc.</p>', '<p>Argentinos por su Nombre, conducido por Andy Kusnetzoff, producido por Mandarina para Canal 13. Tres temporadas consecutivas: S&aacute;bados 21 hs. 2008/2009/2010</p>', '', '', 0, 13, 13, '2014-07-22 17:16:25', '2014-08-28 16:02:47'),
(70, 3, '0000-00-00 00:00:00', '', 'recreo173x150.jpg', 'RE.CREO EN VOS', 'Re.Creo en vos, las tardes tienen una propuesta para los adolescentes con Emilia Attias.', 'recreo900x123.jpg', '', 'Re. creo en vos, un programa donde se combinan performances musicales, juegos de destreza, conocimiento y un segmento de reality protagonizado por los miembros del staff, que está compuesto por 12 chicos.', 'Creo en vos con Emilia Attias en la conducción. Producido por Mandarina, para Canal 13; de lunes a viernes a las 17 hs, 2010.', '', '', 0, 14, 14, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(71, 3, '0000-00-00 00:00:00', '', 'nico173x150.jpg', 'NICO TRASNOCHADO', 'La actualidad y el humor se combinan con el inconfundible sello de Nicolás Repetto.', 'nico900x123_copia.jpg', '', 'Acompañado por Diego Reinhold, el Pollo Cerviño y Juanita Repetto. Nico regresa a la tele con un programa diferente, apostando a la originalidad, la información, el humor, pero sobre todo buena onda. El programa tiene diversas secciones y un reportaje a un invitado especial. ', 'Nico Trasnochado, los sábados a las 23 hs. por Canal 13, año 2010', '', '', 0, 15, 15, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(72, 3, '0000-00-00 00:00:00', '', 'ciega173x150.jpg', 'CIEGA A CITAS', 'Una divertida novela, con formato de blog, que narra en tiempo real la vida de Lucía.', 'ciega900x123.jpg', '', '<p>Narra en tiempo real la vida de Luc&iacute;a Gonz&aacute;lez,una periodista soltera de 31 a&ntilde;os, quien busca conseguir un novio para llevar a la boda de su hermana. La motivaci&oacute;n fue ganarle una apuesta a su mam&aacute;. Ciega a citas fue producida especialmente para la TV P&uacute;blica y dirigida por Juan Taratuto.</p>', '<p>Con un elenco encabezado por Georgina Barbarossa, Nicol&aacute;s Pauls, Rafael Ferro, Muriel Santa Ana, junto a Mar&iacute;a Abadi, Fabian Arenillas, Lidia Catalano, Silvia Montanari, Boy Olmi y Osvaldo Santoro. Lunes a jueves 22.30 hs., 2010 por la TV P&uacute;blica.</p>', '', '', 0, 16, 16, '2014-07-22 17:16:25', '2014-08-28 16:05:01'),
(73, 3, '0000-00-00 00:00:00', '', 'lacomunidad173x1150.jpg', 'LA COMUNIDAD', 'Un programa de espectáculos, videos y humor producido especialmente para Movistar.', 'lacomunidad900x123.jpg', '', '<p>El programa propone que la gente participe mandando sus videos y que los famosos filmen sus propios backstage antes de salir a escena. La idea es una especie de Facebook televizado. Los videos deben ser grabados con c&aacute;maras de fotos digitales o con celulares.</p>', '<p>La Comunidad. Conducci&oacute;n: Dar&iacute;o Lopilato. Co-Conducci&oacute;n: Chechu Bonelli. Producci&oacute;n: Mandarina. S&aacute;bados 24 hs. por Canal 13. Dos temporadas 2009/2010</p>', '', '', 0, 17, 17, '2014-07-22 17:16:25', '2014-08-28 16:04:06'),
(74, 3, '0000-00-00 00:00:00', '', 'Archivo.jpg', 'Mira todo lo que hicimos.', 'Mira todo lo que hicimos.', '', '', '', '', '', '', 0, 3, 3, '2014-07-22 17:16:25', '2014-08-28 16:05:43'),
(75, 3, '0000-00-00 00:00:00', '', 'zoom173x150.jpg', 'ZOOM', 'Andy Kusnetzoff, Freddy Villarreal y Daniel Tognetti al frente de ZOOM.', 'zoom900x123.jpg', '', 'Cuando la realidad se mira bien de cerca hay dos posibilidades: la primera, descubrir detalles que aparentan ser imperceptibles. La segunda, darse cuenta que todo es más cómico de lo que parece. ', 'Andy Kusnetzoff, Fredy Villarreal y Daniel Tognetti estarán al frente de este ciclo producido por Mandarina para Canal 13, de lunes a jueves a las 19 hs. 2009', '', '', 0, 18, 18, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(76, 1, '0000-00-00 00:00:00', '', 'artattack175x150.jpg', 'ART ATTACK "LA EXPERIENCIA"', 'La Experiencia Art Attack tiene una nueva dimensión, por primera vez en Buenos Aires ', 'artattack900x123.jpg', 'Presentacion_Art_Attack.pdf', 'Un lugar para pequeños grandes artistas. Un espacio artístico y participativo para los niños y sus familias. La experiencia se desarrolla por primera vez en Buenos Aires, y comprende más de 30 actividades creativas distribuidas en diversos sectores:Arte simple, grupal, técnica, interactivo, libre.', 'ART ATTACK LA EXPERIENCIA Centro Municipal de Exposiciones desde el 3de mayo. Martes a Viernes de 15 a 20 hs. Sábados,Domingos y feriados de 10 a 20 hs. ', 'www.disneylatino.com/ArtAttack', '', 0, 66, 66, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(77, 2, '0000-00-00 00:00:00', '', 'ckmute173x150.jpg', 'CK ONE SHOCK EN MUTE', 'Desarrollamos una importante activación para Calvin Klein One Shock en Mute, Mar del Plata', 'ckmute900x123.jpg', 'CK_ONE_SHOCK.pdf', 'Durante el día está presente en el exclusivo sector de piletas. La marca está presente en fondo de piletas, vidrios, reposeras, camastros, etc. Durante la noche, CK One Shock, presenta varios de los eventos nocturnos con importantes Djs. internacionales, en un espacio totalmente ambientado ', 'por la marca, un grupo de promotoras invitan con tragos verdes y rosas, de acuerdo a cada línea de producto, sampling y tatoos de la marca, complementan la propuesta. Mute, Mar del Plata, Ruta 11, Paraje Alfar. Verano 2013.', '', '', 0, 97, 97, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(78, 1, '0000-00-00 00:00:00', '', 'archivo_2010.jpg', '', 'Mira todo lo que hicimos.', '', '', '', '', '', '', 0, 113, 113, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(79, 1, '0000-00-00 00:00:00', '', 'stp2010173x150.jpg', 'STONE TEMPLE PILOT', 'Por segunda vez en nuestro país, Stone Temple Pilots brilló con un potente show.', 'stp2010900X123.jpg', '', 'La agrupación liderada por el vocalista Scott Weiland desembarcó en Argentina en el marco de la gira de promoción de su placa "Stone Temple Pilots" dando un contundente show donde repasaron sus clásicos y presentaron temas de su último disco.', '4 de Diciembre, 2010 Luna Park', '', '', 0, 114, 114, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(80, 1, '0000-00-00 00:00:00', '', 'creamfields173x150.jpg', 'CREAMFIELDS', '10 Años de la mejor música electrónica en Buenos Aires.', 'creamfields1900x123.jpg', '', 'Más de 50 mil personas celebraron los diez años de la edición porteña del festival de música electrónica más importante del mundo, de la mano del francés David Guetta, el alemán Paul Van Dyk y los británicos Carl Cox, Sasha y Steve Lawler, entre muchísimos otros djs locales e internacionales.', '13 de Noviembre, Autodromo de la Ciudad de Buenos Aires.', '', '', 0, 115, 115, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(81, 1, '0000-00-00 00:00:00', '', 'corinne173x150.jpg', 'CORINNE BAILEY RAE', 'Llega por primera vez a nuestro país, una de las voces mas impactantes del soul.', 'corinne900x123.jpg', '', 'Por primera vez en su corta pero ascendente carrera, veremos un show de Corinne Bailey Rae en Argentina. En sólo 5 años de trayectoria musical oficial, la cantante británica logró posicionarse en los primeros rankings en su país, tanto para la crítica y las radios, como para las ventas de discos.', '2 de Noviembre, Teatro Gran Rex', '', '', 0, 116, 116, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(82, 1, '0000-00-00 00:00:00', '', 'dmb173x150.jpg', 'DAVE MATTHEWS BAND', 'Luego de su exitosa presentación en el marco del Pepsi Music, regresan a nuestro país.', 'dmb900x123_copia.jpg', '', 'La agrupación de Virginia está de regreso. La banda liderada por Dave Matthews presentará el material de su último disco, "Big Whiskey & The GrooGrux King", editado en Junio del 2009. ', 'Jueves 14 de Octubre, Estadio Luna Park.', '', '', 0, 117, 117, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(83, 1, '0000-00-00 00:00:00', '', 'dkrall173x150.jpg', 'DIANA KRALL', 'La extraordinaria cantante de jazz llega a nuestro país para deslumbrar a su público.', 'dk900x123.jpg', '', 'Una de las principales voces del jazz actual, se presenta en nuestro país para presentar su deudécimo disco ?Quiet Nights? y todos sus éxitos (So Nice, Lets face the music and dance, Fly me to the moon). Un show repleto de brillo que sin dudas cautivará al público.', 'Jueves 23 de Septiembre, Teatro Gran Rex.', '', '', 0, 118, 118, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(84, 1, '0000-00-00 00:00:00', '', 'mayu20102173x150.jpg', 'MAYUMANA', 'Después del éxito de su última presentación regresan, con un nuevo espectáculo; Momentum.', 'mayu2010900x123.jpg', '', 'El tiempo es la fuerza motora de este nuevo show que, con un elenco internacional de artistas multidisciplinarios, presenta tecnologías innovadoras desarrolladas especialmente para el espectáculo.', 'Teatro Gran Rex: 24, 25 y 26 de Septiembre.', '', '', 0, 119, 119, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(85, 1, '0000-00-00 00:00:00', '', 'bodies173x150.jpg', 'MISTERIOS DEL CUERPO HUMANO', 'Una novedosa muestra de cuerpos humanos reales que asombró al mundo llega a nuestro país.', 'bodies900x123.jpg', '', 'Misterios del Cuerpo Humano tiene como objetivo que el público entienda como funciona el organismo de una manera ágil, educativa y respetuosa. Está compuesta por más de 150 órganos y cuerpo humanos enteros y reales. ', 'Unicenter Shopping, desde Julio y hasta fin de año.', '', '', 0, 120, 120, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(86, 1, '0000-00-00 00:00:00', '', 'archivo_13_copia.jpg', 'SHOWS ANTERIORES', 'Mirá todo lo que hicimos.', '', '', '', '', '', '', 0, 45, 45, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(87, 2, '0000-00-00 00:00:00', '', 'JJ_173X150.jpg', 'PLATAFORMA SANTANDER', 'Por cuarto año consecutivo desarrollamos una plataforma de shows con beneficios exclusivos', 'activacionsantander900x123.jpg', '', 'La activación diseñada para este año, incluye además de la preventa exclusiva, descuentos y cuotas en la compra de tickets y canje premios Superclub. La plataforma 2013 comenzó con Ivete Sangalo, seguimos con La Experiencia Art Attack, B52, Jesse&Joy y algunas sorpresas más para el resto del año.', '', 'www.jesseyjoy.com', '', 0, 94, 94, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(88, 1, '0000-00-00 00:00:00', '', 'violetta_173x150.jpg', 'VIOLETTA EN VIVO', 'Violetta, la primer coproducción de Disney Channel se presenta por primera vez en vivo.', 'Violetta_900x123.jpg', 'Presentacion_Violetta.pdf', 'Tras presentarse en el Radio Disney Vivo 2012, el fenómeno Violetta volverá a presentarse en Buenos Aires pero esta vez en el teatro Gran Rex. El show está basado en la historia de la serie de Disney Channel.Incluye música, humor y comedia. Se bailará y cantará en vivo.', 'Desde el próximo 13 de Julio, en el Gran Rex; más de 50 funciones. Gira Interior: Santa Fe,Club Unión:3 y 4/10, Rosario, Teatro Metropolitano,6 y 7/10; Neuquén, Teatro Ruca Che 9/10. Mendoza, Maipú Arena, 16 y 17/10. Córdoba: 19,20 y 21/10; Orfeo.', '', '', 0, 61, 61, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(89, 1, '0000-00-00 00:00:00', '', 'andrerieu173x150.jpg', 'ANDRE RIEU', 'El maestro del violín André Rieu, nos trae el espectáculo en vivo más aclamado del mundo.', 'andrerieu900x123.jpg', 'Presentacion_Andre_Rieu.pdf', 'La pieza internacional de Rieu "And The Waltz Goes On Tour" es una oda al vals y lleva el nombre de su exitoso álbum, para el que colaboró con Sir Anthony Hopkins. En su show podrá disfrutar desde unas operetas vienesas hasta música para películas. ', '4 de Junio, Estadio Luna Park', 'http://www.andrerieu.com/', '', 0, 68, 68, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(90, 1, '0000-00-00 00:00:00', '', 'tanbionica173x150.jpg', 'TAN BIONICA', 'Con el lanzamiento de su nuevo disco Destinología, la banda inicia una gran gira nacional.', 'tanbionica900x123.jpg', 'Presentacion_Tan_Bionica.pdf', 'La banda se formó en el 2001 y se consagró con el lanzamiento de Obsesionario y su primer single "Ella". En mayo lanzan su nuevo disco e inician una gira nacional que los llevará a recorrer las principales ciudades de todo el país.', '08-JUN,CORDOBA/15-JUN, ROSARIO/20-JUN,SAN RAFAEL/21-JUN,SAN JUAN/22-JUN,MENDOZA/28-JUN,BS.AS/29-JUN,BS.AS/04-JUL, JUJUY/05-JUL,SALTA/06-JUL, TUCUMAN/08-JUL,LA RIOJA/25-JUL, SANTA FE/26-JUL,RESISTENCIA/27-JUL,FORMOSA/28-JUL,POSADAS/23-AGO,LA PLATA/ETC', 'www.tanbionica.com', '', 0, 55, 55, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(92, 1, '0000-00-00 00:00:00', '', 'mmonte173x150.jpg', 'MARISA MONTE', 'Después de un gran tour por Brasil y Europa, se presenta en Buenos Aires.', 'mmonte900x123.jpg', '', 'Marisa llegará al Teatro Gran Rex, como parte de la gira Verdade uma ilusao. La artista carioca vendrá acompañada de una banda de nueve músicos y una puesta visual con imágenes en alta definición. Marisa Monte, la cantante más importante de su país, presentará los temas de su último disco.', 'Teatro Gran Rex, 11 y 12 de Junio.', 'www.marisamonte.com.br', '', 0, 67, 67, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(93, 1, '0000-00-00 00:00:00', '', 'doki_173x150.jpg', 'DOKI EN VIVO', 'Vuelve Doki al teatro. Un nuevo e inolvidable viaje para convertirse en Gran Explorador. ', 'doki_900x123.jpg', 'Presentacin_Doki.pdf', 'Muy pronto llega Doki al teatro, con muchas aventuras donde ira conociendo nuevos amigos que lo ayudarán a descubrir planetas, a visitar las profundidades del mar, las selvas del amazonas y muchos otros lugares donde deberá superar desafíos y aprender a trabajar en grupo, cuidando el medio ambiente.', 'A partir de Junio en el Teatro Lola Membrives.', '', '', 0, 64, 64, '2014-07-22 17:16:25', '2014-07-22 17:16:25');
INSERT INTO `fichas` (`id`, `categoria_id`, `fecha`, `cliente`, `imagen_principal`, `titulo`, `copete`, `banner`, `presentacion`, `ficha`, `info`, `web`, `blog`, `destacada`, `orden_home`, `orden_interior`, `created_at`, `updated_at`) VALUES
(94, 1, '0000-00-00 00:00:00', '', 'kitty175x150.jpg', 'HELLO KITTY', 'Un espectáculo de gran despliegue, interacción multimedia y efectos especiales!!!', 'kitty900x123.jpg', 'Presentation_Hello_Kiyyt.pdf', 'En su show, Hello Kitty atrapará a los niños desde el primer minuto con su fantástica historia. Su dinámica puesta en escena, convertirán al espectáculo teatral en una verdadera experiencia de sentidos, para niños y grandes. Imperdible.', 'Teatro Lola Membrives, Junio 2013', '', '', 0, 63, 63, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(95, 1, '2014-08-11 00:00:00', 'test', 'afaplus173x150.jpg', 'AFA PLUS', 'Una nueva manera de ingreso a los estadios de fútbol, destinada a otorgar mayor seguridad.', 'afaplus900x123.jpg', 'PRESENTACION_AFA_PLUS_NEWS.pdf.ppt', '<p>AFA PLUS, a trav&eacute;s de los objetivos con los que fue desarrollado, es una extraordinaria plataforma con herramientas de participaci&oacute;n que proporcionan a las marcas asociadas un v&iacute;nculo con valores altamente percibidos por el p&uacute;blico, en el universo del futbol, la pasi&oacute;n de los argentinos.</p>', '<p>El empadronamiento se realizar&aacute; como un tr&aacute;mite personal en las sedes de los clubes de primera divisi&oacute;n, AFA, Shoppings y Universidades, donde cada aficionado deber&aacute; registrarse con sus datos personales, foto y huella digital.</p>', 'www.afaplus.com.ar', '', 1, 43, 43, '2014-07-22 17:16:25', '2014-08-11 18:10:27'),
(96, 1, '0000-00-00 00:00:00', '', 'mutebariloche173x150.jpg', 'MUTE BARILOCHE', 'La propuesta más efectiva e innovadora de las últimas 9 temporadas invernales de Argentina', 'mutebariloche900x123.jpg', 'Presentacion_Mute_Bariloche_Temporada_2013.pdf', 'De cara a la novena temporada, Mute vuelve con todo. Ciclos after ski, dj sets, bandas en vivo, eventos nocturnos, acciones de marcas, cenas temáticas, música de vanguardia, nuevas propuestas gastronómicas y la gente mas linda del cerro pasa por Mute. ', 'Mute Bariloche, se encuentra emplazado en la base del cerro, frente a la plaza Catalina Reynal, el shopping y la silla séxtuple; el sector más concurrido, exclusivo y cuidado de la base del cerro.', 'www,mute.com.ar', '', 0, 62, 62, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(97, 1, '0000-00-00 00:00:00', '', 'topa175x150.jpg', 'TOPA EN JUNIOR EXPRESS', 'Topa en un viaje lleno de canciones, amigos y diversión.', 'topa900x123.jpg', '', 'Ya todo está preparado para la partida. Topa y su tripulación ponen en marcha el "Junior Express", un mágico monorriel para viajar juntos y cantar las canciones que más te gustan, "Me muevo para aquí", "Pedro, el navegante", "Arcoíris" y muchas nuevas canciones por conocer. ', 'Desde el 20 de Junio, en el Teatro El Nacional.', 'www.topa.com.ar', '', 0, 65, 65, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(98, 2, '0000-00-00 00:00:00', '', 'caso_supervielle173x150.jpg', 'SUPERVIELLE EN FUERZA BRUTA', 'Desarrollamos una importante activación para Banco Supervielle en Fuerza Bruta.', 'caso_supervielle900x123.jpg', 'caso_supervielle.pdf', 'Banco Supervielle, como sponsor medio de pago contó con una preventa exclusiva para clientes y ofrece descuentos con tarjetas de crédito. Además dispone de una función exclusiva para la marca y acciones de promoción y relacionamiento con ticktes. Activará en el lugar con un photo opportunity.', '', '', '', 0, 96, 96, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(99, 3, '0000-00-00 00:00:00', '', 'DCE152x175.jpg', 'DIAS COMO ESTOS', 'Con la conducción de Diego Iglesias, desde el 6 de julio, todos los sábados por Metro 95.1', 'diascomoestos900x123.jpg', 'DIAS_COMO_ESTOS_PRESENTACION_Actualizada_Noviembre.pdf', '<p>Arranca el s&aacute;bado bien informado. M&uacute;sica,deportes, microeconom&iacute;a,sociales, emprendimientos,recomendaciones, agendas de shows y lugares, y mucho m&aacute;s, en un programa din&aacute;mico que te mantendr&aacute; al tanto no s&oacute;lo de lo que pasa y lo que est&aacute; por venir, sino que tambi&eacute;n te acercar&aacute; lo que pod&eacute;s hacer.</p>', '<p>Desde el 6 de Julio. S&aacute;bados de 10 a 13h Conduce: Diego Iglesias Deportes: Martin Reich Econom&iacute;a dom&eacute;stica: Matias Tombolini M&uacute;sica y agenda de shows: Majo Echeverr&iacute;a. Lifestyle: Nicolas Guthm. Cocketeler&iacute;a: Mona Gallosi. Musicalizaci&oacute;n: Festa Bros.</p>', 'www,metro951.com', '', 0, 1, 1, '2014-07-22 17:16:25', '2014-08-28 16:04:42'),
(100, 1, '0000-00-00 00:00:00', '', 'B52173X150.jpg', 'THE B52´S', 'The B-52´s se presenta en nuestro país, con un show que recorrerá sus 35 años de carrera. ', 'B52900X123.jpg', 'PRESENTACION_B52s.pdf', 'Formada en 1976, en Athens, Giorgia. Se sabe muy bien que B52´s es ?la banda más fiestera del mundo?. Con 35 años y más de 20 millones de discos vendidos, no hay dudas de porque ellos siguen siendo una de las bandas más requeridas y duraderas de la historia del rock. ', 'Se presentan el 30 de Septiembre, en el Luna Park.', '', '', 0, 60, 60, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(101, 1, '0000-00-00 00:00:00', '', 'yyy173x150.jpg', 'YEAH YEAH YEAHS', 'El espíritu del New York más Punk y Glamoroso, llega a nuestro país.', 'yyy900x123.jpg', 'PRESENTACION_YYY.pdf', 'Formada por la carismática cantante Karen O, el baterista Brian Chase y el guitarrista Nick Zinner, Yeah Yeah Yeahs es un despliegue de vanguardia indie. Con un ritmo demoledor y una forma única de mostrarse, combinan voces elaboradas, sonidos electrónicos y beats absolutamente bailables. ', 'Se presentan el 5 de Noviembre en Groove.', '', '', 0, 58, 58, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(102, 2, '0000-00-00 00:00:00', '', 'cencosudinfantiles173x150.jpg', 'CENCOSUD', 'Generamos un programa de contenidos y beneficios para tarjeta Cencosud.', 'cencosudinfantiles900x123.jpg', '', 'El objetivo de la activación fue generar contenidos y beneficios de interes para los usuarios de la tarjeta Cencosud. Los poseedores de la tarjeta pueden acceder al 15% de descuento en la compra de tickets en los espectáculos infantiles Doki en vivo y Hello Kitty, un día de suerte.', 'Ambos espectáculos se presentan en el Teatro Lola Membrives.', '', '', 0, 95, 95, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(103, 2, '0000-00-00 00:00:00', '', 'espaciopj152x175.jpg', 'ESPACIO PERSONAL JUEGOS', 'Desarrollamos para Personal, el Espacio Personal Juegos, en Tecnópolis.', 'espaciopj9001x123.jpg', 'Suplemento_Personal_Aspeb.pdf', 'El primer festival de videojuegos del país que contará con la exhibición internacional GAME ON, un área de juegos con lo último para consolas y para móviles, concursos, torneos, talleres y una serie de conferencias a cargo de importantes personalidades del sector. El espacio ocupa un área de 2500 m2', 'Predio Tecnópolis, Ciencia, Tecnología y Arte. Villa Martelli, Vicente Lopez. Provincia de Buenos Aires.', 'http://www.personal.com.ar/espaciopersonaljuegos/index.html', '', 0, 93, 93, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(104, 1, '0000-00-00 00:00:00', '', 'aldi173x150.jpg', 'AL DI MEOLA', 'El virtuoso guitarrista, regresa a la Argentina, presentandose en el tearto Opera Citi.', 'aldi900x123.jpg', 'PRESENTACION_AL_DI_MEOLA.pdf', 'El guitarrista, que fue parte del tándem Return For Ever junto al pianista Chick Corea y que ahora disfruta de una exitosa carrera solista, retornará al país con un nuevo espectáculo; donde ofrecerá un shows con temas acústicos y eléctricos de su último disco.', 'Al Di Meola, Teatro Opera Citi, 3 de Octubre 2013', 'http://www.aldimeola.com/', '', 0, 59, 59, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(105, 2, '0000-00-00 00:00:00', '', 'actsamsung150x172.jpg', 'SAMSUNG GALAXY S4 BY FUERZA BRUTA', 'Desarrollamos para el lanzamiento de Samsung Galaxy S4, una versión muy especial del show.', 'activacionsamsung900x123.jpg', 'PRESENTACION_FB_SAMSUNG.pdf', 'El show, como siempre, despertó sensaciones extraordinarias. Pero no fue cualquier show de Fuerza Bruta, tuvo un giro de vuelta diferente. El corredor, luego de superar innumerables obstáculos tales como disparos, lluvia, personas y sillas, logró su cometido. Corrió hasta entregarle la valija, nada', 'más y nada menos que Oh-Hyun Kwon, el director de Samsung a nivel mundial. Dentro de la valija reposaba la figura de la noche: el nuevo Samsung Galaxy S4. De la misma forma todos los actos incluian de una forma original y sorpresiva el nuevo S4', '', '', 0, 92, 92, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(106, 1, '0000-00-00 00:00:00', '', 'stieve173x150.jpg', 'STEVIE WONDER', 'La visita más esperada llega a nuestro país. Por primera vez en Argentina.', 'stieve900x123.jpg', 'Presentacin_STEVIE_WONDER.pdf', 'Wonder es uno de los músicos más admirados e influyentes de todos los tiempos; su influencia ha llegado a compositores,músicos y productores de todas las épocas. Considerado uno de los 10 mejores cantantes de la historia,con 25 premios grammy en su haber y más de 100 millones de discos vendidos.', 'El legendario Stevie Wonder se presentará el próximo 12 de diciembre en el Estadio Velez para brindar un único show.', '', '', 0, 54, 54, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(107, 2, '0000-00-00 00:00:00', '', 'activacioncitroen152x175.jpg', 'CITROËN JUNTO A FUERZA BRUTA', 'Potenciar el concepto rupturista y vanguardista de la marca asociándola con Fuerza Bruta.', 'activacioncitroen900x123.jpg', 'caso_citroen.pdf', 'se trabajaron varias aristas. Activación en el show; Evento Lanzamiento, contenido adhoc para la presentación del nuevo C4 Lounge en la ciudad de Mendoza. Realacionamiento, con una función exclusiva para clientes, prensa y celebrities y redes sociales para amplificar todas las acciones.', 'Asociación Citroën Fuerza Bruta, Mayo a Diciembre 2013', '', '', 0, 90, 90, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(108, 1, '0000-00-00 00:00:00', '', 'JESSEJ_173X150.jpg', 'JESSE & JOY', 'El duo mexicano de rock pop, vuelve a nuestro país para reencontrarse con sus fans.', 'JJ_900X123.jpg', 'Presentacio_JJ.pdf', 'En estos 8 años de carrera lanzaron a la venta 3 discos de estudio y ganaron en 5 oportunidades los Premios Grammy Latinos. Jesse & Joy vuelve a nuestro país en el marco de la gira ?Con quién se queda el perro tour" y prometen ser dos noches mágicas.', '14 de Noviembre, Buenos Aires, Estadio Luna Park. 16 de Noviembre, Córdoba, Estadio Orfeo.', 'http://jesseyjoy.com', '', 0, 56, 56, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(109, 1, '0000-00-00 00:00:00', '', 'FESTIVALITO_2013_173X150.jpg', 'FESTIVALITO', 'Un día de pura fiesta, pensada para toda la familia donde los chicos son los protagonistas', 'BANNER_900X123_FESTIVALITO.jpg', 'PRESENTACION_FESTIVALITO.pdf', 'Descubrir, conocer y explorar nuevas expresiones artísticas. Una fiesta al aire libre, eco amigable. Talleres, cine, teatro, actividades recreativas, artísticas y de ingenio. Además espacios gastronómicos y muchos shows en vivo. ', 'Festivalito, 9 de Noviembre, Planetario. Entrada libre y gratuita.', '', '', 0, 57, 57, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(110, 2, '0000-00-00 00:00:00', '', 'VIOLETTAMENDOZA173X150.jpg', 'SUPERVIELLE JUNTO A VIOLETTA', 'Realizamos la asociación marcaria de Supervielle al espectáculo de Violetta en Mendoza.', 'VIOLETTAMENDOZA900X123.jpg', 'CASO_SUPERVIELLE_REGIONAL_DE_CUYO__VIOLETTA.pdf', 'Entre los beneficios que otorgó el banco como sponsor medio de pago se incluyeron: una semana de preventa y descuentos exclusivos para sus clientes, además del desarrollo de diversas acciones de hospitality - cócktail de recepción, plateas Vip y Meet&Greet con el artista y los personajes-. ', '16 Y 17 DE OCTUBRE, ESTADIO ARENA MAIPÚ, MENDOZA', '', '', 0, 89, 89, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(111, 2, '0000-00-00 00:00:00', 'test', 'ACTRON152X175.jpg', 'ACTRON JUNTO A FUERZA BRUTA', 'Impactante presencia de Actron en la Sala Villa Villa del Centro Cultural Recoleta.', 'ACTRON900x123.jpg', 'presentacion_activacion_actron_fuerza_bruta.pdf', '<p>La activaci&oacute;n de marca consisti&oacute; en elaborar un p&oacute;rtico de entrada en la antesala de la Sala Villa Villa (CCR), compuesta por un espacio s&iacute;mil caja de Actron con un piso interactivo motion sensitive, reaccionando con cada paso humano y convirtiendo las c&aacute;psulas digitales en logos de Actron.</p>', '<p>Mayo a Diciembre 2013. (8 meses). Sala Villa Villa, Centro Cultural Recoleta.</p>', '', '', 1, 91, 91, '2014-07-22 17:16:25', '2014-08-08 16:59:33'),
(112, 1, '0000-00-00 00:00:00', '', 'muteclub175x150.jpg', 'MUTE MAR DEL PLATA', 'Este verano, la mejor opción para tu marca es Mute. Vení a disfrutar la experiencia. ', 'MUTE900X123.jpg', 'Mute_2014.pdf', 'Un parador boutique con el más alto nivel de servicios: gastronomía internacional, piscinas, estacionamiento, bajada 4x4, djs. en vivo. Los eventos de dia y las fiestas nocturas, como Armada Beach Festival, Magda, Marc Houle, Barem, etc., tienen convocatorias que superan las 50.000 personas.', 'Mute, Club de Mar. Ruta 11, Paraje Alfar, Mar del Plata. ', '', '', 0, 53, 53, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(113, 1, '0000-00-00 00:00:00', '', 'ultra173x150.jpg', 'ULTRA MUSIC FESTIVAL BUENOS AIRES 2014', 'Tras una exitosa segunda edición en el 2013, UMF 2014 ya tiene fechas confirmadas!', 'ultra900x123.jpg', 'PPT_ULTRA_2014.pdf', 'Las 3° edición del Ultra Buenos Aires tendrá lugar 21 y 22 de Febrero, en Ciudad del Rock, Buenos Aires, y esperan más de 80.000 personas. Su exclusivo line-up incluye la presencia de 35 djs de primera línea, entre ellos: Hardwell, Fatboy Slim, Tiesto, Alesso, y una producción artística de avanzada.', '21 y 22 de Febrero 2014, Ciudad del Rock, Buenos Aires', 'http://www.ultrabuenosaires.com/', '', 0, 52, 52, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(114, 1, '0000-00-00 00:00:00', '', 'PRISCILLA173X150.jpg', 'EL MUSICAL PRISCILLA LLEGA A BUENOS AIRES', 'Llega a Bs As el musical que hizo furor en Broadway: Priscilla, la reina del desierto.', 'PRISCILLA900X123.jpg', 'Presentacion_Priscilla.pdf', 'Priscilla, musical suceso a nivel mundial llega a Buenos Aires. Un show con estética multicolor al que se le suma un increíble y desopilante humor. Es una obra valiosísima en valores humanos,y relata la historia de tres amigos que consolidan su amistad gracias a una travesía por el desierto.', 'Febrero - Julio 2014 Lola Membrives Elenco: Pepe Cibrián Campoy, Juan Gil Navarro, Alejandro Paker Dirección: Valeria Ambrosio ', '', '', 0, 44, 44, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(115, 1, '0000-00-00 00:00:00', '', 'VIOLETTA173X150.jpg', 'VIOLETTA CIERRA SU GIRA INTERNACIONAL', 'Luego de una increíble gira internacional, Violetta se despide con 10 shows en Luna Park.', 'VIOLETTA900X123.jpg', 'Presentacion_Violetta.pdf', 'Tras el rotundo éxito de la gira de Violetta en Vivo durante el 2013, que abarcó: Mendoza, Cordoba, Rosario, Santa Fe y Neuquen, Chile, Paraguay; Peru, Guatemala, España, Italia y Francia, el musical se despide en Buenos Aires. Un sueño a todo volumen, hecho realidad.', '10 únicas presentaciones Estadio Luna Park 28 de Febrero, 1º, 2, 3 y 4 de Marzo 2014. ', '', '', 0, 49, 49, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(116, 1, '0000-00-00 00:00:00', '', 'ASOT_173X150.jpg', 'ASOT 650: CONFIRMADO BUENOS AIRES', 'Buenos Aires fue anunciada entre una de las 5 primeras ciudades por donde pasará ASOT 650.', 'ASOT_900x123.jpg', 'Presentacin_ASOT_650.pdf', 'Confirmado: ASOT 650, con su gira New Horizons, aterriza en Buenos Aires. El Line up ASOT 650 de Buenos Aires? estará conformado por: Aly & Fila?Armin van Buuren?Chris Schweizer?Dash Berlin?Heatbeat?Orjan Nilsen?Ruben De Rone Himno oficial de ASOT 650?Jorn van Deynhoven ? New Horizons ', '1 de Marzo, Ciudad del Rock.', 'http://www.astateoftrance.com', '', 0, 51, 51, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(117, 1, '0000-00-00 00:00:00', '', 'CALLE_13_173X150.jpg', 'CALLE 13', 'Llegarán a la Argentina Presentando su nuevo trabajo discográfico ?Multi_viral?', 'CALLE_13_900X123.jpg', 'Presentacin_CALLE_13.pdf', 'La nueva producción del El Residente y el Visitante, René Pérez y Eduardo Cabra, se dará a conocer el 1 de Marzo en formato digital. Calle 13 recorre el planeta con el tour de su último disco ?Multi_Viral?, que será publicado por la banda en Marzo mediante la compañía El Abismo.', '1º de Marzo ? Estadio Ferro Carril Oeste. ', 'http://www.lacalle13.com/multiviral/', '', 0, 50, 50, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(118, 1, '0000-00-00 00:00:00', '', 'hugh_laurie_173x150.jpg', 'HUGH LAURIE VUELVE A LA ARGENTINA', 'El talentoso actor y músico cumple con su promesa de volver a visitar nuestro país.', 'BANNER_HUGH.jpg', 'Presentacion_Hugh_Laurie.pdf', 'A dos años de su primera visita por Argentina, Hugh Laurie regresa a Argentina, para presentar junto a una notable banda, su segundo disco de estudio, Didn´t It Rain, donde vuelve a explotar las raíces del blues.El ex Dr. House interpretará los temas de éste y su primer trabajo, Let Them Talk.', '14 DE MARZO: ORFEO SUPERDOMO - Córdoba 15 DE MARZO: GRAN REX ? Buenos Aires', '', '', 0, 47, 47, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(119, 1, '0000-00-00 00:00:00', '', 'MAS173X150.jpg', 'MARCO ANTONIO SOLIS - GIRA NACIONAL 2014', 'Uno de los cantaurotes más influyentes de la música latina llega a Buenos Aires.', 'MAS900X123.jpg', '', 'El recientemente Disco de Oro y Platino mejicano hará presentaciones por todo el país, con su nuevo disco ?Gracias por estar aquí?.', '14 y 15 de Marzo, Estadio Ferro Carril Oeste 18 de Marzo, Hipódromo Independencia ? Rosario 20 de Marzo, Superdomo Orfeo ? Cba. 22 de Marzo, Arena Maipú ? Mendoza 24 de Marzo, Estadio Ruca Che - Neuquén 28 de Marzo, Estadio Único de La Plata', '', '', 0, 48, 48, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(121, 1, '0000-00-00 00:00:00', '', 'PLACEBO173X150.jpg', 'VUELVE PLACEBO A LA ARGENTINA', 'Por cuarta vez, el trío inglés visita al país presentando su álbum "Loud like love". ', 'PLACEBO900X123.jpg', 'PPT_PLACEBO_2014.pdf', 'Brian Molko, Stefan Olsdal y Steve Forrest se presentarán en el estadio Malvinas Argentinas el 12 de abril 2014 y estarán dando a conocer su séptimo disco de estudio. Formada a mediados de los 90´, Placebo consiguió formar parte de la música alcanzando una verdadera consolidación a nivel mundial. ', '12 de Abril, Estadio Malvinas Argentinas, BA. ', '', '', 0, 46, 46, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(122, 2, '0000-00-00 00:00:00', '', 'violetta173x150.jpg', 'REALIZAMOS LA ACTIVACION DE PERSONAL JUNTO A VIOLETTA', 'Fue el Main Sponsor del cierre de la gira 2014, concluyendo su paso por 12 países.', 'violetta_900x123.jpg', 'CASO_ACTIVACION_VIOLETTA_PERSONAL.pdf', 'Personal junto a LG presentaron los 10 shows de Violetta en el Luna Park. Con una importante plataforma de acciones 2.0, desarrolladas especialmente para la marca, y de esta forma, logró cumplir con su objetivo de instalarse en la mente de los pequeños consumidores. ', '28 de Febrero 1º, 2, 3 y 4 de Marzo.', '', '', 0, 88, 88, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(123, 1, '0000-00-00 00:00:00', '', 'MCHIESA173X150.jpg', 'MARIANO CHIESA ESTRENA WOOW', 'WooW un nuevo espectáculo para niños estas vacaciones de Invierno ', 'MCHIESA900X123.jpg', 'MCHIESA_GENERICA_A_WEB.pdf', 'Llega WooW, un espectáculo para niños de hasta 10 años que contará con la música y el equipo creativo de Violetta, con el protagónico de Mariano Chiesa, quien a partir del éxito de Velozmente se convirtió en uno de los conductores más queridos y valorados.', 'Funciones a partir del 20 de Junio, Teatro Metropolitan - Sala 1. ', '', '', 0, 39, 39, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(124, 2, '0000-00-00 00:00:00', '', '173X150.jpg', 'InFamous, Second Son, by Fuerza Bruta.', 'Fuerza Bruta le puso toda la adrenalina, fuerza y pasión, al lanzamiento del videojuego.', '900X123.jpg', 'PresentacinCASO_SECOND_SON.pdf', 'Con un acting preparado ad hoc para la ocasión, en el que los actores se lookearon como protagonistas del juego, Fuerza Bruta deslumbró a cientos de fans y prensa que esperaban ansiosos la llegada del videojuego a nuestro país. Luego, los invitados tuvieron oportunidad de testear el juego', 'en las maquinas instaladas en el foyer y el patio de la sala, mientras degustaban un exquisito catering. Lanzamiento en Argentina de InFamus Second Son, Sala Villa Villa, Centro Cultural Recoleta. 25 de Marzo, 2014 ', '', '', 0, 87, 87, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(125, 1, '0000-00-00 00:00:00', '', '173x150.jpg', 'MAYUMANA VISITA ARGENTINA', 'La compañía multicultural restrena Racconto, uno de sus mayores éxitos.', '900x123.jpg', 'mayumana_2014_a_web.pdf', 'Racconto cuenta con la colaboración del popular cómico y presentador Andreu Buenafuente, quien le imprime el ritmo a un grupo multicultural proveniente de diferentes disciplinas, desarrollando un único lenguaje internacional basado en el talento personal, el ritmo, el humor, la visualidad, el baile ', 'y la música. 15 y 16 de Octubre: Plaza de la Música, Cba. 18 y 19 de Octubre: Teatro Astengo, Rosario. 23 al 26 de Octubre: Teatro Ópera, CABA.', '', '', 0, 41, 41, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(126, 1, '0000-00-00 00:00:00', '', 'DOKI173X150.jpg', 'DOKI ESTRENA SU OBRA TEATRAL UNA EXPEDICION MUSICAL', 'El éxito infantil de Discovery Kids vuelve al Teatro ', 'BANNER_DOKI.jpg', 'PRESENTACION_DOKI_2014_a_WEB.pdf', 'El nuevo show de Doki comienza en Julio, trayendo consigo nuevas y divertidas aventuras! Los personajes interactúan con materiales audiovisuales que refuerzan la atmósfera de la creación.', 'Estreno mundial: 5 de julio 2014 Teatro: Metropolitan Citi', '', '', 0, 40, 40, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(127, 1, '0000-00-00 00:00:00', '', 'PION173X150.jpg', 'VUELVE EL PAYASO MÁS DIVERTIDO PARA TODA LA FAMILIA', 'Comienza en Junio y también hará gira por Córdoba', 'Pin900X123.JPG', 'PION_FIJO_2014_a_web.pdf', 'El payaso más querido de los últimos tiempos por grandes y chicos, llega al Teatro Lola Membrives con toda la alegría para estas vacaciones de Invierno.', 'CABA TEATRO LOLA MEMBRIVES 7 y 8 de JUNIO 28 y 29 de JUNIO Período de vacaciones de Invierno (del 21 de Julio al 1 de Agosto) CBA. ESPACIO QUALITY del 10 al 13 de Julio ', '', '', 0, 38, 38, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(128, 1, '0000-00-00 00:00:00', '', 'MUTEBARILOCHE2014173X1501.jpg', 'La posta elegida por los celebrities en el Cerro Catedral', 'Mute se viste de blanco para inaugurar la temporada de Ski 2014.', 'MUTEBARILOCHE2014900X123.jpg', 'Mute_Bariloche_Temporada_2014__a_web.pdf', 'La temporada 2014 de Bariloche se vive en Mute. Este parador, consagrado por sus famosos ciclos after ski, propone dj sets, bandas en vivo, eventos nocturnos, acciones de marcas, nuevas propuestas gastronómicas y el glamour de los celebrities hacen de Mute un lugar único en su especie.', 'Mute Bariloche, ubicado en la base del cerro Catedral, frente a la plaza Catalina Reynal, el shopping y la silla séxtuple.', '', '', 0, 35, 35, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(129, 1, '0000-00-00 00:00:00', '', 'RDV173X150.jpg', 'TODA LA EMOCION DE RADIO DISNEY EN VIVO !', 'Llega el Festival más importante juvenil más importante de Latinoamérca a la Argentina', 'RDV900X123.jpg', 'PRESENTACION_COMERCIAL_ARGENTINA_2014_web.pdf', 'RADIO DISNEY VIVO es una oportunidad para vivir la radio como espectador. Una experiencia totalmente que hace única a Radio Disney: guitarras autografiadas, la puerta autografiada, meet & greets sorpresivos dentro del venue y mucho más. Este año Axel, Camila, Sonus y Abel Pintos condecoran el show! ', '9 de Agosto, Luna Park', '', '', 0, 36, 36, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(130, 1, '0000-00-00 00:00:00', '', 'caetano173x150.jpg', '', 'Caetano es respetado, amado y muy esperado en la escena porteña.', 'CETANO900X123.jpg', 'CAETANO_GENERICA_WEB.pdf', 'Autor, poeta, novelista, productor discográfico, el bahiano de 70 años, es una de las figuras centrales de la música brasileña y del continente. Toda la experiencia, suavidad, armonía y pasión por el Tropicalismo renovados en este nuevo tour de Caetano Ao Vivo.', '2 de Noviembre - Luna Park Rosario: Anfiteatro Municipal (Fecha TBC) Córdoba: Orfeo (Fecha TBC) Mendoza: (TBC)', '', '', 0, 42, 42, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(131, 2, '0000-00-00 00:00:00', '', 'CATAPERSONAL173X150_copia.jpg', 'CICLO DE CATAS PERSONAL 2014', 'Desarrollamos para Personal Black, un programa de beneficios exclusivos. ', 'CATAPERSONAL900X123.jpg', 'catadevinos_v5.pdf', 'Desarrollamos un formato estratégico que nos permite trabajar los vínculos más profundos entre los clientes y la marca a través de contenidos de alto valor. Ciclo de Catas Personal Black, una invitación a disfrutar las mejores cepas, en selectos bares y restós seleccionados para clientes Black. ', '15 de Abril ? Peugeot Lounge Bar 23 de Junio - Olsen 29 de Julio ? Cuk3', '', '', 0, 86, 86, '2014-07-22 17:16:25', '2014-07-22 17:16:25'),
(140, 3, '0000-00-00 00:00:00', '', 'SAMSUNG_VILLAGE_2.jpg', 'SAMSUNG', 'Nuevo Galaxy', NULL, NULL, 'Campaña: Nuevo Galaxy SIII Anunciante: Samsung Marca: Galaxy SIII Dispositivo: Marquesina Village Rosario Período de Fijación: Agosto a Noviembre 2012. Agencia: Starcom Worldwide S.A. ', '', '', '', 0, 300, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(141, 3, '0000-00-00 00:00:00', '', 'SAMSUNG_VILLAGE_4.jpg', 'SAMSUNG', 'Nuevo Galaxy', NULL, NULL, 'Campaña: Nuevo Galaxy SIII Anunciante: Samsung Marca: Galaxy SIII Dispositivo: Pendón en el Hall Central-Shopping del Siglo. Rosario. Período de Fijación: Agosto a Noviembre 2012. Agencia: Starcom Worldwide S.A.', '', '', '', 0, 250, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(142, 3, '0000-00-00 00:00:00', '', 'SAMSUNG2.jpg', 'SAMSUNG', 'Nuevo Galaxy', NULL, NULL, 'Campaña: Nuevo Galaxy SIII Anunciante: Samsung Marca: Galaxy SIII Dispositivo:FrontLight Período de Fijación:Agosto a Diciembre 2012 Agencia: Starcom Worldwide S.A ', '', '', '', 0, 200, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(143, 3, '0000-00-00 00:00:00', '', 'telon_avon.jpg', 'AVON', 'Set de Navidad', NULL, NULL, 'Campaña: Set de navidad Anunciante: Avon Dispositivo: Telón en Av. Libertador 800 Período de Fijación: Noviembre y Diciembre 2011 Agencia: Starcom Worldwide S.A.', '', '', '', 0, 400, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(144, 3, '0000-00-00 00:00:00', '', 'SAMSUNG_VILLAGE.jpg', 'SAMSUNG', 'Galaxy Note', NULL, NULL, 'Campaña: Galaxy Note Anunciante: Samsung Dispositivo: Marquesina Village Rosario Periodo de fijación: Junio/Julio 2012 Agencia: Starcom Worldwide S.A ', '', '', '', 0, 350, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(145, 3, '0000-00-00 00:00:00', '', 'telon_movistar_1.jpg', 'MOVISTAR', 'Día de los Enamorados', NULL, NULL, 'Campaña: Día de los Enamorados Anunciante: Telefónica de Argentina. Marca: Movistar Dispositivo: Telón en Av. Libertador y Esperalda Periodo de fijación: Febrero 2012 Agencia: Espacios SA ', '', '', '', 0, 390, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(146, 3, '0000-00-00 00:00:00', '', 'ivete1_800x533.jpg', 'IVETE SANGALO', 'Show Luna Park', NULL, NULL, 'Campaña: Ivete Sangalo Anunciante: SPA-Entertainment Dispositivo: CPM y Sextuples Producto: Ivete Sangalo Periodo de fijación: Junio a Agosto 2012 Agencia: GDI- Generacion de Ideas', '', '', '', 0, 340, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(147, 3, '0000-00-00 00:00:00', '', 'UMF_1_800X533.jpg', 'UMF', 'Primera Edición Bs. As.', NULL, NULL, 'Campaña: UMF Anunciante: SPA-Entertainment Dispositivo: Séxtuples Producto: UMF Periodo de fijación :10 al 23 de Abril de 2012 Agencia: GDI- Generacion de Ideas ', '', '', '', 0, 365, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(148, 3, '0000-00-00 00:00:00', '', 'cirque_medianera_1_800x533.jpg', 'CIRQUE DU SOLEI', 'Varekai', NULL, NULL, 'Campaña: Cirque Du Solei Anunciante: T4F Dispositivo: Medianera Av. Córdoba y Armenia Producto: Varekai Periodo de fijación: Julio a Septiembre 2012 Agencia: T4F ', '', '', '', 0, 345, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(149, 3, '0000-00-00 00:00:00', '', 'csn1_800x533.jpg', 'CROSBY STILL & NASH', 'Show Luna Park', NULL, NULL, 'Campaña:Crosby Still & Nash Anunciante: SPA-Entertainment Dispositivo: CPM Periodo de fijación: 26 al 29 de Abril de 2012 Agencia: GDI- Generacion de Ideas ', '', '', '', 0, 355, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(150, 3, '0000-00-00 00:00:00', '', 'mayu1_800x533.jpg', 'MAYUMANA', 'Momentum', NULL, NULL, 'Campaña: Mayumana Anunciante: Ozono Dispositivo: CPM Producto: Momentum Periodo de fijación: 12 al 15 de Abril de 2012 Agencia: GDI- Generacion de Ideas ', '', '', '', 0, 370, 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(151, 3, '0000-00-00 00:00:00', '', 'jcocker1_800x533.jpg', 'JOE COCKER', 'Show Luna Park', NULL, NULL, 'Campaña: Joe Cocker Anunciante: SPA-Entertainment Producto: Joe Cocker Dispositivo: CPM Periodo de fijación: 15 al 18 de Marzo de 2012 Agencia: GDI- Generacion de Ideas ', '', '', '', 0, 380, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(152, 3, '0000-00-00 00:00:00', '', 'smirnoff_medianera_800x533.jpg', 'SMIRNOFF', 'Campaña Vía Pública', NULL, NULL, 'Campaña: Smirnoff Anunciante: Diageo Argentina SA Marca:Smirnoff Dispositivo: Medianera Av. Córdoba y Armenia Periodo de fijación: Septiembre y Octubre 2011 Agencia: Commedia ', '', '', '', 0, 410, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(153, 3, '0000-00-00 00:00:00', '', 'lecoq_medianera_800x533.jpg', 'LE COQ SPORTIF', 'Campaña Vía Pública', NULL, NULL, 'Campaña: Le Coq Sportif Anunciante: Distrinando Marca: Le Coq Sportif Dispositivo: Medianera Av. Córdoba y Armenia Periodo de fijación: Julio y Agosto 2011 Agencia: Commedia ', '', '', '', 0, 410, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(154, 3, '0000-00-00 00:00:00', '', 'pciasegurosmedianera800x6533.jpg', 'PROVINCIA SEGUROS', 'Marcelo Tinelli', NULL, NULL, 'Campaña: Marcelo Tinelli Anunciante: Provincia Seguros Dispositivo: Medianera Av. Córdoba y Armenia Periodo de fijación: Noviembre a Enero 2013 ', '', '', '', 0, 199, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(155, 3, '0000-00-00 00:00:00', '', 'villagerosariovw800x533.jpg', 'VOLKSWAGEN', 'Nuevo Gol Trend', NULL, NULL, 'Campaña: Nuevo Gol Trend Anunciante: Volkswagen Dispositivo: Marquesina Village Rosario Periodo de fijación: Diciembre 2012 a Mayo 2013 Agencia: MediaCom', '', '', '', 0, 198, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(156, 3, '0000-00-00 00:00:00', '', 'ivetecpm800x2533.jpg', 'IVETE SANGALO', 'Show Luna Park', NULL, NULL, 'Campaña: Ivete Sangalo Anunciante: SPA-Entertainment Dispositivo: CPM Producto: Ivete Sangalo Periodo de fijación: Febrero 2013 Agencia: GDI- Generacion de Ideas', '', '', '', 0, 197, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(157, 3, '0000-00-00 00:00:00', '', 'aavphonduras800x533.jpg', 'ART ATTACK', 'Experiencia Art Attack', NULL, NULL, 'Campaña: Experiencia Art Attack Anunciante: Ozono Producciones Dispositivo: Murales Producto: Art Attack Periodo de fijación: Mayo 2013 Agencia: GDI- Generacion de Ideas', '', '', '', 0, 196, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(158, 3, '0000-00-00 00:00:00', '', 'telonS800x1533.jpg', 'MAN OF STEEL', 'El Hombre de Acero', NULL, NULL, 'Campaña: Man of Steel Anunciante: Warner Bros. Dispositivo: Telón en Av.Córdoba y Azcuénaga Período de Fijación: Junio Agencia: MediaCom ', '', '', '', 0, 195, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(159, 3, '0000-00-00 00:00:00', '', 'Foto0359.jpg', 'PEUGEOT', 'Nuevo Peugeot 208', NULL, NULL, 'Campaña: Nuevo Peugeot 208 Anunciante: Peugeot Dispositivo: Marquesina Village Rosario Periodo de fijación: Julio a Diciembre 2013 Agencia: Arena', '', '', '', 0, 193, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(160, 3, '0000-00-00 00:00:00', '', 'medianera_coq_800x2533.jpg', 'LE COQ SPORTIF', 'LE COQ SPORTIF', NULL, NULL, 'Campaña: Le Coq Sportif Anunciante: Distrinando Marca: Le Coq Sportif Dispositivo: Medianera Av. Córdoba y Armenia Periodo de fijación: Septiembre a Noviembre 2013 ', '', '', '', 0, 194, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(161, 3, '0000-00-00 00:00:00', '', 'GIVENCHY_DIA_800X1533.jpg', 'GIVENCHY', ' VERY IRRESISTIBLE', NULL, NULL, 'Campaña: Givenchy Anunciante: LVMH Fragance Brands Dispositivo: Telón en Embajada de Francia Período de Fijación: Noviembre/Diciembre 2013', '', '', '', 0, 191, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(162, 3, '0000-00-00 00:00:00', '', 'andes_VILLAGE_800X533.jpg', 'ANDES BARLEY WINE', 'Cerveza Andes', NULL, NULL, 'Campaña: Andes Barley Wine Anunciante: Cervecería Quilmes Dispositivo: Banner Boletería Village Mendoza Periodo de fijación: Noviembre 2013', '', '', '', 0, 192, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(163, 3, '0000-00-00 00:00:00', '', 'med.jpg', 'QUAM', 'PROYECTO X', NULL, NULL, 'Campaña: Proyecto X Anunciante: Telefónica de Argentina Marca: Quam Dispositivo: Medianera Av. Córdoba y Armenia Periodo de fijación: Diciembre a Febrero 2014', '', '', '', 0, 190, 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_categorias`
--

CREATE TABLE IF NOT EXISTS `ficha_categorias` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `ficha_categorias`
--

INSERT INTO `ficha_categorias` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(1, 'Entertainment', '2014-07-14 00:00:00', '2014-08-27 17:18:07'),
(2, 'Experience', '2014-07-14 00:00:00', '2014-07-14 00:00:00'),
(3, 'Media', '2014-07-14 00:00:00', '2014-07-14 00:00:00'),
(4, 'Activaciones', '2014-07-23 00:00:00', '2014-07-23 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=529 ;

--
-- Volcado de datos para la tabla `ficha_fotos`
--

INSERT INTO `ficha_fotos` (`id`, `ficha_id`, `fuente`, `orden`, `created_at`, `updated_at`) VALUES
(16, 10, 'ivete_800X533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(17, 10, 'ivete_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(18, 10, 'ivete_800X533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(19, 5, 'FB800X533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(20, 5, 'FB800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(21, 5, 'FB800X533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(22, 6, 'disney800x533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(23, 6, 'disney800x533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(24, 7, 'chayanne800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(25, 7, 'chayanne800x533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(26, 7, 'chayanne800x533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(31, 13, 'FB800X533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(32, 3, 'santanderdisney.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(34, 3, 'santanderchayanne.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(35, 11, 'FB800X533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(36, 11, 'FB800X533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(37, 4, 'BRUNCH800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(38, 12, 'crm800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(39, 12, 'CRM800X5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(40, 14, 'LAFLIADT800X5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(41, 14, 'LAFLIADT800X5332.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(42, 14, 'LAFLIADT800X5333.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(43, 14, 'LAFLIADT800X5334.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(44, 14, 'LAFLIADT800X5335.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(45, 14, 'LAFLIADT800X5336.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(47, 15, 'Latinspots_800x5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(48, 16, 'notio800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(49, 16, 'notio800x5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(52, 20, 'vg800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(53, 20, 'vg800x5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(54, 21, 'ap800x5336.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(55, 21, '116.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(57, 21, '125.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(58, 21, 'ap800x5334.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(59, 21, 'ap800x5332.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(60, 21, 'ap800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(61, 21, 'ap800x5333.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(62, 21, 'ap800x5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(63, 18, '8990_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(64, 3, 'CartelAA2000320x220.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(66, 22, 'radiodisney800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(67, 22, 'radiodisney_2_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(68, 22, 'radiodisney_1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(69, 23, 'axel_1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(70, 23, 'axel800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(71, 23, 'axel_3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(72, 23, 'axel_4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(73, 24, 'cher800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(74, 24, 'cher800x5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(75, 28, 'jstone800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(76, 28, 'jstone1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(77, 28, 'jstone4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(78, 28, 'jstone3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(79, 29, 'joecocker800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(80, 30, 'mute1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(81, 30, 'mute800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(82, 30, 'mute14800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(83, 30, 'mute4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(84, 30, 'mute3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(85, 30, 'mute7800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(86, 30, 'mute5800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(87, 30, 'mute12800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(88, 30, 'mute11800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(89, 30, 'mute13800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(90, 33, 'SS800X533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(91, 33, 'SS800X533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(92, 33, 'SS800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(93, 33, 'SS800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(96, 3, 'santanderserrat.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(97, 34, 'umf800x533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(98, 34, 'umf800x533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(99, 34, 'umf800x533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(100, 34, 'umf800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(101, 34, 'umf800x533_5.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(103, 34, 'umf800x533_6.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(104, 34, 'umf800x533_7.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(106, 3, 'santanderivete.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(107, 11, 'personal_fuerza_bruta_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(108, 11, 'personal_fuerza_bruta_800x533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(113, 36, 'Crosby_800x533_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(114, 36, 'Crosby_800x533_1_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(115, 36, 'Crosby_800x533_2_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(116, 37, 'Umf_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(117, 37, 'Umf_800x533_3_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(118, 37, 'Umf_800x533_1_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(119, 38, 'Paul_800x533_3_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(120, 38, 'Paul_800x533_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(121, 39, 'Mayumana_800x533_3_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(122, 39, 'Mayumana_800x533_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(123, 39, 'Mayumana_800x533_1_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(124, 40, 'Bunbury_800x533_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(125, 40, 'Bunbury_800x533_3_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(126, 40, 'Bunbury_800x533_2_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(127, 41, 'aa2000_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(128, 41, 'aa2000_1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(129, 41, 'aa2000_2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(130, 41, 'aa2000_3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(131, 41, 'aa2000_4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(132, 41, 'aa2000_5800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(133, 41, 'aa2000_6800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(134, 42, 'cream800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(135, 42, 'cream800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(136, 42, 'cream800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(137, 42, 'cream800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(138, 43, 'speedy2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(140, 42, 'cream800x5533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(141, 42, 'cream800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(142, 42, 'cream800x6533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(143, 42, 'cream800x7533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(144, 43, '_speedy_800.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(145, 3, 'santanderjoss1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(146, 44, 'aguante800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(147, 44, 'aguante800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(148, 44, 'aguante800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(149, 44, 'aguante800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(150, 46, 'alo800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(151, 41, 'aa20008800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(152, 41, 'aa20007800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(153, 47, 'elojovw800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(154, 47, 'elojovw4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(155, 47, 'elojovw3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(156, 47, 'elojovw2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(157, 47, 'elojo800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(158, 48, 'elojopersonal800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(159, 48, 'elojopersonal3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(160, 48, 'elojopersonal7800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(161, 48, 'elojopersonal4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(162, 48, 'elojopersonal2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(163, 49, 'apjs2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(164, 49, 'apjs1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(165, 49, 'apjs800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(166, 50, 'STP800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(167, 50, 'stp800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(168, 50, 'stp3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(169, 51, 'bs800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(170, 51, 'bs173x150.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(171, 51, 'bs800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(172, 51, 'bs800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(173, 52, 'SADE_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(174, 52, 'SADE_800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(175, 52, 'SADE_800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(176, 53, 'chayu_800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(177, 53, 'Chayu_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(178, 53, 'chayu_800x533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(179, 55, 'lb_800x533_5.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(180, 55, 'lb_800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(181, 55, 'LB_800x533_3_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(182, 55, 'LB_800x533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(183, 56, 'wayra_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(184, 56, 'wayra_800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(185, 56, 'wayra_800x533_5.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(186, 56, 'wayra_tour800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(187, 57, 'Miley_Cyrus_800x533_1_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(188, 57, 'Miley_Cyrus_800x533_2_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(189, 57, 'Miley_Cyrus_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(190, 58, '30seconds__800x533_1_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(191, 58, '30seconds__800x533_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(193, 58, '30secs.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(194, 59, 'jose_800x533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(195, 59, 'jose_800x533_2_copia.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(197, 60, 'disney_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(199, 60, 'disney_800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(200, 60, 'disney_800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(201, 61, 'Jouney_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(202, 61, 'Jouney_1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(203, 61, 'Jouney_3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(204, 62, 'Morcheeba_2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(205, 62, 'Morcheeba_3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(206, 62, 'Morcheeba_4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(207, 63, 'sanz_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(208, 63, 'sanz_800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(209, 63, 'sanz_800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(210, 64, 'tarjetacool800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(211, 64, 'tarjetacool800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(212, 65, 'Cranberries_800x533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(213, 65, 'cranberries_800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(214, 65, 'cranberrys800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(215, 66, 'FB800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(216, 66, 'FB800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(217, 66, 'FB800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(218, 66, 'FB800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(220, 67, 'bimbomiley800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(221, 67, 'bimbomiley800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(222, 67, 'bimbomiley800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(223, 68, 'ivete800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(224, 68, 'ivete800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(225, 68, 'ivete800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(226, 68, 'ivete800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(227, 69, 'argentinos800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(228, 69, 'argentinos800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(229, 69, 'argentinos800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(230, 69, 'argentinos800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(231, 70, 'recreo800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(232, 70, 'recreo800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(233, 70, 'recreo800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(234, 71, 'nico800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(235, 71, 'nico800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(236, 71, 'nico800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(237, 72, 'ciega800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(238, 72, 'ciega800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(239, 72, 'ciega800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(240, 72, 'ciega800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(241, 72, 'ciega800x5533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(242, 73, 'lacomunidad800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(243, 73, 'lacomunidad800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(244, 73, 'lacomunidad800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(245, 73, 'lacomunidad800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(246, 75, 'zoom800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(247, 75, 'zoom800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(249, 76, 'artattack800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(250, 76, 'artattack800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(251, 76, 'artattack800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(252, 76, 'artattack800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(253, 77, 'ckmute800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(254, 77, 'ckmute800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(255, 77, 'ckmute800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(256, 77, 'ckmute800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(257, 77, 'ckmute800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(258, 77, 'ckmute800x5533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(259, 79, 'STP2010_800X533_1.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(260, 79, 'STP2010_800x533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(261, 79, 'STP2010_800X533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(263, 80, 'creamfields800x5331.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(264, 80, 'creamfields800x5332.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(265, 80, 'creamfields800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(266, 81, 'Corinnne_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(267, 81, 'Corinne800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(268, 81, 'Corinnne_2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(269, 81, 'Corinnne1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(270, 82, 'dmb800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(271, 82, 'dmb1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(272, 82, 'dmb2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(273, 82, 'dmb4800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(274, 83, 'dk800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(275, 83, 'dk2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(276, 83, 'dk1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(277, 84, 'mayu20104800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(278, 84, 'mayu20102800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(279, 84, 'mayu20105800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(282, 84, 'mayu2010800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(283, 84, 'mayu20101800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(284, 77, 'ckmute1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(285, 77, 'ckmute2800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(286, 77, 'ckmute3800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(287, 77, 'ckmute5800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(288, 85, 'bodies800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(289, 85, 'bodies800x4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(290, 85, 'bodies800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(291, 85, 'bodies800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(292, 85, 'bodies800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(293, 77, 'ckmute800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(294, 77, 'ckmute800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(295, 77, 'ckmuteactivacionverano800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(296, 77, 'ckmuteactivacionverano800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(297, 77, 'ckmuteactivacionverano800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(298, 87, 'activacionsantander800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(299, 88, 'violetta_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(300, 88, 'violetta_800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(301, 88, 'violetta_800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(302, 89, 'andrerieu800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(303, 89, 'andrerieu800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(304, 90, 'tanbionica800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(305, 90, 'tanbionica800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(306, 90, 'tanbionica800X4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(307, 90, 'tanbionica800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(308, 87, 'activacionsantander800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(310, 92, 'mmonte800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(311, 92, 'mmonte800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(312, 92, 'mmonte800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(315, 93, 'Doki_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(316, 93, 'doki_800x533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(317, 93, 'doki_800x533_3.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(318, 93, 'doki_800x533_4.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(319, 94, 'kitty800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(320, 94, 'kitty800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(321, 95, 'afaplus800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(322, 96, 'mutebariloche800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(323, 96, 'mutebariloche800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(324, 96, 'mutebariloche800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(325, 96, 'mutebariloche800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(326, 97, 'topa800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(327, 97, 'topa800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(329, 98, 'activacionsupervielle.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(331, 99, 'diascomoestos800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(332, 99, 'diascomoestos800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(333, 87, 'santanderactivaciones800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(334, 100, 'B52800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(335, 100, 'B52800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(337, 101, 'yyy800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(338, 101, 'yyy800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(339, 101, 'yyy800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(340, 102, 'cencosudinfantiles800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(344, 104, 'aldi800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(345, 104, 'aldi800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(346, 104, 'aldi800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(348, 105, 'sam4grouppay.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(349, 105, 'sam3dualshot.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(350, 106, 'stieve800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(351, 106, 'stieve800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(352, 105, 'sam2dramashot.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(353, 105, 'sam1airgestur.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(355, 107, 'activacioncitroen800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(356, 107, 'activacioncitroen800x5533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(357, 107, 'activacioncitroen800x8533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(358, 107, 'activacioncitroen800x9533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(359, 107, 'activacioncitroen800x10533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(360, 107, 'activacioncitroen800x11533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(362, 103, '_MG_9922.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(364, 103, 'espaciopj800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(366, 108, 'JJ_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(367, 108, 'JJ_1800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(368, 108, 'JJ_2800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(369, 109, 'FESTIVALITO_2013_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(370, 109, 'festivalito_2013_1800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(371, 109, 'FESTIVALITO_2013_2800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(372, 87, 'JJ_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(373, 110, 'VIOLETTAMENDOZA800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(374, 110, 'VIOLETTAMENDOZA800X1533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(376, 110, 'VIOLETTAMENDOZA800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(377, 110, 'VIOLETTAMENDOZA800X3533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(378, 110, 'VIOLETTAMENDOZA800X4533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(379, 110, 'VIOLETTAMENDOZA800X5533_2.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(382, 111, 'ACTRON_800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(384, 112, 'MUTE800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(385, 112, 'MUTE800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(386, 112, 'MUTE800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(387, 112, 'MUTE800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(388, 113, 'ultra800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(389, 113, 'ultra800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(390, 113, 'ultra800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(391, 114, 'PRISCILLA800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(392, 114, 'PRISCILLA800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(393, 114, 'PRISCILLA800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(394, 114, 'PRISCILLA800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(395, 115, 'VIOLETTA800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(396, 115, 'VIOLETTA800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(397, 115, 'VIOLETTA800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(398, 115, 'VIOLETTA800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(399, 116, 'ASOT_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(400, 116, 'asot_800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(401, 116, 'asot_800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(402, 117, 'CALLE_13_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(403, 117, '800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(404, 118, 'hugh_laurie_800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(405, 118, 'hugh_laurie_800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(406, 118, 'hugh_laurie_800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(407, 119, 'MAS800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(408, 119, 'MAS_800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(409, 119, '800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(414, 121, 'PLACEBO_800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(415, 121, 'PLACEBO800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(416, 121, 'PLACEBO800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(417, 121, 'PLACEBO800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(418, 122, 'violetta800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(419, 122, 'violetta800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(420, 124, '800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(421, 124, '800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(422, 123, 'MCHIESA800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(423, 123, 'MCHIESA800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(424, 123, 'MCHIESA_800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(425, 125, '800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(426, 125, '800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(427, 125, '800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(428, 125, '800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(429, 126, 'DOKI800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(430, 126, 'DOKI800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(431, 126, 'DOKI800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(432, 127, 'PION800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(433, 127, 'pion800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(434, 127, 'PION800X3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(435, 128, 'mutebariloche2014800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(436, 128, 'MUTEBARILOCHE2014800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(437, 128, 'MUTEBARILOCHE2013800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(438, 128, 'mutebariloche2014800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(440, 129, 'rdv800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(441, 129, 'rdv800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(442, 129, 'rdv800x3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(443, 129, 'rdv800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(444, 130, 'caetano800x533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(445, 130, 'caetano800x1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(446, 130, 'Caetano800x2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(447, 131, 'CATAPERSONAL800X533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(449, 131, 'CATAPERSONAL800X1533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(450, 131, 'CATAPERSONAL800X4533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(451, 131, 'CATAPERSONAL800X2533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(452, 131, 'CATAPERSONAL800X5533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(453, 131, 'CATAPERSONAL800C3533.jpg', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(458, 78, '6b25ee89967f3a5475ba8beefeb1d783a2d8cd06.png', 0, '2014-08-08 20:01:43', '2014-08-08 20:14:16'),
(459, 78, '6cde5d358d8937acaba4632a1706f3059da8a190.jpg', 1, '2014-08-08 20:01:45', '2014-08-08 20:14:16'),
(460, 58, 'fc2f509acf8ecc93e2978c74784ca588a8f7100d.jpg', 0, '2014-08-19 18:41:55', '2014-08-19 18:41:55'),
(461, 140, 'asdasdasd', 12, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(462, 140, 'SAMSUNG_VILLAGE_2.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(463, 140, 'SAMSUNG_VILLAGE_3.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(464, 141, 'SAMSUNG_VILLAGE_4.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(465, 141, 'SAMSUNG_VILLAGE_5.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(466, 142, 'SAMSUNG2.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(467, 142, 'SAMSUNG3.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(468, 143, 'telon_avon.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(469, 143, 'telon_avon_1.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(470, 144, 'SAMSUNG_VILLAGE.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(471, 144, 'SAMSUNG_VILLAGE_1.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(472, 145, 'telon_movistar_1.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(473, 145, 'telon_movistar.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(474, 146, 'ivete1_800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(475, 146, 'ivete2_800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(476, 146, 'ivete800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(477, 147, 'UMF_1_800X533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(478, 147, 'UMF_800X533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(479, 147, 'UMF.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(480, 148, 'cirque_medianera_1_800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(481, 148, 'cirque_medianera_800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(482, 149, 'csn1_800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(483, 149, 'csn800x533.jpg', 0, '2014-08-21 19:12:03', '2014-08-21 19:12:03'),
(484, 150, 'mayu1_800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(485, 150, 'mayu800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(486, 151, 'jcocker1_800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(487, 151, 'jcocker800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(488, 152, 'smirnoff_medianera_800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(489, 153, 'lecoq_medianera_800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(490, 154, 'pciasegurosmedianera800x6533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(491, 154, 'pciasegurosmedianera800x5533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(492, 154, 'pciasegurosmedianera800x4533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(493, 154, 'pciasegurosmedianera800x3533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(494, 154, 'pciasegurosmedianera800x2533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(495, 154, 'pciasegurosmedianera800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(496, 155, 'villagerosariovw800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(497, 155, 'villagerosariovw800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(498, 155, 'villagerosariovw800x2533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(499, 155, 'villagerosariovw800x3533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(500, 156, 'ivetecpm800x2533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(501, 156, 'ivetecpm800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(502, 156, 'ivetecpm800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(503, 157, 'aavphonduras800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(504, 157, 'aavphonduras800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(505, 157, 'aavphonduras800x2533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(506, 157, 'aavpurirarte800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(507, 157, 'aavpurirarte800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(508, 157, 'aavp800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(509, 158, 'telonS800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(510, 158, 'telonS800x2533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(511, 158, 'telonS800x3533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(512, 158, 'telonS800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(513, 159, 'Foto0359.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(514, 159, 'CAM03026_copia.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(515, 160, 'medianera_coq_800x2533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(516, 160, 'medianera_coq_800x1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(517, 160, 'medianera_coq_800x533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(518, 161, 'GIVENCHY_DIA_800X1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(519, 161, 'GIVENCHY_DIA_800X533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(520, 161, 'GIVENCHY_NOCHE_800X1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(521, 161, 'GIVENCHY_NOCHE_800X533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(522, 162, 'andes_VILLAGE_800X533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(523, 162, 'andes_VILLAGE_800X1533.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04'),
(524, 163, 'med.jpg', 0, '2014-08-21 19:12:04', '2014-08-21 19:12:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_tag`
--

CREATE TABLE IF NOT EXISTS `ficha_tag` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `ficha_id` int(5) unsigned NOT NULL,
  `tag_id` int(3) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha_id` (`ficha_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=74 ;

--
-- Volcado de datos para la tabla `ficha_tag`
--

INSERT INTO `ficha_tag` (`id`, `ficha_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 140, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 141, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 142, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 143, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 144, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 145, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 146, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 147, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 148, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 149, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 150, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 151, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 152, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 153, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 154, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 155, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 156, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 157, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 158, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 159, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 160, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 161, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 162, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 163, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 3, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 11, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 21, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 41, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 42, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 43, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 47, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 48, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 49, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 64, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 67, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 77, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 87, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 98, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 102, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 103, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 105, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 107, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 110, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 122, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 124, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 131, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 46, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 111, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 111, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 63, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 63, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 13, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 69, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 15, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 14, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 73, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 18, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 44, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 99, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 12, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 72, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 4, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 74, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha_videos`
--

CREATE TABLE IF NOT EXISTS `ficha_videos` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `ficha_id` int(5) unsigned NOT NULL,
  `fuente` varchar(255) NOT NULL,
  `sitio` varchar(32) NOT NULL,
  `orden` int(5) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ficha_id` (`ficha_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=462 ;

--
-- Volcado de datos para la tabla `ficha_videos`
--

INSERT INTO `ficha_videos` (`id`, `ficha_id`, `fuente`, `sitio`, `orden`, `created_at`, `updated_at`) VALUES
(31, 13, 'Wz9dvoCkpOU', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(32, 3, 'oSVGQbaFvk8', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(40, 14, '6ukQZ2V1woU', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(55, 21, 'FbvU8IOSHRI', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(63, 18, 'OnMW7CJOsIc', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(64, 3, 'UE5N2bTGxyg', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(72, 23, 'pLvb8iVWkvs', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(80, 30, 'jeeKX0QaIPg', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(97, 34, 'LfSpPZhLoA4', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(107, 11, 'Q3xr2y8NcQw', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(108, 11, 'Kq2bhUihwaE', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(215, 66, 'nc50j-rG1NA', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(321, 95, 'mtChxzQNzYM', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(329, 98, 'F5rmQDt8gYQ', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(348, 105, 'xcCrqc0TyOE', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(349, 105, 'NVDAW9JJrM8', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(352, 105, '2tJ6xRrXpHU', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(353, 105, 'jfLtT7IdLy0', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(355, 107, 'qwWZ0dyLvHk', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(362, 103, 'FNw4qxIkfMI', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(383, 110, 'FQ5glr0SpQI', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(439, 124, 'tLSodzlyBOc', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(460, 122, 'm9C6XK3qGN0', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02'),
(461, 87, 'TrxjONtzUGQ', '', 0, '2014-07-21 16:26:02', '2014-07-21 16:26:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newsletter`
--

CREATE TABLE IF NOT EXISTS `newsletter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(128) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `newsletter`
--

INSERT INTO `newsletter` (`id`, `nombre`, `correo`, `created_at`, `updated_at`) VALUES
(2, 'Eduardito', 'eduugr@gmail.com', '2014-08-07 20:59:48', '2014-08-07 20:59:48'),
(3, 'asdasd', 'eduugr@gmail.com', '2014-08-07 21:08:11', '2014-08-07 21:08:11'),
(4, 'TEST', 'test@test.com', '2014-08-11 17:32:00', '2014-08-11 17:32:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `admin`, `titulo`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrador', 'Tiene acceso total al sitio y todos sus sub-sitios, así también al área de traducción de contenidos.', '2014-01-21 00:00:00', '2014-01-21 00:00:00'),
(2, 0, 'Standard', 'Usuarios standard del sistema', '2014-05-01 00:00:00', '2014-05-01 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `categoria`, `created_at`, `updated_at`) VALUES
(2, 'Home', '2014-07-23 16:40:03', '2014-07-23 16:40:03'),
(7, 'Clientes', '2014-07-24 16:20:40', '2014-07-24 16:20:40');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Volcado de datos para la tabla `slider_fotos`
--

INSERT INTO `slider_fotos` (`id`, `slider_id`, `fuente`, `url`, `orden`, `created_at`, `updated_at`) VALUES
(28, 7, 'b2ccd48f34b5a202d83f5c9371b1a94a54db6f47.png', '', 1, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(29, 7, '3baea483a331789c771bc714c0ec5c9751f85554.png', '', 0, '2014-07-24 16:20:40', '2014-07-24 16:20:40'),
(30, 7, 'b7f6e8f56a229018a3a7185149c81da19b27af0a.png', '', 3, '2014-07-24 16:20:40', '2014-08-08 19:39:03'),
(31, 7, '9d3926d5378cbcea6e065ce7b5cb915ffe04f8df.png', '', 2, '2014-07-24 16:20:40', '2014-08-08 19:39:03'),
(32, 7, 'b8eee078b7e896d1ea902dbaf45ef7724a81f876.png', '', 4, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(33, 7, '3d3e19f108bd7d83b3ba7ca2a624ba44b3af0d66.png', '', 5, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(34, 7, 'a958a1295dd8374ffc618e14bbf3cb864cabdcae.png', '', 6, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(35, 7, 'f334cbd81fdee9ee14fc0ba32f8933dc3733b0b5.png', '', 7, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(36, 7, '727304717244ac6b7b2835ddfd529d583fc087d1.png', '', 8, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(37, 7, 'a236f8597ec50067514ed3e37c1a71650c097b85.png', '', 9, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(38, 7, '4f71ce9686abdcb28b1d49c88f82475f68086914.png', '', 10, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(39, 7, '4f56e30f987727ab0689a1c82e394a406ba7465f.png', '', 11, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(40, 7, '2a27f9ee536a1d727a6502e4adcc47c92003a257.png', '', 12, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(41, 7, '5dc1c52b4842f084d40aa47f4cb77a072d3a8a85.png', '', 13, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(42, 7, 'b775998e8673bd0a249bac267681d6f3701f4aef.png', '', 14, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(43, 7, 'bb3343310149c65f4469a73c9d26bfd043db6ed0.png', '', 15, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(44, 7, '96a7bc997b2a43ff1dbd55926ca30a4f2f1c89d8.png', '', 16, '2014-07-24 16:20:40', '2014-08-08 19:37:24'),
(45, 2, '289f5fcdd2ac098f631ccf805cdd4236b72abee9.jpg', '', 0, '2014-08-08 20:23:14', '2014-08-08 20:23:14');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`, `updated_at`) VALUES
(2, 'Art', '2014-07-18 12:30:12', '2014-07-18 12:30:12'),
(3, 'Photography', '2014-07-18 12:30:24', '2014-07-18 12:30:24'),
(4, 'Video', '2014-07-18 12:30:32', '2014-07-18 12:30:32'),
(5, 'Media', '2014-08-27 17:16:58', '2014-08-27 17:16:58'),
(6, 'VPL', '2014-08-27 17:17:05', '2014-08-27 17:17:05');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
(1, 1, 'admin@koodstudio.com.ar', '$2y$10$9bQgkOTfzXzYivOn6aOL/.m570XKhjhQkGiqRVpFYx0XGPR/a9VqK', 'Administrador', 'Kood Studio', 'admin@koodstudio.com.ar', 1390317603, '127.0.0.1', 1, 0, 'O3YRrUDLt8fKzLN1FSCIlQHWu8oCqvizzYtxhwhBNMcqpBxCfyaLxRu4voIU', '2014-01-21 00:00:00', '2014-08-11 15:56:50');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_tag`
--
ALTER TABLE `categoria_tag`
  ADD CONSTRAINT `categoria_tag_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `ficha_categorias` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `categoria_tag_ibfk_3` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fichas`
--
ALTER TABLE `fichas`
  ADD CONSTRAINT `fichas_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `ficha_categorias` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha_fotos`
--
ALTER TABLE `ficha_fotos`
  ADD CONSTRAINT `ficha_fotos_ibfk_1` FOREIGN KEY (`ficha_id`) REFERENCES `fichas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha_tag`
--
ALTER TABLE `ficha_tag`
  ADD CONSTRAINT `ficha_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ficha_tag_ibfk_1` FOREIGN KEY (`ficha_id`) REFERENCES `fichas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha_videos`
--
ALTER TABLE `ficha_videos`
  ADD CONSTRAINT `ficha_videos_ibfk_1` FOREIGN KEY (`ficha_id`) REFERENCES `fichas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
