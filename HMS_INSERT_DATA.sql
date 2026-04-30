INSERT INTO Department (Dept_id, Dept_name, Location, No_of_doctors, Contact_number, Manager_ID) VALUES
(1, 'Cardiology', 'First Floor', 2, '24560001', NULL),
(2, 'Neurology', 'Second Floor', 2, '24560002', NULL),
(3, 'Orthopedics', 'Third Floor', 2, '24560003', NULL),
(4, 'General Medicine', 'Ground Floor', 2, '24560004', NULL);

INSERT INTO Doctor (Doctor_id, Name, Specialization, Phone_no, Email, License_no, Qualification, Years_of_experience, Dept_id, Supervisor_ID) VALUES
(1, 'Dr. Ahmed', 'Cardiologist', '91234567', 'ahmed@hospital.com', 'LIC1001', 'MD Cardiology', 10, 1, NULL),
(2, 'Dr. Sara', 'Cardiologist', '91234568', 'sara@hospital.com', 'LIC1002', 'MD Cardiology', 7, 1, 1),
(3, 'Dr. Khalid', 'Neurologist', '91234569', 'khalid@hospital.com', 'LIC1003', 'MD Neurology', 9, 2, NULL),
(4, 'Dr. Noor', 'Neurologist', '91234570', 'noor@hospital.com', 'LIC1004', 'MD Neurology', 6, 2, 3),
(5, 'Dr. Ali', 'Orthopedic', '91234571', 'ali@hospital.com', 'LIC1005', 'MD Orthopedics', 8, 3, NULL),
(6, 'Dr. Mona', 'Orthopedic', '91234572', 'mona@hospital.com', 'LIC1006', 'MD Orthopedics', 5, 3, 5),
(7, 'Dr. Hassan', 'General Physician', '91234573', 'hassan@hospital.com', 'LIC1007', 'MBBS', 12, 4, NULL),
(8, 'Dr. Fatma', 'General Physician', '91234574', 'fatma@hospital.com', 'LIC1008', 'MBBS', 4, 4, 7);

UPDATE Department SET Manager_ID = 1 WHERE Dept_id = 1;
UPDATE Department SET Manager_ID = 3 WHERE Dept_id = 2;
UPDATE Department SET Manager_ID = 5 WHERE Dept_id = 3;
UPDATE Department SET Manager_ID = 7 WHERE Dept_id = 4;

INSERT INTO Patient (Patient_id, F_name, L_name, Phone_no, Email, Address, DOB, Blood_group, Gender, Age) VALUES
(1, 'Salim', 'Al-Harthi', '92345671', 'salim@email.com', 'Muscat', '1995-05-10', 'O+', 'Male', 31),
(2, 'Aisha', 'Al-Balushi', '92345672', 'aisha@email.com', 'Seeb', '1998-07-15', 'A+', 'Female', 28),
(3, 'Khalfan', 'Al-Rawahi', '92345673', 'khalfan@email.com', 'Barka', '1990-03-22', 'B+', 'Male', 36),
(4, 'Noor', 'Al-Mamari', '92345674', 'noor@email.com', 'Muscat', '2000-11-01', 'AB+', 'Female', 25),
(5, 'Huda', 'Al-Saadi', '92345675', 'huda@email.com', 'Nizwa', '1993-02-14', 'O-', 'Female', 33),
(6, 'Saeed', 'Al-Kindi', '92345676', 'saeed@email.com', 'Sohar', '1988-09-09', 'A-', 'Male', 37),
(7, 'Maryam', 'Al-Hinai', '92345677', 'maryam@email.com', 'Muscat', '1996-12-30', 'B-', 'Female', 29),
(8, 'Ali', 'Al-Abri', '92345678', 'ali@email.com', 'Ibri', '1992-06-18', 'O+', 'Male', 34);

INSERT INTO Service (Service_id, Service_name, Service_type, Unit_price, Description, Dept_id) VALUES
(1, 'Consultation', 'Consultation', 15.000, 'General doctor consultation', 4),
(2, 'ECG', 'Lab Test', 20.000, 'Heart test', 1),
(3, 'MRI', 'X-Ray', 50.000, 'Brain scan', 2),
(4, 'X-Ray', 'X-Ray', 25.000, 'Bone scan', 3),
(5, 'Blood Test', 'Lab Test', 10.000, 'Basic blood test', 4),
(6, 'Physiotherapy', 'Treatment', 30.000, 'Physical therapy session', 3),
(7, 'Minor Surgery', 'Surgery', 200.000, 'Small surgical procedure', 3),
(8, 'Follow-up Visit', 'Consultation', 10.000, 'Follow-up appointment', 4);

INSERT INTO Appointment (Appointment_id, Date, Time, Status, Appointment_type, Reason, Doctor_id, Patient_id) VALUES
(1, '2026-04-01', '09:00:00', 'Completed', 'Consultation', 'Chest pain', 1, 1),
(2, '2026-04-02', '10:00:00', 'Completed', 'Emergency', 'Headache', 2, 3),
(3, '2026-04-03', '11:00:00', 'Scheduled', 'Follow-up', 'Knee pain', 3, 5),
(4, '2026-04-04', '12:00:00', 'Completed', 'Consultation', 'Fever', 4, 7),
(5, '2026-04-05', '09:30:00', 'Cancelled', 'Consultation', 'Back pain', 5, 6),
(6, '2026-04-06', '10:30:00', 'Completed', 'Emergency', 'Heart check', 6, 2),
(7, '2026-04-07', '11:30:00', 'Completed', 'Consultation', 'Bone injury', 7, 5),
(8, '2026-04-08', '12:30:00', 'Scheduled', 'Consultation', 'General checkup', 8, 8),
(9, '2026-04-09', '09:15:00', 'Completed', 'Follow-up', 'Follow-up heart test', 1, 1),
(10, '2026-04-10', '10:15:00', 'Completed', 'Consultation', 'Migraine', 2, 4);

INSERT INTO Appointment_service (Service_id, Appointment_id, Quantity) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 1),
(5, 2, 2),
(4, 3, 1),
(1, 4, 1),
(5, 4, 1),
(6, 5, 2),
(2, 6, 1),
(1, 6, 1),
(4, 7, 1),
(6, 7, 1),
(1, 8, 1),
(2, 9, 1),
(8, 9, 1),
(3, 10, 1),
(1, 10, 1);

INSERT INTO Medical_record (Record_id, Visit_date, Diagnosis, Treatment_plan, Prescribed_medications, Doctor_notes, Follow_up_required, Appointment_id) VALUES
(1, '2026-04-01', 'Mild chest pain', 'Medication and rest', 'Painkiller', 'Patient stable', 1, 1),
(2, '2026-04-02', 'Migraine symptoms', 'MRI and medication', 'Migraine medicine', 'Needs follow-up', 1, 2),
(3, '2026-04-04', 'Fever infection', 'Antibiotics', 'Antibiotic', 'Monitor temperature', 0, 4),
(4, '2026-04-06', 'Heart rhythm issue', 'ECG follow-up', 'Heart medication', 'Needs monitoring', 1, 6),
(5, '2026-04-07', 'Minor bone injury', 'Physiotherapy', 'Pain relief', 'Improving', 1, 7),
(6, '2026-04-09', 'Heart follow-up', 'Continue treatment', 'Same medication', 'Better condition', 0, 9),
(7, '2026-04-10', 'Headache issue', 'MRI review', 'Painkiller', 'Check scan result', 1, 10);

INSERT INTO Billing (Bill_id, Bill_date, Total_amount, Payment_method, Due_date, Appointment_id, Patient_id) VALUES
(1, '2026-04-01', 35.000, 'Card', '2026-04-05', 1, 1),
(2, '2026-04-02', 70.000, 'Insurance', '2026-04-06', 2, 3),
(3, '2026-04-04', 25.000, 'Cash', '2026-04-08', 4, 7),
(4, '2026-04-06', 35.000, 'Card', '2026-04-10', 6, 2),
(5, '2026-04-07', 55.000, 'Cash', '2026-04-11', 7, 5),
(6, '2026-04-09', 30.000, 'Card', '2026-04-13', 9, 1),
(7, '2026-04-10', 65.000, 'Insurance', '2026-04-14', 10, 4);