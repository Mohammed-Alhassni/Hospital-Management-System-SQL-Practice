use HMS2

-- 1. Count total patients.
select count(Patient.Patient_id) as [total_patients]
from Patient

-- 2. Count total doctors.
select count(doctor_id) as [total_doctors]
from Doctor

-- 3. Count total appointments.
select count(Appointment_id) as [total_appointments]
from Appointment

-- 4. Find total billing amount.
select sum(Total_amount) as [total_billing_amount]
from Billing

-- 5. Find average service price.
select avg(Unit_price) as [average_service_price]
from Service
--or
select sum(Unit_price)/count(Service_id) as [average_service_price]
from Service

-- 6. Find highest and lowest service price.
select max(Unit_Price) as [highest_price], min(Unit_price) as [lowest_price]
from Service