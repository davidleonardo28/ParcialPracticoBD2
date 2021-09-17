CREATE TABLE Department(
	ID_Departament int not null,
	nombre_Dpto varchar(35),
	primary key(ID_Departament)
);
INSERT INTO Department(ID_Departament, nombre_Dpto)VALUES ('74874125','Contabilidad');
INSERT INTO Department(ID_Departament, nombre_Dpto)VALUES ('14528464','Tecnologia');
INSERT INTO Department(ID_Departament, nombre_Dpto)VALUES ('42536871','marketing');
INSERT INTO Department(ID_Departament, nombre_Dpto)VALUES ('9641364','Recursos humanos');
INSERT INTO Department(ID_Departament, nombre_Dpto)VALUES ('54268413','Planeacion');
INSERT INTO Department(ID_Departament, nombre_Dpto)VALUES ('98742365','Comercial');

CREATE TABLE Position1(
	ID_Position int not null,
	nombre_Position1 varchar(35),
	primary key(ID_Position)
);
INSERT INTO Position1(ID_Position, nombre_Position1)VALUES ('1234','Contador');
INSERT INTO Position1(ID_Position, nombre_Position1)VALUES ('7485','Desarrollador');
INSERT INTO Position1(ID_Position, nombre_Position1)VALUES ('9856','Tesorero');
INSERT INTO Position1(ID_Position, nombre_Position1)VALUES ('7412','Gerente');
INSERT INTO Position1(ID_Position, nombre_Position1)VALUES ('1254','Psicologo');
INSERT INTO Position1(ID_Position, nombre_Position1)VALUES ('6502','Ingeniero');


CREATE TABLE Country(
	ID_Country int not null,
	nombre_Country varchar(40)not null,
	primary key(ID_Country)
);

INSERT INTO Country(ID_Country, nombre_Country)VALUES ('111','Colombia');
INSERT INTO Country(ID_Country, nombre_Country)VALUES ('222','Mexico');
INSERT INTO Country(ID_Country, nombre_Country)VALUES ('333','Estados Unidos');
INSERT INTO Country(ID_Country, nombre_Country)VALUES ('444','Ecuador');
INSERT INTO Country(ID_Country, nombre_Country)VALUES ('555','Argentina');
INSERT INTO Country(ID_Country, nombre_Country)VALUES ('666','Venezuela');



/* Foranea */
CREATE TABLE City(
	ID_City int not null,
	nombre_City varchar(35),
	ID_Country_City int not null,
	FOREIGN KEY(ID_Country_City) REFERENCES Country(ID_Country), 
	primary key(ID_City)
);
INSERT INTO City(ID_City, nombre_City,ID_Country_City)VALUES ('0011','Bogota','111');
INSERT INTO City(ID_City, nombre_City,ID_Country_City)VALUES ('0034','Ciudad De Mexico','222');
INSERT INTO City(ID_City, nombre_City,ID_Country_City)VALUES ('0045','California','333');
INSERT INTO City(ID_City, nombre_City,ID_Country_City)VALUES ('0056','Quito','444');
INSERT INTO City(ID_City, nombre_City,ID_Country_City)VALUES ('0100','Buenos Aires','555');
INSERT INTO City(ID_City, nombre_City,ID_Country_City)VALUES ('0025','Maracaibo','666');


/* Foranea */
CREATE TABLE Address(
	ID_Address int not null,
	line1 varchar(45),
	line2 varchar(45),
	ID_Address_City int not null,
	FOREIGN KEY(ID_Address_City) REFERENCES City(ID_City), 
	primary key(ID_Address)
);
INSERT INTO Address(ID_Address, line1,line2,ID_Address_City)VALUES ('100','Calle 134 # 56 - 08','Apto','0011');
INSERT INTO Address(ID_Address, line1,line2,ID_Address_City)VALUES ('200','Calle AGUSTIN LARA NO. 69-B','Oficina 301','0034');
INSERT INTO Address(ID_Address, line1,line2,ID_Address_City)VALUES ('300','WILSHIRE BLVD','BLVD','0045');
INSERT INTO Address(ID_Address, line1,line2,ID_Address_City)VALUES ('400','Juan León Mera Nro. 19-36','Casa','0056');
INSERT INTO Address(ID_Address, line1,line2,ID_Address_City)VALUES ('500','Avenida Benavídez','Oficina 404','0100');
INSERT INTO Address(ID_Address, line1,line2,ID_Address_City)VALUES ('600','Urbanización Las Virtudes Manzana 6',' Casa 5','0025');


/* Foranea */
CREATE TABLE BranchOffice(
	ID_Branch int not null,
	nombre_Branch varchar(45),
	ID_Branch_Address int not null,
	FOREIGN KEY(ID_Branch_Address) REFERENCES Address(ID_Address), 
	primary key(ID_Branch)
);

INSERT INTO BranchOffice(ID_Branch, nombre_Branch,ID_Branch_Address)VALUES ('11111','Local','100');
INSERT INTO BranchOffice(ID_Branch, nombre_Branch,ID_Branch_Address)VALUES ('22222','Oficina','200');
INSERT INTO BranchOffice(ID_Branch, nombre_Branch,ID_Branch_Address)VALUES ('33333','Tienda','300');
INSERT INTO BranchOffice(ID_Branch, nombre_Branch,ID_Branch_Address)VALUES ('44444','Negocio','400');
INSERT INTO BranchOffice(ID_Branch, nombre_Branch,ID_Branch_Address)VALUES ('55555','Oficina','500');
INSERT INTO BranchOffice(ID_Branch, nombre_Branch,ID_Branch_Address)VALUES ('66666','Tienda','600');



CREATE TABLE Supervisor(
	ID_Supervisor int not null,
	nombre_Supervisor varchar(45),
	primary key(ID_Supervisor)
);

INSERT INTO Supervisor(ID_Supervisor, nombre_Supervisor)VALUES ('1','Carolina Vasquez');
INSERT INTO Supervisor(ID_Supervisor, nombre_Supervisor)VALUES ('2','Camilo Torres');
INSERT INTO Supervisor(ID_Supervisor, nombre_Supervisor)VALUES ('3','David Barrera');
INSERT INTO Supervisor(ID_Supervisor, nombre_Supervisor)VALUES ('4','Daniela Lopez');
INSERT INTO Supervisor(ID_Supervisor, nombre_Supervisor)VALUES ('5','Sebastian Novoa');
INSERT INTO Supervisor(ID_Supervisor, nombre_Supervisor)VALUES ('6','Kevin Castellanos');


CREATE TABLE Employee(
	ID_Employee int not null,
	fullName varchar(45),
	BranchId_Employee int not null,
	FOREIGN KEY(BranchId_Employee) REFERENCES BranchOffice(ID_Branch) ON DELETE CASCADE, 
	DepartmentId_Employee int not null,
	FOREIGN KEY(DepartmentId_Employee) REFERENCES Department(ID_Departament) ON DELETE CASCADE, 
	PositionId_Employee int not null,
	FOREIGN KEY(PositionId_Employee) REFERENCES Position1(ID_Position) ON DELETE CASCADE, 
	AddressId_Employee int not null,
	FOREIGN KEY(AddressId_Employee) REFERENCES Address(ID_Address) ON DELETE CASCADE, 
	SupervisorId_Employee int not null,
	FOREIGN KEY(SupervisorId_Employee) REFERENCES Supervisor(ID_Supervisor)
	ON DELETE CASCADE
);

INSERT INTO Employee(ID_Employee, fullName,BranchId_Employee,DepartmentId_Employee,PositionId_Employee,AddressId_Employee,SupervisorId_Employee)
VALUES('12374856','Lina Mendoza','11111','74874125','1234','100','1');
INSERT INTO Employee(ID_Employee, fullName,BranchId_Employee,DepartmentId_Employee,PositionId_Employee,AddressId_Employee,SupervisorId_Employee)
VALUES('23141771','Carlos Pinilla','22222','14528464','7485','200','2');
INSERT INTO Employee(ID_Employee, fullName,BranchId_Employee,DepartmentId_Employee,PositionId_Employee,AddressId_Employee,SupervisorId_Employee)
VALUES('32456417','Laura Rojas','33333','42536871','9856','300','3');
INSERT INTO Employee(ID_Employee, fullName,BranchId_Employee,DepartmentId_Employee,PositionId_Employee,AddressId_Employee,SupervisorId_Employee)
VALUES('47852671','Pablo Correa','44444','9641364','7412','400','4');
INSERT INTO Employee(ID_Employee, fullName,BranchId_Employee,DepartmentId_Employee,PositionId_Employee,AddressId_Employee,SupervisorId_Employee)
VALUES('58964872','Juan Moreno','55555','54268413','1254','500','5');
INSERT INTO Employee(ID_Employee, fullName,BranchId_Employee,DepartmentId_Employee,PositionId_Employee,AddressId_Employee,SupervisorId_Employee)
VALUES('69874134','Angie rojas','66666','98742365','6502','600','6');


CREATE TABLE EmployeeAudit(
	ID_Employee int not null,
	fullName varchar(45),
	branchOffice varchar(45)NOT NULL,
	department varchar(45)NOT NULL,
	supervisor varchar(45)NOT NULL,
	position1 varchar(45)NOT NULL,
	address varchar(45)NOT NULL,
	city varchar(45) NOT NULL,
	country varchar(45) NOT NULL,
	event1 varchar(30) NOT NULL,
	registeredAt date NOT NULL		   
);






