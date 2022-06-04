-- Created out of the PERSON entity;
DROP TABLE IF EXISTS PERSON;
CREATE TABLE IF NOT EXISTS PERSON (
  Pid        INTEGER        NOT NULL AUTO_INCREMENT,
  Fname      VARCHAR(30)    NOT NULL,
  Lname      VARCHAR(30)    NOT NULL,
  Birthday   DATE,
  Phone      CHAR(10)       NOT NULL,
  Email      VARCHAR(254)   NOT NULL,
  Street     VARCHAR(30)    NOT NULL,
  City       VARCHAR(30)    NOT NULL,
  State      VARCHAR(30)    NOT NULL,
  PRIMARY KEY (Pid)
  );

-- Created from the PILOT EXAMINER entity;
DROP TABLE IF EXISTS PILOT_EXAMINER;
CREATE TABLE IF NOT EXISTS PILOT_EXAMINER (
  Pid        INTEGER        NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES PERSON(Pid)
);

-- Created from the CAN_ISSUE relationship;
DROP TABLE IF EXISTS EXAMINER_AUTHORIZATION;
CREATE TABLE IF NOT EXISTS EXAMINER_AUTHORIZATION (
  Examiner          INTEGER    NOT NULL,
  Cert_type    INTEGER    NOT NULL,
  PRIMARY KEY (Examiner, Cert_type),
  FOREIGN KEY(Examiner) REFERENCES PILOT_EXAMINER(Pid),
  FOREIGN KEY(Cert_type) REFERENCES CERT_TYPE(Ceid)
);

-- Created form the employee entity;
DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE IF NOT EXISTS EMPLOYEE (
  Pid          INTEGER        NOT NULL,
  Hire_date    TEXT           NOT NULL,
  Ssn          CHAR(9)        NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES PERSON(Pid)
);

-- Created from the student entity;
DROP TABLE IF EXISTS STUDENT;
CREATE TABLE IF NOT EXISTS STUDENT (
  Pid                 INTEGER    NOT NULL,
  Date_enrolled       TEXT       NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES PERSON(Pid)  
);

-- Created from the CERTIFIED_IN relationship;
DROP TABLE IF EXISTS INSTRUCTOR_AUTHORIZATION;
CREATE TABLE IF NOT EXISTS INSTRUCTOR_AUTHORIZATION (
  Instructor        INT       NOT NULL,
  Course_type       INT       NOT NULL,
  PRIMARY KEY (Instructor, Course_type),
  FOREIGN KEY (Instructor) REFERENCES INSTRUCTOR(Pid)
);

-- Created from the Instructor entity;
DROP TABLE IF EXISTS INSTRUCTOR;
CREATE TABLE IF NOT EXISTS INSTRUCTOR (
  Pid            INTEGER        NOT NULL,
  Specialization VARCHAR(30)    NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES EMPLOYEE(Pid)
);

-- Created from the course entity;
DROP TABLE IF EXISTS COURSE;
CREATE TABLE IF NOT EXISTS COURSE (
  Cid                INTEGER       NOT NULL AUTO_INCREMENT,
  Course_type        INTEGER       NOT NULL,
  Start_date         DATE          NOT NULL,
  Instructor         INTEGER       NOT NULL,
  Student            INTEGER       NOT NULL,
  PRIMARY KEY (Cid),
  FOREIGN KEY (Instructor) REFERENCES INSTRUCTOR(Pid),
  FOREIGN KEY (Student) REFERENCES STUDENT(Pid),
  FOREIGN KEY (Course_type) REFERENCES COURSE_TYPE(Ctid)
);

-- Created from the Certification weak entity;
DROP TABLE IF EXISTS CERTIFICATION;
CREATE TABLE IF NOT EXISTS CERTIFICATION (
  Student        INTEGER      NOT NULL,
  Examiner       INTEGER      NOT NULL,
  Cert_type      INTEGER      NOT NULL,
  PRIMARY KEY(Student, Examiner, Cert_type),
  FOREIGN KEY (Student) REFERENCES STUDENT(Pid),
  FOREIGN KEY (Examiner) REFERENCES PILOT_EXAMINER(Pid)
);

-- Created from the CERT_TYPE entity;
DROP TABLE IF EXISTS CERT_TYPE;
CREATE TABLE IF NOT EXISTS CERT_TYPE (
  Ceid             INTEGER        NOT NULL,
  Name             VARCHAR(50)    NOT NULL,
  Is_helicopter    INTEGER        NOT NULL,
  Is_airplane      INTEGER        NOT NULL,
  PRIMARY KEY (Ceid),
  CHECK (Is_airplane!=Is_helicopter)
);

-- Created from the TRAINING_SESSION entity;
DROP TABLE IF EXISTS TRAINING_SESSION;
CREATE TABLE IF NOT EXISTS TRAINING_SESSION (
  Instructor        INTEGER        NOT NULL,
  Student           INTEGER        NOT NULL,
  Lesson            INTEGER        NOT NULL,
  T_date            DATE           NOT NULL,
  Duration          DECIMAL(2, 1)  NOT NULL,
  Route             VARCHAR(30)    NOT NULL,
  Aircraft          VARCHAR(10)    NOT NULL,
  PRIMARY KEY (Instructor, Student, Lesson, T_date),
  FOREIGN KEY (Instructor) REFERENCES INSTRUCTOR(Pid),
  FOREIGN KEY (Student) REFERENCES STUDENT(Pid),
  FOREIGN KEY (Lesson) REFERENCES LESSON(Lid)
);

-- Created from the COURSE_TYPE entity;
DROP TABLE IF EXISTS COURSE_TYPE;
CREATE TABLE IF NOT EXISTS COURSE_TYPE (
  Ctid              INTEGER        NOT NULL AUTO_INCREMENT,
  Cname             VARCHAR(60)    NOT NULL,
  Required_hours    INTEGER        NOT NULL,
  Cost              INTEGER        NOT NULL,
  Cert_type         INTEGER        NOT NULL,
  PRIMARY KEY (Ctid),
  FOREIGN KEY (Cert_type) REFERENCES CERT_TYPE(Ceid)
);

-- Created from the CONTAINS relationship;
DROP TABLE IF EXISTS COURSE_LESSON;
CREATE TABLE IF NOT EXISTS COURSE_LESSONS (
  Course      INTEGER       NOT NULL,
  Lesson      INTEGER       NOT NULL,
  PRIMARY KEY (Course, Lesson),
  FOREIGN KEY (Course) REFERENCES COURSE_TYPE(Ctid),
  FOREIGN KEY (Lesson) REFERENCES LESSON(Lid)
);

-- Created from the LESSON entity;
DROP TABLE IF EXISTS LESSON;
CREATE TABLE IF NOT EXISTS LESSON (
  Lid         INTEGER        NOT NULL,
  L_name      VARCHAR(60)    NOT NULL,
  PRIMARY KEY (Lid)
);

-- Created from the TASKS composite attribute;
DROP TABLE IF EXISTS LESSON_TASKS;
CREATE TABLE IF NOT EXISTS LESSON_TASKS (
  Lid        INTEGER         NOT NULL,
  Task_name  VARCHAR(80)     NOT NULL,
  PRIMARY KEY (Lid, Task_name),
  FOREIGN KEY (Lid) REFERENCES LESSON(Lid)
);

-- Created from the aircraft entity, and the disjoint HELI and AIR entities;
DROP TABLE IF EXISTS AIRCRAFT;
CREATE TABLE IF NOT EXISTS AIRCRAFT (
  N_number        VARCHAR(10)        NOT NULL,
  Type            VARCHAR(30)        NOT NULL,
  Empty_weight    INTEGER            NOT NULL,
  Manufacturer    VARCHAR(30)        NOT NULL,
  Model           VARCHAR(30)        NOT NULL,
  Seats           INTEGER            NOT NULL,
  Status          VARCHAR(15),
  PRIMARY KEY (N_number),
  CHECK (Type="Helicopter" OR Type="Airplane")
);


INSERT INTO PERSON (Pid,Fname,Lname,Birthday,Phone,Email,Street,City,State)
VALUES
(1, 'Tobit', 'Danielian', '1973-01-10', '6503508206', 'tdanielian0@washington.edu', '1 Nelson Place', 'Eugene', 'Oregon'),
(31, 'Osbert', 'Wollrauch', '1987-09-06', '2566284426', 'owollrauchu@businessweek.com', '99731 Mariners Cove Avenue', 'Bend', 'Oregon'),
(4, 'Clemmy', 'Rizzello', '1956-10-27', '8593195574', 'crizzello3@comsenz.com', '6 Manley Alley', 'Bend', 'Oregon'),
(5, 'Georgette', 'Riply', '1988-10-23', '2149141938', 'griply4@youtu.be', '56447 Mcbride Point', 'Prineville', 'Oregon'),
(12, 'Elston', 'Rasch', '1994-12-17', '3025909098', 'eraschb@theguardian.com', '05865 Merry Junction', 'Bend', 'Oregon'),
(7, 'Bill', 'Deegan', '1965-04-21', '5309043015', 'bodeegan6@microsoft.com', '444 Towne Lane', 'Redmond', 'Oregon'),
(2, 'Gallagher', 'Mayston', '1970-12-02', '2167786014', 'gmayston1@storify.com', '08 Swallow Court', 'Prineville', 'Oregon'),
(13, 'Alane', 'Letteresse', '1982-05-27', '4088274202', 'aletteressec@google.it', '69 Raven Terrace', 'Bend', 'Oregon'),
(3, 'Ransom', 'Karolczyk', '1956-08-20', '5703114986', 'rkarolczyk2@newsvine.com', '873 Mosinee Crossing', 'Redmond', 'Oregon'),
(10, 'Timothea', 'Sturge', '1980-04-15', '2067749707', 'tsturge9@gmpg.org', '4 Calypso Lane', 'Portland', 'Oregon'),
(6, 'Bordie', 'Fautly', '1989-11-26', '4011593589', 'bfautly5@1688.com', '486 Pond Terrace', 'Bend', 'Oregon'),
(47, 'Jasper', 'Emmer', '1995-12-22', '9194113986', 'jemmer1a@cargocollective.com', '09725 Darwin Trail', 'Redmond', 'Oregon'),
(9, 'Hanny', 'Ellcome', '2000-03-31', '4697536207', 'hellcome8@china.com.cn', '59 Crescent Oaks Lane', 'Prineville', 'Oregon'),
(14, 'Egbert', 'Favelle', '2000-02-04', '7191042812', 'efavelled@imgur.com', '70696 Jenifer Center', 'Colorado Springs', 'Colorado'),
(15, 'Mallissa', 'Allgood', '1963-03-20', '9251933608', 'mallgoode@t-online.de', '12 Pine View Alley', 'Hayward', 'California'),
(16, 'Hertha', 'Kibard', '1964-09-28', '4783386069', 'hkibardf@zdnet.com', '04 Elka Drive', 'Macon', 'Georgia'),
(17, 'Deidre', 'Giacovetti', '1960-10-09', '3138801339', 'dgiacovettig@ucoz.com', '78 Bonner Place', 'Detroit', 'Michigan'),
(18, 'Allix', 'Gallier', '1957-07-25', '6142516978', 'agallierh@boston.com', '8138 Judy Street', 'Columbus', 'Ohio'),
(19, 'Belia', 'Patzelt', '1996-02-25', '4027513107', 'bpatzelti@elpais.com', '079 Kennedy Plaza', 'Omaha', 'Nebraska'),
(20, 'Lancelot', 'Emanuele', '1970-02-14', '8635336593', 'lemanuelej@webnode.com', '50 Dovetail Terrace', 'Lehigh Acres', 'Florida'),
(21, 'Cesya', 'Benck', '1983-07-24', '9014911495', 'cbenckk@creativecommons.org', '6995 Delaware Drive', 'Corvallis', 'Oregon'),
(22, 'Ulick', 'Bakey', '1969-02-22', '7276565823', 'ubakeyl@netvibes.com', '0285 Holmberg Center', 'Klamath Falls', 'Oregon'),
(23, 'Mal', 'Grabban', '1984-06-09', '8068733784', 'mgrabbanm@netscape.com', '52514 Vahlen Avenue', 'Amarillo', 'Texas'),
(24, 'Letizia', 'Meaddowcroft', '1961-03-05', '4089442688', 'lmeaddowcroftn@deliciousdays.com', '2 Swallow Place', 'San Jose', 'California'),
(25, 'Sully', 'Sugden', '1966-06-15', '2027037252', 'ssugdeno@icq.com', '1610 Aberg Point', 'Washington', 'District of Columbia'),
(26, 'Allsun', 'Petche', '1979-09-03', '8183026631', 'apetchep@mysql.com', '22982 Pankratz Crossing', 'North Hollywood', 'California'),
(27, 'Cesaro', 'Pitbladdo', '1978-05-18', '9043515153', 'cpitbladdoq@reddit.com', '4 Kipling Crossing', 'Jacksonville', 'Florida'),
(28, 'Ardyth', 'Jikovsky', '1957-02-17', '8132583681', 'ajikovskyr@soup.io', '079 Pennsylvania Way', 'Tampa', 'Florida'),
(29, 'Astrix', 'Binge', '1972-11-11', '6518261440', 'abinges@cyberchimps.com', '82 Washington Alley', 'Minneapolis', 'Minnesota'),
(30, 'Ikey', 'Hourihane', '1956-02-02', '2568561669', 'ihourihanet@technorati.com', '4 Hagan Park', 'Anniston', 'Alabama'),
(8, 'Muffin', 'Coulsen', '1974-06-13', '3125360888', 'mcoulsen7@naver.com', '995 Spaight Place', 'Bend', 'Oregon'),
(32, 'Kiah', 'Gurry', '1966-07-19', '2058333573', 'kgurryv@webeden.co.uk', '5 Londonderry Junction', 'Birmingham', 'Alabama'),
(33, 'Adrien', 'Swafield', '1951-10-26', '7655415114', 'aswafieldw@who.int', '5 Sunnyside Circle', 'Anderson', 'Indiana'),
(34, 'Giustina', 'Toop', '1968-11-17', '2156924745', 'gtoopx@deviantart.com', '2323 Bay Hill', 'Philadelphia', 'Pennsylvania'),
(35, 'Isa', 'Blucher', '1981-12-23', '7655227650', 'ibluchery@smh.com.au', '8 Killdeer Drive', 'Crawfordsville', 'Indiana'),
(36, 'Belle', 'Rattrie', '1970-09-12', '5181583306', 'brattriez@jalbum.net', '2 Dunning Alley', 'Albany', 'New York'),
(37, 'Paxon', 'Adam', '1975-04-08', '5403893535', 'padam10@toplist.cz', '56 Lakewood Gardens Center', 'Roanoke', 'Virginia'),
(38, 'Athena', 'Francescotti', '1953-04-01', '8129783191', 'afrancescotti11@nba.com', '566 Del Mar Terrace', 'Evansville', 'Indiana'),
(39, 'Wendeline', 'Shreve', '1956-02-09', '5029935477', 'wshreve12@nymag.com', '2767 Drewry Center', 'Louisville', 'Kentucky'),
(40, 'Immanuel', 'Pocock', '1994-04-19', '6153466951', 'ipocock13@seesaa.net', '281 Golf Parkway', 'Nashville', 'Tennessee'),
(41, 'Diane', 'Krug', '1990-03-24', '6783636755', 'dkrug14@hugedomains.com', '66429 Leroy Place', 'Gainesville', 'Georgia'),
(42, 'Grantley', 'Phippin', '1972-07-01', '2121074659', 'gphippin15@issuu.com', '2958 Del Sol Trail', 'New York City', 'New York'),
(43, 'Harriott', 'Cissen', '1981-10-02', '2027419846', 'hcissen16@spiegel.de', '8534 Truax Street', 'Redmond', 'Oregon'),
(44, 'Niels', 'Moyse', '1961-04-23', '5014090826', 'nmoyse17@w3.org', '4 Main Circle', 'Hot Springs National Park', 'Arkansas'),
(45, 'Leupold', 'Haitlie', '1974-10-30', '4042363424', 'lhaitlie18@webnode.com', '63539 Mcbride Plaza', 'Atlanta', 'Georgia'),
(46, 'Jacqueline', 'Blaydon', '1976-11-19', '4251299808', 'jblaydon19@skype.com', '249 Vernon Drive', 'Everett', 'Washington'),
(11, 'Udall', 'Cardinale', '1956-08-29', '6191305217', 'ucardinalea@deliciousdays.com', '7891 Nancy Hill', 'Redmond', 'Oregon'),
(48, 'Bartie', 'Foottit', '1985-05-02', '7027442013', 'bfoottit1b@wikipedia.org', '64288 Meadow Ridge Center', 'Las Vegas', 'Nevada'),
(49, 'Ernestus', 'Rolls', '1960-12-15', '7851587255', 'erolls1c@stumbleupon.com', '4 Vera Plaza', 'Bend', 'Oregon'),
(50, 'Isabel', 'MacDermott', '1985-08-12', '9798380196', 'imacdermott1d@yahoo.com', '61657 Lakewood Trail', 'Bryan', 'Texas');

INSERT INTO PILOT_EXAMINER (Pid)
VALUES
(49),
(43),
(10),
(21),
(1),
(22);

INSERT INTO EXAMINER_AUTHORIZATION (Examiner,Cert_type)
VALUES
(49, 1),
(49, 3),
(49, 2),
(49, 6),
(49, 4),
(43, 7),
(49, 5),
(10, 1),
(10, 3),
(10, 7),
(21, 7),
(21, 9),
(21, 8),
(21, 12),
(21, 11),
(21, 10),
(1, 1),
(1, 3),
(1, 2),
(22, 7),
(22, 9),
(22, 8);

INSERT INTO EMPLOYEE (Pid,Hire_date,Ssn) VALUES
(31, '2022-05-22', '181059513'),
(4, '2016-01-30', '373613408'),
(5, '2010-03-09', '675266049'),
(12, '2020-10-26', '726921569'),
(7, '2014-01-14', '668233442'),
(2, '2018-12-12', '532678226'),
(13, '2003-09-01', '311594727'),
(3, '2010-03-13', '806715048'),
(6, '2007-12-27', '102258726'),
(47, '2005-05-22', '222738468'),
(9, '2004-04-09', '743113224'),
(8, '2004-08-12', '384457019'),
(11, '2010-12-07', '657115885');

INSERT INTO STUDENT (Pid,Date_enrolled) 
VALUES
(14, '2018-09-27'),
(15, '2021-11-22'),
(16, '2022-04-08'),
(17, '2022-05-09'),
(18, '2021-12-17'),
(19, '2018-12-22'),
(20, '2020-09-25'),
(23, '2020-05-08'),
(24, '2020-07-29'),
(25, '2022-04-27'),
(26, '2022-01-01'),
(27, '2021-08-30'),
(28, '2021-02-15'),
(29, '2021-09-07'),
(30, '2020-02-22'),
(32, '2019-12-14'),
(33, '2019-02-15'),
(34, '2018-07-20'),
(35, '2018-06-01'),
(36, '2018-07-06'),
(37, '2019-07-17'),
(38, '2019-06-27'),
(39, '2019-04-22'),
(40, '2021-07-20'),
(41, '2020-09-13'),
(42, '2021-07-08'),
(44, '2020-11-03'),
(45, '2021-07-20'),
(46, '2018-09-23'),
(48, '2021-10-02'),
(50, '2019-10-02');

INSERT INTO INSTRUCTOR_AUTHORIZATION (Instructor,Course_type)
VALUES
(3, 1),
(3, 3),
(3, 5),
(6, 7),
(6, 8),
(6, 9),
(47, 7),
(47, 9),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5);

INSERT INTO INSTRUCTOR (Pid,Specialization)
VALUES
(6, 'Full down autorotations'),
(47, 'Aerobatics'),
(9, 'Spins'),
(8, 'Flight instructor candidates'),
(11, 'Flight instructor candidates'),
(12, 'Full down autorotations');

INSERT INTO COURSE (Cid,Course_type,Start_date,Instructor,Student)
VALUES
(1, 12, '2018-10-07', 6, 14),
(18, 1, '2018-07-30', 3, 34),
(3, 12, '2022-04-18', 6, 16),
(4, 12, '2022-05-19', 6, 17),
(5, 10, '2021-12-27', 47, 18),
(20, 2, '2018-07-16', 8, 36),
(7, 10, '2020-10-05', 47, 20),
(21, 2, '2019-07-27', 11, 37),
(13, 3, '2021-02-25', 3, 28),
(14, 3, '2021-09-17', 8, 29),
(10, 5, '2022-05-07', 11, 25),
(12, 12, '2021-09-09', 6, 27),
(24, 5, '2021-07-30', 3, 40),
(9, 6, '2020-08-08', 6, 24),
(17, 6, '2019-02-25', 47, 33),
(23, 6, '2019-05-02', 9, 39),
(31, 6, '2019-10-12', 6, 50),
(11, 7, '2022-01-11', 47, 26),
(26, 7, '2021-07-18', 9, 42),
(28, 7, '2021-07-30', 6, 45),
(2, 8, '2021-12-02', 47, 15),
(22, 12, '2019-07-07', 6, 38),
(6, 8, '2019-01-01', 9, 19),
(8, 8, '2020-05-18', 6, 23),
(25, 10, '2020-09-23', 47, 41),
(15, 8, '2020-03-03', 47, 30),
(27, 12, '2020-11-13', 6, 44),
(29, 8, '2018-10-03', 9, 46),
(30, 8, '2021-10-12', 6, 48),
(19, 9, '2018-06-11', 47, 35),
(16, 11, '2019-12-24', 9, 32);

INSERT INTO CERTIFICATION (Student,Examiner,Cert_type)
VALUES
(19, 43, 7),
(20, 21, 9),
(23, 10, 7),
(24, 49, 5),
(25, 49, 4),
(27, 21, 11),
(28, 49, 2),
(29, 1, 2),
(30, 21, 7),
(32, 21, 10),
(33, 49, 5),
(35, 22, 8);

INSERT INTO CERT_TYPE (Ceid,Name,is_helicopter,is_airplane)
VALUES
(2, 'Instrument ', 1, 0),
(3, 'Commercial ', 1, 0),
(4, 'Certified Flight Instructor ', 1, 0),
(5, 'Certified Flight Instrument Instructor ', 1, 0),
(6, 'Airline Transport Pilot', 1, 0),
(7, 'Private ', 0, 1),
(8, 'Instrument ', 0, 1),
(9, 'Commercial ', 0, 1),
(10, 'Certified Flight Instructor ', 0, 1),
(11, 'Certified Flight Instrument Instructor ', 0, 1),
(12, 'Airline Transport Pilot', 0, 1);

INSERT INTO TRAINING_SESSION (Instructor,Student,Lesson,T_date,Duration,Route,Aircraft)
VALUES
(3, 34, 14, '2018-07-30', 1.1, 'BDN - DLS - BDN', 'N688M'),
(6, 14, 3, '2018-10-07', 1.5, 'BDN - S21 - BDN', 'N194LE'),
(47, 18, 6, '2021-12-27', 2.1, 'BDN - RDM - BDN', 'N860CG'),
(9, 39, 11, '2019-05-02', 0.5, 'BDN - BDN', 'N117LE'),
(8, 29, 12, '2021-09-17', 1.3, 'BDN - RDM - BDN', 'N219LE'),
(11, 25, 10, '2022-05-07', 1.8, 'BDN - PDX - BDN', 'N74681');

INSERT INTO COURSE_TYPE (Ctid,Cname,Required_hours,Cost,Cert_type)
VALUES
(1, 'Private Pilot - Helicopter', 40, 5000, 1),
(2, 'Instrument Pilot - Helicopter', 35, 8000, 2),
(3, 'Commercial Pilot - Helicopter', 100, 9000, 3),
(4, 'Certified Flight Instructor - Helicopter', 50, 7000, 4),
(5, 'Certified Flight Instrument Instructor - Helicopter', 50, 7000, 5),
(6, 'Airline Transport Pilot - Helicopter', 10, 2000, 6),
(7, 'Private Pilot - Airplane', 40, 3500, 7),
(8, 'Instrument Pilot - Airplane', 35, 6000, 8),
(9, 'Commercial Pilot - Airplane', 100, 4000, 9),
(10, 'Certified Flight Instructor - Airplane', 50, 2500, 10),
(11, 'Certified Flight Instrument Instructor - Airplane', 50, 3600, 11),
(12, 'Airline Transport Pilot - Airplane', 10, 1400, 12);

INSERT INTO COURSE_LESSONS (Course,Lesson)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(7, 1),
(7, 2),
(7, 3),
(7, 5),
(7, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(8, 7),
(8, 8),
(8, 9),
(8, 10),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 11),
(3, 12),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 11),
(4, 12),
(4, 13),
(5, 8),
(5, 9),
(5, 10),
(5, 13),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(9, 1),
(9, 2),
(9, 3),
(9, 5),
(9, 6),
(9, 14),
(10, 1),
(10, 2),
(10, 3),
(10, 5),
(10, 6),
(10, 14),
(10, 13),
(11, 8),
(11, 9),
(11, 10),
(11, 13),
(12, 1),
(12, 2),
(12, 3),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 9),
(12, 10),
(12, 14);

INSERT INTO LESSON (Lid,L_name)
VALUES
(1, 'Preflight and Postflight'),
(2, 'Takoffs and Landings'),
(3, 'Maneuvers and Emergency Procedures'),
(4, 'Hovering'),
(5, 'Night and Day Navigation'),
(6, 'Power-Off Landings'),
(7, 'Introduction to Instrument Flying'),
(8, 'Approach Procedures'),
(9, 'Contingency Plans'),
(10, 'Navigation Procedures'),
(11, 'Advanced Helicopter Emergencies'),
(12, 'Advanced Helicopter Off Airport'),
(13, 'In Flight Instructional Methods'),
(14, 'Advanced Airplane Takeoffs and Landings');

INSERT INTO LESSON_TASKS (Lid,Task_name)
VALUES
(1, 'Preflight Preparation'),
(1, 'Preflight Procedures'),
(5, 'Airport and Heliport Operations'),
(4, 'Hovering Maneuvers'),
(2, 'Takeoffs, Landings, and Go-arounds'),
(3, 'Performance Maneuvers'),
(5, 'Navigation'),
(3, 'Emergency Operations'),
(5, 'Night Operation'),
(1, 'Postflight Procedures'),
(11, 'Power Failure at a Hover'),
(11, 'Power Failure at Altitude'),
(11, 'Settling-with-power'),
(11, 'Low Rotor Rpm Recovery'),
(12, 'Confined Area Operation'),
(12, 'Pinnacle/platform Operations'),
(10, 'Cross-country Flight Planning'),
(7, 'Instrument Cockpit Check'),
(10, 'Air Traffic Control Clearances'),
(10, 'Compliance With Departure, en Route, and Arrival Procedures and Clearances'),
(10, 'Holding Procedures'),
(7, 'Flight by Reference to Instruments'),
(7, 'Recovery from Unusual Flight Attitudes'),
(10, 'Intercepting and Tracking Navigational Systems and DME'),
(8, 'Nonprecision Approach (NPA)'),
(8, 'Precision Approach (PA)'),
(9, 'Missed Approach'),
(8, 'Circling Approach'),
(9, 'Loss of Communications'),
(13, 'In Flight Instructional Methods'),
(14, 'Soft-Field Takeoff and Climb'),
(14, 'Soft-Field Approach and Landing'),
(14, 'Short-Field Takeoff and Maximum Performance Climb'),
(14, 'Short-Field Approach and Landing'),
(14, 'Confined Area Takeoff and Maximum Performance Climb'),
(14, 'Confined Area Approach and Landing'),
(6, 'Power-Off Approach and Landing'),
(3, 'Go-Around/Rejected Landing');

INSERT INTO AIRCRAFT (N_Number,Type,Empty_weight,Manufacturer,Model,Seats,Status)
VALUES
('N115LE', 'Helicopter', 875, 'Robinson', 'R22', 2, 'Maintenance'),
('N117LE', 'Helicopter', 885, 'Robinson', 'R22', 2, 'Operational'),
('N194LE', 'Helicopter', 880, 'Robinson', 'R22', 2, 'Operational'),
('N219LE', 'Helicopter', 1505, 'Robinson', 'R44', 4, 'Operational'),
('N424SH', 'Helicopter', 1500, 'Robinson', 'R44', 4, 'Operational'),
('N509MM', 'Helicopter', 1499, 'Robinson', 'R44', 4, 'Maintenance'),
('N516LE', 'Helicopter', 2309, 'Bell', '206', 4, 'Operational'),
('N597LE', 'Helicopter', 872, 'Robinson', 'R22', 2, 'Operational'),
('N601GM', 'Helicopter', 2340, 'Bell', '206', 4, 'Operational'),
('N688M', 'Airplane', 2195, 'Beechcraft', 'Bonanza', 5, 'Operational'),
('N734ST', 'Airplane', 1676, 'Cessna', '172', 4, 'Operational'),
('N74681', 'Helicopter', 1501, 'Robinson', 'R44', 4, 'Maintenance'),
('N17HZ', 'Airplane', 1680, 'Cessna', '172', 4, 'Operational'),
('N4913G', 'Airplane', 1684, 'Cessna', '172', 4, 'Operational'),
('N860CG', 'Airplane', 3965, 'Beechcraft', 'Baron', 6, 'Maintenance');

 -- ==== DATA SOURCES ====;
 -- Aircraft registration data: https://www.faa.gov/licenses_certificates/aircraft_certification/aircraft_registry/releasable_aircraft_download/;
 -- Sample person data: https://www.mockaroo.com/;
 -- FAA Practical Test Standards for lesson task data: https://www.faa.gov/training_testing/testing/test_standards/;
