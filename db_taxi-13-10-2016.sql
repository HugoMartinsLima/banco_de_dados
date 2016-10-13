-- MySQL dump 10.13  Distrib 5.7.15, for Linux (x86_64)
--
-- Host: localhost    Database: db_taxi
-- ------------------------------------------------------
-- Server version	5.7.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `cidade_id` int(9) DEFAULT NULL,
  `bairro` varchar(50) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_id` (`cidade_id`),
  CONSTRAINT `bairro_ibfk_1` FOREIGN KEY (`cidade_id`) REFERENCES `cidade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,1,'Parque 10 de novembro','p10'),(2,1,'Aleixo','Al'),(3,1,'Adrianópolis','Ad'),(4,1,'Japiim','ja'),(5,1,'Alvorada','alv');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carro` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `placa` varchar(10) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `ano` varchar(10) DEFAULT NULL,
  `categoria_carro_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_carro_id` (`categoria_carro_id`),
  CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`categoria_carro_id`) REFERENCES `categoria_carro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,'OAA-2001','Vermelho','Corola','2016',3),(2,'OAA-2002','Vermelho','Honda Civic','2016',3),(3,'OAA-2003','Vermelho','Gol','2016',3),(4,'OAA-2004','Vermelho','Mercedes bens','2016',1);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_carro`
--

DROP TABLE IF EXISTS `categoria_carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_carro` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_carro`
--

LOCK TABLES `categoria_carro` WRITE;
/*!40000 ALTER TABLE `categoria_carro` DISABLE KEYS */;
INSERT INTO `categoria_carro` VALUES (1,'Ônibus'),(2,'Van'),(3,'Carro de passeio');
/*!40000 ALTER TABLE `categoria_carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `cliente_id` int(9) DEFAULT NULL,
  `motorista_id` int(9) DEFAULT NULL,
  `endereco_id` int(9) DEFAULT NULL,
  `numero_local` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `motorista_id` (`motorista_id`),
  KEY `endereco_id` (`endereco_id`),
  CONSTRAINT `chamado_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `chamado_ibfk_2` FOREIGN KEY (`motorista_id`) REFERENCES `motorista` (`id`),
  CONSTRAINT `chamado_ibfk_3` FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
INSERT INTO `chamado` VALUES (2,'2016-10-13 17:43:58',100,4,3,1,'22'),(3,'2016-10-13 17:44:52',100,10,3,1,'22'),(4,'2016-10-13 17:45:08',100,10,4,1,'22');
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `estado_id` int(9) DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,1,'Manaus','MA');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `bairro_id` int(9) DEFAULT NULL,
  `rua` varchar(100) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bairro_id` (`bairro_id`),
  CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`bairro_id`) REFERENCES `bairro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,1,'Rua 8','Conjunto Castelo Branco','69055260'),(2,1,'Rua 9','Conjunto Castelo Branco','69055261'),(3,1,'Rua 10','Conjunto Castelo Branco','69055262'),(4,2,'Rua Aleixo','Conjunto Aleixo','69055263'),(5,2,'Av. Professor Armando Armound','Conjunto Aleixo','69055264');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `pais_id` int(9) DEFAULT NULL,
  `estado` varchar(50) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pais_id` (`pais_id`),
  CONSTRAINT `estado_ibfk_1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,1,'Amazonas','AM');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `idioma` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (1,'Português'),(2,'Inglês'),(3,'Espanhol'),(4,'Mandarim'),(5,'Francês'),(6,'Alemão'),(7,'Italiano');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista`
--

DROP TABLE IF EXISTS `motorista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `cnh` varchar(20) DEFAULT NULL,
  `pessoa_id` int(9) DEFAULT NULL,
  `carro_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_id` (`pessoa_id`),
  KEY `carro_id` (`carro_id`),
  CONSTRAINT `motorista_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `motorista_ibfk_2` FOREIGN KEY (`carro_id`) REFERENCES `carro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista`
--

LOCK TABLES `motorista` WRITE;
/*!40000 ALTER TABLE `motorista` DISABLE KEYS */;
INSERT INTO `motorista` VALUES (3,'001',5,1),(4,'002',6,1);
/*!40000 ALTER TABLE `motorista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motorista_idioma`
--

DROP TABLE IF EXISTS `motorista_idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorista_idioma` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `idioma_id` int(9) DEFAULT NULL,
  `motorista_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idioma_id` (`idioma_id`),
  KEY `motorista_id` (`motorista_id`),
  CONSTRAINT `motorista_idioma_ibfk_1` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`),
  CONSTRAINT `motorista_idioma_ibfk_2` FOREIGN KEY (`motorista_id`) REFERENCES `motorista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorista_idioma`
--

LOCK TABLES `motorista_idioma` WRITE;
/*!40000 ALTER TABLE `motorista_idioma` DISABLE KEYS */;
INSERT INTO `motorista_idioma` VALUES (6,1,3),(7,2,3),(8,1,4),(9,2,4),(10,3,4);
/*!40000 ALTER TABLE `motorista_idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocorrencia`
--

DROP TABLE IF EXISTS `ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocorrencia` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `ocorrencia` text,
  `tipo_ocorrencia_id` int(9) DEFAULT NULL,
  `cliente_id` int(9) DEFAULT NULL,
  `motorista_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_ocorrencia_id` (`tipo_ocorrencia_id`),
  KEY `cliente_id` (`cliente_id`),
  KEY `motorista_id` (`motorista_id`),
  CONSTRAINT `ocorrencia_ibfk_1` FOREIGN KEY (`tipo_ocorrencia_id`) REFERENCES `tipo_ocorrencia` (`id`),
  CONSTRAINT `ocorrencia_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `ocorrencia_ibfk_3` FOREIGN KEY (`motorista_id`) REFERENCES `motorista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocorrencia`
--

LOCK TABLES `ocorrencia` WRITE;
/*!40000 ALTER TABLE `ocorrencia` DISABLE KEYS */;
INSERT INTO `ocorrencia` VALUES (1,'Roubaram meu carro',2,NULL,3),(2,'Roubaram meu carro',2,NULL,4),(3,'Esqueci minha carteira no carro',2,10,NULL);
/*!40000 ALTER TABLE `ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `pais` varchar(30) NOT NULL,
  `sigla` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Brasil','BR');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `endereco_id` int(9) DEFAULT NULL,
  `numero_casa` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (4,'Hugo Martins de Lima','918.826.052-68',1,'23'),(5,'Marcelo Silva','918.826.052-69',2,'24'),(6,'Marcel Gomes','918.826.052-70',3,'25'),(7,'Diana Gomes','918.826.052-71',4,'26'),(8,'Livia Andrade','918.826.052-72',5,'27'),(9,'Isabella Martins Andrade','918.826.052-74',1,'28'),(10,'César Henrique','918.826.052-75',2,'29');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefone`
--

DROP TABLE IF EXISTS `telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefone` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) DEFAULT NULL,
  `pessoa_id` int(9) DEFAULT NULL,
  `tipo_telefone_id` int(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_id` (`pessoa_id`),
  KEY `tipo_telefone_id` (`tipo_telefone_id`),
  CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `telefone_ibfk_2` FOREIGN KEY (`tipo_telefone_id`) REFERENCES `tipo_telefone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefone`
--

LOCK TABLES `telefone` WRITE;
/*!40000 ALTER TABLE `telefone` DISABLE KEYS */;
INSERT INTO `telefone` VALUES (1,'993346242',5,1),(2,'993343212',6,1);
/*!40000 ALTER TABLE `telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ocorrencia`
--

DROP TABLE IF EXISTS `tipo_ocorrencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_ocorrencia` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ocorrencia`
--

LOCK TABLES `tipo_ocorrencia` WRITE;
/*!40000 ALTER TABLE `tipo_ocorrencia` DISABLE KEYS */;
INSERT INTO `tipo_ocorrencia` VALUES (1,'Acidente'),(2,'Incidentes'),(3,'Reclamação'),(4,'Sugestão'),(5,'Elogios');
/*!40000 ALTER TABLE `tipo_ocorrencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefone`
--

DROP TABLE IF EXISTS `tipo_telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_telefone` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `tipo_telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefone`
--

LOCK TABLES `tipo_telefone` WRITE;
/*!40000 ALTER TABLE `tipo_telefone` DISABLE KEYS */;
INSERT INTO `tipo_telefone` VALUES (1,'Celular'),(2,'Residencial');
/*!40000 ALTER TABLE `tipo_telefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-13 17:49:53
