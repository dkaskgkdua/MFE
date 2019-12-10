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
insert into member values('admin@mfe.com','1234','배유리','서울시 구로구','010-1111-2222','발라드','1');
insert into member values('fddfddddd@mfe.com','1234','배유리','서울시 양천구','010-1111-2222','댄스','1');
insert into member values('fddfddddd@mfe.com','1234','배유리','서울시 구로구','010-1111-2222','팝','1');
select * from member;