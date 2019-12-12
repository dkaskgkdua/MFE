drop table chat;

drop sequence chat_seq;
drop sequence chat_seq2;


CREATE TABLE CHAT(
   CHAT_LOG_ID number(30) PRIMARY KEY,
   CHAT_LOG_ID2	number(30),
   MEMBER_ID VARCHAR2(50) NOT NULL,
   CHAT_LOG_CONTENT VARCHAR2(100) NOT NULL,
   CHAT_LOG_DATE DATE NOT NULL,
   FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create sequence chat_seq increment by 1 start with 1;
create sequence chat_seq2 increment by 1 start with 1;


create table sessId (id varchar(100));

SELECT * FROM CHAT;
DELETE FROM CHAT;
select * from sessId;
delete from sessId;

