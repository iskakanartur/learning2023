--------------------------- CREATE A DB and A TABLE ----------------------------

create DATABASE onshop;

CREATE TABLE products(
    product_name VARCHAR (300),
    price NUMERIC (10,2),
    description TEXT,
    amount_instock int, 
    image_path VARCHAR (500) 
);

INSERT INTO products (product_name, price, description, amount_instock, image_path)
VALUES ('Կրունգի տակի կեղտի չեչաքար', 2899, ' Կրունգը մաքրելւո տուֆի քար', 134, 
'www.krngiqAR.COM'); 

INSERT INTO products (product_name, price, description, amount_instock, image_path)
VALUES ('Ականջի Կեղտի Մաքրիչ', 145.67, ' Անգաճ Մաքրելւո սարք', 167, 
'www.krngiqAR.COM'); 

select * from products;

---------------------------- ALTER COLUMNS AND ADD CONSTRAINTS ----------------------

ALTER table products
ALTER column product_name set not NULL, 
ALTER column price set set not NULL,
alter column description set not NULL,
add constraint price_positive check (price > 0),
add constraint amount_instock_positive check (amount_instock > 0);

----- Add auto increment id
ALTER table products add column id serial primary key;



