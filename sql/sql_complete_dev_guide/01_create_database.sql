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

insert INTO users (yearly_salary, full_name, current_status)
values (0, 'Michael SMith', 'unemployed');

select * from users;





