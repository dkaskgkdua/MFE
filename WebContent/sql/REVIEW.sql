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
	PRIMARY KEY(REVIEW_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade,
	FOREIGN KEY(CONCERT_ID) REFERENCES concert on delete cascade
);

create sequence review_seq increment by 1 start with 1;

insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 1, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 2, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 3, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 4, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 5, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 6, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 7, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 2, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);
insert into review values(review_seq.nextval, 'abc123@mfe.com','1234', 1, '콘서트 대박!!', '완전 재미씀><', sysdate, 4);

SELECT * FROM review;