-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2025 a las 00:28:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `meraki`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `id_tip_user`
--

CREATE TABLE `id_tip_user` (
  `id_tip_user` int(11) NOT NULL,
  `tip_user` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `id_tip_user`
--

INSERT INTO `id_tip_user` (`id_tip_user`, `tip_user`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, ' Cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `documento` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `celular` varchar(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `profesion` varchar(40) NOT NULL,
  `contrasena` varchar(500) NOT NULL,
  `desc_perfil` text NOT NULL,
  `id_tip_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`documento`, `nombre`, `celular`, `email`, `profesion`, `contrasena`, `desc_perfil`, `id_tip_user`) VALUES
(123123123, 'SARA', '3176066850', 'sara@ahsdgahs.com', 'GHDFGH', '$2y$10$wwf/mPDEjxDpZ7lclmVvZ.a.9p5XLinBasWUgHsTKRNz3riRvKBuO', 'dgsdgsfd', 3),
(1105461467, 'sebas', '3176066850', 'gfdfg', 'cajero', '123', 'sdgf', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `id_tip_user`
--
ALTER TABLE `id_tip_user`
  ADD PRIMARY KEY (`id_tip_user`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`documento`),
  ADD KEY `id_tip_user` (`id_tip_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `id_tip_user`
--
ALTER TABLE `id_tip_user`
  MODIFY `id_tip_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_tip_user`) REFERENCES `id_tip_user` (`id_tip_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
