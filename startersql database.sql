use insertsql;  -- use the data from insertdata database.

select * from user; -- take all the data from users.


-- specific data selection from database(gender,name)
select gender,name from users; 


-- selecting specific genders only(female)
select gender ,name from users
where gender = "female";


-- selecting and printing specific date of birth which are greater than 2000-08-09
select * from users where date_of_birth>"2000-08-09";

-- id greater than 10
select * from users where id > 10;

-- date of birth between 1990-09-09 and 1999-09-09
select * from users where date_of_birth between "1990-09-09" and "1999-09-09";

-- selecting females who has more than 70000 salary
select * from users where gender="female" and salary > 70000;

-- selecting male or salary higher than 75000
select * from users where gender = "male" or salary > 75000;


-- selecting male or salary higher than 70000 and ordering the table by ascending date of birth column
select * from users where gender = "female" or salary > 70000 order by date_of_birth asc;

-- selecting male or salary higher than 70000 and ordering the table by ascending date of birth column but only top 5
select * from users where gender = "female" or salary > 70000 order by date_of_birth asc limit 5;

-- changing or updating the salary of id numb 1 and 3
update users set salary = 45000 where id in (1, 3);

-- changing the name of the user with email aisha@gmail.com to aisha khan
update users set name = 'aisha khan' where email = 'aisha@example.com';

-- increase salary by 10000 for all users whose salary is less than 60000
update users set salary = salary +10000 where salary<60000;

-- delecting a specific row by indicating salary
delete from users where salary <65000 and id>0;

-- droping a table
drop table users;

-- inserting something into a existing database
insert into users (name,email,gender,date_of_birth,salary) values ('sadman','sadmanuddin123@gmail.com','male','2003-10-24',100000);

-- changing an existing column to null(eg-name)
alter table users modify column name varchar(150) null;

-- changing back an existing column to not null(eg-name)
alter table users modify column name varchar(150) not null;

-- adding a check constraint so that no date is lesser than 1900
alter table users add constraint chk_dob check (date_of_birth>'1900-10-10');

-- changing an existing column created at from default currenttime to null and inserting data
alter table users modify column created_at timestamp null; 
insert into users (name,email,gender,date_of_birth,salary) values ('uddin3','uddin1@gmail3.com','male','2003-10-24',100000);

-- changing an existing column created at from null to default currentime
alter table users modify column created_at timestamp default current_timestamp;

-- counting the total rows of database
select count(*) from users;

-- counting the total rows of database where gender is male
select count(*) from users where gender ="male";

--min and max salary from database and storing them in diff coloum
select min(salary) as min_salary, max(salary) as max_salary from users;

-- total and avg salary from database
select sum(salary) as total_salary from users;
select avg(salary) as avg_salary from users;

--sorting the avg salary and grouping it by selecting gender
select gender, avg(salary) as avg_salary from users group by gender;

--selecting name and measuring their length by using length command
select id,name, length(name) as name_length from users;

--selecting name and measuring their name in lower and uppercase
select id,name, lower(name), upper(name), length(name) as name_length from users;

--using concat command to add extra letters to their name as username
select id,name, lower(name), upper(name), concat(upper(name),"12345") as username, length(name) as name_length from users;

--couting how many days a person is in the database
select name, datediff(curdate(),date_of_birth) as days from users;

--floor and round function
select salary,round(salary) as rounded, floor(salary) as floored from users;

-- to get a remainder 
select salary, mod(salary,23) as remaider from users;

--If function
select name,gender, if(gender = "female","yes","no") from users;

-- using a foreign key and adding addresses
select * from addresses;
delete from addresses where id = 4;
