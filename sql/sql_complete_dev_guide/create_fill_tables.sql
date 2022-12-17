
-------SQL - The Complete Developer's Guide (MySQL, PostgreSQL) -----FOLDER 04 -------------
             ---------------------------------------------------------
                           ------------------------

-- CREATE DATABASE talently; 


--------------------------CREATE TYPE/ ALTER TYPE -  ENUM --------------------------

-- drop table users; 

CREATE type employment_status as ENUM ('employed',  'unemployed', 'seelf-employed'); 
ALTER type employment_status  add value 'self-employed';


CREATE TABLE users (full_name VARCHAR(200),
yearly_salary INT,
current_status employment_status);

insert INTO users (yearly_salary, full_name, current_status)
values (19000, 'Max Schwarz', 'self-employed');

insert INTO users (yearly_salary, full_name, current_status)
values (0, 'Michael SMith', 'unemployed');

insert INTO users (yearly_salary, full_name, current_status)
values (27890, 'Սահակյան Գարիկ Անուշի', 'employed');


select * from users; 

CREATE TABLE employers (
    company_name  VARCHAR (200), 
    copany_address VARCHAR (300),
    yearly_revenue FLOAT (5,2) 
    yearly_revenue NUMERIC (5,2)
); 

SELECT * from employers; 


ALTER TABLE employers 
add column is_hiring boolean ;


CREATE TABLE conversation (
    user_name VARCHAR (200),
    employer_name VARCHAR (250),
    message text,
    date_sent timestamp 
);

alter table employers
rename column copany_address to company_address;

INSERT INTO employers (company_name,  company_address, yearly_revenue, is_hiring)
values ('Պլյոնդրակ եվ Փողինձ ԱՁ', 'Վարդանանց փողոց  13', 0.87, TRUE); 

INSERT INTO employers (company_name,  company_address, yearly_revenue, is_hiring)
values ('Բազումի Կլունձ', 'Չուխաջյան փ․  13', 146.77, FALSE); 

INSERT INTO employers (company_name,  company_address, yearly_revenue, is_hiring)
values ('Զմբիշ եվ Ըմբիշ', 'Բզնունյանց  13', 112.55, FALSE); 

INSERT INTO employers (company_name,  company_address, yearly_revenue, is_hiring)
values ('Պացան եվ Պոռնիկ ՍՊԸ', 'Երեվանյան խճուղի  13', 0.23, TRUE); 

INSERT INTO employers (company_name,  company_address, yearly_revenue, is_hiring)
values ('Անթրո եվ Սանդրո ՍՊԸ', 'Սոթլիկ Փողոց  32', 146.89, FALSE); 


select * from users; 
select * from employers; 
select * FROM conversation; 


INSERT INTO conversation (user_name, employer_name, message, date_sent)
values ('Max Schwarz', 'Պլյոնդրակ եվ Փողինձ ԱՁ', 'Hi, I like Learning!', '2021-10-15 16:32:11'); 


------------------------ALTER TABLES AND DEFAULT VALUES ---------------------------

ALTER TABLE employers alter column yearly_revenue set data type float ; 

ALTER table users alter column full_name set NOT NULL ; 
ALTER table users alter column current_status set NOT NULL ;

select * from users; 
-- Michael Smith has a 0 salar hence the errror message that some row viloates the condition 
-- of check/ The Solution is to modify that row

ALTER table users add constraint yearly_salary_positive check (yearly_salary > 0); 

UPDATE users set yearly_salary = NULL 
where full_name = 'Michael SMith'; 

ALTER table users add constraint yearly_salary_positive check (yearly_salary > 0); 

 
ALTER TABLE conversation ALTER column  date_sent 
set default current_timestamp;

ALTER table employers alter column is_hiring
set default FALSE;

INSERT INTO conversation (user_name, employer_name, message)
values ('Մռավյան Մանուկ Վասպուրի', 'Շուն եվ Շան որդի ԱՁ', 'Էս խիա ոռս քոր գալի');

INSERT INTO conversation (user_name, employer_name, message)
values ('Ավեդիքյան Սեվադա Բեհզեբուղի', 'Շիշ հվաքողների միութոյւն', 'Չիշիկ ունեմ բայց շատ չի');

INSERT INTO employers (company_name,  company_address, yearly_revenue)
values ('Շիշ հվաքողների միութոյւն', 'Սղլիկ Նրբանցք 15', 0.34); 

SELECT * FROM conversation; 
SELECT * FROM employers; 



-------------------------- UNIQUE ID s/ PRIMARY KEY/ RECREATING TABLES------------------------

-- dropping all tables and recreating them with unique and ID
DROP table conversation;
drop TABLE employers;
DROP TABLE users; 

-- for postgres you first create type
CREATE type employment_status as ENUM ('self-employed', 'unemployed', 'employed');

CREATE TABLE users (
    id serial primary KEY,
    full_name VARCHAR (300) NOT NULL,
    yearly_salary int check (yearly_salary > 0),
    current_status employment_status -- this is for postgres
); 

CREATE TABLE employers (
    id serial primary KEY,
    company_name VARCHAR (300) NOT NULL,
    company_address VARCHAR (300) NOT NULL,
    yearly_revenue float check (yearly_revenue > 0 ),
    is_hiring boolean  default FALSE
); 

CREATE TABLE conversations (
    id serial primary KEY,
    user_id INT,
    employer_id INT,
    message TEXT NOT NULL
); 


------SQL - The Complete Developer's Guide (MySQL, PostgreSQL) -----FOLDER 05 -------------
             ---------------------------------------------------------
                           ------------------------

---- Basic Table Setup

CREATE TABLE sales (
    id serial primary key,
    date_created date default current_date,
    date_fulfilled date,
    current_name VARCHAR (300) not NULL,
    product_name VARCHAR (300) not NULL,
    volume NUMERIC (10,3) not null check (volume >= 0),
    is_recurring boolean default FALSE,
    is_disputed boolean default FALSE 
);

ALTER table sales  rename column current_name to customer_name;

INSERT INTO sales (customer_name, product_name, volume, is_recurring)
VALUES ('Մամաջանյան Ռուզաննա Ծմավոնի', 'Կրունգի Քար Տուֆից', 3.4, TRUE);

---- MULTIPLE ROW INSERTION
INSERT INTO sales (date_fulfilled,  customer_name, product_name, volume, 
is_recurring, is_disputed)
VALUES (NULL, 'Փարեմուզյան Արթուր Ծծլոյի', 'Մի հաստ Մատյան', 0.35, FALSE, FALSE),
('2022-04-10', 'Ստեփանյան Տաթեվիկ Զուլումի', 'Քույրի Սումկա', 1.45, FALSE, TRUE); 

select * from sales;

------------------------- INSERT MORE DUMMY DATA/ SOURCE-----------------------------
-- https://github.com/academind/sql-complete-guide-code/blob/05-data-manipulation-crud/sql/03-insert-more-data.sql

--- The right data
INSERT INTO sales (
  date_created,
  date_fulfilled,
  customer_name,
  product_name,
  volume,
  is_disputed,
  is_recurring
)
VALUES 
('2009-05-19', '2009-03-18', 'Դեղին Գույնի Ջորի', 'Կտասկած', 567.90,  True, False),
('2014-03-14', '2014-03-18', 'Ծննդիս Օրվա Հեծո', 'ԱՌլյոնկ', 489.99,  FALSE, TRUE),

('2022-01-18', '2022-03-11', 'Company A', 'A Nice Product', 489.99,  FALSE, TRUE),
('2022-01-18', '2022-05-01', 'Company B','Video Game Collection', 3859.12,  FALSE, FALSE),
( '2021-12-05', NULL, 'Company C', 'Daily News Summary', 4.99, FALSE, TRUE),
('2021-12-05','2021-12-07', 'Company A',  'Good-looking carpet', 1099.82, TRUE, FALSE), 
('2022-02-21', '2022-02-24', 'Max Schwarz', 'Lord of the Rings Collection', 69.99, FALSE, FALSE), 
('2021-10-14','2022-02-21','Max Schwarz','Lord of the Rings Movies',25.99, FALSE, FALSE), 
('2022-06-01',NULL,'Max Schwarz','Another book',8.99,FALSE,FALSE), 
('2021-08-17','2021-09-12','Company D','Vehicle Services',4999.99,TRUE,TRUE), 
('2021-03-12','2022-06-19','Company D','Vehicle Fleet',280000,FALSE,FALSE);

-- WRONG DATA
INSERT INTO sales (
  date_created,
  date_fulfilled,
  customer_name,
  product_name,
  volume
)
VALUES ('2021-12-09','2021-12-17','Company Z','A Tuck', 109.0);

-------------------------------- UPDATE /DELETE A ROW-------------------

update sales set product_name = 'A Truck',
volume = volume * 1000 where id = 44;

DELETE from sales  where id = 44; 

--------------------------- Select Columns MODIFIED / ALIAS --------------

select date_created, customer_name, product_name, volume, volume * 35.314667 as volume_inches
from sales;


select * from sales; 

------------------------ SELECT CONDITION / WHERE CLAUSE/ BOOLEAN SEARCH -------------
select * from sales where is_recurring IS FALSE;

------------------------ COMBINE CONDITIONS SELECT AND /OR -----------------------
select * from sales WHERE (is_disputed is TRUE) AND (volume > 500); 

------------------------- GREATER SMALLER RANGES/ BETWEEN  ----------------------------------
SELECT * from sales where date_created > '2011-11-02' and date_created < '2022-05-01'; 
select * from sales where date_created BETWEEN '2011-11-02' and '2022-05-01';

select * from sales; 

----------------------- WORKING WITH DATE and TIME DIFFERENCES ----------------------------
