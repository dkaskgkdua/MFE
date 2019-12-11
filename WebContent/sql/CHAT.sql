drop table chat;

drop sequence chat_seq;
drop sequence chat2_seq;

CREATE TABLE CHAT(
	CHAT_LOG_ID			number,
	chat_log_id2		number,
	MEMBER_ID			VARCHAR2(20)	NOT NULL,
	CHAT_LOG_CONTENT	VARCHAR2(100)	NOT NULL,
	CHAT_LOG_DATE		DATE	NOT NULL,
	PRIMARY KEY(CHAT_LOG_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create sequence chat_seq increment by 1 start with 1;
create sequence chat2_seq increment by 1 start with 1;

SELECT * FROM CHAT;
DELETE FROM CHAT;

INSERT INTO CHAT VALUES(chat_seq.nextval, chat2_seq.nextval, 'admin@mfe.com', '1111', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval,chat2_seq.currval, 'admin@mfe.com', '2222', SYSDATE);

INSERT INTO CHAT VALUES(chat_seq.nextval,chat2_seq.currval, 'abc123@mfe.com', '3333', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval,chat2_seq.currval, 'abc123@mfe.com', '4444', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval,chat2_seq.currval, 'abc123@mfe.com', '5555', SYSDATE);
INSERT INTO CHAT VALUES(chat_seq.nextval,chat2_seq.currval, 'abc123@mfe.com', '6666', SYSDATE);

INSERT INTO CHAT VALUES(chat_seq.nextval,chat2_seq.nextval, 'abc123@mfe.com', '7777', SYSDATE);

select chat_log_id2 from chat where chat_log_id2=(select chat_log_id2 from chat where chat_log_id = chat_log_id-1);

select count(count(*)) from chat where chat.member_id='abc123@mfe.com' group by chat_log_id2;

select chat_log_id2, count(chat_log_id2)
from chat 
where chat.member_id='abc123@mfe.com' 
or chat.member_id='admin@mfe.com' 
group by chat_log_id2
order by chat_log_id2 desc;

select * 
from (select rownum rnum, b.* 
from (select * from chat where member_id='abc123@mfe.com' or member_id='admin@mfe.com'order by chat_log_id2 desc ) b 
) where rnum >= 1 and rnum <= 10;

select * from chat;


select * from chat where member_id='abc123@mfe.com' or member_id='admin@mfe.com' group by chat_log_id2;

select chat_log_content, chat_log_date from chat where chat_log_id2=2 and (member_id='admin@mfe.com' or member_id='abc123@mfe.com')
