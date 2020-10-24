-- -------------------------------------------------------------
-- TablePlus 3.5.3(314)
--
-- https://tableplus.com/
--
-- Database: upwork
-- Generation Time: 2020-10-23 17:32:52.4120
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `newsupdate` (
  `NewsID` int NOT NULL AUTO_INCREMENT,
  `Date-UTC` datetime(6) NOT NULL,
  `ReferenceLinkTimezone` varchar(255) NOT NULL,
  `Heading` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Reference` varchar(255) NOT NULL,
  `TagCategorization` longtext NOT NULL,
  `PrimaryTag` varchar(255) NOT NULL,
  `Industry` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  `TimelineQualifier` varchar(255) NOT NULL,
  `Similarnewsid` longtext NOT NULL,
  `NewsStatus` varchar(255) NOT NULL,
  `Updatedby` varchar(255) NOT NULL,
  PRIMARY KEY (`NewsID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;