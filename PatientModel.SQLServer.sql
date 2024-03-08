CREATE SCHEMA ORMModel1
GO

GO


CREATE TABLE ORMModel1.Patient
(
	patientNr int NOT NULL,
	genderCode nchar(2) NOT NULL,
	patientName nvarchar(40) NOT NULL,
	roweHistory nvarchar(200) NOT NULL,
	diastolicBloodPressure smallint CHECK (diastolicBloodPressure >= 0),
	malePatientHasProstatitis bit,
	systolicBloodPressure smallint CHECK (systolicBloodPressure >= 0),
	CONSTRAINT Patient_PK PRIMARY KEY(patientNr),
	CONSTRAINT Patient_genderCode_RoleValueConstraint1 CHECK (genderCode IN (N'M', N'F'))
)
GO


CREATE TABLE ORMModel1.PatientIsAllergicToDrug
(
	drugName nvarchar(30) NOT NULL,
	patientNr int NOT NULL,
	CONSTRAINT PatientIsAllergicToDrug_PK PRIMARY KEY(patientNr, drugName)
)
GO


CREATE TABLE ORMModel1.DrugTaking
(
	drugName nvarchar(30) NOT NULL,
	patientNr int NOT NULL,
	dosage smallint CHECK (dosage >= 0),
	CONSTRAINT DrugTaking_PK PRIMARY KEY(patientNr, drugName)
)
GO


CREATE TABLE ORMModel1.FemalePatient
(
	femalePatientNr int NOT NULL,
	isPregnant bit,
	CONSTRAINT FemalePatient_PK PRIMARY KEY(femalePatientNr)
)
GO


ALTER TABLE ORMModel1.PatientIsAllergicToDrug ADD CONSTRAINT PatientIsAllergicToDrug_FK FOREIGN KEY (patientNr) REFERENCES ORMModel1.Patient (patientNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.DrugTaking ADD CONSTRAINT DrugTaking_FK FOREIGN KEY (patientNr) REFERENCES ORMModel1.Patient (patientNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


ALTER TABLE ORMModel1.FemalePatient ADD CONSTRAINT FemalePatient_FK FOREIGN KEY (femalePatientNr) REFERENCES ORMModel1.Patient (patientNr) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


GO