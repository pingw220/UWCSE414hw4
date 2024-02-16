CREATE TABLE InsuranceCo (
    name VARCHAR(255) PRIMARY KEY,
    phone INT
);

CREATE TABLE Person (
    ssn INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Vehicle (
    licensePlate VARCHAR(255) PRIMARY KEY,
    year INT
);

CREATE TABLE Car (
    licensePlate VARCHAR(255) PRIMARY KEY,
    make VARCHAR(255),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Truck (
    licensePlate VARCHAR(255) PRIMARY KEY,
    capacity INT,
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Driver (
    driverID INT PRIMARY KEY,
    ssn INT,
    FOREIGN KEY (ssn) REFERENCES Person(ssn)
);

CREATE TABLE NonProfessionalDriver (
    driverID INT PRIMARY KEY,
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE ProfessionalDriver (
    driverID INT PRIMARY KEY,
    medicalHistory TEXT,
    FOREIGN KEY (driverID) REFERENCES Driver(driverID)
);

CREATE TABLE Owns (
    ssn INT,
    licensePlate VARCHAR(255),
    PRIMARY KEY (ssn, licensePlate),
    FOREIGN KEY (ssn) REFERENCES Person(ssn),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Insures (
    insuranceCoName VARCHAR(255),
    licensePlate VARCHAR(255),
    maxLiability REAL,
    PRIMARY KEY (insuranceCoName, licensePlate),
    FOREIGN KEY (insuranceCoName) REFERENCES InsuranceCo(name),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Drives (
    driverID INT,
    licensePlate VARCHAR(255),
    PRIMARY KEY (driverID, licensePlate),
    FOREIGN KEY (driverID) REFERENCES Driver(driverID),
    FOREIGN KEY (licensePlate) REFERENCES Vehicle(licensePlate)
);

CREATE TABLE Operates (
    driverID INT,
    licensePlate VARCHAR(255),
    PRIMARY KEY (driverID, licensePlate),
    FOREIGN KEY (driverID) REFERENCES ProfessionalDriver(driverID),
    FOREIGN KEY (licensePlate) REFERENCES Truck(licensePlate)
);

/*
b.
So in this relational scheme I created based off the given E/R diagram, 
the insures relation is shown through the insures table. I picked this 
representation because as per the E/R diagram, the insures relationships 
connects an insurance company to a vehicle (and has unique attribute 
maxLiability). The insures table captures this relationship by including 
the foreign keys to both tables (InsuranceCo & Vehicle). This means that 
it represents the insurance company and the vehicle respectively, and with 
the maxLiability attribute to store the max liability amount the insurance 
company would have to cover for that particular vehicle.

c. 
From my schema, the two tables Drives and operates represent the two 
relationships with drives and operates. They’re different since drives refers 
to the action of any driver driving a vehicle so the driver table links the 
driver table to the vehicle table. For the latter, operates is specific to 
professional drivers using trucks so the operate table links the ProfessionalDriver 
table to the Truck table. The way I thought about it is a normal person driving 
to work versus an Amazon delivery driver. With all this said, this means that 
while any driver can be technically associated with driving a vehicle, only 
professional drivers are associated with operating trucks (aligns with the 
constraints of the relationships).
*/








