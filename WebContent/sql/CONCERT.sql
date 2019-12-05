drop table concert;
drop sequence concert_seq;
CREATE TABLE CONCERT(
   CONCERT_ID      NUMBER(10),
   CONCERT_NAME   VARCHAR2(3000)   NOT NULL,
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


INSERT INTO CONCERT VALUES(concert_seq.nextval, '악동뮤지션 콘서트', '2020-01-01', '악동뮤지션', '19:00', '23:00', 'pic02.jpg', 1, 1, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, 'DAY6 2019 Christmas Special Concert ‘The Present’', '2019-12-25', 'DAY6', '20:00', '23:00', 'pic02.jpg', 2, 1, '100,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '박진영 콘서트 NO.1 X 50', '2020-01-23', '박진영', '19:00', '24:00', 'pic02.jpg', 3, 6, '110,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '소란 winter concert ‘live SORAN’', '2020-02-12', '소란', '14:00', '23:00', 'pic02.jpg', 4, 3, '84,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 JUNG YONG HWA LIVE ‘STILL 622’ IN SEOUL', '2020-02-02', '정용화', '19:00', '25:00', 'pic02.jpg', 6, 4, '150,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '쏜애플 콘서트 <은하>', '2019-12-31', '은하', '17:00', '22:00', 'pic02.jpg', 6, 5, '90,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 김연우 연말 콘서트 ＜오마이갓연우＞', '2020-03-08', '김연우', '18:00', '23:00', 'pic02.jpg', 4, 2, '60,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '악동뮤지션 콘서트', '2020-01-01', '악동뮤지션', '19:00', '23:00', 'pic02.jpg', 1, 1, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '악동뮤지션 콘서트', '2020-01-01', '악동뮤지션', '19:00', '23:00', 'pic02.jpg', 1, 1, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '악동뮤지션 콘서트', '2020-01-01', '악동뮤지션', '19:00', '23:00', 'pic02.jpg', 1, 1, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '악동뮤지션 콘서트', '2020-01-01', '악동뮤지션', '19:00', '23:00', 'pic02.jpg', 1, 1, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '[청주] 내일은 미스트롯 전국투어 콘서트', '2020-03-24', '미스트롯', '15:00', '23:00', 'pic02.jpg', 1, 6, '80,000원');



SELECT * FROM CONCERT;