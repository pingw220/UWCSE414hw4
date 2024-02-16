CREATE TABLE InsuranceCo (
	name VARCHAR(255) PRIMARY KEY,
	phone INT);

CREATE TABLE Person (
	ssn INT PRIMARY KEY,
	name VARCHAR(255));

CREATE TABLE Driver (
	ssn INT PRIMARY KEY REFERENCES Person,
	driverID INT);

CREATE TABLE NonProfessionalDriver (
	ssn INT PRIMARY KEY REFERENCES Driver(ssn));

CREATE TABLE ProfessionalDriver (
	ssn INT PRIMARY KEY REFERENCES Driver(ssn),
	medicalHistory VARCHAR(255));

CREATE TABLE Vehicle (
	licensePlate VARCHAR(255) PRIMARY KEY,
	year INT,
	maxLiability REAL,
	pssn INT REFERENCES Person(ssn),
	iname VARCHAR(255) REFERENCES InsuranceCo(name));

CREATE TABLE Car (
	licensePlate VARCHAR(255) PRIMARY KEY REFERENCES Vehicle,
	make VARCHAR(255));

CREATE TABLE Truck (
	licensePlate VARCHAR(255) PRIMARY KEY REFERENCES Vehicle,
	capacity INT,
	pssn INT REFERENCES ProfessionalDriver(ssn));

CREATE TABLE Drives (
	nssn INT PRIMARY KEY REFERENCES NonProfessionalDriver(ssn),
	clicensePlate VARCHAR(255) REFERENCES Car(licensePlate));

/*-----------------------------------------------------------------------------------------*/

/*
b.  Inside the Vehicle table, I use a foreign key to represent the relationaship "insures".

	iname VARCHAR(20) REFERENCES InsuranceCo(name));

	Because there is a single direction arrow pointing from Vehicle to InsuranceCo,
	I know that this is a many-to-one relationship. Therefore, to use a foreign key in 
	Vehicle Table to link the relationship between the Vehicle and Insurance company.

	In addition, the max liability is the money that the insurance company thinks they
	can cover. Thus, it is specific to each car respectively. So, I choose to inlcude the attributes
	in the Vehicle Table.

	The code above is how I reference the many-to-one relationship.
*/


/*-----------------------------------------------------------------------------------------*/

/*
c.  The Car and NonProfessionalDriver is many-to-many relationship because of the non-arrow lines connect them.
	The Truck and ProfessionalDriver is many-to-one relationship because the arrow points from the Truck to ProfessionalDriver.

	When implementing the Car and NonProfessionalDriver, I create a new table called Drives to represent their many-to-many relationship.
	The code are shown as below. The attributes in the Drives table refernce to individual table as a foreign key.

	CREATE TABLE Drives (
	nssn INT REFERENCES NonProfessionalDriver(ssn),
	clicensePlate VARCHAR(20) REFERENCES Car(lisencePlate));

	When implementing the Truck and ProfessionalDriver, I use foreign key to reference the Truck and Professional Driver.
	The code are shown as below.

	pssn INT REFERENCES ProfessionalDriver(ssn));

	Because there is a single direction arrow pointing from Truck to ProfessionalDriver,
	I know that this is a many-to-one relationship. Therefore, to use a foreign key in 
	Truck Table to link the relationship between the Truck and Professional Driver.
*/