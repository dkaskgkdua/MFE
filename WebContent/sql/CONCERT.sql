drop table concert;
drop sequence concert_seq;
CREATE TABLE CONCERT(
   CONCERT_ID      NUMBER(10),
   CONCERT_NAME   VARCHAR2(30)   NOT NULL,
   CONCERT_DAY      date NOT NULL,
   CONCERT_MUSICIAN   VARCHAR2(20)   NOT NULL,
   CONCERT_OPEN   VARCHAR2(20)   NOT NULL,
   CONCERT_CLOSE   VARCHAR2(20)   NOT NULL,
   CONCERT_IMAGE   VARCHAR2(20),
   GENRE_ID      NUMBER(5)   NOT NULL,
   LOCAL_ID      NUMBER(5)   NOT NULL,
   CONCERT_PRICE   VARCHAR2(20)   NOT NULL,
   PRIMARY KEY(CONCERT_ID),
   FOREIGN KEY(GENRE_ID) REFERENCES GENRE,
   FOREIGN KEY(LOCAL_ID) REFERENCES LOCAL
);
create sequence concert_seq increment by 1 start with 1;


SELECT * FROM CONCERT;
delete * from concert;
INSERT INTO CONCERT VALUES(concert_seq.nextval, '악동뮤지션 콘서트', '2019-12-25', '악동뮤지션', '19', '23','악동뮤지션.jpg', 1, 1, '80000');
