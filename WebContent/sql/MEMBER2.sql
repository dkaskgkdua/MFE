drop table member;

create table member(
	member_id varchar2(30),
	member_password varchar2(20) not null,
	member_name varchar2(20) not null,
	member_address varchar2(20) not null,
	member_phone_number varchar2(20) not null,
	member_preference varchar2(20),
	member_gender varchar2(2) not null,
	primary key(member_id)
);

insert into member values('admin@mfe.com','1234','관리자','서울시','01012341234','1','1');
insert into member values('abc123@mfe.com','1234','abc','서울시','01011112222','1','1');
select * from member;