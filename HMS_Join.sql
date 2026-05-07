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