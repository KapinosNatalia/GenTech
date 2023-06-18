CREATE DATABASE University;
USE University;
-- 1. Создание таблиц
-- 1) Создать таблицу Students с полями:
-- id целое число первичный ключ автоинкремент
-- name строка 128 не null
-- age целое число

DROP TABLE Students;
CREATE TABLE Students (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    age INTEGER
);

-- 2) Создать таблицу Teachers с полями:
-- id целое число первичный ключ автоинкремент
-- name строка 128 не null
-- age целое число
CREATE TABLE Teachers (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(128) NOT NULL,
    age INTEGER	
);

-- 3) Создать таблицу Competencies с полями:
-- id целое число первичный ключ автоинкремент
-- title строка 128 не null
CREATE TABLE Competencies (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(128) NOT NULL
);

-- 4) Создать таблицу Teachers2Competencies с полями:
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- competencies_id целое число
CREATE TABLE Teachers2Competencies (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    teacher_id INTEGER,
    competencies_id INTEGER
);

-- 5) Создать таблицу Courses
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- title строка 128 не null
-- headman_id целое число
CREATE TABLE Courses (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    teacher_id INTEGER,
    title VARCHAR(128),
    headman_id INTEGER
);

-- 6) Создать таблицу Students2Courses
-- id целое число первичный ключ автоинкремент
-- student_id целое число
-- course_id целое число
CREATE TABLE Students2Courses (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    student_id INTEGER,
    course_id INTEGER
);

-- Заполнение таблиц

-- Добавить 6 записей в таблицу Students
-- Анатолий 29
-- Олег 25
-- Семен 27
-- Олеся 28
-- Ольга 31
-- Иван 22
INSERT INTO Students (`name`, age) VALUES
	('Анатолий', 29),
	('Олег', 25),
	('Семен', 27),
	('Олеся', 28),
	('Ольга', 31),
	('Иван', 22);

-- Добавить 6 записей в таблицу Teachers
-- Петр 39
-- Максим 35
-- Антон 37
-- Всеволод 38
-- Егор 41
-- Светлана 32
INSERT INTO Teachers (`name`, age) VALUES
	('Петр', 39),
	('Максим', 35),
	('Антон', 37),
	('Всеволод', 38),
	('Егор', 41),
	('Светлана', 32);

-- Добавить 4 записей в таблицу Competencies
-- Математика 
-- Информатика
-- Программирование
-- Графика
INSERT INTO Competencies (title) VALUES
	('Математика'),
	('Информатика'),
	('Программирование'),
	('Графика');

-- Добавьте 6 записей в таблицу Teachers2Competencies
-- 1 1
-- 2 1
-- 2 3
-- 3 2
-- 4 1
-- 5 3
INSERT INTO Teachers2Competencies (teacher_id, competencies_id) VALUES
	(1, 1),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 1),
	(5, 3);

-- Добавьте 5 записей в таблицу Courses
-- 1 Алгебра логики 2
-- 2 Математическая статистика 3
-- 4 Высшая математика 5
-- 5 Javascript 1
-- 5 Базовый Python 1
INSERT INTO Courses (teacher_id, title, headman_id) VALUES
	(1, 'Алгебра логики', 2),
    (2, 'Математическая статистика', 3),
    (4, 'Высшая математика', 5),
    (5, 'Javascript', 1),
    (5, 'Базовый Python', 1);

-- Добавьте 5 записей в таблицу Students2Courses
-- 1 1
-- 2 1
-- 3 2
-- 3 3
-- 4 5
INSERT INTO Students2Courses (student_id, course_id) VALUES
	(1, 1),
    (2, 1),
    (3, 2),
    (3, 3),
    (4, 5);

-- Задачи
-- 1) Вывести имена студентов и курсы, которые они проходят
SELECT 
	t2.name,
    t3.title
FROM students2courses t1
JOIN students t2 ON t2.id = t1.student_id
JOIN courses t3 ON t3.id = t1.course_id; 

-- 2) Вывести имена всех преподавателей с их компетенциями
SELECT 
	t2.name,
    t3.title
FROM teachers2competencies t1
JOIN teachers t2 ON t1.teacher_id = t2.id
JOIN competencies t3 ON t1.competencies_id = t3.id

-- 3) Найти преподавателя, у которого нет компетенций
SELECT
	*
FROM teachers
WHERE id NOT IN (
	SELECT 
			teacher_id
    FROM teachers2competencies
);

-- 4) Найти имена студентов, которые не проходят ни один курс
SELECT
	name
FROM Students
WHERE id NOT IN (
	SELECT 
			student_id
    FROM students2courses
);

-- 5) Найти курсы, которые не посещает ни один студент
SELECT
	title
FROM courses
WHERE id NOT IN (
	SELECT 
			course_id
    FROM students2courses
);

-- 6) Найти компетенции, которых нет ни у одного преподавателя
SELECT
	title
FROM competencies
WHERE id NOT IN (
	SELECT 
			competencies_id
    FROM teachers2competencies
);

-- 7) Вывести название курса и имя старосты
SELECT
	t1.title,
    t2.name 
FROM courses t1
JOIN students t2 ON t1.headman_id = t2.id;

-- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
SELECT 
	t2.name as student_name,
    t3.title,
    t4.name as headman_name
FROM students2courses t1
JOIN students t2 ON t2.id = t1.student_id
JOIN courses t3 ON t3.id = t1.course_id 
JOIN students t4 ON t3.headman_id = t4.id;
