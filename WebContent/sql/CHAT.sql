drop table chat;


CREATE TABLE CHAT(
   CHAT_LOG_ID         number,
   MEMBER_ID         VARCHAR2(20)   NOT NULL,
   CHAT_LOG_CONTENT   VARCHAR2(100)   NOT NULL,
   CHAT_LOG_DATE      DATE   NOT NULL,
   PRIMARY KEY(CHAT_LOG_ID),
   FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create sequence chat_seq increment by 1 start with 1;



create table sessId (id varchar(100));
SELECT * FROM CHAT;
DELETE FROM CHAT;

INSERT(CHAH_LOG_ID, MEMBER_ID, CHAR_LOG_ANSWER, CHAH_LOG_CONTENT, 
		CHAT_LOG_DATE) 
INTO CHAT 
VALUES(1, 1, 'TEST_CHAR_LOG_ANSWER', 'TEST_CHAH_LOG_CONTENT', SYSDATE);