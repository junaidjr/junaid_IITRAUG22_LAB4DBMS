create database e_commerce;

use e_commerce;

create table supplier 
( 
SUPP_ID int, 
SUPP_NAME varchar (50) not null, 
SUPP_CITY varchar (50) not null, 
SUPP_PHONE varchar(50) not null,
primary key(SUPP_ID)
);

create table customer 
(
CUS_ID int,
CUS_NAME varchar(20) not null,
CUS_PHONE varchar(10) not null,
CUS_CITY varchar(30) not null,
CUS_GENDER char,
primary key(CUS_ID)
);

create table category 
(
CAT_ID int,
CAT_NAME varchar(20) not null,
primary key(CAT_ID)
);

create table product
(
PRO_ID int,
PRO_NAME varchar(20) not null default 'Dummy',
PRO_DESC varchar(60),
CAT_ID int,
primary key(PRO_ID),
foreign key(CAT_ID) references category(CAT_ID)
);

create table supplier_pricing
(
PRICING_ID int,
PRO_ID int,
SUPP_ID int,
SUPP_PRICE int default 0,
primary key(PRICING_ID),
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier(SUPP_ID)
);

create table `order`
(
ORD_ID int,
ORD_AMOUNT int not null,
ORD_DATE date not null,
CUS_ID int,
PRICING_ID int,
primary key(ORD_ID),
foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

create table rating 
(
RAT_ID int,
ORD_ID int,
RAT_RATSTARS int not null,
primary key(RAT_ID),
foreign key(ORD_ID) references `order`(ORD_ID)
);

Insert into supplier values(1, 'Rajesh Retails', 'Delhi', '1234567890');
Insert into supplier values(2, 'Appario Ltd', 'Mumbai', '2589631470');
Insert into supplier values(3, 'Knome products', 'Bangalore', '9785462315');
Insert into supplier values(4, 'Bansal Retails', 'Kochi', '8975463285');
Insert into supplier values(5, 'Mittal Ltd', 'Lucknow', '7898456532');

Insert into customer values(1, 'AAKASH', '9999999999', 'DELHI', 'M');
Insert into customer values(2, 'AMAN', '9785463215', 'NOIDA', 'M');
Insert into customer values(3, 'NEHA', '9999999999', 'MUMBAI', 'F');
Insert into customer values(4, 'MEGHA', '9994562399', 'KOLKATA', 'F');
Insert into customer values(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

Insert into category values(1, 'BOOKS');
Insert into category values(2, 'GAMES');
Insert into category values(3, 'GROCERIES');
Insert into category values(4, 'ELECTRONICS');
Insert into category values(5, 'CLOTHES');

Insert into product values(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
Insert into product values(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
Insert into product values(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
Insert into product values(4, 'OATS', 'Highly Nutritious from Nestle', 3);
Insert into product values(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
Insert into product values(6, 'MILK', '1L Toned MIlk', 3);
Insert into product values(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
Insert into product values(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
Insert into product values(9, 'Project IGI', 'compatible with windows 7 and above', 2);
Insert into product values(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
Insert into product values(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1);
Insert into product values(12, 'Train Your Brain', 'By Shireen Stephen', 1);

Insert into supplier_pricing values(1, 1, 2, 1500);
Insert into supplier_pricing values(2, 3, 5, 30000);
Insert into supplier_pricing values(3, 5, 1, 3000);
Insert into supplier_pricing values(4, 2, 3, 2500);
Insert into supplier_pricing values(5, 4, 1, 1000);
Insert into supplier_pricing values(6, 12, 2, 780);
Insert into supplier_pricing values(7, 12, 4, 789);
Insert into supplier_pricing values(8, 3, 1, 31000);
Insert into supplier_pricing values(9, 1, 5, 1450);
Insert into supplier_pricing values(10, 4, 2, 999);
Insert into supplier_pricing values(11, 7, 3, 549);
Insert into supplier_pricing values(12, 7, 4, 529);
Insert into supplier_pricing values(13, 6, 2, 105);
Insert into supplier_pricing values(14, 6, 1, 99);
Insert into supplier_pricing values(15, 2, 5, 2999);
Insert into supplier_pricing value(16, 5, 2, 2999);

Insert into `order` values(101, 1500, '2021-10-06', 2, 1);
Insert into `order` values(102, 1000, '2021-10-12', 3, 5);
Insert into `order` values(103, 30000, '2021-09-16', 5, 2);
Insert into `order` values(104, 1500, '2021-10-05', 1, 1);
Insert into `order` values(105, 3000, '2021-08-16', 4, 3);
Insert into `order` values(106, 1450, '2021-08-18', 1, 9);
Insert into `order` values(107, 789, '2021-09-01', 3, 7);
Insert into `order` values(108, 780, '2021-09-07', 5, 6);
Insert into `order` values(109, 3000, '2021-08-10', 5, 3);
Insert into `order` values(110, 2500, '2021-09-10', 2, 4);
Insert into `order` values(111, 1000, '2021-09-15', 4, 5);
Insert into `order` values(112, 789, '2021-09-16', 4, 7);
Insert into `order` values(113, 31000, '2021-09-16', 1, 8);
Insert into `order` values(114, 1000, '2021-09-16', 3, 5);
Insert into `order` values(115, 3000, '2021-09-16', 5, 3);
Insert into `order` values(116, 99, '2021-09-17', 2, 14);

Insert into rating values(1, 101, 4);
Insert into rating values(2, 102, 3);
Insert into rating values(3, 103, 1);
Insert into rating values(4, 104, 2);
Insert into rating values(5, 105, 4);
Insert into rating values(6, 106, 3);
Insert into rating values(7, 107, 4);
Insert into rating values(8, 108, 4);
Insert into rating values(9, 109, 3);
Insert into rating values(10, 110, 5);
Insert into rating values(11, 111, 3);
Insert into rating values(12, 112, 4);
Insert into rating values(13, 113, 2);
Insert into rating values(14, 114, 1);
Insert into rating values(15, 115, 1);
Insert into rating values(16, 116, 0);

select count(*) as Total_Customers from customer INNER JOIN `order` ON customer.CUS_ID = `order`.CUS_ID where customer.CUS_GENDER = 'M' AND `order`.ORD_AMOUNT>=3000;

select `order`.ORD_ID, product.PRO_NAME from `order` JOIN product ON product.PRO_ID where `order`.CUS_ID = 2;

select supplier.SUPP_NAME, count(supplier_pricing.PRICING_ID) from supplier JOIN supplier_pricing ON supplier.SUPP_ID = supplier_pricing.SUPP_ID group by supplier.SUPP_NAME having count(supplier_pricing.PRICING_ID)>1;

select category.CAT_ID, category.CAT_NAME, product.PRO_NAME, supplier_pricing.SUPP_PRICE from category INNER JOIN product ON category.CAT_ID = product.CAT_ID INNER JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID;

select product.PRO_ID, product.PRO_NAME from product where product.PRO_ID IN (select product.PRO_ID from `order` where ORD_DATE > '2021-10-05');

select CUS_NAME, CUS_GENDER from customer where CUS_NAME LIKE '%A' OR CUS_NAME LIKE 'A%';

CREATE PROCEDURE Display_supplier_rating()
SELECT supplier.SUPP_ID, supplier.SUPP_NAME, rating.RAT_RATSTARS,
CASE
WHEN RAT_RATSTARS = 5 THEN 'Excellent Service'
WHEN RAT_RATSTARS >= 4 THEN 'Good Service'
WHEN RAT_RATSTARS > 2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_service
from supplier LEFT JOIN rating ON SUPP_ID;
