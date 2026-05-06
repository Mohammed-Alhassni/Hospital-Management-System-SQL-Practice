use HMS2

/*Update Task*/

-- 1. Update one appointment from Scheduled to Completed.
update Appointment set Status = 'Completed' where Appointment_id = 8;

-- 2. Change one bill from Pending to Paid.
update Billing set Payment_status = 'Paid' where Bill_id = 5

-- 3. Increase all service prices by 10%.
select * from Service
update Service set Unit_price = Unit_price * 1.1

-- 4. Update one patient’s phone number.
select * from Patient
update Patient set Phone_no = '9999999' where Patient_id = 3

-- 5. Move one doctor to another department. 
select * from Doctor
update Doctor set Dept_id = 4 where Doctor_id = 2


/*Delete Task*/

-- 1. Delete one cancelled appointment.
select * from Appointment
delete from Appointment_service where Appointment_id = 5
delete from Billing where Appointment_id = 5
delete from Medical_record where Appointment_id = 5
delete from Appointment where Appointment_id = 5

-- 2. Delete one service that was never used.

-- 3. Delete one billing record entered by mistake.
-- 4. Try to delete a patient who has appointments and explain why it fails. 
