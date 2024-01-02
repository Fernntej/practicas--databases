-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: tarea
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Gran artículo',1,'2024-01-02 00:10:10'),(2,'Interesante tema',2,'2024-01-02 00:10:10'),(3,'Buen trabajo',3,'2024-01-02 00:10:10'),(4,'Me gustó mucho',1,'2024-01-02 00:10:10'),(5,'Excelente contenido',2,'2024-01-02 00:10:10'),(6,'Bien explicado',3,'2024-01-02 00:10:10'),(7,'Información útil',1,'2024-01-02 00:10:10'),(8,'Comentario positivo',2,'2024-01-02 00:10:10'),(9,'Aprendí mucho',3,'2024-01-02 00:10:10'),(10,'Valiosa contribución',1,'2024-01-02 00:10:10');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(10) unsigned NOT NULL,
  `status` enum('active','inactive') DEFAULT 'inactive',
  `bio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'juanito123','juanito123@example.com',28,'active','Amante de la tecnología y los viajes.','2024-01-01 19:57:42'),(2,'laura84','laura84@example.com',32,'inactive','Apasionada por la fotografía y los libros.','2024-01-01 19:57:42'),(3,'carlos22','carlos22@example.com',25,'active','Entusiasta del deporte y la música.','2024-01-01 19:57:42'),(4,'maria777','maria777@example.com',30,'inactive','Fanática de la cocina y los idiomas.','2024-01-01 19:57:42'),(5,'pedrito55','pedrito55@example.com',27,'active','Desarrollador de sistemas','2024-01-01 19:57:42'),(6,'sofia_g','sofia_g@example.com',29,'inactive','Interesada en el arte y la pintura.','2024-01-01 19:57:42'),(7,'robert_89','robert_89@example.com',26,'active','Adicto a las películas y series.','2024-01-01 19:57:42'),(8,'ana2000','ana2000@example.com',31,'inactive','Ama los animales y la naturaleza.','2024-01-01 19:57:42'),(9,'diego12','diego12@example.com',24,'active','Aficionado a la música y la escritura.','2024-01-01 19:57:42'),(10,'carmen_34','carmen_34@example.com',33,'inactive','Disfruta del senderismo y el aire libre.','2024-01-01 19:57:42'),(23,'Mario54','nuevo_usuario_2@example.com',28,'inactive','Le gustan las peliculas de terror','2024-01-01 22:31:58');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-02  0:07:03
