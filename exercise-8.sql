ALTER TABLE Account ADD COLUMN email VARCHAR(255), ADD COLUMN password VARCHAR(40), ADD COLUMN createdOn DATETIME, ADD COLUMN modifiedOn DATETIME;
--Added 4 columns as shown in schema/addressbook_denormalized.png

ALTER TABLE AddressBook ADD COLUMN accountId INT, ADD COLUMN name VARCHAR(255), ADD COLUMN createdOn DATETIME, ADD COLUMN modifiedOn DATETIME;

ALTER TABLE Entry ADD COLUMN addressBookId INT, ADD COLUMN firstName VARCHAR(255), ADD COLUMN lastName VARCHAR(255), ADD COLUMN birthday DATETIME, ADD COLUMN type ENUM('home', 'work', 'other'), ADD COLUMN subtype ENUM('phone', 'address', 'email'), ADD COLUMN contentLineOne VARCHAR(255), ADD COLUMN contentLineTwo VARCHAR(255), ADD COLUMN contentLineThree VARCHAR(255), ADD COLUMN contentLineFour VARCHAR(255), ADD COLUMN contentLineFive VARCHAR(255);