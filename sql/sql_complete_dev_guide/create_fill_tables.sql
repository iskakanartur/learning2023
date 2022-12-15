-- CREATE DATABASE talently; 


-- ALTER type employment_status  add value 'self-employed'
-- after  'seelf-employed';

-- CREATE type employment_status as ENUM ('employed',  'unemployed', 'seelf-employed'); 


-- CREATE TABLE users (full_name VARCHAR(200),
-- yearly_salary INT,
-- current_status employment_status);

-- insert INTO users (yearly_salary, full_name, current_status)
-- values (19000, 'Max Schwarz', 'self-employed');

-- select * from users; 

-- insert INTO users (yearly_salary, full_name, current_status)
-- values (0, 'Michael SMith', 'unemployed');

-- select * from users;

-- CREATE TABLE employers (
    -- company_name  VARCHAR (200), 
    -- copany_address VARCHAR (300),
    -- yearly_revenue FLOAT (5,2) 
    -- yearly_revenue NUMERIC (5,2)
--); 

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

