use HMS2

/* PART 1: JOIN OF 2 TABLES */
select Appointment.*, Patient.* from Appointment 
full join Patient on Patient.Patient_id = Appointment.Patient_id

select Doctor.*, Department.* from Doctor
full join Department on Department.Dept_id = Doctor.Dept_id

select Appointment.Appointment_id, Appointment.Status, Patient.F_name + ' ' + Patient.L_name as [full_name] from Appointment
inner join Patient on Patient.Patient_id = Appointment.Patient_id

select Appointment.Appointment_id, Doctor.Name, Appointment.Status from Appointment
inner join Doctor on Doctor.Doctor_id = Appointment.Doctor_id

select Service.Service_name, Service.Unit_price, Department.Dept_name from Service
inner join Department on Department.Dept_id = Service.Dept_id

/* PART 2: APPLY FILTER */
select Appointment.Appointment_id, Appointment.Appointment_type, Appointment.Date, Appointment.Reason, Appointment.Time, Appointment.Status, Patient.F_name + ' ' + Patient.L_name as [full_name] from Appointment 
inner join Patient on Patient.Patient_id = Appointment.Patient_id
where status = 'Completed'

select Doctor.*, Department.* from Doctor
full join Department on Department.Dept_id = Doctor.Dept_id
where Dept_name = 'Cardiology'

select * from Service where Unit_price > 20

/* PART 3: CHALLENGE */
select Patient.F_name + ' ' + Patient.L_name as [full_name], Doctor.Name, Appointment.Date from Appointment
inner join Doctor on Doctor.Doctor_id = Appointment.Doctor_id
inner join Patient on Patient.Patient_id = Appointment.Patient_id

select Patient.F_name + ' ' + Patient.L_name as [full_name], Department.Dept_name, Appointment.Status from Appointment
inner join Doctor on Doctor.Doctor_id = Appointment.Doctor_id
inner join Department on Doctor.Dept_id = Department.Dept_id
inner join Patient on Patient.Patient_id = Appointment.Patient_id

select Patient.F_name + ' ' + Patient.L_name as [full_name], Service.Service_name, Appointment_service.Quantity from Appointment_service
inner join Service on Service.Service_id =  Appointment_service.Service_id
inner join Appointment on Appointment.Appointment_id = Appointment_service.Appointment_id
inner join Patient on Patient.Patient_id = Appointment.Patient_id

/* FINAL CHALLENGE */
select Patient.F_name + ' ' + Patient.L_name as [full_name], Doctor.Name, Service.Service_name, Appointment.Date from Appointment
inner join Appointment_service on Appointment.Appointment_id =  Appointment_service.Appointment_id
inner join Service on Service.Service_id = Appointment_service.Service_id
inner join Patient on Patient.Patient_id = Appointment.Patient_id
inner join Doctor on Doctor.Doctor_id = Appointment.Doctor_id
