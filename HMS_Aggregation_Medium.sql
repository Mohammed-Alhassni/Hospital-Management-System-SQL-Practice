use HMS2

-- 1. Count doctors in each department.
select Dept_id, count(Doctor_id) as [Total_Doctors]
from Doctor
group by Dept_id

-- 2. Count appointments for each doctor.
select Doctor_id, count(Appointment_id) as [total_appointments]
from Appointment
group by Doctor_id

-- 3. Count appointments by status.
select status, count(Appointment_id) as [total_appointments]
from Appointment
group by status

-- 4. Find total billing amount by payment status.
select Payment_status, sum(Total_amount) as [total_billing_amount]
from Billing
group by Payment_status

-- 5. Find average service price by service type.
select Service_type, avg(Unit_price) as [Average_service_price]
from Service
group by Service_type

-- 6. Find total quantity used for each service.
select Service.Service_name, sum(Appointment_service.Quantity) as [total_quantity]
from Service
    left join Appointment_Service on Service.Service_id = Appointment_service.Service_id
group by Service.Service_name