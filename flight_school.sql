CREATE TABLE IF NOT EXISTS PERSON (
  Pid        INTEGER        NOT NULL AUTO_INCREMENT,
  Fname      VARCHAR(20)    NOT NULL,
  Lname      VARCHAR(20)    NOT NULL,
  Bday       TEXT,
  Phone      CHAR(10)       NOT NULL,
  Street     VARCHAR(20)    NOT NULL,
  City       VARCHAR(20)    NOT NULL,
  State      VARCHAR(20)    NOT NULL,
  Email      VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Pid)
  );

CREATE TABLE IF NOT EXISTS PILOT_EXAMINER (
  Peid        INTEGER        NOT NULL,
  PRIMARY KEY (Peid),
  FOREIGN KEY (Peid) REFERENCES PERSON(Pid)
);

CREATE TABLE IF NOT EXISTS AUTHORIZATIONS (
  Peid             INTEGER        NOT NULL,
  Authorization    VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Peid, Authorization),
  FOREIGN KEY(Peid) REFERENCES PILOT_EXAMINER(Peid) 
);

CREATE TABLE IF NOT EXISTS EMPLOYEE (
  Eid          INTEGER        NOT NULL,
  Hire_date    TEXT           NOT NULL,
  Ssn          CHAR(9)        NOT NULL,
  PRIMARY KEY (Eid),
  FOREIGN KEY (Eid) REFERENCES PERSON(Pid)
);

CREATE TABLE IF NOT EXISTS INSTRUCTOR (
  Iid            INTEGER        NOT NULL,
  Specialty      VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Iid),
  FOREIGN KEY (Iid) REFERENCES EMPLOYEE(Eid)
);

CREATE TABLE IF NOT EXISTS INST_CERTIFICATIONS (
  Iid              INTEGER        NOT NULL,
  Certification    VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Iid, Certification),
  FOREIGN KEY (Iid) REFERENCES INSTRUCTOR(Iid)
);




-- PERSON INSERT STATEMENTS
INSERT INTO "PERSON" ("Pid","Fname","Lname","Birthday","Phone","Email","Street","City","State") VALUES
('1', 'Tobit', 'Danielian', '1/10/1973', '650-350-8206', 'tdanielian0@washington.edu', '1 Nelson Place', 'Eugene', 'Oregon'),
('31', 'Osbert', 'Wollrauch', '9/6/1987', '256-628-4426', 'owollrauchu@businessweek.com', '99731 Mariners Cove Avenue', 'Bend', 'Oregon'),
('4', 'Clemmy', 'Rizzello', '10/27/1956', '859-319-5574', 'crizzello3@comsenz.com', '6 Manley Alley', 'Bend', 'Oregon'),
('5', 'Georgette', 'Riply', '10/23/1988', '214-914-1938', 'griply4@youtu.be', '56447 Mcbride Point', 'Prineville', 'Oregon'),
('12', 'Elston', 'Rasch', '12/17/1994', '302-590-9098', 'eraschb@theguardian.com', '05865 Merry Junction', 'Bend', 'Oregon'),
('7', 'Bill', "O'Deegan", '4/21/1965', '530-904-3015', 'bodeegan6@microsoft.com', '444 Towne Lane', 'Redmond', 'Oregon'),
('2', 'Gallagher', 'Mayston', '12/2/1970', '216-778-6014', 'gmayston1@storify.com', '08 Swallow Court', 'Prineville', 'Oregon'),
('13', 'Alane', 'Letteresse', '5/27/1982', '408-827-4202', 'aletteressec@google.it', '69 Raven Terrace', 'Bend', 'Oregon'),
('3', 'Ransom', 'Karolczyk', '8/20/1956', '570-311-4986', 'rkarolczyk2@newsvine.com', '873 Mosinee Crossing', 'Redmond', 'Oregon'),
('10', 'Timothea', 'Sturge', '4/15/1980', '206-774-9707', 'tsturge9@gmpg.org', '4 Calypso Lane', 'Portland', 'Oregon'),
('6', 'Bordie', 'Fautly', '11/26/1989', '401-159-3589', 'bfautly5@1688.com', '486 Pond Terrace', 'Bend', 'Oregon'),
('47', 'Jasper', 'Emmer', '12/22/1995', '919-411-3986', 'jemmer1a@cargocollective.com', '09725 Darwin Trail', 'Redmond', 'Oregon'),
('9', 'Hanny', 'Ellcome', '3/31/2000', '469-753-6207', 'hellcome8@china.com.cn', '59 Crescent Oaks Lane', 'Prineville', 'Oregon'),
('14', 'Egbert', 'Favelle', '2/4/2000', '719-104-2812', 'efavelled@imgur.com', '70696 Jenifer Center', 'Colorado Springs', 'Colorado'),
('15', 'Mallissa', 'Allgood', '3/20/1963', '925-193-3608', 'mallgoode@t-online.de', '12 Pine View Alley', 'Hayward', 'California'),
('16', 'Hertha', 'Kibard', '9/28/1964', '478-338-6069', 'hkibardf@zdnet.com', '04 Elka Drive', 'Macon', 'Georgia'),
('17', 'Deidre', 'Giacovetti', '10/9/1960', '313-880-1339', 'dgiacovettig@ucoz.com', '78 Bonner Place', 'Detroit', 'Michigan'),
('18', 'Allix', 'Gallier', '7/25/1957', '614-251-6978', 'agallierh@boston.com', '8138 Judy Street', 'Columbus', 'Ohio'),
('19', 'Belia', 'Patzelt', '2/25/1996', '402-751-3107', 'bpatzelti@elpais.com', '079 Kennedy Plaza', 'Omaha', 'Nebraska'),
('20', 'Lancelot', 'Emanuele', '2/14/1970', '863-533-6593', 'lemanuelej@webnode.com', '50 Dovetail Terrace', 'Lehigh Acres', 'Florida'),
('21', 'Cesya', 'Benck', '7/24/1983', '901-491-1495', 'cbenckk@creativecommons.org', '6995 Delaware Drive', 'Corvallis', 'Oregon'),
('22', 'Ulick', 'Bakey', '2/22/1969', '727-656-5823', 'ubakeyl@netvibes.com', '0285 Holmberg Center', 'Klamath Falls', 'Oregon'),
('23', 'Mal', 'Grabban', '6/9/1984', '806-873-3784', 'mgrabbanm@netscape.com', '52514 Vahlen Avenue', 'Amarillo', 'Texas'),
('24', 'Letizia', 'Meaddowcroft', '3/5/1961', '408-944-2688', 'lmeaddowcroftn@deliciousdays.com', '2 Swallow Place', 'San Jose', 'California'),
('25', 'Sully', 'Sugden', '6/15/1966', '202-703-7252', 'ssugdeno@icq.com', '1610 Aberg Point', 'Washington', 'District of Columbia'),
('26', 'Allsun', 'Petche', '9/3/1979', '818-302-6631', 'apetchep@mysql.com', '22982 Pankratz Crossing', 'North Hollywood', 'California'),
('27', 'Cesaro', 'Pitbladdo', '5/18/1978', '904-351-5153', 'cpitbladdoq@reddit.com', '4 Kipling Crossing', 'Jacksonville', 'Florida'),
('28', 'Ardyth', 'Jikovsky', '2/17/1957', '813-258-3681', 'ajikovskyr@soup.io', '079 Pennsylvania Way', 'Tampa', 'Florida'),
('29', 'Astrix', 'Binge', '11/11/1972', '651-826-1440', 'abinges@cyberchimps.com', '82 Washington Alley', 'Minneapolis', 'Minnesota'),
('30', 'Ikey', 'Hourihane', '2/2/1956', '256-856-1669', 'ihourihanet@technorati.com', '4 Hagan Park', 'Anniston', 'Alabama'),
('8', 'Muffin', 'Coulsen', '6/13/1974', '312-536-0888', 'mcoulsen7@naver.com', '995 Spaight Place', 'Bend', 'Oregon'),
('32', 'Kiah', 'Gurry', '7/19/1966', '205-833-3573', 'kgurryv@webeden.co.uk', '5 Londonderry Junction', 'Birmingham', 'Alabama'),
('33', 'Adrien', 'Swafield', '10/26/1951', '765-541-5114', 'aswafieldw@who.int', '5 Sunnyside Circle', 'Anderson', 'Indiana'),
('34', 'Giustina', 'Toop', '11/17/1968', '215-692-4745', 'gtoopx@deviantart.com', '2323 Bay Hill', 'Philadelphia', 'Pennsylvania'),
('35', 'Isa', 'Blucher', '12/23/1981', '765-522-7650', 'ibluchery@smh.com.au', '8 Killdeer Drive', 'Crawfordsville', 'Indiana'),
('36', 'Belle', 'Rattrie', '9/12/1970', '518-158-3306', 'brattriez@jalbum.net', '2 Dunning Alley', 'Albany', 'New York'),
('37', 'Paxon', 'Adam', '4/8/1975', '540-389-3535', 'padam10@toplist.cz', '56 Lakewood Gardens Center', 'Roanoke', 'Virginia'),
('38', 'Athena', 'Francescotti', '4/1/1953', '812-978-3191', 'afrancescotti11@nba.com', '566 Del Mar Terrace', 'Evansville', 'Indiana'),
('39', 'Wendeline', 'Shreve', '2/9/1956', '502-993-5477', 'wshreve12@nymag.com', '2767 Drewry Center', 'Louisville', 'Kentucky'),
('40', 'Immanuel', 'Pocock', '4/19/1994', '615-346-6951', 'ipocock13@seesaa.net', '281 Golf Parkway', 'Nashville', 'Tennessee'),
('41', 'Diane', 'Krug', '3/24/1990', '678-363-6755', 'dkrug14@hugedomains.com', '66429 Leroy Place', 'Gainesville', 'Georgia'),
('42', 'Grantley', 'Phippin', '7/1/1972', '212-107-4659', 'gphippin15@issuu.com', '2958 Del Sol Trail', 'New York City', 'New York'),
('43', 'Harriott', 'Cissen', '10/2/1981', '202-741-9846', 'hcissen16@spiegel.de', '8534 Truax Street', 'Redmond', 'Oregon'),
('44', 'Niels', 'Moyse', '4/23/1961', '501-409-0826', 'nmoyse17@w3.org', '4 Main Circle', 'Hot Springs National Park', 'Arkansas'),
('45', 'Leupold', 'Haitlie', '10/30/1974', '404-236-3424', 'lhaitlie18@webnode.com', '63539 Mcbride Plaza', 'Atlanta', 'Georgia'),
('46', 'Jacqueline', 'Blaydon', '11/19/1976', '425-129-9808', 'jblaydon19@skype.com', '249 Vernon Drive', 'Everett', 'Washington'),
('11', 'Udall', 'Cardinale', '8/29/1956', '619-130-5217', 'ucardinalea@deliciousdays.com', '7891 Nancy Hill', 'Redmond', 'Oregon'),
('48', 'Bartie', 'Foottit', '5/2/1985', '702-744-2013', 'bfoottit1b@wikipedia.org', '64288 Meadow Ridge Center', 'Las Vegas', 'Nevada'),
('49', 'Ernestus', 'Rolls', '12/15/1960', '785-158-7255', 'erolls1c@stumbleupon.com', '4 Vera Plaza', 'Bend', 'Oregon'),
('50', 'Isabel', 'MacDermott', '8/12/1985', '979-838-0196', 'imacdermott1d@yahoo.com', '61657 Lakewood Trail', 'Bryan', 'Texas')
;