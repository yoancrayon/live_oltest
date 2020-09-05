/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.4.13-MariaDB : Database - live_oltest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`live_oltest` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `live_oltest`;

/*Table structure for table `jawaban_peserta_ujian` */

DROP TABLE IF EXISTS `jawaban_peserta_ujian`;

CREATE TABLE `jawaban_peserta_ujian` (
  `id_pertanyaan` varchar(35) NOT NULL,
  `id_ujian` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `template_jawab` text DEFAULT NULL,
  `link_gambar` varchar(250) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT current_timestamp(),
  `nilai_jawab` double DEFAULT NULL,
  `input_jawaban` varchar(100) DEFAULT NULL,
  `output_jawab` text DEFAULT NULL,
  `initial_time` datetime DEFAULT NULL,
  `timer` int(11) DEFAULT NULL,
  `countdown_timer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pertanyaan`,`id_ujian`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `jawaban_peserta_ujian` */

/*Table structure for table `jawaban_quisioner` */

DROP TABLE IF EXISTS `jawaban_quisioner`;

CREATE TABLE `jawaban_quisioner` (
  `id_ujian` varchar(35) DEFAULT NULL,
  `id_survey` varchar(35) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `jawab` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `jawaban_quisioner` */

/*Table structure for table `jawaban_quisioner_json` */

DROP TABLE IF EXISTS `jawaban_quisioner_json`;

CREATE TABLE `jawaban_quisioner_json` (
  `id_ujian` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `json_text` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_ujian`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `jawaban_quisioner_json` */

/*Table structure for table `log_jawaban_peserta_ujian` */

DROP TABLE IF EXISTS `log_jawaban_peserta_ujian`;

CREATE TABLE `log_jawaban_peserta_ujian` (
  `id_pertanyaan` varchar(35) DEFAULT NULL,
  `id_ujian` varchar(35) DEFAULT NULL,
  `username` varchar(35) DEFAULT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `template_jawab` text DEFAULT NULL,
  `link_gambar` varchar(250) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT NULL,
  `nilai_jawab` double DEFAULT NULL,
  `input_jawaban` varchar(100) DEFAULT NULL,
  `output_jawab` text DEFAULT NULL,
  `initial_time` datetime DEFAULT NULL,
  `timer` int(11) DEFAULT NULL,
  `countdown_timer` int(11) DEFAULT NULL,
  `waktu_log` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `log_jawaban_peserta_ujian` */

/*Table structure for table `log_json_test` */

DROP TABLE IF EXISTS `log_json_test`;

CREATE TABLE `log_json_test` (
  `id_ujian` varchar(35) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `json_text` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `log_json_test` */

/*Table structure for table `m_jenis_user` */

DROP TABLE IF EXISTS `m_jenis_user`;

CREATE TABLE `m_jenis_user` (
  `k_jenis_user` varchar(3) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`k_jenis_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `m_jenis_user` */

insert  into `m_jenis_user`(`k_jenis_user`,`content`) values 
('1','Admin'),
('2','Dosen'),
('3','Mahasiswa');

/*Table structure for table `pengguna` */

DROP TABLE IF EXISTS `pengguna`;

CREATE TABLE `pengguna` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `k_jenis_user` varchar(3) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kelas` varchar(100) DEFAULT NULL,
  `jenis_asal_sekolah` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `pengguna` */

insert  into `pengguna`(`username`,`password`,`k_jenis_user`,`nama`,`kelas`,`jenis_asal_sekolah`) values 
('yogi.kur','12345','1','Yogi Kurniwan',NULL,NULL),
('1234567','1234567','3','mhs1','TI A','SMA'),
('12345678','mhs3','3','mhs2',NULL,NULL);

/*Table structure for table `pertanyaan` */

DROP TABLE IF EXISTS `pertanyaan`;

CREATE TABLE `pertanyaan` (
  `id_pertanyaan` varchar(35) NOT NULL,
  `id_ujian` varchar(35) NOT NULL,
  `pertanyaan` text DEFAULT NULL,
  `template_jawab` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT current_timestamp(),
  `username` varchar(60) DEFAULT NULL,
  `link_gambar` varchar(250) DEFAULT NULL,
  `ekspektasi_jawaban` text DEFAULT NULL,
  PRIMARY KEY (`id_pertanyaan`,`id_ujian`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `pertanyaan` */

insert  into `pertanyaan`(`id_pertanyaan`,`id_ujian`,`pertanyaan`,`template_jawab`,`waktu_input`,`username`,`link_gambar`,`ekspektasi_jawaban`) values 
('20200823114043','20200820 115341','Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\n    \n    public static void main(String[] args) {\n        int a=\n        int b=\n        System.out.println(c);\n    }\n    \n}','2020-08-23 11:40:43','yogi.kur',NULL,'15'),
('20200825191637','20200820 115341','Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 19:16:37','yogi.kur',NULL,'{username}');

/*Table structure for table `peserta_ujian` */

DROP TABLE IF EXISTS `peserta_ujian`;

CREATE TABLE `peserta_ujian` (
  `id_ujian` varchar(35) NOT NULL,
  `username_peserta` varchar(60) NOT NULL,
  `total_nilai` double DEFAULT NULL,
  `waktu_start_ujian` datetime DEFAULT NULL,
  `waktu_end_ujian` datetime DEFAULT NULL,
  `waktu_input` datetime DEFAULT NULL,
  `username_input` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_ujian`,`username_peserta`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `peserta_ujian` */

/*Table structure for table `quisioner_ujian` */

DROP TABLE IF EXISTS `quisioner_ujian`;

CREATE TABLE `quisioner_ujian` (
  `id_ujian` varchar(35) NOT NULL,
  `id_survey` varchar(35) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `isRequired` tinyint(1) DEFAULT NULL,
  `minRating` varchar(50) DEFAULT NULL,
  `maxRating` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ujian`,`id_survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `quisioner_ujian` */

insert  into `quisioner_ujian`(`id_ujian`,`id_survey`,`type`,`title`,`isRequired`,`minRating`,`maxRating`) values 
('20200820 115341','1','text','Tuliskan Nama Anda YA',1,'',''),
('20200820 115341','2','radiogroup','Jenis Sekolah',1,NULL,NULL),
('20200820 115341','20200901233307','text','Nama Sekolah SMA/SMK',NULL,NULL,''),
('20200820 115341','4','text','Jurusan Anda di SMA/SMK?',NULL,NULL,NULL),
('20200820 115341','5','text','Kesulitan yang dialami dalam proses instalasi JDK?',NULL,NULL,NULL),
('20200820 115341','6','rating','Menurut anda dari skala 1-5 Seberapa mudah aplikasi ini digunakan',NULL,'Susah','Mudah'),
('20200820 115341','7','rating','Dalam skala 1-5 Seberapa kencang koneksi internet yang anda gunakan untk mengakses aplikasi ini?',NULL,'Lambat','Cepat'),
('20200820 115341','8','comment','Berikan saran anda untuk pengembangan aplikasi ini',NULL,NULL,NULL);

/*Table structure for table `quisioner_ujian_jawab` */

DROP TABLE IF EXISTS `quisioner_ujian_jawab`;

CREATE TABLE `quisioner_ujian_jawab` (
  `id_ujian` varchar(35) NOT NULL,
  `id_survey` varchar(35) NOT NULL,
  `values` varchar(35) NOT NULL,
  `text` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_ujian`,`id_survey`,`values`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `quisioner_ujian_jawab` */

insert  into `quisioner_ujian_jawab`(`id_ujian`,`id_survey`,`values`,`text`) values 
('20200820 115341','2','SMA','SMA'),
('20200820 115341','2','SMK','SMK');

/*Table structure for table `ujian` */

DROP TABLE IF EXISTS `ujian`;

CREATE TABLE `ujian` (
  `id_ujian` varchar(35) NOT NULL,
  `nama_ujian` varchar(100) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `waktu_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `username` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_ujian`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `ujian` */

insert  into `ujian`(`id_ujian`,`nama_ujian`,`tanggal_mulai`,`tanggal_selesai`,`durasi`,`waktu_create`,`username`) values 
('20200820 115341','Ujian Test 2-2','2020-08-21','2020-10-10',2,'2020-09-02 00:57:15','yogi.kur');

/* Procedure structure for procedure `delpengguna` */

/*!50003 DROP PROCEDURE IF EXISTS  `delpengguna` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delpengguna`(
IN inusername varchar(60)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
delete from pengguna 
where `username`=inusername;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `delpertanyaan` */

/*!50003 DROP PROCEDURE IF EXISTS  `delpertanyaan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delpertanyaan`(
IN inid_pertanyaan VARCHAR(35),
IN inid_ujian varchar(35)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
DELETE FROM pertanyaan
WHERE id_pertanyaan=inid_pertanyaan AND id_ujian=inid_ujian;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `delpesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `delpesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delpesertaujian`(
IN inid_ujian varchar(35),
IN inusername_peserta varchar(60)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00000' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 

delete from jawaban_peserta_ujian WHERE id_ujian=inid_ujian AND username=inusername_Peserta;
delete from jawaban_quisioner 	WHERE id_ujian=inid_ujian AND username=inusername_Peserta;
DELETE FROM log_jawaban_peserta_ujian WHERE id_ujian=inid_ujian AND username=inusername_Peserta;
DELETE FROM log_json_test 	WHERE id_ujian=inid_ujian AND username=inusername_Peserta;
DELETE FROM  `jawaban_quisioner_json` 	WHERE id_ujian=inid_ujian AND username=inusername_Peserta;

DELETE FROM peserta_ujian WHERE id_ujian=inid_ujian AND username_Peserta=inusername_Peserta;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `delquisionerujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `delquisionerujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delquisionerujian`(
IN inid_ujian varchar(35),
inid_survey VARCHAR(35)

)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00000' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 

delete from  quisioner_ujian_jawab WHERE id_ujian=inid_ujian AND id_survey=inid_survey;
delete from quisioner_ujian WHERE id_ujian=inid_ujian AND id_survey=inid_survey;

IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `delquisionerujianpilihan` */

/*!50003 DROP PROCEDURE IF EXISTS  `delquisionerujianpilihan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delquisionerujianpilihan`(
IN inid_ujian varchar(35),
in inid_survey VARCHAR(35),
in invalue varchar(35)

)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00000' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 

delete from  quisioner_ujian_jawab where 
id_ujian=inid_ujian and id_survey=inid_survey and `values`=invalue
;


IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `delujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `delujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `delujian`(
IN inid_ujian varchar(35)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00000' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
	
delete from `quisioner_ujian_jawab` WHERE id_ujian=inid_ujian;
delete from `quisioner_ujian`	WHERE id_ujian=inid_ujian;
delete from peserta_ujian WHERE id_ujian=inid_ujian;
delete from ujian WHERE id_ujian=inid_ujian;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `finalquisioner` */

/*!50003 DROP PROCEDURE IF EXISTS  `finalquisioner` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `finalquisioner`(inid_ujian varchar(35), inusername varchar(60))
begin
DECLARE vidsurvey VARCHAR(200);
declare vtitle varchar(200);
declare vjawab varchar(200);
DECLARE exit_loop BOOLEAN; 
DECLARE quisioner_cursor CURSOR FOR  SELECT id_survey,title name FROM  quisioner_ujian where id_ujian= inid_ujian;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
OPEN quisioner_cursor;
quisioner_loop: LOOP
FETCH  quisioner_cursor INTO vidsurvey, vtitle;

SELECT JSON_EXTRACT(json_text,concat('$.',vidsurvey,''))  into vjawab FROM jawaban_quisioner_json
WHERE id_ujian=inid_ujian AND username=inusername;

set vjawab=substr(vjawab,2,length(vjawab)-1);
SET vjawab=SUBSTR(vjawab,1,LENGTH(vjawab)-1);


if not exists(select * from jawaban_quisioner where id_ujian=inid_ujian and id_survey=vidsurvey and username=inusername) then
insert into jawaban_quisioner(id_ujian,id_survey,username,title,jawab)
values(inid_ujian,vidsurvey,inusername,vtitle,vjawab
);
end if;


IF exit_loop THEN
         CLOSE quisioner_cursor;
         LEAVE quisioner_loop;
END IF;
END LOOP quisioner_loop;

end */$$
DELIMITER ;

/* Procedure structure for procedure `flushnilai` */

/*!50003 DROP PROCEDURE IF EXISTS  `flushnilai` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `flushnilai`(IN inid_ujian VARCHAR(45))
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
update jawaban_peserta_ujian dest, (
SELECT id_Pertanyaan,	id_ujian,nama,	username,	
	CASE WHEN CASE 
	WHEN ANALIS_JAWABAN ='1' AND status_jawaban ='Ekskusi Sukses' THEN 'BENAR'
	WHEN ANALIS_JAWABAN ='2'  AND status_jawaban ='Ekskusi Sukses' THEN 'PERLU CHECK BY DOSEN'
	WHEN ANALIS_JAWABAN ='0'  AND status_jawaban ='Ekskusi Sukses' THEN 'SALAH'
	WHEN status_jawaban ='Error' THEN 'SALAH'
	END='BENAR' THEN 100
	 WHEN CASE 
	WHEN ANALIS_JAWABAN ='1' AND status_jawaban ='Ekskusi Sukses' THEN 'BENAR'
	WHEN ANALIS_JAWABAN ='2'  AND status_jawaban ='Ekskusi Sukses' THEN 'PERLU CHECK BY DOSEN'
	WHEN ANALIS_JAWABAN ='0'  AND status_jawaban ='Ekskusi Sukses' THEN 'SALAH'
	WHEN status_jawaban ='Error' THEN 'SALAH'
	END='SALAH' THEN 0
	WHEN CASE 
	WHEN ANALIS_JAWABAN ='1' AND status_jawaban ='Ekskusi Sukses' THEN 'BENAR'
	WHEN ANALIS_JAWABAN ='2'  AND status_jawaban ='Ekskusi Sukses' THEN 'PERLU CHECK BY DOSEN'
	WHEN ANALIS_JAWABAN ='0'  AND status_jawaban ='Ekskusi Sukses' THEN 'SALAH'
	WHEN status_jawaban ='Error' THEN 'SALAH'
	END='PERLU CHECK BY DOSEN' THEN NULL END
	
	AS nilai
  FROM (
SELECT  a.id_Pertanyaan,a.id_ujian,a.username,c.nama,d.nama_ujian, a.pertanyaan,a.jawaban, CASE WHEN a.output_jawab LIKE '%error%' THEN 'Error' ELSE 'Ekskusi Sukses' END AS status_jawaban,
REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '') AS output_jawaban,
CONCAT(
CASE WHEN LENGTH(FLOOR(timer/60))=1 THEN
CONCAT('0',FLOOR(timer/60))
ELSE
FLOOR(timer/60) END
 ,':',
CASE WHEN  LENGTH(MOD(timer,60))=1 THEN
CONCAT('0',MOD(timer,60))
ELSE
MOD(timer,60) END
 ) waktu_pengerjaan ,
 CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END ekspektasi_jawaban,
CASE WHEN 
 CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='1' 
 
 AND 
 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='1' THEN '1'
 WHEN CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='1'  AND 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='0' THEN '2' 
 WHEN  CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='0'  AND 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='1' THEN '2'  
WHEN CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='0'  AND 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='0' THEN '0' 
END AS ANALIS_JAWABAN,a.nilai_jawab,e.jumlah_eksekusi
  FROM jawaban_peserta_ujian a
  LEFT JOIN pertanyaan b ON a.id_pertanyaan=b.id_pertanyaan AND a.id_ujian=b.id_ujian
  LEFT JOIN pengguna c ON a.username=c.username
  LEFT JOIN ujian d ON a.id_ujian=d.id_ujian
  LEFT JOIN (SELECT  id_pertanyaan,id_ujian,username,COUNT(waktu_log)+1 AS jumlah_eksekusi  FROM log_jawaban_peserta_ujian WHERE jawaban IS NOT NULL
GROUP BY id_pertanyaan,id_ujian,username) e ON a.id_ujian=e.id_ujian AND a.id_Pertanyaan=e.id_pertanyaan AND a.username=e.username
WHERE a.id_ujian=inid_ujian
)A
) src set dest.nilai_jawab=src.nilai
where dest.`id_pertanyaan`=src.id_Pertanyaan and dest.`id_ujian`=src.id_ujian
and dest.`username`=src.username;
UPDATE peserta_ujian dest,(SELECT  id_ujian, username,SUM(nilai_jawab)/COUNT(id_pertanyaan) AS total_nilai FROM jawaban_peserta_ujian 
WHERE id_ujian=inid_ujian 
GROUP BY id_ujian, username) src
SET dest.`total_nilai`=src.total_nilai
WHERE dest.`id_ujian`=src.id_ujian AND dest.`username_peserta`=src.username;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
END */$$
DELIMITER ;

/* Procedure structure for procedure `getjawabanpesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getjawabanpesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getjawabanpesertaujian`(
inid_ujian varchar(35),
inid_pertanyaan  VARCHAR(35),
inusername  VARCHAR(45)
)
begin
select  id_pertanyaan,id_ujian,username,no_urut,pertanyaan,template_jawab from jawaban_peserta_ujian
where id_ujian=inid_ujian or inid_ujian='' or inid_ujian='x' or inid_ujian is null
and username=inusername or inusername='' OR inusername='x' OR inusername IS NULL
and id_pertanyaan=inid_pertanyaan or inid_pertanyaan='' OR inid_pertanyaan='x' OR inid_pertanyaan IS NULL
order by no_urut asc;
end */$$
DELIMITER ;

/* Procedure structure for procedure `getlistujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getlistujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getlistujian`(inid_ujian varchar(35),INusername varchar(60))
begin
 select   a.id_ujian,nama_ujian,tanggal_mulai,tanggal_selesai,durasi, coalesce(jumlah_peserta,0) as jumlah_peserta
 from ujian a
 left join ( SELECT  id_ujian,COUNT( username_peserta) AS jumlah_peserta FROM peserta_ujian
 GROUP BY id_ujian) b on a.`id_ujian`=b.id_ujian
 where (a.id_ujian=inid_ujian or inid_ujian='' or inid_ujian='x' or inid_ujian is null)
 and ( a.username=INusername or INusername='' OR INusername='x' OR INusername IS NULL);
 
 end */$$
DELIMITER ;

/* Procedure structure for procedure `getloginstat` */

/*!50003 DROP PROCEDURE IF EXISTS  `getloginstat` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getloginstat`(in inusername varchar(50), IN inpassword varchar(60))
BEGIN
	if exists (select * from pengguna where  `username`=inusername and `password`=inpassword) then
	
	select 1 as status_login;
	else
	SELECT 0 AS status_login;
	
	end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `getpertanyaan` */

/*!50003 DROP PROCEDURE IF EXISTS  `getpertanyaan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getpertanyaan`(inid_ujian varchar(35),inid_pertanyaan varchar(35),inusername varchar(60))
begin
select a.`id_pertanyaan`,a.`id_ujian`,a.`pertanyaan`,a.`template_jawab`,b.`nama_ujian`,link_gambar,a.ekspektasi_jawaban from pertanyaan a
left join ujian b on a.`id_ujian`=b.`id_ujian`
where (a.`id_ujian`=inid_ujian or inid_ujian='' or inid_ujian='x' or inid_ujian is null) 
and (a.`id_pertanyaan`=inid_pertanyaan OR inid_pertanyaan='' OR inid_pertanyaan='x' OR inid_pertanyaan IS NULL)
and (b.username=inusername OR inusername='' OR inusername='x' OR inusername IS NULL)
;
end */$$
DELIMITER ;

/* Procedure structure for procedure `getpesertanoujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getpesertanoujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getpesertanoujian`(inidujian varchar(35))
begin
SELECT a.`username`,a.`nama`,c.`content` AS jenis_user,a.kelas FROM pengguna a
LEFT JOIN peserta_ujian b ON a.`username`=b.`username_peserta` AND b.`id_ujian`=inidujian
LEFT JOIN m_jenis_user c ON a.`k_jenis_user`=c.`k_jenis_user`
WHERE b.`id_ujian` IS NULL and a.k_jenis_user='3';
end */$$
DELIMITER ;

/* Procedure structure for procedure `getpesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getpesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getpesertaujian`(inidujian varchar(35),inusername_peserta varchar(60),inusername varchar(60))
begin
SELECT a.`id_ujian`,c.`nama_ujian` ,a.`username_peserta`,b.`nama`,a.`total_nilai`,
CONCAT(COALESCE(a.`waktu_start_ujian`,''),' s/d ', COALESCE(a.`waktu_end_ujian`,'') )AS waktu_ujian,b.kelas
 FROM peserta_ujian a
LEFT JOIN pengguna b ON a.`username_peserta`=b.`username`
LEFT JOIN ujian c ON a.`id_ujian`=c.`id_ujian`
where 
(a.`id_ujian`=inidujian or inidujian='' or inidujian='x' or inidujian is null)
and (a.`username_peserta`=inusername_peserta oR inusername_peserta='' OR inusername_peserta='x' OR inusername_peserta IS NULL)
AND (c.username=inusername oR inusername='' OR inusername='x' OR inusername IS NULL);
end */$$
DELIMITER ;

/* Procedure structure for procedure `getquisionerpilihan` */

/*!50003 DROP PROCEDURE IF EXISTS  `getquisionerpilihan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getquisionerpilihan`(inid_ujian varchar(35),inid_survey varchar(35))
begin
select   id_ujian,id_survey,`values`,`text` from quisioner_ujian_jawab
where id_ujian=inid_ujian and id_survey=inid_survey;
end */$$
DELIMITER ;

/* Procedure structure for procedure `getquisionerujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getquisionerujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getquisionerujian`(inid_ujian varchar(35),inid_survey varchar(35))
begin
select  id_ujian,id_survey,title,`type`,minrating,maxrating from quisioner_ujian
where 
(id_ujian=inid_ujian or inid_ujian='' or inid_ujian='x' or inid_ujian is null)
and (id_survey= inid_survey OR inid_survey='' OR inid_survey='x' OR inid_survey IS NULL );
end */$$
DELIMITER ;

/* Procedure structure for procedure `getsummaryujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getsummaryujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getsummaryujian`(in inid_ujian varchar(35),in inid_pertanyaan varchar(35), in inusername varchar(45))
begin
select id_Pertanyaan,	id_ujian,nama,	username	,nama_ujian,	pertanyaan,	jawaban,	status_jawaban,	output_jawaban,	waktu_pengerjaan,
	ekspektasi_jawaban,	
	case 
	when ANALIS_JAWABAN ='1' and status_jawaban ='Ekskusi Sukses' then 'BENAR'
	WHEN ANALIS_JAWABAN ='2'  and status_jawaban ='Ekskusi Sukses' THEN 'PERLU CHECK BY DOSEN'
	WHEN ANALIS_JAWABAN ='0'  and status_jawaban ='Ekskusi Sukses' THEN 'SALAH'
	when status_jawaban ='Error' THEN 'SALAH'
	end as CONTENT_ANALIS_JAWAB,ANALIS_JAWABAN,nilai_jawab,coalesce(jumlah_eksekusi,1) as jumlah_eksekusi
  from (
select  a.id_Pertanyaan,a.id_ujian,a.username,c.nama,d.nama_ujian, a.pertanyaan,a.jawaban, case when a.output_jawab like '%error%' then 'Error' else 'Ekskusi Sukses' end as status_jawaban,
REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '') as output_jawaban,
concat(
case when length(floor(timer/60))=1 then
concat('0',FLOOR(timer/60))
else
FLOOR(timer/60) end
 ,':',
case when  length(mod(timer,60))=1 then
concat('0',MOD(timer,60))
else
MOD(timer,60) end
 ) waktu_pengerjaan ,
 case 
 when b.ekspektasi_jawaban='{username}' then a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 else b.ekspektasi_jawaban end ekspektasi_jawaban,
case when 
 case when
 lcase( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) like concat('%',
 REPLACE(REPLACE(lcase(a.output_jawab), '\r', ''), '\n', '')
 ,'%') then '1' else '0' end ='1' 
 
 and 
 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 like concat('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') then '1' else '0' end ='1' then '1'
 when CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='1'  and 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='0' then '2' 
 when  CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='0'  AND 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='1' THEN '2'  
when CASE WHEN
 LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END) LIKE CONCAT('%',
 REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 ,'%') THEN '1' ELSE '0' END ='0'  AND 
 CASE WHEN REPLACE(REPLACE(LCASE(a.output_jawab), '\r', ''), '\n', '')
 LIKE CONCAT('%',LCASE( CASE 
 WHEN b.ekspektasi_jawaban='{username}' THEN a.username
 WHEN b.ekspektasi_jawaban='{nama}' THEN c.nama
 ELSE b.ekspektasi_jawaban END),'%') THEN '1' ELSE '0' END ='0' THEN '0' 
END AS ANALIS_JAWABAN,a.nilai_jawab,e.jumlah_eksekusi
  from jawaban_peserta_ujian a
  left join pertanyaan b on a.id_pertanyaan=b.id_pertanyaan and a.id_ujian=b.id_ujian
  left join pengguna c on a.username=c.username
  left join ujian d on a.id_ujian=d.id_ujian
  left join (SELECT  id_pertanyaan,id_ujian,username,COUNT(waktu_log)+1 AS jumlah_eksekusi  FROM log_jawaban_peserta_ujian where jawaban is not null
GROUP BY id_pertanyaan,id_ujian,username) e on a.id_ujian=e.id_ujian and a.id_Pertanyaan=e.id_pertanyaan and a.username=e.username
where 
    (a.id_ujian=inid_ujian or inid_ujian='' or inid_ujian='x' or inid_ujian is null)
and (a.id_Pertanyaan=inid_pertanyaan or inid_pertanyaan='' or inid_pertanyaan='x' or inid_pertanyaan is null)
and (a.username=inusername or   inusername='' OR inusername='x' OR inusername IS NULL)
 ) A ;
 
 
 end */$$
DELIMITER ;

/* Procedure structure for procedure `getujianpeserta` */

/*!50003 DROP PROCEDURE IF EXISTS  `getujianpeserta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getujianpeserta`(inid_ujian varchar(35),INusername varchar(60))
begin
SELECT distinct  a.id_ujian,nama_ujian,tanggal_mulai,tanggal_selesai,durasi, COALESCE(jumlah_peserta,0) AS jumlah_peserta,
case when current_date between a.tanggal_mulai and a.tanggal_selesai and coalesce(d.is_jawab,'0')='0'  then '1' 
WHEN CURRENT_DATE BETWEEN a.tanggal_mulai AND a.tanggal_selesai AND COALESCE(d.is_jawab,'0')='1'   then '2'
else '0' end as is_enable,c.total_nilai
 FROM ujian a
 LEFT JOIN ( SELECT  id_ujian,COUNT( username_peserta) AS jumlah_peserta FROM peserta_ujian
 GROUP BY id_ujian) b ON a.`id_ujian`=b.id_ujian
 left join peserta_ujian c on a.`id_ujian`=c.`id_ujian`
 left join ( SELECT  id_ujian,username,CASE WHEN is_jawab IS NOT NULL THEN '1' ELSE '0' END AS is_jawab FROM (
 SELECT  id_ujian,username,MAX(jawaban) AS is_jawab FROM jawaban_peserta_ujian
 GROUP BY id_ujian,username
 ) A) d on a.id_ujian=d.id_ujian and d.username=c.username_Peserta
WHERE (a.id_ujian=inid_ujian OR inid_ujian='' OR inid_ujian='x' OR inid_ujian IS NULL)
AND ( c.`username_peserta`=INusername OR INusername='' OR INusername='x' OR INusername IS NULL)
 
 
 ;
 
 end */$$
DELIMITER ;

/* Procedure structure for procedure `getuserinfo` */

/*!50003 DROP PROCEDURE IF EXISTS  `getuserinfo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getuserinfo`(in inusername varchar(60))
begin
select a.`username`,a.`nama`,a.`k_jenis_user`,b.`content` as jenis_user from pengguna a, m_jenis_user b
where a.k_jenis_user=b.k_jenis_user
and a.`username`=inusername
;
end */$$
DELIMITER ;

/* Procedure structure for procedure `getuserinfoall` */

/*!50003 DROP PROCEDURE IF EXISTS  `getuserinfoall` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getuserinfoall`(in inusername varchar(60) ,ink_jenis_user varchar(3))
begin
select a.`username`,a.`nama`,a.`k_jenis_user`,b.`content` as jenis_user,a.kelas,a.jenis_asal_sekolah from pengguna a, m_jenis_user b
where a.k_jenis_user=b.k_jenis_user
and (a.`username`=inusername or inusername='' or inusername='x' or inusername is null)
AND (a.`k_jenis_user`=ink_jenis_user OR ink_jenis_user='' OR ink_jenis_user='x' OR ink_jenis_user IS NULL)
;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insjawabanquisionerjson` */

/*!50003 DROP PROCEDURE IF EXISTS  `insjawabanquisionerjson` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insjawabanquisionerjson`(
IN inid_ujian varchar(35),
inusername VARCHAR(45),
injson_text text

)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
IF NOT EXISTS(SELECT * FROM jawaban_quisioner_json WHERE id_ujian=inid_ujian AND username=inusername) THEN
INSERT INTO jawaban_quisioner_json (id_ujian,username,json_text)
VALUES(inid_ujian,inusername,injson_text);

-- call finalquisioner(inid_ujian, inusername);

ELSE
DELETE FROM jawaban_quisioner_json WHERE id_ujian=inid_ujian AND username=inusername;
delete from jawaban_quisioner  WHERE id_ujian=inid_ujian AND username=inusername;
INSERT INTO jawaban_quisioner_json (id_ujian,username,json_text)
VALUES(inid_ujian,inusername,injson_text);
-- CALL finalquisioner(inid_ujian, inusername);
END IF;


IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `inspesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `inspesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `inspesertaujian`(
IN inid_ujian varchar(35),
IN inusername_peserta varchar(60),
IN inusername_input VARCHAR(60)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
INSERT INTO peserta_ujian (
id_ujian,username_peserta,waktu_input,username_input
) VALUES(
inid_ujian,inusername_peserta,NOW() ,inusername_input
);
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insquisionerujianpilihan` */

/*!50003 DROP PROCEDURE IF EXISTS  `insquisionerujianpilihan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insquisionerujianpilihan`(
IN inid_ujian varchar(35),
in inid_survey VARCHAR(35),
in intext varchar(200)

)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00000' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 

INSERT INTO  quisioner_ujian_jawab (id_ujian,id_survey,`values`,`text` )
VALUES(inid_ujian,inid_survey,REPLACE(REPLACE(REPLACE(CURRENT_TIMESTAMP,'-',''),':',''),' ',''),intext);


IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insupdlogjsontest` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdlogjsontest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdlogjsontest`(
IN inid_ujian VARCHAR(45),
IN inusername VARCHAR(60),
in INjson_text text
)
BEGIN
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
if not exists(select * from log_json_test WHERE  id_ujian=INid_ujian AND username=INusername) then
insert into log_json_test (id_ujian,username,json_text)
values(INid_ujian,INusername,INjson_text);
else
update log_json_test set json_text=INjson_text, waktu_input=now()
where  id_ujian=INid_ujian and username=INusername;
end IF;
update peserta_ujian set waktu_end_ujian=now()
WHERE  id_ujian=INid_ujian AND username_peserta=INusername;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insupdpengguna` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdpengguna` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdpengguna`(
IN inusername varchar(60),
iN inpassword VARCHAR(60),
IN ink_jenis_user VARCHAR(3),
IN innama VARCHAR(100),
IN inkelas varchar(100),
IN injenis_asal_sekolah varchar(20)

)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
if not exists(select * from pengguna WHERE `username`=inusername ) then
INSERT INTO pengguna(`username`,`password`,`k_jenis_user`,`nama`,`kelas`,`jenis_asal_sekolah`)
VALUES(inusername,inpassword,ink_jenis_user,innama,inkelas,injenis_asal_sekolah);
else
update pengguna set `k_jenis_user`=ink_jenis_user,`nama`=innama,`kelas`=inkelas,`jenis_asal_sekolah`=injenis_asal_sekolah
where `username`=inusername;
end if;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insupdpertanyaan` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdpertanyaan` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdpertanyaan`(
IN inid_pertanyaan VARCHAR(35),
IN inid_ujian varchar(35),
IN inpertanyaan text,
IN intemplate_jawab TEXT,
IN inusername varchar(60),
in inekspektasi_jawaban text
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
IF NOT EXISTS(SELECT * FROM pertanyaan WHERE id_pertanyaan=inid_pertanyaan AND id_ujian=inid_ujian) THEN
set inid_pertanyaan=replace(replace(replace(now(),'-',''),':',''),' ','') ;
INSERT INTO pertanyaan(id_pertanyaan, id_ujian, pertanyaan,template_jawab,username,ekspektasi_jawaban)
VALUES (inid_pertanyaan, inid_ujian, inpertanyaan,intemplate_jawab,inusername,inekspektasi_jawaban);
ELSE
UPDATE pertanyaan SET pertanyaan=inpertanyaan , template_jawab=intemplate_jawab,username=inusername,ekspektasi_jawaban=inekspektasi_jawaban
WHERE id_pertanyaan=inid_pertanyaan AND id_ujian=inid_ujian;
END IF;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insupdquisionerujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdquisionerujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdquisionerujian`(
IN inid_ujian varchar(35),
inid_survey VARCHAR(35),
intype VARCHAR(500),
intitle VARCHAR(100),
inminrating VARCHAR(50),
inmaxating VARCHAR(50)

)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
IF NOT EXISTS (SELECT * FROM quisioner_ujian WHERE id_ujian=inid_ujian AND id_survey=inid_survey) THEN
set inid_survey=replace(replace(replace(current_timestamp,'-',''),':',''),' ','');

INSERT INTO quisioner_ujian(id_ujian,id_survey,`type`,title,minRating,maxRating)
VALUES(inid_ujian,inid_survey,intype,intitle,inminrating,inmaxating);

ELSE
UPDATE quisioner_ujian SET `type`=intype,title=intitle,minRating=inminrating,maxRating=inmaxating
WHERE id_ujian=inid_ujian AND id_survey=inid_survey;
END IF;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `insupdujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdujian`(
IN inid_ujian varchar(35),
IN innama_ujian varchar(100),
IN intanggal_mulai date,
IN intanggal_selesai date,
IN indurasi int,
IN inusername varchar(60)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
IF NOT EXISTS (SELECT * FROM ujian WHERE id_ujian=inid_ujian) THEN
set inid_ujian=replace(replace(replace(current_timestamp,'-',''),':',''),' ','');
INSERT INTO ujian (id_ujian,nama_ujian,tanggal_mulai,tanggal_selesai,durasi,username)
VALUES (inid_ujian,innama_ujian,intanggal_mulai,intanggal_selesai,indurasi,inusername);
ELSE
UPDATE ujian SET nama_ujian=innama_ujian
,tanggal_mulai=INtanggal_mulai
,tanggal_selesai=INtanggal_selesai
,durasi=indurasi
,username=INusername
WHERE id_ujian=inid_ujian;
END IF;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `prepareujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `prepareujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `prepareujian`(
in inid_ujian varchar(45),
IN inusername varchar(60)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
if not exists(select * from jawaban_peserta_ujian where id_ujian=inid_ujian and username= inusername   ) then
INSERT INTO jawaban_peserta_ujian ( id_pertanyaan,id_ujian,username,no_urut,pertanyaan,template_jawab,link_gambar)
SELECT id_pertanyaan,id_ujian,inusername username, row_number() over (PARTITION BY id_ujian)AS no_urut,pertanyaan,template_jawab,link_gambar 
FROM pertanyaan
WHERE id_ujian=inid_ujian
;
end if;
update peserta_ujian set waktu_start_ujian=now()
where id_ujian=inid_ujian and username_peserta=inusername;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `resetpesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `resetpesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `resetpesertaujian`(
in inid_ujian varchar(45),
IN inusername varchar(60)
)
begin
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00000' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
delete from log_jawaban_peserta_ujian where id_ujian=inid_ujian and username=inusername;
delete FROM log_json_test where id_ujian=inid_ujian and username=inusername;
delete FROM jawaban_peserta_ujian where id_ujian=inid_ujian and username=inusername;
update `live_oltest`.`peserta_ujian` 
set waktu_start_ujian=null, waktu_end_ujian=null, total_nilai=null
where id_ujian=inid_ujian and username_peserta=inusername;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
end */$$
DELIMITER ;

/* Procedure structure for procedure `updatejawabanpesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatejawabanpesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatejawabanpesertaujian`(
IN inid_ujian VARCHAR(45),
IN inid_pertanyaan VARCHAR(45),
IN inusername VARCHAR(60),
IN injawaban text,
IN ininput_jawaban varchar(100),
IN inoutput_jawab text,
IN ininitial_time datetime,
IN intimer int,
IN incountdown_timer int
)
BEGIN
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	
if exists (select * from jawaban_peserta_ujian WHERE id_ujian=inid_ujian AND id_pertanyaan=id_pertanyaan AND username=inusername and jawaban is not null) then
INSERT INTO `live_oltest`.`log_jawaban_peserta_ujian`
(`id_pertanyaan`,`id_ujian`,`username`,`no_urut`,`pertanyaan`,`template_jawab`,
`link_gambar`,`jawaban`,`waktu_input`,`nilai_jawab`,`input_jawaban`,`output_jawab`,`initial_time`,`timer`,`countdown_timer`,`waktu_log`)
SELECT `id_pertanyaan`,`id_ujian`,`username`,`no_urut`,`pertanyaan`,`template_jawab`,
`link_gambar`,`jawaban`,`waktu_input`,`nilai_jawab`,`input_jawaban`,`output_jawab`,`initial_time`,`timer`,`countdown_timer`,now()
FROM `live_oltest`.`jawaban_peserta_ujian`
WHERE id_ujian=inid_ujian AND id_pertanyaan=inid_pertanyaan AND username=inusername
;
end if;
UPDATE jawaban_peserta_ujian
SET jawaban=injawaban,
input_jawaban=ininput_jawaban,
output_jawab=inoutput_jawab,
initial_time=ininitial_time,
timer=intimer,
countdown_timer=incountdown_timer
WHERE id_ujian=inid_ujian AND id_pertanyaan=inid_pertanyaan AND username=inusername
;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
END */$$
DELIMITER ;

/* Procedure structure for procedure `updatenilaipeserta` */

/*!50003 DROP PROCEDURE IF EXISTS  `updatenilaipeserta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updatenilaipeserta`(
IN inid_ujian VARCHAR(45),
in inid_pertanyaan varchar(35),
IN inusername VARCHAR(60),
in innilai_jawab double
)
BEGIN
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
update jawaban_peserta_ujian set nilai_jawab=innilai_jawab
where id_ujian=inid_ujian and id_pertanyaan=inid_pertanyaan and username=inusername;
UPDATE peserta_ujian dest,(SELECT  id_ujian, username,SUM(nilai_jawab)/COUNT(id_pertanyaan) AS total_nilai FROM jawaban_peserta_ujian 
where id_ujian=inid_ujian AND username=inusername
GROUP BY id_ujian, username) src
SET dest.`total_nilai`=src.total_nilai
WHERE dest.`id_ujian`=src.id_ujian AND dest.`username_peserta`=src.username;
IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;
END */$$
DELIMITER ;

/* Procedure structure for procedure `updpassworduser` */

/*!50003 DROP PROCEDURE IF EXISTS  `updpassworduser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `updpassworduser`(IN `inusername` VARCHAR(60), IN `inpassword` VARCHAR(60))
BEGIN
DECLARE errstate CHAR(5) DEFAULT '00000';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                       	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
        DECLARE CONTINUE HANDLER FOR NOT FOUND                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
        
        UPDATE pengguna SET `password`=inpassword
	WHERE `username`=inusername;
        
        
	IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;        
        
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
