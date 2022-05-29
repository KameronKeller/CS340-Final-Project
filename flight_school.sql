CREATE TABLE IF NOT EXISTS PERSON (
  Pid        CHAR(9)        NOT NULL,
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
  Peid        VARCHAR(20)        NOT NULL,
  PRIMARY KEY (Peid),
  FOREIGN KEY (Peid) REFERENCES PERSON(Pid)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE (
  Eid          CHAR(9)        NOT NULL,
  Hire_date    TEXT           NOT NULL,
  Ssn          CHAR(9)        NOT NULL,
  PRIMARY KEY (Eid),
  FOREIGN KEY (Eid) REFERENCES PERSON(Pid)
);

CREATE TABLE IF NOT EXISTS INSTRUCTOR (
  Iid            CHAR(9)        NOT NULL,
  Specialty      VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Iid),
  FOREIGN KEY (Iid) REFERENCES EMPLOYEE(Eid)
);

CREATE TABLE IF NOT EXISTS INST_CERTIFICATIONS (
  Iid              CHAR(9)        NOT NULL,
  Certification    VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Iid, Certification),
  FOREIGN KEY (Iid) REFERENCES INSTRUCTOR(Iid)
);

