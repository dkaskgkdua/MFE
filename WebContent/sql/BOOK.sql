DROP TABLE BOOK;
drop sequence book_seq;
CREATE TABLE BOOK(
	BOOK_ID			NUMBER,
	CONCERT_ID		NUMBER			NOT NULL,
	MEMBER_ID		VARCHAR2(20)	NOT NULL,
	BOOK_ETICKET	VARCHAR2(20)	NOT NULL,
	BOOK_AMOUNT		NUMBER			NOT NULL,
	CARD_ID			NUMBER			NOT NULL,
	BOOK_DATE		DATE			NOT NULL,
	PRIMARY KEY(BOOK_ID),
	FOREIGN KEY(CONCERT_ID) REFERENCES CONCERT,
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER,
	FOREIGN KEY(CARD_ID) REFERENCES CARD
);
create sequence book_seq increment by 1 start with 1;
SELECT * FROM BOOK;

DELETE * FROM BOOK where concert_id=1;

INSERT INTO BOOK VALUES(book_seq.nextval, 1, 'abc123@mfe.com', 'e123456789', 1, 1, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 2, 'abc123@mfe.com', 'e222222222', 2, 2, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 3, 'abc123@mfe.com', 'e333333333', 3, 3, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 4, 'abc123@mfe.com', 'e444444444', 4, 4, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 5, 'abc123@mfe.com', 'e555555555', 5, 5, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 6, 'abc123@mfe.com', 'e123456789', 1, 1, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 7, 'abc123@mfe.com', 'e222222222', 2, 2, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 8, 'abc123@mfe.com', 'e333333333', 3, 3, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 9, 'abc123@mfe.com', 'e444444444', 4, 4, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 10, 'abc123@mfe.com', 'e555555555', 5, 5, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 11, 'abc123@mfe.com', 'e555555555', 5, 5, SYSDATE);


INSERT INTO BOOK VALUES(book_seq.nextval, 2, 'admin@mfe.com', 'e222222222', 2, 2, SYSDATE);
INSERT INTO BOOK VALUES(book_seq.nextval, 3, 'admin@mfe.com', 'e333333333', 3, 3, SYSDATE);



select * from (select rownum rnum, b.* from (select * from book inner join concert on concert.concert_id=book.concert_id where book.member_id='abc123@mfe.com' order by book.book_id desc) b ) where rnum >= 1 and rnum <= 10;
