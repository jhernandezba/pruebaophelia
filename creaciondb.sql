-- --------------------------------------------------------
-- Host:                         DESKTOP-CJHC6R8
-- Versión del servidor:         Microsoft SQL Server 2019 (RTM-GDR) (KB4583458) - 15.0.2080.9
-- SO del servidor:              Windows 10 Pro 10.0 <X64> (Build 19041: ) (Hypervisor)
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para facturacion
CREATE DATABASE IF NOT EXISTS "facturacion";
USE "facturacion";

-- Volcando estructura para tabla facturacion.Clientes
DROP TABLE IF EXISTS "Clientes";
CREATE TABLE IF NOT EXISTS "Clientes" (
	"id" NCHAR(12) NOT NULL COLLATE 'Modern_Spanish_CI_AS',
	"nombre" NVARCHAR(150) NULL DEFAULT NULL COLLATE 'Modern_Spanish_CI_AS',
	"fecha_nacimiento" DATE NULL DEFAULT NULL,
	"direccion" NVARCHAR(250) NULL DEFAULT NULL COLLATE 'Modern_Spanish_CI_AS',
	"telefono" NCHAR(15) NULL DEFAULT NULL COLLATE 'Modern_Spanish_CI_AS',
	"correo" NCHAR(100) NULL DEFAULT NULL COLLATE 'Modern_Spanish_CI_AS',
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla facturacion.Clientes: -1 rows
/*!40000 ALTER TABLE "Clientes" DISABLE KEYS */;
INSERT INTO "Clientes" ("id", "nombre", "fecha_nacimiento", "direccion", "telefono", "correo") VALUES
	('100235263   ', 'Josefina Medina', '1980-10-05', 'Carrera 25 #7-60', '3132554265     ', 'jmedina@hotmail.com                                                                                 '),
	('100521425   ', 'Margarita Gomez', '1993-02-15', 'Calle 35 #25-35', '3162532111     ', 'mago@gmail.com                                                                                      '),
	('100527854   ', 'Patricia Pinto', '2004-02-15', 'Carrera 45 #12-85', '31758965478    ', 'patopinto@outlook.com                                                                               '),
	('100563215   ', 'Arturo Gonzales', '2000-02-15', 'Carrera 56 #25-36 ', '32145212514    ', 'agonzales@outlook.com                                                                               '),
	('91236541    ', 'Carlos Plata', '1982-05-14', 'Calle 80 #25-50', '31520325612    ', 'carlosplata@gmail.com                                                                               '),
	('91521523    ', 'Pedro Perez', '1963-01-12', 'Calle 50 23-57', '3165123654     ', 'pedroperez@hotmail.com                                                                              ');
/*!40000 ALTER TABLE "Clientes" ENABLE KEYS */;

-- Volcando estructura para tabla facturacion.DetalleFacturas
DROP TABLE IF EXISTS "DetalleFacturas";
CREATE TABLE IF NOT EXISTS "DetalleFacturas" (
    "id" NCHAR(12) NOT NULL COLLATE 'Modern_Spanish_CI_AS',
	"id_producto" NCHAR(10) NOT NULL COLLATE 'Modern_Spanish_CI_AS',
	"id_factura" BIGINT NOT NULL,
	"cantidad" REAL NULL DEFAULT NULL,
	"valor_unitario" REAL NULL DEFAULT NULL,
	"valor_total" REAL NULL DEFAULT NULL,
	"impuesto" REAL NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	FOREIGN KEY INDEX "FK_DetalleFacturas_Facturas" ("id_factura"),
	FOREIGN KEY INDEX "FK_DetalleFacturas_Productos" ("id_producto"),
	CONSTRAINT "FK_DetalleFacturas_Productos" FOREIGN KEY ("id_producto") REFERENCES "Productos" ("id_producto") ON UPDATE NO_ACTION ON DELETE NO_ACTION,
	CONSTRAINT "FK_DetalleFacturas_Facturas" FOREIGN KEY ("id_factura") REFERENCES "Facturas" ("id_factura") ON UPDATE NO_ACTION ON DELETE NO_ACTION
);

-- Volcando datos para la tabla facturacion.DetalleFacturas: -1 rows
/*!40000 ALTER TABLE "DetalleFacturas" DISABLE KEYS */;
/*!40000 ALTER TABLE "DetalleFacturas" ENABLE KEYS */;

-- Volcando estructura para tabla facturacion.Facturas
DROP TABLE IF EXISTS "Facturas";
CREATE TABLE IF NOT EXISTS "Facturas" (
	"id" BIGINT NOT NULL,
	"fecha" TIMESTAMP NULL DEFAULT NULL,
	"subtotal" REAL NULL DEFAULT NULL,
	"impuesto" REAL NULL DEFAULT NULL,
	"total" REAL NULL DEFAULT NULL,
	"id_cliente" NCHAR(12) NOT NULL COLLATE 'Modern_Spanish_CI_AS',
	PRIMARY KEY ("id"),
	FOREIGN KEY INDEX "FK_Facturas_Clientes" ("id_cliente"),
	CONSTRAINT "FK_Facturas_Clientes" FOREIGN KEY ("id_cliente") REFERENCES "Clientes" ("id_cliente") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Volcando datos para la tabla facturacion.Facturas: -1 rows
/*!40000 ALTER TABLE "Facturas" DISABLE KEYS */;
/*!40000 ALTER TABLE "Facturas" ENABLE KEYS */;

-- Volcando estructura para tabla facturacion.Productos
DROP TABLE IF EXISTS "Productos";
CREATE TABLE IF NOT EXISTS "Productos" (
	"id" NCHAR(10) NOT NULL COLLATE 'Modern_Spanish_CI_AS',
	"nombre" NVARCHAR(100) NULL DEFAULT NULL COLLATE 'Modern_Spanish_CI_AS',
	"valor" REAL NULL DEFAULT NULL,
	"cantidad" REAL NULL DEFAULT NULL,
	"impuesto" REAL NULL DEFAULT NULL,
	"stock" REAL NULL DEFAULT NULL,
	PRIMARY KEY ("id")
);

-- Volcando datos para la tabla facturacion.Productos: -1 rows
/*!40000 ALTER TABLE "Productos" DISABLE KEYS */;
INSERT INTO "Productos" ("id", "nombre", "valor", "cantidad", "impuesto", "stock") VALUES
	('1         ', 'Tijera', 10000, 40, 19, 10),
	('10        ', 'Memoria DDR3 2Gb', 80000, 10, 19, 8),
	('11        ', 'Memoria DDR3 1Gb', 60000, 5, 19, 5),
	('12        ', 'Memoria DDR4 8Gb', 150000, 25, 19, 20),
	('2         ', 'Cable Duplex 12', 75000, 22, 19, 5),
	('3         ', 'Ponchadora', 39000, 5, 19, 10),
	('4         ', 'Conector RJ45', 1200, 60, 19, 100),
	('5         ', 'Cable UTP 5E', 77000, 5, 19, 20),
	('6         ', 'Cable UTP 6', 125000, 25, 19, 20),
	('7         ', 'Disco Duros 500Gb', 120000, 3, 19, 10),
	('8         ', 'SSD 250Gb', 140000, 10, 19, 10),
	('9         ', 'SSD 500Gb', 220000, 7, 19, 10);
/*!40000 ALTER TABLE "Productos" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
