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

/*Table structure for table `m_jenis_user` */

DROP TABLE IF EXISTS `m_jenis_user`;

CREATE TABLE `m_jenis_user` (
  `k_jenis_user` varchar(3) NOT NULL,
  `content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`k_jenis_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pengguna` */

insert  into `pengguna`(`username`,`password`,`k_jenis_user`,`nama`) values 
('yogi.kur','12345','1','Yogi Kurniwan');

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

/* Procedure structure for procedure `insupdpengguna` */

/*!50003 DROP PROCEDURE IF EXISTS  `insupdpengguna` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdpengguna`(
IN inusername varchar(60),
iN npassword VARCHAR(60),
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

update pengguna set `password`=inpassword,`k_jenis_user`=ink_jenis_user,`nama`=innama
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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
