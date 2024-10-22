DROP TABLE ManagementCenter;
DROP TABLE InventoryCenter;
DROP TABLE AppointmentRecord;
DROP TABLE PatientRecord;
DROP TABLE  DistributionCenter;
DROP TABLE Vaccine;
DROP TABLE  HealthcareProvider;

CREATE TABLE HealthcareProvider (
    ProviderID INT PRIMARY KEY,
    DoctorID INT,
    Doctor_name VARCHAR(255),
    InsuranceID INT,
    Specialty VARCHAR(255)
);

INSERT INTO HealthcareProvider (ProviderID, DoctorID, Doctor_name, InsuranceID, Specialty)
VALUES (400, 6000, 'Perry', 70000, 'Pediatrics');
INSERT INTO HealthcareProvider (ProviderID, DoctorID, Doctor_name, InsuranceID, Specialty)
VALUES (401, 6001, 'Figueroa', 70001, 'Oncology');
INSERT INTO HealthcareProvider (ProviderID, DoctorID, Doctor_name, InsuranceID, Specialty)
VALUES (402, 6002, 'Russel', 70002, 'Pulmonology');
INSERT INTO HealthcareProvider (ProviderID, DoctorID, Doctor_name, InsuranceID, Specialty)
VALUES (403, 6003, 'Santos', 70003, 'Infectious diseases');

--Create the Vaccine table
CREATE TABLE Vaccine (
    VaccineID INT PRIMARY KEY,
    Name VARCHAR(255),
    Manufacturer VARCHAR(255),
    Dosage INT,
    Type_of_vaccine VARCHAR(255)
);

-- Insert data into the Vaccine table
INSERT INTO Vaccine (VaccineID, Name, Manufacturer, Dosage, Type_of_vaccine)
VALUES (5000, 'Spike Vax', 'Moderna', 3, 'mRNA');
INSERT INTO Vaccine (VaccineID, Name, Manufacturer, Dosage, Type_of_vaccine)
VALUES (5001, 'Comirnaty', 'Pfizer', 4, 'mRNA');
INSERT INTO Vaccine (VaccineID, Name, Manufacturer, Dosage, Type_of_vaccine)
VALUES (5002, 'Covishield', 'AstraZeneca', 1, 'Vector');
INSERT INTO Vaccine (VaccineID, Name, Manufacturer, Dosage, Type_of_vaccine)
VALUES (5003, 'Novaxovid', 'Novavax', 2, 'Protein subunit');

-- Create the DistributionCenter table
CREATE TABLE DistributionCenter (
    CenterID INT PRIMARY KEY,
    ProviderID INT,
    Location VARCHAR(255),
    Capacity INT,
    FOREIGN KEY (ProviderID) REFERENCES HealthcareProvider(ProviderID)
);

-- Insert data into the DistributionCenter table
INSERT INTO DistributionCenter (CenterID, ProviderID, Location, Capacity)
VALUES (3000, 401, 'Baltimore', 100000);
INSERT INTO DistributionCenter (CenterID, ProviderID, Location, Capacity)
VALUES (3001, 403, 'Colombia', 50000);
INSERT INTO DistributionCenter (CenterID, ProviderID, Location, Capacity)
VALUES (3002, 400, 'Salisbury', 60000);
INSERT INTO DistributionCenter (CenterID, ProviderID, Location, Capacity)
VALUES (3003, 401, 'Catonsville', 80000);

-- Create the PatientRecord table
CREATE TABLE PatientRecord (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(255),
    ContactInfo VARCHAR(255),
    Immunocompromised_status VARCHAR(3),
    Patient_record VARCHAR(10),
    ProviderID INT,
    FOREIGN KEY (ProviderID) REFERENCES HealthcareProvider(ProviderID)
);

-- Create the AppointmentRecord table
CREATE TABLE AppointmentRecord (
    AppointmentID INT PRIMARY KEY,
    "Date" DATE,
    "Time" TIMESTAMP,
    Location VARCHAR(255),
    PatientID INT,
    FOREIGN KEY (PatientID) REFERENCES PatientRecord(PatientID)
);

-- Insert data into the PatientRecord table
INSERT INTO PatientRecord (PatientID, Name, ContactInfo, Immunocompromised_status, Patient_record, ProviderID)
VALUES (800, 'Peter', '698-587-963', 'Yes', 'B01', 400);
INSERT INTO PatientRecord (PatientID, Name, ContactInfo, Immunocompromised_status, Patient_record, ProviderID)
VALUES (801, 'Andrea', '459-863-951', 'No', 'B02', 401);
INSERT INTO PatientRecord (PatientID, Name, ContactInfo, Immunocompromised_status, Patient_record, ProviderID)
VALUES (802, 'Monica', '785-951-357', 'No', 'B03', 402);
INSERT INTO PatientRecord (PatientID, Name, ContactInfo, Immunocompromised_status, Patient_record, ProviderID)
VALUES (803, 'Brian', '698-357-951', 'Yes', 'B04', 403);

-- Insert data into the AppointmentRecord table
INSERT INTO AppointmentRecord (AppointmentID, "Date", "Time", Location, PatientID)
VALUES (7000, TO_DATE('2021-12-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2021-12-06 16:48:00', 'YYYY-MM-DD HH24:MI:SS'), 'Baltimore', 802);
INSERT INTO AppointmentRecord (AppointmentID, "Date", "Time", Location, PatientID)
VALUES (7001, TO_DATE('2022-09-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-09-08 11:03:00', 'YYYY-MM-DD HH24:MI:SS'), 'Colombia', 801);
INSERT INTO AppointmentRecord (AppointmentID, "Date", "Time", Location, PatientID)
VALUES (7002, TO_DATE('2021-03-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2021-03-09 10:22:00', 'YYYY-MM-DD HH24:MI:SS'), 'Salisbury', 800);
INSERT INTO AppointmentRecord (AppointmentID, "Date", "Time", Location, PatientID)
VALUES (7003, TO_DATE('2022-12-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2022-12-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Catonsville', 803);

-- Create the InventoryCenter table
CREATE TABLE InventoryCenter (
    InventoryID INT PRIMARY KEY,
    Quality VARCHAR(255),
    Expiry_date DATE,
    CenterID INT,
    VaccineID INT,
    FOREIGN KEY (CenterID) REFERENCES DistributionCenter(CenterID),
   FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID)
);

-- Create the ManagementCenter table
CREATE TABLE ManagementCenter (
    InventoryID INT PRIMARY KEY,
    CenterID INT,
    FOREIGN KEY (InventoryID) REFERENCES InventoryCenter(InventoryID),
    FOREIGN KEY (CenterID) REFERENCES DistributionCenter(CenterID)
);
-- Insert data into the InventoryCenter table
INSERT INTO InventoryCenter (InventoryID, Quality, Expiry_date, CenterID, VaccineID)
VALUES (1100, 'Good', TO_DATE('2025-01-15', 'YYYY-MM-DD'), 3000, 5000);
INSERT INTO InventoryCenter (InventoryID, Quality, Expiry_date, CenterID, VaccineID)
VALUES (1101, 'Bad', TO_DATE('2024-06-29', 'YYYY-MM-DD'), 3001, 5001);
INSERT INTO InventoryCenter (InventoryID, Quality, Expiry_date, CenterID, VaccineID)
VALUES (1102, 'Good', TO_DATE('2025-08-19', 'YYYY-MM-DD'), 3002, 5002);
INSERT INTO InventoryCenter (InventoryID, Quality, Expiry_date, CenterID, VaccineID)
VALUES (1103, 'Good', TO_DATE('2024-03-23', 'YYYY-MM-DD'), 3003, 5003);

-- Insert data into the ManagementCenter table
INSERT INTO ManagementCenter (InventoryID, CenterID)
VALUES (1100, 3000);
INSERT INTO ManagementCenter (InventoryID, CenterID)
VALUES (1101, 3001);
INSERT INTO ManagementCenter (InventoryID, CenterID)
VALUES (1102, 3002);
INSERT INTO ManagementCenter (InventoryID, CenterID)
VALUES (1103, 3003);



--Join Statement
SELECT
    mc.InventoryID,
    ic.Quality,
    ic.Expiry_date,
    ic.CenterID AS InventoryCenter_CenterID,
    dc.Location AS InventoryCenter_Location,
    ic.VaccineID,
    vc.Name AS Vaccine_Name,
    mc.CenterID AS ManagementCenter_CenterID,
    dc.Location AS ManagementCenter_Location
FROM
    ManagementCenter mc
JOIN
    InventoryCenter ic ON mc.InventoryID = ic.InventoryID
JOIN
    DistributionCenter dc ON ic.CenterID = dc.CenterID
JOIN
    Vaccine vc ON ic.VaccineID = vc.VaccineID;

--Query:  For each patient who places an appointment, what is the patient’s name and ID as well as their Appointment ID, Location, Date and Time. 
SELECT PatientRecord.PatientID, AppointmentID, Name, Location, "Date", "Time"
FROM PatientRecord JOIN AppointmentRecord on PatientRecord.PatientID = AppointmentRecord.PatientID;

--Query: ount the number of people who are immunocompromised. One column will display the immunocompromised status (yes or no) and the other column will show the number of people it applies to.
--Group by total immunocompromised
SELECT Immunocompromised_status, COUNT(Immunocompromised_status)
    FROM PatientRecord
      GROUP BY Immunocompromised_status
        ORDER BY Immunocompromised_status;
        
--query will count the number of occurrences of good quality or bad quality. It will display if the number is greater than 1. Since we have 3 that are ‘good’ and 1 that is ‘bad’ it will only display the good quality.
--Group by vaccine quality, more than 1 occurrence 
SELECT Quality, COUNT(Quality)
    FROM InventoryCenter
      GROUP BY Quality
      HAVING COUNT(Quality) > 1;

--The first statement updates the ‘Doctor_name’ to ‘Dr.Smith’ for the healthcare provider with ‘ProviderID’ 400 in the ‘healthcareProvider’ table.
--The second statement updates the dosage of the vaccine with ‘VaccineID’ 5001 to 5 in the ‘Vaccine’ table.
--Update Statement one
UPDATE HealthcareProvider
  SET Doctor_name = 'Dr. Smith'
  WHERE ProviderID = 400;
--Update Statement two
UPDATE Vaccine
  SET Dosage = 5
  WHERE VaccineID = 5001;