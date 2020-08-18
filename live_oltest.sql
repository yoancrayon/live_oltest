-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2020 at 08:30 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `live_oltest`
--
CREATE DATABASE IF NOT EXISTS `live_oltest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `live_oltest`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delpengguna` (IN `inusername` VARCHAR(60))  begin
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


end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getloginstat` (IN `inusername` VARCHAR(50), IN `inpassword` VARCHAR(60))  BEGIN


	if exists (select * from pengguna where  `username`=inusername and `password`=inpassword) then
	
	select 1 as status_login;
	else
	SELECT 0 AS status_login;
	
	end if;



	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getuserinfo` (IN `inusername` VARCHAR(60))  begin
select a.`username`,a.`nama`,a.`k_jenis_user`,b.`content` as jenis_user from pengguna a, m_jenis_user b
where a.k_jenis_user=b.k_jenis_user
and a.`username`=inusername
;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getuserinfoall` (IN `inusername` VARCHAR(60), `ink_jenis_user` VARCHAR(3))  begin
select a.`username`,a.`nama`,a.`k_jenis_user`,b.`content` as jenis_user from pengguna a, m_jenis_user b
where a.k_jenis_user=b.k_jenis_user
and (a.`username`=inusername or inusername='' or inusername='x' or inusername is null)
AND (a.`k_jenis_user`=ink_jenis_user OR ink_jenis_user='' OR ink_jenis_user='x' OR ink_jenis_user IS NULL)

;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insupdpengguna` (IN `inusername` VARCHAR(60), IN `inpassword` VARCHAR(60), IN `ink_jenis_user` VARCHAR(3), IN `innama` VARCHAR(100))  begin
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


end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `m_jenis_user`
--

CREATE TABLE `m_jenis_user` (
  `k_jenis_user` varchar(3) NOT NULL,
  `content` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_jenis_user`
--

INSERT INTO `m_jenis_user` (`k_jenis_user`, `content`) VALUES
('1', 'Admin'),
('2', 'Dosen'),
('3', 'Mahasiswa');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `username` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `k_jenis_user` varchar(3) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`, `k_jenis_user`, `nama`) VALUES
('yogi.kur', '12345', '1', 'Yogi Kurniwan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `m_jenis_user`
--
ALTER TABLE `m_jenis_user`
  ADD PRIMARY KEY (`k_jenis_user`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
