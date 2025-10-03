use startersql;  -- use the data from insertdata database.

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