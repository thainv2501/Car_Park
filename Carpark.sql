CREATE DATABASE CarParkManagement
USE CarParkManagement

CREATE TABLE [admin](
	adminId    INT         IDENTITY(1,1) PRIMARY　KEY,
	adminName  VARCHAR(50),
	account    VARCHAR(50),
	password   VARCHAR(50),
)

CREATE TABLE employee(
	employeeId        BIGINT       IDENTITY(1,1)  PRIMARY KEY,
	account           VARCHAR(50),
	department        VARCHAR(50),
	employeeAddress   VARCHAR(50),
	employeeBirthdate DATE,
	employeeEmail     VARCHAR(50),
	employeeName      VARCHAR(50),
	employeePhone     VARCHAR(10),
	password          VARCHAR(20),
	sex               varchar(1),
)

CREATE TABLE parkinglot(
	parkId      BIGINT      IDENTITY(1,1) PRIMARY KEY,
	parkArea    BIGINT,
	parkName    VARCHAR(50),
	parkPlace   VARCHAR(50),
	parkPrice   BIGINT,
	parkStatus  VARCHAR(50),
)

CREATE TABLE car(
	licensePlate VARCHAR(20)  PRIMARY KEY,
	carColor     VARCHAR(20),
	carType      VARCHAR(50),
	company      VARCHAR(50),
	parkId       BIGINT       FOREIGN KEY  REFERENCES parkinglot(parkId),
)

CREATE TABLE trip(
	tripId                     BIGINT      IDENTITY(1,1) PRIMARY KEY,
	bookedTicketNumber         INT,
	carType                    VARCHAR(50),
	departureDate              DATE,
	departureTime              TIME,
	destination                VARCHAR(50),
	driver                     VARCHAR(50),
	maximumOnlineTicketNumber  INT,
)

CREATE TABLE bookingoffice(
	officeId              BIGINT  IDENTITY(1,1) PRIMARY KEY,
	endContractDeadline   DATE,
	officeName            VARCHAR(50),
	officePhone           VARCHAR(11),
	officePlace           VARCHAR(50),
	officePrice           BIGINT,
	startContractDeadline DATE,
	tripId                BIGINT    FOREIGN KEY  REFERENCES trip(tripId),
)



CREATE TABLE ticket(
	ticketId     BIGINT  IDENTITY(1,1)  PRIMARY KEY,
	bookingTime  TIME,
	customerName VARCHAR(20),
	licensePlate VARCHAR(20)    FOREIGN KEY  REFERENCES car(licensePlate), 
	tripId       BIGINT         FOREIGN KEY  REFERENCES trip(tripId),
)

--insert admin
INSERT INTO [admin] (adminName,account,password) VALUES ('Ta Van Tan','tantv9','123456')
INSERT INTO [admin] (adminName,account,password) VALUES ('Nguyen Viet Thai','thainv','123456')
INSERT INTO [admin] (adminName,account,password) VALUES ('Tran Phu Cuong','cuongtp4','123456')
INSERT INTO [admin] (adminName,account,password) VALUES ('Do Viet Yen','yendv4','123456')
INSERT INTO [admin] (adminName,account,password) VALUES ('Hoang Quang Huy','huyhq','123456')


--insert employee
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('kinhboy', 'Accounting', '450 Twin Pines Pass', '1983/09/27', 'bmccaffery0@surveymonkey.com', 'Brantley McCaffery', '0987654321', '123456', '1');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('tienhuy', 'Support', '51033 Mesta Court', '1997/11/03', 'jspadotto1@ovh.net', 'Jany Spadotto', '0999999999', '123456', '0');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('quanghuy', 'Sales', '8 Northfield Drive', '1994/09/27', 'pcunniam2@yahoo.co.jp', 'Peta Cunniam', '0988888888', '123456', '1');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('mynhan', 'Human Resources', '029 International Crossing', '1984/04/26', 'astrowlger3@barnesandnoble.com', 'Ardis Strowlger', '0977777777', '123456', '0');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('taothao', 'Business Development', '19 Kings Pass', '2005/04/10', 'ecornil4@senate.gov', 'Eb Cornil', '0966666666', '123456', '1');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('kingman', 'Services', '66 Butternut Park', '1987/09/22', 'lstennard5@sogou.com', 'Law Stennard', '0955555555', 'abcdef', '0');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('minako', 'Support', '72 Oak Valley Point', '1981/05/03', 'borrick6@google.com.br', 'Brenn Orrick', '0944444444', 'abcdef', '1');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('shinichi', 'Marketing', '46274 Fremont Hill', '2003/08/21', 'sert7@t-online.de', 'Sonnie Ert', '0933333333', 'abcdef', '0');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('makoto', 'Research and Development', '20825 Iowa Crossing', '2000/02/24', 'fsalman8@angelfire.com', 'Fran Salman', '0922222222', 'abcdef', '1');
INSERT INTO employee (account, department, employeeAddress, employeeBirthdate, employeeEmail, employeeName, employeePhone, password, sex) VALUES ('trumcuoi', 'Support', '3 Almo Junction', '1997/06/16', 'asalling9@bbb.org', 'Amalee Salling', '0911111111', 'abcdef', '0');

--insert parkinglot
INSERT INTO parkinglot (parkArea,parkName,parkPlace,parkPrice,parkStatus) VALUES (1 ,'park A','place A',10000,'close, cheap and convenient')
INSERT INTO parkinglot (parkArea,parkName,parkPlace,parkPrice,parkStatus) VALUES (2 ,'park B','place B',20000,'very comfortable place')
INSERT INTO parkinglot (parkArea,parkName,parkPlace,parkPrice,parkStatus) VALUES (3 ,'park C','place C',30000,'very comfortable place,slightly expensive')
INSERT INTO parkinglot (parkArea,parkName,parkPlace,parkPrice,parkStatus) VALUES (4 ,'park D','place D',40000,'The place to stay in the cellar is very convenient')
INSERT INTO parkinglot (parkArea,parkName,parkPlace,parkPrice,parkStatus) VALUES (5 ,'park E','place E',50000,'The price is a bit expensive')

--insert car
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G11111','Toyota Camry','green','Toyota',1)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G22222','VinFast VF e34','red','VinFast',2)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G33333','Mazda CX-5','blue','Mazda',3)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G44444','Mercedes-Benz E-Class ','black','Mercedes-Benz',4)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G55555','Luxury Sedan','grey','Lexus',4)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G66666','Porsche Cayenne','white','Porche',1)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G77777','Honda Civic','red','Honda',2)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G88888','BMW X5','blue','BMW',3)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G99999','Audi A6','pink','AUDI',4)
INSERT INTO car(licensePlate,carType,carColor,company,parkId) VALUES ('30G00000','Bugatti veyron','grey','Bugatti',3)

--insert trip
INSERT INTO trip(bookedTicketNumber,carType,departureDate,departureTime,destination,driver,maximumOnlineTicketNumber) VALUES (4,'Toyota Camry','2020/01/02','01:02:03','Ha noi','John',10)
INSERT INTO trip(bookedTicketNumber,carType,departureDate,departureTime,destination,driver,maximumOnlineTicketNumber) VALUES (5,'Bugatti veyron','2021/08/10','07:02:10','Sapa','Tanaka',10)
INSERT INTO trip(bookedTicketNumber,carType,departureDate,departureTime,destination,driver,maximumOnlineTicketNumber) VALUES (6,'Porsche Cayenne','2019/07/06','08:00:10','Ca Mau','Maruko',12)
INSERT INTO trip(bookedTicketNumber,carType,departureDate,departureTime,destination,driver,maximumOnlineTicketNumber) VALUES (6,'BMW X5','2019/09/03','06:20:10','Yen Bai','Paku',10)
INSERT INTO trip(bookedTicketNumber,carType,departureDate,departureTime,destination,driver,maximumOnlineTicketNumber) VALUES (6,'VinFast VF e34','2022/03/02','05:10:10','Hola','Yamaguchi',10)

--insert ticket
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('06:06:06','Ichinose','30G11111',1)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('07:07:07','Ran','30G22222',2)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('08:08:08','Anna','30G33333',3)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('12:12:12','Aran','30G44444',4)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('04:15:12','Chiko','30G55555',5)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('05:11:30','Fuji','30G66666',1)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('09:10:09','Ichiro','30G77777',2)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('10:35:02','Ran','30G88888',3)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('03:48:28','Satoru','30G99999',4)
INSERT INTO ticket(bookingTime,customerName,licensePlate,tripId) VALUES ('07:07:07','Takemichi','30G00000',5)

--insert booking office
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2020/01/05','Office A','0978653212','Ha noi',5000000,'2020/01/02',1)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2021/08/13','Office B','0948653213','Ha noi',6000000,'2021/08/10',2)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2019/07/09','Office C','0928453419','Ha noi',7000000,'2019/07/06',3)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2019/09/07','Office D','0928443318','Ha noi',8000000,'2019/09/03',4)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2022/03/08','Office E','0929433214','Ha noi',9000000,'2022/03/02',5)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2020/01/07','Office F','0933123214','Ha noi',9000000,'2020/01/02',1)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2021/08/15','Office B','0948653213','Ha noi',6000000,'2021/08/10',2)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2019/07/15','Office C','0928453419','Ha noi',7000000,'2019/07/06',3)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2019/09/15','Office D','0928443318','Ha noi',3000000,'2019/09/03',4)
INSERT INTO bookingoffice(endContractDeadline,officeName,officePhone,officePlace,officePrice,startContractDeadline,tripId)
VALUES('2022/03/14','Office E','0929433214','Ha noi',7000000,'2022/03/02',5)

