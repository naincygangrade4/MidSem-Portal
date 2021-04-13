/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.0.24-community-nt : Database - quiz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`quiz` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `quiz`;

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `qid` int(11) NOT NULL auto_increment,
  `course` varchar(20) default NULL,
  `subject` varchar(30) default NULL,
  `name` varchar(30) default NULL,
  `question` varchar(250) default NULL,
  `opta` varchar(250) default NULL,
  `optb` varchar(250) default NULL,
  `optc` varchar(250) default NULL,
  `optd` varchar(250) default NULL,
  `ca` varchar(250) default NULL,
  PRIMARY KEY  (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question` */

insert  into `question`(`qid`,`course`,`subject`,`name`,`question`,`opta`,`optb`,`optc`,`optd`,`ca`) values (1,'Engineering','Java','Quiz 1','why java is so popular?','high level pl','low level pl','follow oops concept','both a & c','both a & c'),(2,'Engineering','Java','Quiz 1','Which class cannot be subclassed (or extended) in java?','abstract class','final class','parent class','none of the above','final class'),(3,'Engineering','Java','Quiz 1','who create java?','dennis ritchi','van der russum','james gosling','Bill Gates','james gosling'),(4,'Engineering','Java','Quiz 1','what is the current logo of java?','coffee beans','apple','oak tree','camel','coffee beans');

/*Table structure for table `quiz` */

DROP TABLE IF EXISTS `quiz`;

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL auto_increment,
  `tname` varchar(30) default NULL,
  `course` varchar(20) default NULL,
  `subject` varchar(30) default NULL,
  `name` varchar(30) default NULL,
  `duration` varchar(30) default NULL,
  `passmark` varchar(30) default NULL,
  `status` varchar(30) default 'inactive',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `quiz` */

insert  into `quiz`(`id`,`tname`,`course`,`subject`,`name`,`duration`,`passmark`,`status`) values (1,'md','Engineering','Java','Quiz 1','30','6','active'),(1000,'md','MCA','C++','Quiz 1','30','6','inactive'),(1001,'md','MCA','C','Quiz 1','20','6','inactive'),(1002,'md','MCA','Java','Quiz 1','30','6','active'),(1003,'mohammed','Engineering','Java','Quiz 3','30','6','inactive'),(1004,'mohammed','MCA','Computer Networking','Quiz 1','30','6','inactive');

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` varchar(30) default NULL,
  `email` varchar(40) default NULL,
  `course` varchar(40) default NULL,
  `subject` varchar(40) default NULL,
  `name` varchar(40) default NULL,
  `marks` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `result` */

insert  into `result`(`id`,`email`,`course`,`subject`,`name`,`marks`) values ('101','mohammedlala5253@gmail.com','Engineering','Java','Quiz 1',3),('101','mohammedlala5253@gmail.com','Engineering','Java','Quiz 2',7),('101','mohammedlala5253@gmail.com','Engineering','Java','Quiz 3',10);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` varchar(30) default NULL,
  `name` varchar(30) default NULL,
  `email` varchar(40) default NULL,
  `pwd` varchar(30) default NULL,
  `number` varchar(30) default NULL,
  `sem` varchar(20) default NULL,
  `status` varchar(10) default 'pending',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`id`,`name`,`email`,`pwd`,`number`,`sem`,`status`) values ('101','Mohammed','mohammedlala5253@gmail.com','12345','9834567888','5th','confirm'),('MCA/10023/16','Aditi Athalye','13aditiathalye.595@gmail.com','12345','2343573985','6th','confirm'),('103','archana','archanabhokre20@gmail.com','12345','237873455','8th','pending'),('105','karan gujrati','karan.010896@gmail.com','12345','9826038261','8th','pending');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` varchar(30) default NULL,
  `name` varchar(30) default NULL,
  `email` varchar(40) default NULL,
  `pwd` varchar(30) default NULL,
  `number` varchar(30) default NULL,
  `subject` varchar(30) default NULL,
  `status` varchar(10) default 'pending',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`name`,`email`,`pwd`,`number`,`subject`,`status`) values ('101','mohammed','mohammedlala5253@gmail.com','12345','98764234','Java','confirm');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
