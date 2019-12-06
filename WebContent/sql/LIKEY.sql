drop table likey;
drop sequence likey_seq;
CREATE TABLE LIKEY(
	LIKEY_ID	NUMBER,
	CONCERT_ID	NUMBER	NOT NULL,
	MEMBER_ID	varchar2(20)	NOT NULL,
	FOREIGN KEY(CONCERT_ID) REFERENCES CONCERT on delete cascade,
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
	
);



create sequence likey_seq increment by 1 start with 1;

SELECT * FROM LIKEY;
DELETE FROM LIKEY;

INSERT INTO LIKEY VALUES(likey_seq.nextval, 1, 'abc123@mfe.com');
INSERT INTO LIKEY VALUES(likey_seq.nextval, 2, 'abc123@mfe.com');
INSERT INTO LIKEY VALUES(likey_seq.nextval, 3, 'abc123@mfe.com');
INSERT INTO LIKEY VALUES(likey_seq.nextval, 4, 'abc123@mfe.com');

INSERT INTO LIKEY VALUES(likey_seq.nextval, 5, 'admin@mfe.com');
INSERT INTO LIKEY VALUES(likey_seq.nextval, 2, 'admin@mfe.com');

