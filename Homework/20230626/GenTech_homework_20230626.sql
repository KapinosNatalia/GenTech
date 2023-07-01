create database homework_20230626;
use homework_20230626;

-- 1. Создать коллекцию users и заполнить документами со следующими свойствами: id, firstname, lastname, age, gender. Используйте следующие данные:
-- 1 Анатолий Ушанов 28 m
-- 2 Светлана Демидова 25 f
-- 3 Никита Иванов 33 m
-- 4 Ольга Петрова 22 f
create table users (
	id int primary key auto_increment,
    firstname varchar(128),
    lastname varchar(128),
    age int,
    gender char
);
insert into users (firstname, lastname, age, gender) values ('Анатолий', 'Ушанов', 28, 'm');
insert into users (firstname, lastname, age, gender) values ('Светлана', 'Демидова', 25, 'f');
insert into users (firstname, lastname, age, gender) values ('Никита', 'Иванов', 33, 'm');
insert into users (firstname, lastname, age, gender) values ('Ольга', 'Петрова', 22, 'f');
select * from users;

-- 2. Создать коллекцию workers и заполнить документами со следующими свойствами: id, firstname, lastname, position, salary. Используйте следующие данные:
-- 1 Петр Сергеев CEO 7000
-- 2 Виктор Семенов Web-developer 5000
-- 3 Никита Петров Assistant 3500
-- 4 Инна Орлова Accountant 4500
create table workers (
	id int primary key auto_increment,
    firstname varchar(128),
    lastname varchar(128),
    position varchar(128),
    salary decimal(7, 2)
);
insert into workers (firstname, lastname, position, salary) values ('Петр', 'Сергеев', 'CEO', 7000);
insert into workers (firstname, lastname, position, salary) values ('Виктор', 'Семенов', 'Web-developer', 5000);
insert into workers (firstname, lastname, position, salary) values ('Никита', 'Петров', 'Assistant', 3500);
insert into workers (firstname, lastname, position, salary) values ('Инна', 'Орлова', 'Accountant', 4500);
select * from workers;

-- 3. Создать коллекцию fruits и заполнить документами со следующими свойствами: id, title, price, count. Используйте следующие данные:
-- 1 Apple 280 4
-- 2 Lemon 300 8
-- 3 Lime 500 3
-- 4 Orange 200 8
create table fruits (
	id int primary key auto_increment,
    title varchar(128),
    price decimal(7, 2),
    count int
);
insert into fruits (title, price, count) values ('Apple', 280, 4);
insert into fruits (title, price, count) values ('Lemon', 300, 8);
insert into fruits (title, price, count) values ('Lime', 500, 3);
insert into fruits (title, price, count) values ('Orange', 200, 8);
select * from fruits;

-- 4. Создать коллекцию vegetables и заполнить документами со следующими свойствами: id, title, price, count, country. Используйте следующие данные:
-- 1 Potato 370 5 Germany
-- 2 Onion 320 3 Poland
-- 3 Tomato 210 9 Spain
-- 4 Carrot 280 4 France
create table vegetables (
	id int primary key auto_increment,
    title varchar(128),
    price decimal(7, 2),
    count int,
    country varchar(128)
);
insert into vegetables (title, price, count, country) values ('Potato', 370, 5, 'Germany');
insert into vegetables (title, price, count, country) values ('Onion', 320, 3, 'Poland');
insert into vegetables (title, price, count, country) values ('Tomato', 210, 9, 'Spain');
insert into vegetables (title, price, count, country) values ('Carrot', 280, 4, 'France');
select * from vegetables;