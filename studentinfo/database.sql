create database students;
use students;
drop table student;
create table student(
id varchar(10) primary key,
name varchar(30),
rollno varchar(20),
branch varchar(10),
year int(5),
semester int,
dob date,
address varchar(100));