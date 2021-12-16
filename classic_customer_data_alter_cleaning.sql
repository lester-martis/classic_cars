SELECT * FROM classicmodels.customers;

/* 1. The following query created to concatanate customer's first and last name as full name
and remove the 2 columns which are no more required. 
*/
ALTER TABLE customers ADD COLUMN full_name varchar(60);

UPDATE customers SET full_name = concat(contactFirstName, " ", contactLastName);

ALTER TABLE customers DROP COLUMN contactFirstName;
ALTER TABLE customers DROP COLUMN contactLastName;

/*2. This query about moving a column position to a desired position.*/
ALTER TABLE customers modify full_name varchar(60) AFTER customerName;