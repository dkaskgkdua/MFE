drop table review; 

drop sequence review_seq;

CREATE TABLE review(
	REVIEW_ID		NUMBER,
	MEMBER_ID		VARCHAR2(50)	NOT NULL,
	REVIEW_PASS		VARCHAR2(20)	NOT NULL,
	CONCERT_ID		number			NOT NULL,
	REVIEW_TITLE	VARCHAR2(50)	NOT NULL,
	REVIEW_CONTENT	varchar2(1000) 	not null,
	REVIEW_DATE		date			not null,
	REVIEW_READCOUNT	number		not null,
	REVIEW_FILE       VARCHAR2(50),
	PRIMARY KEY(REVIEW_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade,
	FOREIGN KEY(CONCERT_ID) REFERENCES concert on delete cascade
);

create sequence review_seq increment by 1 start with 1;

insert into review values(review_seq.nextval, 'aaa@mfe.com','1234', 21, '콘서트 대박!!', '완전 재미씀><', sysdate, 4,'image.jpg');

SELECT * FROM review;

select concert_id, concert_name, concert_image 
from concert inner join book on 
concert.concert_id=book.concert_id


select * from book inner join concert 
on concert.concert_id=book.concert_id 
where book.member_id='aaa@mfe.com'