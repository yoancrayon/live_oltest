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

insert  into `jawaban_peserta_ujian`(`id_pertanyaan`,`id_ujian`,`username`,`no_urut`,`pertanyaan`,`template_jawab`,`link_gambar`,`jawaban`,`waktu_input`,`nilai_jawab`,`input_jawaban`,`output_jawab`,`initial_time`,`timer`,`countdown_timer`) values 
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:4: error: \';\' expected\n        int a=5\n               ^\n1 error\n','2020-08-31 00:42:44',6,113),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\nprint (\"1234567\");\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:4: error: cannot find symbol\nprint (\"1234567\");\n^\n  symbol:   method print(String)\n  location: class Main\n1 error\n','2020-08-31 00:42:53',13,98);

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

insert  into `log_jawaban_peserta_ujian`(`id_pertanyaan`,`id_ujian`,`username`,`no_urut`,`pertanyaan`,`template_jawab`,`link_gambar`,`jawaban`,`waktu_input`,`nilai_jawab`,`input_jawaban`,`output_jawab`,`initial_time`,`timer`,`countdown_timer`,`waktu_log`) values 
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-26 22:17:58',20,1779,'2020-08-26 22:19:07'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n\r\n    \r\n\r\n    public static void main(String[] args) {\r\n\r\n        int a=5;\r\n\r\n        int b=10;\r\n\r\n        int c=a+b;\r\n\r\n        System.out.println(c);\r\n\r\n    }\r\n\r\n    \r\n\r\n}','2020-08-25 21:37:42',NULL,'','15\r\n','2020-08-26 22:17:58',20,1779,'2020-08-26 22:26:18'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n\r\n    \r\n\r\n    public static void main(String[] args) {\r\n\r\n        int a=5;\r\n\r\n        int b=10;\r\n\r\n        int c=a+b\r\n\r\n        System.out.println(c);\r\n\r\n    }\r\n\r\n    \r\n\r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: \';\' expected\n        int c=a+b\n                 ^\n1 error\n','2020-08-26 22:17:58',418,1381,'2020-08-26 22:29:54'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: \';\' expected\n        int c=a+b\n                 ^\n1 error\n','2020-08-26 22:17:58',686,1113,'2020-08-26 22:30:50'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: \';\' expected\n        int c=a+b\n                 ^\n1 error\n','2020-08-26 22:17:58',741,1058,'2020-08-26 22:31:16'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: \';\' expected\n        int c=a+b\n                 ^\n1 error\n','2020-08-26 22:17:58',768,1031,'2020-08-26 22:31:29'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,NULL,'2020-08-25 21:37:42',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-26 22:32:09'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nSystem.out.println(\"0810680064\");\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','0810680064\n','2020-08-26 22:31:47',23,978,'2020-08-26 22:32:41'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-26 22:17:58',780,1019,'2020-08-26 22:35:14'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-26 22:34:53',20,1779,'2020-08-28 18:47:18'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-28 18:46:57',20,1779,'2020-08-28 18:49:55'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 18:49:48',6,1793,'2020-08-28 18:51:51'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: cannot find symbol\n        System.out.println(c);\n                           ^\n  symbol:   variable c\n  location: class Main\n1 error\n','2020-08-28 18:51:40',10,1789,'2020-08-28 18:54:10'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-28 18:51:40',146,1650,'2020-08-28 18:56:42'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=5;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-28 18:56:27',15,1784,'2020-08-28 20:45:52'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: cannot find symbol\n        System.out.println(c);\n                           ^\n  symbol:   variable c\n  location: class Main\n1 error\n','2020-08-28 20:45:42',9,1790,'2020-08-28 20:47:11'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: cannot find symbol\n        System.out.println(c);\n                           ^\n  symbol:   variable c\n  location: class Main\n1 error\n','2020-08-28 20:47:03',7,1792,'2020-08-28 20:47:23'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: cannot find symbol\n        System.out.println(c);\n                           ^\n  symbol:   variable c\n  location: class Main\n1 error\n','2020-08-28 20:47:03',19,1780,'2020-08-28 20:47:59'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 20:47:55',4,1795,'2020-08-28 20:48:18'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nSystem.out.println(\"0810680064\")\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \';\' expected\nSystem.out.println(\"0810680064\")\n                                ^\n1 error\n','2020-08-26 22:31:47',53,948,'2020-08-28 20:48:50'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 20:47:55',22,1777,'2020-08-28 21:30:02'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:17:59',719,1079,'2020-08-28 21:30:02'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:17:59',720,1078,'2020-08-28 21:31:51'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:31:47',3,1796,'2020-08-28 21:35:46'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:35:43',3,1796,'2020-08-28 21:36:27'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:36:24',2,1797,'2020-08-28 21:38:58'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=ewrwer\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:4: error: \';\' expected\n        int a=ewrwer\n                    ^\n1 error\n','2020-08-28 21:38:51',6,1793,'2020-08-28 21:40:03'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:40:00',2,1797,'2020-08-28 21:40:25'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:40:21',3,1796,'2020-08-28 21:43:24'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:43:22',2,1797,'2020-08-28 21:44:21'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:44:13',7,1792,'2020-08-28 21:46:34'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:46:30',4,1795,'2020-08-28 21:48:43'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:48:38',4,1795,'2020-08-28 21:50:37'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:50:33',3,1796,'2020-08-28 21:51:51'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-28 21:51:49',2,1797,'2020-08-28 23:37:34'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','','2020-08-28 20:48:46',5,1744,'2020-08-28 23:38:00'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=5;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-28 23:37:17',17,102,'2020-08-28 23:40:17'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=5;\r\n        int c=a+b\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: \';\' expected\n        int c=a+b\n                 ^\n1 error\n','2020-08-28 23:39:53',23,96,'2020-08-28 23:40:29'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nSystem.out.println(\"0810680064\");\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','0810680064\n','2020-08-28 23:37:40',20,76,'2020-08-28 23:40:54'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=5;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-28 23:39:53',35,84,'2020-08-30 22:22:38'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nSystem.out.println(\"0810680064\");\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','0810680064\n','2020-08-28 23:40:33',21,59,'2020-08-30 22:23:06'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=5;\r\n        int b=10;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-30 22:22:20',17,102,'2020-08-30 22:27:58'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nSystem.out.printf(\"0810680064\");\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','0810680064','2020-08-30 22:22:42',24,74,'2020-08-30 22:28:04'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-30 22:27:54',3,116,'2020-08-30 22:29:45'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','','2020-08-30 22:28:01',3,109,'2020-08-30 22:29:52'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-30 22:29:43',2,117,'2020-08-30 22:34:59'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\nasd\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:4: error: not a statement\nasd\n^\nMain.java:4: error: \';\' expected\nasd\n   ^\n2 errors\n','2020-08-30 22:29:48',4,110,'2020-08-30 22:35:06'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-30 22:34:54',4,115,'2020-08-30 22:37:08'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nasdas\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: not a statement\nasdas\n^\nMain.java:5: error: \';\' expected\nasdas\n     ^\n2 errors\n','2020-08-30 22:35:01',5,108,'2020-08-30 22:37:15'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=asdasd\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:4: error: \';\' expected\n        int a=asdasd\n                    ^\n1 error\n','2020-08-30 22:37:03',4,115,'2020-08-30 22:51:26'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\nzcadas\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: not a statement\nzcadas\n^\nMain.java:6: error: \';\' expected\nzcadas\n      ^\n2 errors\n','2020-08-30 22:37:10',4,108,'2020-08-30 22:51:39'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-30 22:51:22',4,115,'2020-08-30 22:53:44'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\nasdasd\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: not a statement\nasdasd\n^\nMain.java:5: error: \';\' expected\nasdasd\n      ^\n2 errors\n','2020-08-30 22:51:34',5,103,'2020-08-30 22:53:52'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','Main.java:5: error: \'.class\' expected\n        int b=\n            ^\n1 error\n','2020-08-30 22:53:41',3,116,'2020-08-30 23:30:00'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\nasdasd\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','Main.java:6: error: not a statement\nasdasd\n^\nMain.java:6: error: \';\' expected\nasdasd\n      ^\n2 errors\n','2020-08-30 22:53:47',5,109,'2020-08-30 23:30:22'),
('20200823114043','20200820 115341','1234567',1,'Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.','public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=\r\n        int b=\r\n        System.out.println(c);\r\n    }\r\n    \r\n}',NULL,'public class Main {\r\n    \r\n    public static void main(String[] args) {\r\n        int a=10;\r\n        int b=5;\r\n        int c=a+b;\r\n        System.out.println(c);\r\n    }\r\n    \r\n}','2020-08-25 21:37:42',NULL,'','15\n','2020-08-30 23:29:35',24,95,'2020-08-31 00:42:50'),
('20200825191637','20200820 115341','1234567',2,'Print nim anda:','public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n\n\n\n	//baris bawah jangan dihapus\n	}\n}',NULL,'public class Main {\n	public static void main(String[] args) {\n	//baris atas jangan dihapus\n    System.out.println(\"1234567\");\n\n\n	//baris bawah jangan dihapus\n	}\n}','2020-08-25 21:37:42',NULL,'','1234567\n','2020-08-30 23:30:03',19,73,'2020-08-31 00:43:05');

/*Table structure for table `log_json_test` */

DROP TABLE IF EXISTS `log_json_test`;

CREATE TABLE `log_json_test` (
  `id_ujian` varchar(35) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `json_text` text DEFAULT NULL,
  `waktu_input` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

/*Data for the table `log_json_test` */

insert  into `log_json_test`(`id_ujian`,`username`,`json_text`,`waktu_input`) values 
('20200820 115341','1234567','[{\"id_pertanyaan\":\"20200823114043\",\"id_ujian\":\"20200820 115341\",\"username\":\"1234567\",\"no_urut\":\"1\",\"pertanyaan\":\"Buat penambahan dari variabel integer A dengan nilai 5 dan integer B dengan nilai 10. Simpan dalam variable integer C kemudian tampilkan hasil perhitungan tersebut.\",\"template_jawab\":\"public class Main {\\r\\n    \\r\\n    public static void main(String[] args) {\\r\\n        int a=\\r\\n        int b=\\r\\n        System.out.println(c);\\r\\n    }\\r\\n    \\r\\n}\",\"initialtime\":\"2020-08-30T17:42:44.548Z\",\"counter\":8,\"is_simpan\":true,\"jawaban\":\"public class Main {\\r\\n    \\r\\n    public static void main(String[] args) {\\r\\n        int a=5\\r\\n        int b=\\r\\n        System.out.println(c);\\r\\n    }\\r\\n    \\r\\n}\",\"inputjawaban\":\"\",\"outputjawab\":\"Main.java:4: error: \';\' expected\\n        int a=5\\n               ^\\n1 error\\n\",\"timer\":6,\"countdown_timer\":113,\"logjawab\":[{\"jawaban\":\"public class Main {\\r\\n    \\r\\n    public static void main(String[] args) {\\r\\n        int a=5\\r\\n        int b=\\r\\n        System.out.println(c);\\r\\n    }\\r\\n    \\r\\n}\",\"inputjawaban\":\"\",\"outputjawab\":\"Main.java:4: error: \';\' expected\\n        int a=5\\n               ^\\n1 error\\n\",\"timer\":6,\"countdown_timer\":113}]},{\"id_pertanyaan\":\"20200825191637\",\"id_ujian\":\"20200820 115341\",\"username\":\"1234567\",\"no_urut\":\"2\",\"pertanyaan\":\"Print nim anda:\",\"template_jawab\":\"public class Main {\\n\\tpublic static void main(String[] args) {\\n\\t//baris atas jangan dihapus\\n\\n\\n\\n\\t//baris bawah jangan dihapus\\n\\t}\\n}\",\"is_simpan\":true,\"initialtime\":\"2020-08-30T17:42:53.068Z\",\"counter\":0,\"jawaban\":\"public class Main {\\n\\tpublic static void main(String[] args) {\\n\\t//baris atas jangan dihapus\\nprint (\\\"1234567\\\");\\n\\n\\n\\t//baris bawah jangan dihapus\\n\\t}\\n}\",\"inputjawaban\":\"\",\"outputjawab\":\"Main.java:4: error: cannot find symbol\\nprint (\\\"1234567\\\");\\n^\\n  symbol:   method print(String)\\n  location: class Main\\n1 error\\n\",\"timer\":13,\"countdown_timer\":98,\"logjawab\":[{\"jawaban\":\"public class Main {\\n\\tpublic static void main(String[] args) {\\n\\t//baris atas jangan dihapus\\nprint (\\\"1234567\\\");\\n\\n\\n\\t//baris bawah jangan dihapus\\n\\t}\\n}\",\"inputjawaban\":\"\",\"outputjawab\":\"Main.java:4: error: cannot find symbol\\nprint (\\\"1234567\\\");\\n^\\n  symbol:   method print(String)\\n  location: class Main\\n1 error\\n\",\"timer\":13,\"countdown_timer\":98}]}]','2020-08-31 00:43:09');

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

insert  into `peserta_ujian`(`id_ujian`,`username_peserta`,`total_nilai`,`waktu_start_ujian`,`waktu_end_ujian`,`waktu_input`,`username_input`) values 
('20200820 115341','1234567',NULL,'2020-08-31 00:42:41','2020-08-31 00:43:09','2020-08-25 18:58:50','yogi.kur'),
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
('20200820 115341','Ujian Test 2-2','2020-08-21','2020-08-25',2,'2020-08-28 23:35:53','yogi.kur');

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
	end as CONTENT_ANALIS_JAWAB,ANALIS_JAWABAN,nilai_jawab
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
END AS ANALIS_JAWABAN,a.nilai_jawab
  from jawaban_peserta_ujian a
  left join pertanyaan b on a.id_pertanyaan=b.id_pertanyaan and a.id_ujian=b.id_ujian
  left join pengguna c on a.username=c.username
  left join ujian d on a.id_ujian=d.id_ujian
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
