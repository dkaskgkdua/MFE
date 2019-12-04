drop table genre;
drop sequence genre_seq;
CREATE TABLE GENRE(
   GENRE_ID   NUMBER,
   GENRE_NAME   VARCHAR2(300)   NOT NULL,
   PRIMARY KEY(GENRE_ID)
);

create sequence GENRE_SEQ;

insert into GENRE values(GENRE_SEQ.NEXTVAL, '발라드');
insert into GENRE values(GENRE_SEQ.NEXTVAL, '댄스');
insert into GENRE values(GENRE_SEQ.NEXTVAL, '랩/힙합');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'R&B/Soul');
insert into GENRE values(GENRE_SEQ.NEXTVAL, '인디음악');
insert into GENRE values(GENRE_SEQ.NEXTVAL, '록/메탈');
insert into GENRE values(GENRE_SEQ.NEXTVAL, '트로트');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'EDM');

select * from GENRE;