CREATE TABLE CHAT(
	CHAT_LOG_ID			VARCHAR2(20),
	MEMBER_ID			VARCHAR2(20)	NOT NULL,
	CHAT_LOG_ANSWER		VARCHAR2(100),
	CHAT_LOG_CONTENT	VARCHAR2(100)	NOT NULL,
	CHAT_LOG_DATE		DATE	NOT NULL,
	PRIMARY KEY(CHAT_LOG_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create sequence chat_seq increment by 1 start with 1;
SELECT * FROM CHAT;
DELETE FROM CHAT;

INSERT INTO CHAT VALUES(chat_seq.nextval, 'admin@mfe.com', 'answer', 'content', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval, 'admin@mfe.com', 'answer', 'content', SYSDATE);

INSERT INTO CHAT VALUES(chat_seq.nextval, 'abc123@mfe.com', 'answerjkdslgvds', 'contentdgds', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval, 'abc123@mfe.com', 'answerdfas', 'contengfgt', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval, 'abc123@mfe.com', 'answerad', 'confgftent', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval, 'abc123@mfe.com', 'answerlhk', 'confdhftent', SYSDATE);