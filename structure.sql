CREATE TABLE IF NOT EXISTS `bookingowner` (
	`BookingOwnerid` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`Title` VARCHAR(6) NOT NULL,
	`Name` VARCHAR(20) NOT NULL,
	`Surname` VARCHAR(50) NOT NULL,
	`Address1` VARCHAR(255) NOT NULL,
	`Address2` VARCHAR(255) NOT NULL,
	`Address3` VARCHAR(255) NOT NULL,
	`Address4` VARCHAR(255) NOT NULL,
	`PostCode` VARCHAR(10) NOT NULL,
	`PhoneNum` VARCHAR(15) NOT NULL,
	`Email` VARCHAR(255) NOT NULL,
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`BookingOwnerid`),
	UNIQUE `bookingowner_email` (`Email`)
) ENGINE = InnoDB CHARACTER SET utf8;

INSERT INTO `bookingowner` (`BookingOwnerid`, `Title`, `Name`, `Surname`, `Address1`, `Address2`, `Address3`, `Address4`, `PostCode`, `PhoneNum`, `Email`) VALUES
(1, 'Miss', 'Lucy', 'Blatherwick', 'TestAdd1', 'TestAdd2', 'TestAdd3', 'TestAdd4', 'TestCode', 'TestPhone', ''),
(2, 'Miss', 'Test2', 'Test2b', 'qwe', 'qwe', 'qwe', 'qwe', 'qwe', '09876124', 'Test@test.com');

CREATE TABLE IF NOT EXISTS `users` (
  `userid` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `surname` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(70) COLLATE utf8_bin NOT NULL,
  `password` char(32) COLLATE utf8_bin NOT NULL,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `users` (`userid`, `name`, `surname`, `email`, `password`) VALUES
(4, 'Lucy', 'Blatherwick', '09lblatherwick@langton.kent.sch.uk', '098f6bcd4621d373cade4e832627b4f6'),
(5, 'Test', 'Test', 'Test', '098f6bcd4621d373cade4e832627b4f6'),
(7, 'Doctor', 'Who', 'who@where.com', '9972778cb1df4f762f69cea1a3ed07f5');

--
-- Has a foreign key!
--

CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `TimeStart` time DEFAULT NULL,
  `TimeFinish` time DEFAULT NULL,
  `BookingType` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `Rooms` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `EquipmentNotes` text COLLATE utf8_bin,
  `Date` date DEFAULT NULL,
  `userid` INT UNSIGNED NOT NULL,
  `bookingOwnerid` INT UNSIGNED NOT NULL,
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookingid`),
  FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (`bookingOwnerid`) REFERENCES `bookingowner` (`BookingOwnerid`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

INSERT INTO `booking` (`bookingid`, `TimeStart`, `TimeFinish`, `BookingType`, `Rooms`, `EquipmentNotes`, `Date`, `userid`, `bookingOwnerid`) VALUES
(1, '12:30:00', '13:30:00', 'Party', 'Small Hall', 0x5461626c657320616e642050726f6a6563746f72, '2015-03-08', 4, 1);



--			MAY NOT WORK.


CREATE TABLE IF NOT EXISTS `days` (
	`DAYid` INT UNSIGNED AUTO_INCREMENT NOT NULL,
	`Date` date NOT NULL,
	`'09:00'` VARCHAR(20) DEFAULT NULL,
	`'09:30'` VARCHAR(20) DEFAULT NULL,
	`'10:00'` VARCHAR(20) DEFAULT NULL,
	`'10:30'` VARCHAR(20) DEFAULT NULL,
	`'11:00'` VARCHAR(20) DEFAULT NULL,
	`'11:30'` VARCHAR(20) DEFAULT NULL,
	`'12:00'` VARCHAR(20) DEFAULT NULL,
	`'12:30'` VARCHAR(20) DEFAULT NULL,
	`'13:00'` VARCHAR(20) DEFAULT NULL,
	`'13:30'` VARCHAR(20) DEFAULT NULL,
	`'14:00'` VARCHAR(20) DEFAULT NULL,
	`'14:30'` VARCHAR(20) DEFAULT NULL,
	`'15:00'` VARCHAR(20) DEFAULT NULL,
	`'15:30'` VARCHAR(20) DEFAULT NULL,
	`'16:00'` VARCHAR(20) DEFAULT NULL,
	`'16:30'` VARCHAR(20) DEFAULT NULL,
	`'17:00'` VARCHAR(20) DEFAULT NULL,
	`'17:30'` VARCHAR(20) DEFAULT NULL,
	`'18:00'` VARCHAR(20) DEFAULT NULL,
	`'18:30'` VARCHAR(20) DEFAULT NULL,
	`'19:00'` VARCHAR(20) DEFAULT NULL,
	`'19:30'` VARCHAR(20) DEFAULT NULL,
	`'20:00'` VARCHAR(20) DEFAULT NULL,
	`'20:30'` VARCHAR(20) DEFAULT NULL,
	`'21:00'` VARCHAR(20) DEFAULT NULL,
	`'21:30'` VARCHAR(20) DEFAULT NULL,
	`'22:00'` VARCHAR(20) DEFAULT NULL,
	`'22:30'` VARCHAR(20) DEFAULT NULL,
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`DAYid`),
	UNIQUE `days_date` (`Date`),
	FOREIGN KEY (`'09:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'09:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'10:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'10:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'11:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'11:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'12:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'12:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'13:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'13:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'14:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'14:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'15:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'15:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'16:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'16:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'17:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'17:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'18:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'18:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'19:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'19:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'20:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'20:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'21:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'21:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'22:00'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE,
	--FOREIGN KEY (`'22:30'`) REFERENCES `booking` (`bookingid`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = InnoDB CHARACTER SET utf8;