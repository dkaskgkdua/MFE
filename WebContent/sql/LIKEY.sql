drop table likey;
drop sequence likey_seq;
CREATE TABLE LIKEY(
	LIKEY_ID	NUMBER,
	CONCERT_ID	NUMBER(10)	NOT NULL,
	MEMBER_ID	varchar2(50)	NOT NULL,
	PRIMARY KEY(LIKEY_ID),
	FOREIGN KEY(concert_id) REFERENCES concert(concert_id) on delete cascade,
	FOREIGN KEY(member_id) REFERENCES member(member_id) on delete cascade
);

alter table likey modify(member_id varchar2(50));
create sequence likey_seq; 

DELETE FROM LIKEY;
SELECT * FROM LIKEY;
select * from likey where member_id = 'admin@mfe.com';

