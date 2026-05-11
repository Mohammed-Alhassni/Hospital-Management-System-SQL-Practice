use HMS2

-- 1. Show doctors with more than 1 appointment.
select Doctor.Doctor_id, count(Appointment.Appointment_id) as [total_appoinment]
from Doctor
    inner join Appointment on Appointment.Doctor_id = Doctor.Doctor_id
group by Doctor.Doctor_id
having count(Appointment.Appointment_id) > 1

-- 2. Show services used more than 2 times.
select Service.Service_id, Service.Service_name, count(Appointment_service.Quantity) as [quantity]
from Service
    join Appointment_service on Service.Service_id = Appointment_service.Service_id
group by Service.Service_id, Service.Service_name
having count(Appointment_service.Quantity) > 2

-- 3. Show departments with more than 1 doctor.
select Department.Dept_id, Department.Dept_name, count(Doctor.Doctor_id) as [total_doctors]
from Department
    join Doctor on Department.Dept_id = Doctor.Dept_id
group by Department.Dept_id, Department.Dept_name
having count(Doctor.Doctor_id) > 1

-- 4. Show payment statuses where total amount is more than 50.
select Billing.Bill_id, Billing.Payment_status, Billing.Total_amount
from Billing
where Billing.Total_amount > 50

-- 5. Find the most used service.
select top 1
    Service.Service_id, Service.Service_name, count(Appointment_service.Quantity) as [quantity]
from Service
    join Appointment_service on Appointment_service.Service_id = Service.Service_id
group by Service.Service_id, Service.Service_name
order by count(Appointment_service.Quantity) desc

-- 6. Find the highest revenue service using quantity × unit price.
select top 1
    Service.Service_id, Service.Service_name, sum(Appointment_service.Quantity * Service.Unit_price) as [service_revenue]
from Service
    join Appointment_service on Appointment_service.Service_id = Service.Service_id
group by Service.Service_id, Service.Service_name
order by sum(Appointment_service.Quantity * Service.Unit_price) desc