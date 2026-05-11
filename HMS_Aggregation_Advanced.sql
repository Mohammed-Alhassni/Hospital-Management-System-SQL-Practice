use HMS2

-- 1. Show doctors with more than 1 appointment.
select Doctor.Doctor_id, count(Appointment.Appointment_id) as [total_appoinment]
from Doctor
    inner join Appointment on Appointment.Doctor_id = Doctor.Doctor_id
group by Doctor.Doctor_id
having count(Appointment.Appointment_id) > 1

-- 2. Show services used more than 2 times.
-- 3. Show departments with more than 1 doctor.
-- 4. Show payment statuses where total amount is more than 50.
-- 5. Find the most used service.
-- 6. Find the highest revenue service using quantity × unit price.