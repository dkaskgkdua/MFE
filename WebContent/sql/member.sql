drop table member;

create table member(
	id varchar2(15),
	password varchar2(10),
	name varchar2(15),
	age Number,
	gender varchar2(5),
	email varchar2(30),
	PRIMARY KEY(id)
);

insert into member values('mjmjmj', 'mj', 'mj', '26', '남','mj@mj.mj');
select * from member;



