-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2021 a las 05:59:30
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dfacturacion`
--

CREATE TABLE `dfacturacion` (
  `id` int(11) NOT NULL,
  `idfactura` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `montoafecto` decimal(12,2) DEFAULT NULL,
  `igv` decimal(12,2) DEFAULT NULL,
  `montotal` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dpedidos`
--

CREATE TABLE `dpedidos` (
  `orderDetailID` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `idproducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dprdpreparados`
--

CREATE TABLE `dprdpreparados` (
  `id` int(11) NOT NULL,
  `idproducto` int(50) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL,
  `timeprepara` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dproducto`
--

CREATE TABLE `dproducto` (
  `id` int(11) NOT NULL,
  `idGrupo` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `costoprd` decimal(15,2) DEFAULT 0.00,
  `estado` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `tipo` int(11) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `nombres` varchar(50) DEFAULT NULL,
  `sueldo` decimal(15,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL,
  `nrofactura` varchar(15) NOT NULL,
  `tipo` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `montoafecto` decimal(12,2) DEFAULT NULL,
  `igv` decimal(12,2) DEFAULT NULL,
  `montototal` decimal(12,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `idPedido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id` int(11) NOT NULL,
  `codigo` varchar(6) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mpedidos`
--

CREATE TABLE `mpedidos` (
  `orderID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `order_date` date NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idMesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mproducto`
--

CREATE TABLE `mproducto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `costo` decimal(15,2) DEFAULT NULL,
  `fcstgl` int(11) DEFAULT 0,
  `estado` int(11) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`) VALUES
(1, 'GERENCIA'),
(2, 'COCINERO'),
(3, 'CAMARERO'),
(4, 'DELIVERY');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolexempleado`
--

CREATE TABLE `rolexempleado` (
  `idrole` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userxempleado`
--

CREATE TABLE `userxempleado` (
  `iduser` int(11) NOT NULL,
  `idempleado` int(11) NOT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `status`) VALUES
(1, 'admin', '123', b'1'),
(2, 'pepe', '123', b'1'),
(3, 'maria', '123', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dfacturacion`
--
ALTER TABLE `dfacturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idfactura` (`idfactura`);

--
-- Indices de la tabla `dpedidos`
--
ALTER TABLE `dpedidos`
  ADD PRIMARY KEY (`orderDetailID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `dprdpreparados`
--
ALTER TABLE `dprdpreparados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `dproducto`
--
ALTER TABLE `dproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadopedido`
--
ALTER TABLE `estadopedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mpedidos`
--
ALTER TABLE `mpedidos`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `status` (`status`),
  ADD KEY `idMesa` (`idMesa`),
  ADD KEY `idusuario` (`idusuario`);

--
-- Indices de la tabla `mproducto`
--
ALTER TABLE `mproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rolexempleado`
--
ALTER TABLE `rolexempleado`
  ADD PRIMARY KEY (`idrole`,`idempleado`),
  ADD KEY `idempleado` (`idempleado`);

--
-- Indices de la tabla `userxempleado`
--
ALTER TABLE `userxempleado`
  ADD PRIMARY KEY (`iduser`,`idempleado`),
  ADD KEY `idempleado` (`idempleado`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dfacturacion`
--
ALTER TABLE `dfacturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dpedidos`
--
ALTER TABLE `dpedidos`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dprdpreparados`
--
ALTER TABLE `dprdpreparados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dproducto`
--
ALTER TABLE `dproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mpedidos`
--
ALTER TABLE `mpedidos`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mproducto`
--
ALTER TABLE `mproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dfacturacion`
--
ALTER TABLE `dfacturacion`
  ADD CONSTRAINT `dfacturacion_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `facturacion` (`id`);

--
-- Filtros para la tabla `dpedidos`
--
ALTER TABLE `dpedidos`
  ADD CONSTRAINT `dpedidos_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `mpedidos` (`orderID`),
  ADD CONSTRAINT `dpedidos_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `mproducto` (`id`);

--
-- Filtros para la tabla `dprdpreparados`
--
ALTER TABLE `dprdpreparados`
  ADD CONSTRAINT `dprdpreparados_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `mproducto` (`id`),
  ADD CONSTRAINT `dprdpreparados_ibfk_2` FOREIGN KEY (`idPerfil`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `dproducto`
--
ALTER TABLE `dproducto`
  ADD CONSTRAINT `dproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `mproducto` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id`) REFERENCES `rolexempleado` (`idrole`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `mpedidos` (`orderID`);

--
-- Filtros para la tabla `mpedidos`
--
ALTER TABLE `mpedidos`
  ADD CONSTRAINT `mpedidos_ibfk_1` FOREIGN KEY (`status`) REFERENCES `estadopedido` (`id`),
  ADD CONSTRAINT `mpedidos_ibfk_2` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`id`),
  ADD CONSTRAINT `mpedidos_ibfk_3` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `mproducto`
--
ALTER TABLE `mproducto`
  ADD CONSTRAINT `mproducto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `rolexempleado`
--
ALTER TABLE `rolexempleado`
  ADD CONSTRAINT `rolexempleado_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `rolexempleado_ibfk_2` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `userxempleado`
--
ALTER TABLE `userxempleado`
  ADD CONSTRAINT `userxempleado_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `userxempleado_ibfk_2` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
