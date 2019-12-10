drop table genre;
drop sequence genre_seq;
CREATE TABLE GENRE(
   GENRE_ID   NUMBER,
   GENRE_NAME   VARCHAR2(20)   NOT NULL,
   PRIMARY KEY(GENRE_ID)
);

create sequence GENRE_SEQ;

insert into GENRE values(GENRE_SEQ.NEXTVAL, 'balad');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'rock');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'rap');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'R&B/Soul');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'jazz');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'classic');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'pop');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'EDM');


update genre set genre_name = 'EDM' where genre_id ='8';
update genre set genre_name ='EDM' where genre_id = 8;
select * from genre;