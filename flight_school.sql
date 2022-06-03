CREATE TABLE IF NOT EXISTS PERSON (
  Pid        INTEGER        NOT NULL AUTO_INCREMENT,
  Fname      VARCHAR(20)    NOT NULL,
  Lname      VARCHAR(20)    NOT NULL,
  Birthday   TEXT,
  Phone      CHAR(10)       NOT NULL,
  Street     VARCHAR(20)    NOT NULL,
  City       VARCHAR(20)    NOT NULL,
  State      VARCHAR(20)    NOT NULL,
  Email      VARCHAR(254)   NOT NULL,
  PRIMARY KEY (Pid)
  );

CREATE TABLE IF NOT EXISTS PILOT_EXAMINER (
  Pid        INTEGER        NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES PERSON(Pid)
);

CREATE TABLE IF NOT EXISTS EXAMINER_AUTHORIZATION (
  Pid          INTEGER    NOT NULL,
  Cert_type    INTEGER    NOT NULL,
  PRIMARY KEY (Pid, Cert_type),
  FOREIGN KEY(Pid) REFERENCES PILOT_EXAMINER(Pid),
  FOREIGN KEY(Cert_type) REFERENCES CERT_TYPE(Ceid)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE (
  Pid          INTEGER        NOT NULL,
  Hire_date    TEXT           NOT NULL,
  Ssn          CHAR(9)        NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES PERSON(Pid)
);

CREATE TABLE IF NOT EXISTS STUDENT (
  Pid                 INTEGER    NOT NULL,
  Date_enrolled       TEXT       NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES PERSON(Pid)  
);

CREATE TABLE IF NOT EXISTS INSTRUCTOR_AUTHORIZATION (
  Instructor        INT       NOT NULL,
  Course_type       INT       NOT NULL,
  PRIMARY KEY (Instructor, Course_type),
  FOREIGN KEY (Instructor) REFERENCES INSTRUCTOR(Pid)
);

CREATE TABLE IF NOT EXISTS INSTRUCTOR (
  Pid            INTEGER        NOT NULL,
  Specialty      VARCHAR(20)    NOT NULL,
  PRIMARY KEY (Pid),
  FOREIGN KEY (Pid) REFERENCES EMPLOYEE(Pid)
);

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

CREATE TABLE IF NOT EXISTS CERTIFICATION (
  Student        INTEGER      NOT NULL,
  Examiner       INTEGER      NOT NULL,
  Cert_type      INTEGER      NOT NULL,
  PRIMARY KEY(Student, Examiner, Cert_type),
  FOREIGN KEY (Student) REFERENCES STUDENT(Pid),
  FOREIGN KEY (Examiner) REFERENCES PILOT_EXAMINER(Pid)
);

CREATE TABLE IF NOT EXISTS CERT_TYPE (
  Ceid             INTEGER        NOT NULL,
  Name             VARCHAR(20)    NOT NULL,
  Is_helicopter    INTEGER        NOT NULL,
  Is_airplane      INTEGER        NOT NULL,
  PRIMARY KEY (Ceid)
);

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

CREATE TABLE IF NOT EXISTS COURSE_TYPE (
  Ctid              INTEGER        NOT NULL AUTO_INCREMENT,
  Cname             VARCHAR(30)    NOT NULL,
  Required_hours    INTEGER        NOT NULL,
  Cost              INTEGER        NOT NULL,
  Cert_type         INTEGER        NOT NULL,
  PRIMARY KEY (Ctid),
  FOREIGN KEY (Cert_type) REFERENCES CERT_TYPE(Ceid)
);

CREATE TABLE IF NOT EXISTS COURSE_LESSONS (
  Course      INTEGER       NOT NULL,
  Lesson      INTEGER       NOT NULL,
  PRIMARY KEY (Course, Lesson),
  FOREIGN KEY (Course) REFERENCES COURSE_TYPE(Ctid),
  FOREIGN KEY (Lesson) REFERENCES LESSON(Lid)
);

CREATE TABLE IF NOT EXISTS LESSON (
  Lid         INTEGER        NOT NULL,
  L_name      VARCHAR(30)    NOT NULL,
  PRIMARY KEY (Lid)
);

CREATE TABLE IF NOT EXISTS LESSON_TASKS (
  Lid        INTEGER         NOT NULL,
  Task_name  VARCHAR(30)     NOT NULL,
  PRIMARY KEY (Lid, Task_name),
  FOREIGN KEY (Lid) REFERENCES LESSON(Lid)
);

CREATE TABLE IF NOT EXISTS AIRCRAFT (
  N_number        VARCHAR(10)        NOT NULL,
  Type            VARCHAR(30)        NOT NULL,
  Empty_weight    INTEGER            NOT NULL,
  Manufacturer    VARCHAR(30)        NOT NULL,
  Model           VARCHAR(30)        NOT NULL,
  Seats           INTEGER            NOT NULL,
  Status          VARCHAR(15),
  PRIMARY KEY (N_number)
);

