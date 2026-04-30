create database HMS2

use HMS2

create table Department 
(
	Dept_id int primary key,
	Dept_name varchar(100),
	Location varchar(100),
	No_of_doctors int,
	Contact_number varchar(20),
	Manager_ID int
)

create table Doctor
(
	Doctor_id int primary key,
	Name varchar(100),
	Specialization varchar(100),
	Phone_no varchar(20),
	Email varchar(100),
	License_no varchar(50),
	Qualification varchar(100),
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
	F_name varchar(50),
	L_name varchar(50),
	Phone_no varchar(20),
	Email varchar(100),
	Address varchar(255),
	DOB date,
	Gender varchar(10),
	Blood_group varchar(5),
	Age int
)

create table Service 
(
	Service_id int primary key,
	Service_name varchar(100),
	Service_type varchar(50),
	Unit_price float,
	Description varchar(255),
	Dept_id int,
	constraint fk_Ser_Dept foreign key (Dept_id) references Department(Dept_id)
)

create table Appointment 
(
	Appointment_id int primary key,
	Date date,
	Time time,
	Status varchar(20),
	Appointment_type varchar(50),
	Reason varchar(255),
	Doctor_id int,
	Patient_id int,
	constraint fk_app_doc foreign key (Doctor_id) references Doctor(Doctor_id),
	constraint fk_app_pat foreign key (Patient_id) references Patient(Patient_id)
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
	Diagnosis varchar(255),
	Treatment_plan varchar(255),
	Prescribed_medications varchar(255),
	Doctor_notes varchar(max),
	Follow_up_required bit,
	Appointment_id int,
	constraint fk_rec_app foreign key (Appointment_id) references Appointment(Appointment_id)
)

create table Billing 
(
	Bill_id int primary key,
	Bill_date date,
	Total_amount float,
	Payment_method varchar(50),
	Due_date date,
	Appointment_id int,
	Patient_id int,
	constraint fk_bil_app foreign key (Appointment_id) references Appointment(Appointment_id),
	constraint fk_bil_pat foreign key (Patient_id) references Patient(Patient_id)
)