-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-12-2022 a las 18:52:34
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `firstName` varchar(125) NOT NULL,
  `lastName` varchar(125) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `address` mediumtext NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `confirmCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `firstName`, `lastName`, `email`, `mobile`, `address`, `password`, `type`, `confirmCode`) VALUES
(4, 'Jose', 'Varo', 'pepevg@mail.com', '01677876551', 'Ahualulco', '$5$rounds=535000$7mV6FCAM0YxFEw1R$mpJdbasmYqAU5X/asydP5g.0fbLSW38.gA6ybkY1pZC', 'manager', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `ofname` mediumtext NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `oplace` mediumtext NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dstatus` varchar(10) NOT NULL DEFAULT 'no',
  `odate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `uid`, `ofname`, `pid`, `quantity`, `oplace`, `mobile`, `dstatus`, `odate`, `ddate`) VALUES
(1, 18, 'Peter Parker', 9, 4, 'New York #123', '12345678900', 'no', '2022-12-03 18:50:00', '2022-12-10'),
(2, 18, 'Peter Parker', 6, 5, 'New York #123', '12345678900', 'no', '2022-12-03 18:50:46', '2022-12-10'),
(3, 19, 'Jose Varo González', 8, 1, 'Mi Casa #10', '12345678900', 'no', '2022-12-03 18:51:35', '2022-12-10'),
(4, 19, 'Jose Varo González', 5, 3, 'Mi Casa #10', '12345678900', 'no', '2022-12-03 18:51:48', '2022-12-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `pName` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` mediumtext NOT NULL,
  `available` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `picture` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `pName`, `price`, `description`, `available`, `category`, `picture`, `date`) VALUES
(5, 'Celular POCO', 4000, 'hello moto', 4, 'celulares', '1.jpg', '2022-11-11 02:37:31'),
(6, 'Organizador', 12, 'accesorio súper pitero', 1, 'accesorios', 'a.jpeg', '2022-11-11 04:18:30'),
(8, 'Monitor', 400, 'monitor perron', 9, 'computo', 'c.jpeg', '2022-11-11 19:21:18'),
(9, 'Iron-Mouse', 200, 'mouse chido', 10, 'perifericos', 'p.jpeg', '2022-11-11 19:31:53'),
(14, 'Casa Bob', 1000, 'Cuadro de la sala de Bob Esponja', 1, 'accesorios', 'bob.jpg', '2022-11-17 18:50:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `reg_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` varchar(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `mobile`, `reg_time`, `online`) VALUES
(18, 'Peter Parker', 'spider@man.com', 'spiderman', '$5$rounds=535000$.bJLg3G7.VvYyLqA$CfGFgVaCYhHluchbWBoFP4bxcZEiXQUmuzfo1utgfgD', '12312312311', '2022-11-10 18:44:56', '0'),
(19, 'Pepe Varo', 'pepe@mail.com', 'pepe', '$5$rounds=535000$/Sf80phPzbwnWdKb$WeDbGXs3tOjFmRECV0SrjMLLE0icOmiURVdypNpDL..', '111111111111111', '2022-11-15 20:04:35', '0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_users` (`uid`) USING BTREE,
  ADD KEY `orders_products` (`pid`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_users` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
