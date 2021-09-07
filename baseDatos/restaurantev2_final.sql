-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2021 a las 14:09:21
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

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'DESAYUNOS'),
(2, 'CARNES'),
(3, 'BEBIDAS'),
(5, 'PLATOS CARTA'),
(6, 'MENU-ALMUERZO'),
(7, 'CENA'),
(8, 'POSTRES'),
(9, 'SOPAS'),
(10, 'PAN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombreCompleto` varchar(100) DEFAULT NULL,
  `ruc_dni` varchar(15) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `ubigeo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombreCompleto`, `ruc_dni`, `direccion`, `ubigeo`) VALUES
(1, 'ALBERTO PIZANGO', '888888', 'Las palmas del rio', '9999999'),
(2, 'COMERCIALIZADORA EL PISAO', '999999999', 'Roberto', '8888888'),
(3, 'Clientes Varios', '-', '-', '-');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dcatalogopreparacion`
--

CREATE TABLE `dcatalogopreparacion` (
  `id` int(11) NOT NULL,
  `idCategoria` int(50) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `estado` int(11) DEFAULT 1,
  `timeprepara` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dcatalogopreparacion`
--

INSERT INTO `dcatalogopreparacion` (`id`, `idCategoria`, `idPerfil`, `estado`, `timeprepara`) VALUES
(1, 1, 2, 1, 3),
(2, 2, 2, 1, 4),
(3, 5, 2, 1, 5),
(4, 6, 2, 1, 6),
(5, 7, 2, 1, 6),
(6, 9, 2, 1, 8);

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
  `montotal` decimal(12,2) DEFAULT NULL,
  `idCajero` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `nombreProducto` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dpedidoelaboracion`
--

CREATE TABLE `dpedidoelaboracion` (
  `idPedido` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL COMMENT 'Usuario quien elabora el producto',
  `finipreparacion` datetime DEFAULT NULL,
  `ffinpreparacion` datetime DEFAULT NULL,
  `estado` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dpedidoelaboracion`
--

INSERT INTO `dpedidoelaboracion` (`idPedido`, `idUsuario`, `finipreparacion`, `ffinpreparacion`, `estado`) VALUES
(4, 2, '2021-09-05 12:53:32', '2021-09-05 12:56:40', 'P');

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

--
-- Volcado de datos para la tabla `dpedidos`
--

INSERT INTO `dpedidos` (`orderDetailID`, `orderID`, `itemID`, `quantity`, `estado`, `idproducto`) VALUES
(1, 4, 1, 1, 0, 2),
(2, 4, 2, 2, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dproducto`
--

CREATE TABLE `dproducto` (
  `id` int(11) NOT NULL,
  `idcatalogo` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT 1,
  `idProducto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dproducto`
--

INSERT INTO `dproducto` (`id`, `idcatalogo`, `estado`, `idProducto`) VALUES
(1, 3, 1, 2),
(2, 6, 1, 2),
(3, 1, 1, 1),
(4, 3, 1, 3),
(5, 6, 1, 3),
(6, 9, 1, 4),
(7, 10, 1, 5),
(8, 11, 1, 6),
(9, 12, 1, 7),
(10, 13, 1, 8),
(11, 14, 1, 9),
(12, 15, 1, 10),
(13, 16, 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dprogramamesa`
--

CREATE TABLE `dprogramamesa` (
  `idProgramacion` int(11) NOT NULL,
  `idCamarero` int(11) NOT NULL,
  `idMesa` int(11) NOT NULL,
  `estado` char(2) DEFAULT 'A',
  `HoraInicio` time DEFAULT NULL,
  `HoraFinInicio` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dprogramamesa`
--

INSERT INTO `dprogramamesa` (`idProgramacion`, `idCamarero`, `idMesa`, `estado`, `HoraInicio`, `HoraFinInicio`) VALUES
(1, 3, 1, 'A', '08:00:00', '12:00:00'),
(1, 3, 2, 'A', '10:00:00', '12:00:00');

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
  `estado` int(11) DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `tipo`, `apellidos`, `nombres`, `sueldo`, `estado`, `iduser`, `dni`) VALUES
(1, 0, 'PEPE', 'CANTINA', '355.00', 1, 1, '99999999'),
(2, 0, 'MARIA', 'YANKI', '3443.00', 1, 2, '00000888'),
(3, 0, 'JUAN', 'QUISPE', '990.00', 1, 3, '77777788');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ruc` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ubigeo` varchar(30) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  `distrito` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadopedido`
--

CREATE TABLE `estadopedido` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estadopedido`
--

INSERT INTO `estadopedido` (`id`, `descripcion`) VALUES
(1, 'PENDIENTE'),
(2, 'EN PREPARACION'),
(3, 'ESPERANDO'),
(4, 'LISTO'),
(5, 'CANCELADO'),
(6, 'FINALIZADO');

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
-- Estructura de tabla para la tabla `mcatalogo`
--

CREATE TABLE `mcatalogo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mcatalogo`
--

INSERT INTO `mcatalogo` (`id`, `descripcion`, `estado`) VALUES
(1, 'PAN RISOTO', 1),
(2, 'TORTA TRES LECHES', 1),
(3, 'SOPA DE SEMOLA', 1),
(4, 'ARROZ CON POLLO', 1),
(5, 'COPA DE VINO', 1),
(6, 'LOMO SALTADO', 1),
(7, 'HAMBURGUESA', 1),
(8, 'CAFE CON LECHE', 1),
(9, 'Huevos en Caserola', 1),
(10, 'Huevos Revueltos', 1),
(11, 'Carne en Bistec', 1),
(12, 'Calentado', 1),
(13, 'Filete de Pollo', 1),
(14, 'Filete de Carne', 1),
(15, 'Chuleta de Pollo', 1),
(16, 'Chuleta de Res', 1),
(17, 'Chuleta de Cerdo', 1),
(18, 'Res Asada', 1),
(19, 'Pollo Asado', 1),
(20, 'Pollo Frito', 1),
(21, 'Tinto', 1),
(22, 'CafÃ© con Leche', 1),
(23, 'Gaseosa 350 ML', 1),
(24, 'Gaseosa 200 ML', 1),
(25, 'Jugo Natural en Agua', 1),
(26, 'Jugo Natural en Leche', 1),
(27, 'Jugo de Naranja', 1),
(28, 'Cremas', 1),
(29, 'Sancocho', 1),
(30, 'Caldo de Costilla', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id` int(11) NOT NULL,
  `nroUbicacion` int(6) DEFAULT NULL,
  `codigoAlterno` varchar(6) DEFAULT NULL,
  `nropiso` int(11) DEFAULT NULL,
  `nMaxComensales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`id`, `nroUbicacion`, `codigoAlterno`, `nropiso`, `nMaxComensales`) VALUES
(1, 1, 'A1', 1, 3),
(2, 2, 'A2', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mpedidos`
--

CREATE TABLE `mpedidos` (
  `orderID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `order_date` date NOT NULL,
  `idCamarero` int(11) DEFAULT NULL,
  `idMesa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mpedidos`
--

INSERT INTO `mpedidos` (`orderID`, `status`, `total`, `order_date`, `idCamarero`, `idMesa`) VALUES
(4, 1, '999.00', '2021-09-05', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mproducto`
--

CREATE TABLE `mproducto` (
  `id` int(11) NOT NULL,
  `precio` decimal(12,2) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `idCategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mproducto`
--

INSERT INTO `mproducto` (`id`, `precio`, `nombre`, `idCategoria`) VALUES
(1, '3.00', 'PAN RISOTO x5', 1),
(2, '15.00', 'ALMUERZO EJECUTIVO', 8),
(3, '10.00', 'ALMUERZO 1', 8),
(4, '15.00', 'Huevos en Caserola', 2),
(5, '15.00', 'Huevos Revueltos', 2),
(6, '15.00', 'Carne en Bistec', 2),
(7, '15.00', 'Calentado', 2),
(8, '15.00', 'Filete de Pollo', 2),
(9, '15.00', 'Filete de Carne', 2),
(10, '15.00', 'Chuleta de Pollo', 2),
(11, '15.00', 'Chuleta de Res', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mprogramamesa`
--

CREATE TABLE `mprogramamesa` (
  `id` int(11) NOT NULL,
  `fechaProgramacion` date DEFAULT NULL,
  `fechaAplica` date DEFAULT NULL,
  `fechaFinAplica` date DEFAULT NULL,
  `idUsuarioPrograma` int(11) DEFAULT NULL,
  `estado` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mprogramamesa`
--

INSERT INTO `mprogramamesa` (`id`, `fechaProgramacion`, `fechaAplica`, `fechaFinAplica`, `idUsuarioPrograma`, `estado`) VALUES
(1, '2021-09-05', '2021-09-06', '2021-09-19', 1, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `dsccorta` varchar(60) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `dsccorta`, `descripcion`) VALUES
(1, 'ADMIN', 'GERENCIA'),
(2, 'COCIN', 'COCINERO'),
(3, 'CMRRO', 'CAMARERO'),
(4, 'DLVRY', 'DELIVERY'),
(5, 'BRTND', 'BARTENDER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userxrol`
--

CREATE TABLE `userxrol` (
  `idrole` int(11) NOT NULL,
  `iduser` int(11) NOT NULL,
  `estado` char(11) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `userxrol`
--

INSERT INTO `userxrol` (`idrole`, `iduser`, `estado`) VALUES
(1, 1, 'A'),
(2, 2, 'A'),
(3, 3, 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `online` bit(1) DEFAULT b'0',
  `estado` char(1) DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `online`, `estado`) VALUES
(1, 'PEPE', '123', b'1', 'A'),
(2, 'MARIA', '123', b'1', 'A'),
(3, 'JUAN', '123', b'1', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dcatalogopreparacion`
--
ALTER TABLE `dcatalogopreparacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idproducto` (`idCategoria`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `dfacturacion`
--
ALTER TABLE `dfacturacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idfactura` (`idfactura`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `dpedidoelaboracion`
--
ALTER TABLE `dpedidoelaboracion`
  ADD PRIMARY KEY (`idPedido`,`idUsuario`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `dpedidos`
--
ALTER TABLE `dpedidos`
  ADD PRIMARY KEY (`orderDetailID`),
  ADD KEY `orderID` (`orderID`),
  ADD KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `dproducto`
--
ALTER TABLE `dproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idcatalogo` (`idcatalogo`);

--
-- Indices de la tabla `dprogramamesa`
--
ALTER TABLE `dprogramamesa`
  ADD PRIMARY KEY (`idProgramacion`,`idCamarero`,`idMesa`),
  ADD KEY `idCamarero` (`idCamarero`),
  ADD KEY `idMesa` (`idMesa`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`);

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
-- Indices de la tabla `mcatalogo`
--
ALTER TABLE `mcatalogo`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `idusuario` (`idCamarero`),
  ADD KEY `idMesa` (`idMesa`);

--
-- Indices de la tabla `mproducto`
--
ALTER TABLE `mproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indices de la tabla `mprogramamesa`
--
ALTER TABLE `mprogramamesa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `userxrol`
--
ALTER TABLE `userxrol`
  ADD PRIMARY KEY (`idrole`,`iduser`),
  ADD KEY `iduser` (`iduser`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dcatalogopreparacion`
--
ALTER TABLE `dcatalogopreparacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `dfacturacion`
--
ALTER TABLE `dfacturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `dpedidos`
--
ALTER TABLE `dpedidos`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dproducto`
--
ALTER TABLE `dproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mcatalogo`
--
ALTER TABLE `mcatalogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mpedidos`
--
ALTER TABLE `mpedidos`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mproducto`
--
ALTER TABLE `mproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `mprogramamesa`
--
ALTER TABLE `mprogramamesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `dfacturacion_ibfk_1` FOREIGN KEY (`idfactura`) REFERENCES `facturacion` (`id`),
  ADD CONSTRAINT `dfacturacion_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `dpedidoelaboracion`
--
ALTER TABLE `dpedidoelaboracion`
  ADD CONSTRAINT `dpedidoelaboracion_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `mpedidos` (`orderID`),
  ADD CONSTRAINT `dpedidoelaboracion_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `dpedidos`
--
ALTER TABLE `dpedidos`
  ADD CONSTRAINT `dpedidos_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `mpedidos` (`orderID`),
  ADD CONSTRAINT `dpedidos_ibfk_2` FOREIGN KEY (`idproducto`) REFERENCES `mcatalogo` (`id`);

--
-- Filtros para la tabla `dproducto`
--
ALTER TABLE `dproducto`
  ADD CONSTRAINT `dproducto_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `mproducto` (`id`),
  ADD CONSTRAINT `dproducto_ibfk_2` FOREIGN KEY (`idcatalogo`) REFERENCES `mcatalogo` (`id`);

--
-- Filtros para la tabla `dprogramamesa`
--
ALTER TABLE `dprogramamesa`
  ADD CONSTRAINT `dprogramamesa_ibfk_3` FOREIGN KEY (`idProgramacion`) REFERENCES `mprogramamesa` (`id`),
  ADD CONSTRAINT `dprogramamesa_ibfk_4` FOREIGN KEY (`idCamarero`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `dprogramamesa_ibfk_5` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `usuario` (`id`);

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
  ADD CONSTRAINT `mpedidos_ibfk_3` FOREIGN KEY (`idCamarero`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `mpedidos_ibfk_4` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`id`);

--
-- Filtros para la tabla `mproducto`
--
ALTER TABLE `mproducto`
  ADD CONSTRAINT `mproducto_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `userxrol`
--
ALTER TABLE `userxrol`
  ADD CONSTRAINT `userxrol_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `userxrol_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
