create database if not exists StockUp_db;
use StockUp_db;

create table if not exists Company (
company_ID int not null auto_increment,
company_Name varchar(45) not null,
company_Address varchar(255) not null,
company_PhoneNumber int(10) not null,
primary key (company_ID)
);

create table if not exists Admins (
admin_ID int not null auto_increment,
admin_Name varchar(45) not null,
admin_Surname varchar(45) not null,
admin_PhoneNumber int(10) not null,
company_ID int not null,
username varchar(45) not null unique,
password varchar(45) not null,
primary key (admin_ID),
foreign key (company_ID) references Company (company_ID)
);

create table if not exists Dispatch (
dispatch_ID int not null auto_increment,
dispatch_Name varchar(45) not null,
dispatch_Surname varchar(45) not null,
dispatch_PhoneNumber int(10) not null,
company_ID int not null,
username varchar(45) not null unique,
password varchar(45) not null,
primary key (dispatch_ID),
foreign key (company_ID) references Company (company_ID)
);

create table if not exists Product (
product_ID int not null auto_increment,
product_Name varchar(45) not null,
product_UnitsPerCrate int not null,
company_ID int not null,
primary key (product_ID),
foreign key (company_ID) references Company (company_ID)
);

create table if not exists Store (
store_ID int not null auto_increment,
store_Name varchar(45) not null,
store_Address varchar(255) not null,
store_PhoneNumber int(10) not null,
primary key (store_ID)
);

create table if not exists Staff (
staff_ID int not null auto_increment,
staff_Name varchar(45) not null,
staff_Surname varchar(45) not null,
staff_PhoneNumber int(10) not null,
store_ID int not null,
username varchar(45) not null unique,
password varchar(45) not null,
primary key (staff_ID),
foreign key (store_ID) references Store (store_ID)
);

create table if not exists Orders (
order_ID int not null auto_increment,
order_Date date not null,
store_ID int not null,
primary key (order_ID),
foreign key (store_ID) references Store (store_ID)
);

create table if not exists OrderDetails (
od_CratesOrdered int not null,
product_ID int not null,
order_ID int not null,
primary key (product_ID, order_ID),
foreign key (product_ID) references Product (product_ID),
foreign key (order_ID) references Orders (order_ID)
);

