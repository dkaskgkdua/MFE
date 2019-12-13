

drop table member cascade constraints;

create table member(
	member_id varchar2(50),
	member_password varchar2(20) not null,
	member_name varchar2(20) not null,
	member_address varchar2(20) not null,
	member_phone_number varchar2(20) not null,
	member_preference varchar2(20),
	member_gender varchar2(2) not null,
	primary key(member_id)
);

insert into member values('admin@mfe.com','1234','song','seoul','01063485549','rap','1');
insert into member values('1234@mfe.com','1234','koo','seoul','01022223333','rap','1');
insert into member values('test@mfe.com','1234','song','seoul','01063485549','rap,balad','1');

select * from member;