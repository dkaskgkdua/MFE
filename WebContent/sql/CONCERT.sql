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
INSERT INTO CONCERT VALUES(concert_seq.nextval, 'DAY6 2019 Christmas Special Concert ‘The Present’', '2019-01-05', 'DAY6', '20:00', '23:00', 'pic02.jpg', 2, 1, '100,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '박진영 콘서트 NO.1 X 50', '2019-10-23', '박진영', '19:00', '24:00', 'pic01.jpg', 3, 1, '110,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '소란 winter concert ‘live SORAN’', '2019-02-12', '소란', '14:00', '23:00', 'pic03.jpg', 4, 3, '84,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 JUNG YONG HWA LIVE ‘STILL 622’ IN SEOUL', '2020-02-02', '정용화', '19:00', '25:00', 'pic04.jpg', 2, 3, '150,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '쏜애플 콘서트 <은하>', '2019-12-31', '은하', '17:00', '22:00', 'pic05.jpg', 3, 3, '90,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 김연우 연말 콘서트 ＜오마이갓연우＞', '2020-03-08', '김연우', '18:00', '23:00', 'pic02.jpg', 3, 2, '60,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, 'U2 첫 내한공연 - The Joshua Tree Tour 2019', '2020-01-01', 'U2', '19:00', '23:00', 'pic03.jpg', 3, 1, '110,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '[인천] 2019 나훈아 청춘어게인', '2020-01-03', '나훈아', '14:00', '23:00', 'pic06.jpg', 1, 1, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 장동윤 팬미팅［FIRST MOMENT］인 서울', '2020-01-02', '장동윤', '19:00', '24:00', 'pic02.jpg', 2, 2, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '배치기 [777] 연말 단독콘서트', '2020-01-03', '배치기', '13:00', '23:00', 'pic04.jpg', 1, 3, '30,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '[청주] 내일은 미스트롯 전국투어 콘서트', '2020-03-24', '미스트롯', '15:00', '23:00', 'pic02.jpg', 3, 2, '80,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '김건모 25th Anniversary Tour - 부산 FINALE', '2020-01-1', '김건모', '15:00', '23:00', 'pic01.jpg', 1, 2, '380,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 임한별 연말 단독 콘서트〈Agit〉', '2020-01-04', '임한별', '11:00', '23:00', 'pic05.jpg', 1, 3, '40,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '[서울] 몽스터 주식회사 - 제1회 주주총회 뒤풀이 : 저세상텐션-', '2019-03-24', 'MC몽', '15:00', '23:00', 'pic04.jpg', 2, 1, '60,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 박신혜 팬미팅 [Voice of Angel]', '2019-01-24', '박신혜', '15:00', '16:00', 'pic05.jpg', 1, 1, '40,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, 'EXO PLANET #5 -EXplOration[dot]-', '2019-01-01', 'EXO', '15:00', '20:00', 'pic02.jpg', 3, 2, '140,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 TVXQ! FANMEETING ‘The Starry Night with Cassiopeia’', '2019-01-04', '동방신기', '15:00', '19:00', 'pic05.jpg', 1, 3, '240,000원');
INSERT INTO CONCERT VALUES(concert_seq.nextval, '2019 NCT 127 FANMEETING ‘WINTER 127 with NCTzen 127’', '2019-01-04', 'NCT', '15:00', '21:00', 'pic02.jpg', 2, 3, '440,000원');



SELECT * FROM CONCERT;