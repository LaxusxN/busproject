/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: crudbus
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `tbl_bus`
--

DROP TABLE IF EXISTS `tbl_bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_bus` (
  `bus_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `características` varchar(255) DEFAULT NULL,
  `número de bus` int(11) DEFAULT NULL,
  `activo o inactivo` bit(1) DEFAULT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `placa` varchar(255) DEFAULT NULL,
  `marca_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bus_id`),
  UNIQUE KEY `UK9366p7k9m1ugc0ielh4eh8ief` (`placa`),
  KEY `FKk1to1bdtdifg2yb5kcyciw13j` (`marca_id`),
  CONSTRAINT `FKk1to1bdtdifg2yb5kcyciw13j` FOREIGN KEY (`marca_id`) REFERENCES `tbl_marca` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_bus`
--

LOCK TABLES `tbl_bus` WRITE;
/*!40000 ALTER TABLE `tbl_bus` DISABLE KEYS */;
INSERT INTO `tbl_bus` VALUES
(1,'Nuevo',48,'',NULL,'A3P141',1),
(3,'Comodo',104,'\0',NULL,'NIX311',2),
(4,'Mantenimiento',91,'',NULL,'BCR499',1),
(5,'Nuevo',94,'\0',NULL,'APP311',2),
(6,'Malogrado',50,'\0',NULL,'OPP590',1),
(7,'Nuevo',105,'',NULL,'ACX540',1),
(8,'Nuevo',69,'',NULL,'CPX987',2);
/*!40000 ALTER TABLE `tbl_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'crudbus'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-11-21 12:55:21
