/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.36-community-log : Database - dbminimarket2110020
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbminimarket2110020` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbminimarket2110020`;

/*Table structure for table `barang2110020` */

DROP TABLE IF EXISTS `barang2110020`;

CREATE TABLE `barang2110020` (
  `idbarang2110020` char(7) NOT NULL,
  `namabarang2110020` varchar(100) DEFAULT NULL,
  `satuan2110020` varchar(50) DEFAULT NULL,
  `hargabeli2110020` double DEFAULT NULL,
  `hargajual2110020` double DEFAULT NULL,
  `stok2110020` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbarang2110020`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barang2110020` */

insert  into `barang2110020`(`idbarang2110020`,`namabarang2110020`,`satuan2110020`,`hargabeli2110020`,`hargajual2110020`,`stok2110020`) values ('B001','Ciptadent','Pcs',5000,7500,95),('B002','Shampo Khaf','Pcs',24000,27500,90),('B003','Sabun Khaf','Pcs',15000,17500,96);

/*Table structure for table `detailjual2110020` */

DROP TABLE IF EXISTS `detailjual2110020`;

CREATE TABLE `detailjual2110020` (
  `iddetail2110020` int(11) NOT NULL AUTO_INCREMENT,
  `idjual2110020` char(10) DEFAULT NULL,
  `idbarang2110020` char(7) DEFAULT NULL,
  `qty2110020` int(11) DEFAULT NULL,
  `harga2110020` double DEFAULT NULL,
  PRIMARY KEY (`iddetail2110020`),
  KEY `idjual2110020` (`idjual2110020`),
  KEY `idbarang2110020` (`idbarang2110020`),
  CONSTRAINT `detailjual2110020_ibfk_1` FOREIGN KEY (`idjual2110020`) REFERENCES `jual2110020` (`idjual2110020`) ON UPDATE CASCADE,
  CONSTRAINT `detailjual2110020_ibfk_2` FOREIGN KEY (`idbarang2110020`) REFERENCES `barang2110020` (`idbarang2110020`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `detailjual2110020` */

insert  into `detailjual2110020`(`iddetail2110020`,`idjual2110020`,`idbarang2110020`,`qty2110020`,`harga2110020`) values (1,'F0001','B001',5,7500),(2,'F0001','B002',10,27500),(4,'F0002','B003',5,17500),(5,'F0002','B001',2,7500),(7,'F0003','B002',10,27500),(8,'F0004','B001',2,7500),(9,'F0005','B003',2,17500),(10,'F0005','B001',1,7500),(12,'F0006','B001',2,7500),(13,'F0006','B003',2,17500);

/*Table structure for table `jual2110020` */

DROP TABLE IF EXISTS `jual2110020`;

CREATE TABLE `jual2110020` (
  `idjual2110020` char(10) NOT NULL,
  `tgl2110020` date DEFAULT NULL,
  `username2110020` char(5) DEFAULT NULL,
  `total2110020` double DEFAULT NULL,
  PRIMARY KEY (`idjual2110020`),
  KEY `username2110020` (`username2110020`),
  CONSTRAINT `jual2110020_ibfk_1` FOREIGN KEY (`username2110020`) REFERENCES `user2110020` (`username2110020`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jual2110020` */

insert  into `jual2110020`(`idjual2110020`,`tgl2110020`,`username2110020`,`total2110020`) values ('F0001','2024-01-10','A001',312500),('F0002','2024-01-10','A001',102500),('F0003','2024-01-10','A001',275000),('F0004','2024-01-11','A001',15000),('F0005','2024-01-15','A001',42500),('F0006','2024-01-15','A001',50000);

/*Table structure for table `temp2110020` */

DROP TABLE IF EXISTS `temp2110020`;

CREATE TABLE `temp2110020` (
  `idbarang2110020` char(7) DEFAULT NULL,
  `qty2110020` int(11) DEFAULT NULL,
  `harga2110020` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `temp2110020` */

/*Table structure for table `user2110020` */

DROP TABLE IF EXISTS `user2110020`;

CREATE TABLE `user2110020` (
  `username2110020` char(5) NOT NULL,
  `nama2110020` varchar(30) DEFAULT NULL,
  `password2110020` varchar(50) DEFAULT NULL,
  `email2110020` varchar(100) DEFAULT NULL,
  `lastlogin2110020` datetime DEFAULT NULL,
  PRIMARY KEY (`username2110020`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user2110020` */

insert  into `user2110020`(`username2110020`,`nama2110020`,`password2110020`,`email2110020`,`lastlogin2110020`) values ('A001','Farid','202cb962ac59075b964b07152d234b70','faridsuhanda@gmail.com','2024-01-15 20:21:36'),('A002','Farhan','d81f9c1be2e08964bf9f24b15f0e4900','farhanfadhillah@gmail.com',NULL),('A003','Rahim','68053af2923e00204c3ca7c6a3150cf7','rahimulfikri@gmail.com',NULL);

/* Trigger structure for table `detailjual2110020` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `t_ai_detailjual2110020` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `t_ai_detailjual2110020` AFTER INSERT ON `detailjual2110020` FOR EACH ROW BEGIN
	update barang2110020 set stok2110020=stok2110020 - new.qty2110020 where idbarang2110020=new.idbarang2110020;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
