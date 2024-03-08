CREATE SCHEMA ORMModel1
GO

GO


CREATE TABLE ORMModel1.Tampus
(
	tampusID int IDENTITY (1, 1) NOT NULL,
	departmentName nvarchar(30) NOT NULL,
	CONSTRAINT Tampus_PK PRIMARY KEY(tampusID)
)
GO


CREATE TABLE ORMModel1.DeptSchoolsEngineering
(
	deptSchoolsEngineeringName nvarchar(30) NOT NULL,
	engineeringDeptCode nchar(20) NOT NULL,
	scienceDeptCode nchar(20) NOT NULL,
	departmentName nvarchar(30),
	CONSTRAINT DeptSchoolsEngineering_PK PRIMARY KEY(deptSchoolsEngineeringName)
)
GO


CREATE TABLE ORMModel1.Student
(
	studentName nvarchar(30) NOT NULL,
	deptSchoolsEngineeringName nvarchar(30),
	tampusID int,
	CONSTRAINT Student_PK PRIMARY KEY(studentName)
)
GO


CREATE TABLE ORMModel1.Courses
(
	coursesId int IDENTITY (1, 1) NOT NULL,
	engineeringDeptCode nchar(20) NOT NULL,
	scienceDeptCode nchar(20) NOT NULL,
	CONSTRAINT Courses_PK PRIMARY KEY(coursesId),
	CONSTRAINT Courses_UC1 UNIQUE(engineeringDeptCode),
	CONSTRAINT Courses_UC2 UNIQUE(scienceDeptCode)
)
GO


ALTER TABLE ORMModel1.Student ADD CONSTRAINT Student_FK1 FOREIGN KEY (deptSchoolsEngineeringName) REFERENCES ORMModel1.DeptSchoolsEngineering (deptSchoolsEngineeringName) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.Student ADD CONSTRAINT Student_FK2 FOREIGN KEY (tampusID) REFERENCES ORMModel1.Tampus (tampusID) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


GO