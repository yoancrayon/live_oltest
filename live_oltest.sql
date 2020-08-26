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
  PRIMARY KEY (`id_pertanyaan`,`id_ujian`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `jawaban_peserta_ujian` */

insert  into `jawaban_peserta_ujian`(`id_pertanyaan`,`id_ujian`,`username`,`no_urut`,`pertanyaan`,`template_jawab`,`link_gambar`,`jawaban`,`waktu_input`,`nilai_jawab`) values 
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,NULL,'2020-08-25 21:37:42',NULL),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,NULL,'2020-08-25 21:37:42',NULL);

/*Table structure for table `log_jawaban_peserta_ujian` */

DROP TABLE IF EXISTS `log_jawaban_peserta_ujian`;

CREATE TABLE `log_jawaban_peserta_ujian` (
  `id_pertanyaan` varchar(35) NOT NULL,
  `id_ujian` varchar(35) NOT NULL,
  `username` varchar(35) NOT NULL,
  `no_urut` int(11) DEFAULT NULL,
  `pertanyaan` text DEFAULT NULL,
  `template_jawab` text DEFAULT NULL,
  `link_gambar` varchar(250) DEFAULT NULL,
  `jawaban` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT NULL,
  `nilai_jawab` double DEFAULT NULL,
  `waktu_log` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_pertanyaan`,`id_ujian`,`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `log_jawaban_peserta_ujian` */

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
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `pengguna` */

insert  into `pengguna`(`username`,`password`,`k_jenis_user`,`nama`,`kelas`) values 
('yogi.kur','12345','1','Yogi Kurniwan',NULL),
('1234567','1234567','3','mhs1',NULL),
('12345678','mhs3','3','mhs2',NULL);

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
  PRIMARY KEY (`id_pertanyaan`,`id_ujian`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `pertanyaan` */

insert  into `pertanyaan`(`id_pertanyaan`,`id_ujian`,`pertanyaan`,`template_jawab`,`waktu_input`,`username`,`link_gambar`) values 
('20200823114043','20200820 115341','Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-23 11:40:43','yogi.kur',NULL),
('20200825191637','20200820 115341','Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 19:16:37','yogi.kur',NULL);

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

insert  into `peserta_ujian`(`id_ujian`,`username_peserta`,`total_nilai`,`waktu_start_ujian`,`waktu_end_ujian`,`waktu_input`,`username_input`) values 
('20200820 115341','1234567',NULL,NULL,NULL,'2020-08-25 18:58:50','yogi.kur'),
('20200820 115341','12345678',NULL,NULL,NULL,'2020-08-25 18:58:50','yogi.kur');

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
('20200820 115341','Ujian Test 2-2','2020-08-21','2020-08-25',30,'2020-08-24 22:37:53','yogi.kur');

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
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	


DELETE FROM peserta_ujian WHERE id_ujian=inid_ujian AND username_Peserta=inusername_Peserta;

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
        SET errstate = '00001' ;     
        DECLARE CONTINUE HANDLER FOR SQLWARNING                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00002';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
        DECLARE CONTINUE HANDLER FOR SQLEXCEPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
        SET errstate = '00003';
        SET AUTOCOMMIT=0;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
        START TRANSACTION; 
	


if exists (select * from peserta_ujian where id_ujian=inid_ujian) then
delete from peserta_ujian WHERE id_ujian=inid_ujian;
end if;

delete from ujian 
WHERE id_ujian=inid_ujian;



IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;


end */$$
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
select a.`id_pertanyaan`,a.`id_ujian`,a.`pertanyaan`,a.`template_jawab`,b.`nama_ujian`,link_gambar from pertanyaan a
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
SELECT a.`username`,a.`nama`,c.`content` AS jenis_user FROM pengguna a
LEFT JOIN peserta_ujian b ON a.`username`=b.`username_peserta` AND b.`id_ujian`=inidujian
LEFT JOIN m_jenis_user c ON a.`k_jenis_user`=c.`k_jenis_user`
WHERE b.`id_ujian` IS NULL;
end */$$
DELIMITER ;

/* Procedure structure for procedure `getpesertaujian` */

/*!50003 DROP PROCEDURE IF EXISTS  `getpesertaujian` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getpesertaujian`(inidujian varchar(35),inusername_peserta varchar(60),inusername varchar(60))
begin
SELECT a.`id_ujian`,c.`nama_ujian` ,a.`username_peserta`,b.`nama`,a.`total_nilai`,
CONCAT(COALESCE(a.`waktu_start_ujian`,''),' s/d ', COALESCE(a.`waktu_end_ujian`,'') )AS waktu_ujian

 FROM peserta_ujian a
LEFT JOIN pengguna b ON a.`username_peserta`=b.`username`
LEFT JOIN ujian c ON a.`id_ujian`=c.`id_ujian`
where 
(a.`id_ujian`=inidujian or inidujian='' or inidujian='x' or inidujian is null)
and (a.`username_peserta`=inusername_peserta oR inusername_peserta='' OR inusername_peserta='x' OR inusername_peserta IS NULL)
AND (c.username=inusername oR inusername='' OR inusername='x' OR inusername IS NULL);
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
else '0' end as is_enable

 FROM ujian a
 LEFT JOIN ( SELECT  id_ujian,COUNT( username_peserta) AS jumlah_peserta FROM peserta_ujian
 GROUP BY id_ujian) b ON a.`id_ujian`=b.id_ujian
 left join peserta_ujian c on a.`id_ujian`=c.`id_ujian`
 left join ( SELECT  id_ujian,username,CASE WHEN is_jawab IS NOT NULL THEN '1' ELSE '0' END AS is_jawab FROM (
 SELECT  id_ujian,username,MAX(jawaban) AS is_jawab FROM jawaban_peserta_ujian
 GROUP BY id_ujian,username
 ) A) d on a.id_ujian=d.id_ujian and a.username=c.username_Peserta
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
select a.`username`,a.`nama`,a.`k_jenis_user`,b.`content` as jenis_user from pengguna a, m_jenis_user b
where a.k_jenis_user=b.k_jenis_user
and (a.`username`=inusername or inusername='' or inusername='x' or inusername is null)
AND (a.`k_jenis_user`=ink_jenis_user OR ink_jenis_user='' OR ink_jenis_user='x' OR ink_jenis_user IS NULL)

;

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

/* Procedure structure for procedure `insupdpengguna` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdpengguna` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdpengguna`(
IN inusername varchar(60),
iN inpassword VARCHAR(60),
IN ink_jenis_user VARCHAR(3),
IN innama VARCHAR(100)



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
INSERT INTO pengguna(`username`,`password`,`k_jenis_user`,`nama`)
VALUES(inusername,inpassword,ink_jenis_user,innama);
else

update pengguna set `k_jenis_user`=ink_jenis_user,`nama`=innama
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
	


IF NOT EXISTS(SELECT * FROM pertanyaan WHERE id_pertanyaan=inid_pertanyaan AND id_ujian=inid_ujian) THEN
set inid_pertanyaan=replace(replace(replace(now(),'-',''),':',''),' ','') ;
INSERT INTO pertanyaan(id_pertanyaan, id_ujian, pertanyaan,template_jawab,username)
VALUES (inid_pertanyaan, inid_ujian, inpertanyaan,intemplate_jawab,inusername);

ELSE
UPDATE pertanyaan SET pertanyaan=inpertanyaan , template_jawab=intemplate_jawab,username=inusername
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
ORDER BY RAND();
end if;

IF errstate='00000' THEN 
	COMMIT; 
	ELSE         
	ROLLBACK;
	END IF;       
	SELECT errstate;


end */$$
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
