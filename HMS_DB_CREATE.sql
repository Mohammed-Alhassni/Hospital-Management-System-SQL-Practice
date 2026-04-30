create database HMS2

use HMS2

create table Department 
(
	Dept_id int primary key,
	Dept_name varchar,
	Location varchar,
	No_of_doctors int,
	Contact_number int,
	Manager_ID int
)

create table Doctor
(
	Doctor_id int primary key,
	Name varchar,
	Specialization varchar,
	Phone_no varchar,
	Email varchar,
	License_no varchar,
	Qualification varchar,
	Years_of_experience int,
	Dept_id int,
	Supervisor_ID int 
)

alter table Doctor   
add constraint fk_doc_dept 
	foreign key (Dept_id) references Department(Dept_id)

alter table Doctor   
add constraint fk_doc_doc 
	foreign key (Supervisor_ID) references Doctor(Doctor_id)

alter table Department   
add constraint fk_dept_doc 
	foreign key (Manager_ID) references Doctor(Doctor_id)

create table Patient 
(
	Patient_id int primary key,
	F_name varchar,
	L_name varchar,
	Phone_no varchar,
	Email varchar,
	Address varchar,
	DOB date,
	Gender varchar,
	Blood_group varchar,
	Age int
)

create table Service 
(
	Service_id int primary key,
	Service_name varchar,
	Service_type varchar,
	Unit_price float,
	Description varchar,
	Dept_id int,
	constraint fk_Ser_Dept foreign key (Dept_id) references Department(Dept_id)
)

create table Appointment 
(
	Appointment_id int primary key,
	Date date,
	Time time,
	Status varchar,
	Appointment_type varchar,
	Reason varchar,
	Doctor_id int,
	Patient_id int,
	constraint fk_app_doc foreign key (Doctor_id) references Doctor(Doctor_id),
	constraint fk_app_pat foreign key (Patient_id) references Patient(Patient_id),
)

create table Appointment_service 
(
	Service_id int,
	Appointment_id int,
	Quantity int,
	primary key (Service_id, Appointment_id),
	constraint fk_appser_ser foreign key (Service_id) references Service(Service_id),
	constraint fk_appser_app foreign key (Appointment_id) references Appointment(Appointment_id)
)

create table Medical_record
(
	Record_id int primary key,
	Visit_date date,
	Diagnosis varchar,
	Treatment_plan varchar,
	Prescribed_medications varchar,
	Doctor_notes varchar,
	Follow_up_required bit,
	Appointment_id int,
	constraint fk_rec_app foreign key (Appointment_id) references Appointment(Appointment_id)
)

create table Billing 
(
	Bill_id int primary key,
	Bill_date date,
	Total_amount float,
	Payment_method varchar,
	Due_date date,
	Appointment_id int,
	Patient_id int,
	constraint fk_bil_app foreign key (Appointment_id) references Appointment(Appointment_id),
	constraint fk_bil_pat foreign key (Patient_id) references Patient(Patient_id)
)