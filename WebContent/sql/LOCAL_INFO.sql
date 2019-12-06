drop table LOCAL;

CREATE TABLE LOCAL(
   LOCAL_ID   NUMBER,
   LOCAL_NAME   VARCHAR2(20)   NOT NULL,
   PRIMARY KEY(LOCAL_ID)
);
drop sequence LOCAL_SEQ;
create sequence LOCAL_SEQ;


insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '서울');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '경기');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '인천');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '부산');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '대구');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '대전');

insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '경남');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '전남');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '충남');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '광주');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '울산');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '경북');

insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '전북');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '충북');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '강원');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '세종');
select * from local;