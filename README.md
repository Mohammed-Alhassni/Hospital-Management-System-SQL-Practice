# Hospital Management System — SQL Practice

## System Description

The Hospital Management System (HMS) is a relational database designed to manage the core operations of a hospital. It tracks departments, doctors, patients, services, appointments, medical records, and billing. The system enforces data integrity through primary keys, foreign keys, unique constraints, check constraints, and referential actions — ensuring only valid and consistent data is stored.

---

## ERD Summary

### Entities and Key Attributes

| Entity | Primary Key | Notable Attributes |
|---|---|---|
| Department | department_id | name, location, num_doctors, phone |
| Doctor | doctor_id | name, specialization, phone, email, license_num, qualifications, experience, department_id (FK) |
| Patient | patient_id | f_name, l_name, phone, email, address, DOB, blood_type, gender |
| Service | service_id | name, type, price, description, department_id (FK) |
| Appointment | appointment_id | date, time, status, type, reason, patient_id (FK), doctor_id (FK) |
| Appointment_Service | (appointment_id, service_id) | quantity |
| Medical_Record | record_id | date, diagnosis, treatment, medication, notes, follow_up, patient_id (FK), doctor_id (FK), appointment_id (FK) |
| Billing | billing_id | billing_date, amount, payment_status, payment_method, due_date, patient_id (FK), appointment_id (FK) |

### Relationships

- **Department → Doctor (Has):** One department can have many doctors. Each doctor belongs to exactly one department. 1:M — FK placed on Doctor.
- **Department → Service (Provides):** One department can offer many services. Each service belongs to one department. 1:M — FK placed on Service.
- **Patient → Appointment (Books):** One patient can have many appointments. Each appointment belongs to exactly one patient. 1:M — FK placed on Appointment.
- **Doctor → Appointment (Handles):** One doctor can handle many appointments. Each appointment is assigned to exactly one doctor. 1:M — FK placed on Appointment.
- **Appointment ↔ Service (Includes):** An appointment can include many services, and a service can appear in many appointments. This M:N relationship is resolved through the **Appointment_Service** junction table, which also stores the `quantity` of each service used — making it a relationship with an attribute.
- **Patient → Medical_Record (Has):** One patient can have many medical records. 1:M — FK placed on Medical_Record.
- **Doctor → Medical_Record (Writes):** One doctor can write many medical records. 1:M — FK placed on Medical_Record.
- **Appointment → Medical_Record (Generates):** Each medical record is tied to a specific appointment. 1:1 or 1:M depending on implementation — FK placed on Medical_Record.
- **Patient → Billing (Billed):** One patient can have many billing records. 1:M — FK placed on Billing.
- **Appointment → Billing (Generates):** Each billing record corresponds to a specific appointment. 1:M — FK placed on Billing.

### Design Decisions

- `Appointment_Service` was introduced as a required junction table because the Appointment–Service relationship is many-to-many and carries a `quantity` attribute. A simple FK in either table would not correctly model this.
- `Medical_Record` references both `patient_id` and `doctor_id` directly even though both could be derived from the appointment. This denormalization is intentional for query performance — medical records are frequently accessed by patient or doctor independently of appointment context.
- `full_name` in Patient is split into `f_name` and `l_name` to satisfy 1NF and allow proper alphabetical sorting.

---

## Mapping Decisions

### Foreign Key Placement

All foreign keys follow the standard 1:M conversion rule — the FK is placed on the "many" side:

- `Doctor.department_id` → references `Department` (many doctors belong to one department)
- `Service.department_id` → references `Department` (many services belong to one department)
- `Appointment.patient_id` → references `Patient`
- `Appointment.doctor_id` → references `Doctor`
- `Medical_Record.patient_id` → references `Patient`
- `Medical_Record.doctor_id` → references `Doctor`
- `Medical_Record.appointment_id` → references `Appointment`
- `Billing.patient_id` → references `Patient`
- `Billing.appointment_id` → references `Appointment`

### M:N Resolution

`Appointment_Service(appointment_id, service_id, quantity)` — the composite primary key is formed from both foreign keys. The `quantity` column exists only in this table because it describes the relationship itself (how many units of a service were used in a given appointment), not any single entity alone.

### Normalization

- **1NF:** All attributes are atomic. No repeating groups. Full names are stored as separate first and last name columns.
- **2NF:** All non-key attributes are fully dependent on the entire primary key. In `Appointment_Service`, `quantity` depends on both `appointment_id` and `service_id` together — no partial dependencies.
- **3NF:** No transitive dependencies. Every non-key column in every table depends directly on that table's primary key, not on another non-key column.

---

## Errors Faced During Insert / Delete

**Insert errors:**
- Inserting into `Appointment` before inserting the referenced `Patient` or `Doctor` records causes a foreign key violation. The correct insertion order is: Department → Doctor → Patient → Service → Appointment → Appointment_Service → Medical_Record → Billing.
- Inserting a `Medical_Record` referencing an appointment that does not yet exist fails for the same reason.

**Delete errors:**
- Attempting to delete a patient who has existing appointments fails because `Appointment.patient_id` references `Patient`. The database enforces referential integrity and blocks the deletion. To proceed, the related appointments (and their downstream records — medical records, billing, appointment services) must be deleted first, or the FK must be defined with `ON DELETE CASCADE`.
- Deleting a cancelled appointment succeeds only if there are no child records referencing it (e.g., no billing or medical record linked to that appointment_id). Running a `SELECT` before the `DELETE` helps confirm this.

---

## WHERE vs. HAVING

**WHERE** filters individual rows before any grouping or aggregation takes place. It cannot reference aggregate functions like `COUNT()`, `SUM()`, or `AVG()`.

**HAVING** filters groups after a `GROUP BY` has been applied. It is used to place conditions on the results of aggregate functions.

A simple rule: WHERE works on rows, HAVING works on groups.

**Example from this project:**

```sql
-- Count appointments per doctor, show only doctors with more than 1
SELECT doctor_id, COUNT(*) AS total_appointments
FROM Appointment
WHERE status != 'Cancelled'          -- WHERE filters rows before grouping
GROUP BY doctor_id
HAVING COUNT(*) > 1;                 -- HAVING filters groups after aggregation
```

In the example above, WHERE first removes cancelled appointments from consideration, then GROUP BY groups the remaining rows by doctor, and finally HAVING keeps only the doctors who handled more than one appointment.

---

## Most Useful Aggregation Query

The most useful query in this project is the advanced-level revenue query that calculates total revenue per service using quantity multiplied by unit price:

```sql
SELECT 
    s.name AS service_name,
    SUM(a_s.quantity * s.price) AS total_revenue
FROM Appointment_Service a_s
JOIN Service s ON a_s.service_id = s.service_id
GROUP BY s.service_id, s.name
ORDER BY total_revenue DESC;
```

This query is useful because it combines data from two tables, applies a calculated expression inside an aggregate function, and produces a ranked list of services by the revenue they actually generated — not just their unit price. It reflects real-world business intelligence logic and would be directly useful to hospital management for resource allocation and pricing decisions.
