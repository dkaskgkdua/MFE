drop table member cascade constraints;
drop table genre cascade constraints;
drop table local cascade constraints;
drop table concert cascade constraints;
drop table review cascade constraints;
drop table likey cascade constraints;
drop table card cascade constraints;
drop table book cascade constraints;
drop table chat cascade constraints;
drop table sessId cascade constraints;
drop table board cascade constraints;
drop table reply cascade constraints;
drop table recent_search cascade constraint;

drop sequence board_seq;
drop sequence book_seq;
drop sequence card_seq;
drop sequence chat_seq;
drop sequence chat_seq2;
drop sequence concert_seq;
drop sequence genre_seq;
drop sequence likey_seq;
drop sequence LOCAL_SEQ;
drop sequence recent_seq;
drop sequence reply_seq;
drop sequence review_seq;

create sequence board_seq increment by 1 start with 1;
create sequence book_seq;
create sequence card_seq increment by 1 start with 1;
create sequence chat_seq increment by 1 start with 1;
create sequence chat_seq2 increment by 1 start with 1;
create sequence concert_seq increment by 1 start with 1;
create sequence GENRE_SEQ;
create sequence likey_seq; 
create sequence LOCAL_SEQ;
create sequence recent_seq increment by 1 start with 1;
create sequence reply_seq ;
create sequence review_seq increment by 1 start with 1;

create table member(
	member_id varchar2(50),
	member_password varchar2(20) not null,
	member_name varchar2(20) not null,
	member_address varchar2(20) not null,
	member_phone_number varchar2(20) not null,
	member_preference varchar2(20),
	member_gender varchar2(2) not null,
	primary key(member_id)
);

CREATE TABLE GENRE(
   GENRE_ID   NUMBER,
   GENRE_NAME   VARCHAR2(20)   NOT NULL,
   PRIMARY KEY(GENRE_ID)
);

CREATE TABLE LOCAL(
   LOCAL_ID   NUMBER,
   LOCAL_NAME   VARCHAR2(20)   NOT NULL,
   PRIMARY KEY(LOCAL_ID)
);


CREATE TABLE CONCERT(
	CONCERT_ID		NUMBER(10),
	CONCERT_NAME	VARCHAR2(500)	NOT NULL,
	CONCERT_DAY		date NOT NULL,
	CONCERT_MUSICIAN	VARCHAR2(20)	NOT NULL,
	CONCERT_OPEN	VARCHAR2(5)	NOT NULL,
	CONCERT_CLOSE	VARCHAR2(5)	NOT NULL,
	CONCERT_IMAGE	VARCHAR2(30),
	GENRE_ID		NUMBER(5)	NOT NULL,
	LOCAL_ID		NUMBER(5)	NOT NULL,
	CONCERT_PRICE	VARCHAR2(20)	NOT NULL,
	PRIMARY KEY(CONCERT_ID),
	FOREIGN KEY(GENRE_ID) REFERENCES GENRE on delete cascade,
	FOREIGN KEY(LOCAL_ID) REFERENCES LOCAL on delete cascade
);

CREATE TABLE review(
	REVIEW_ID		NUMBER,
	MEMBER_ID		VARCHAR2(50)	NOT NULL,
	REVIEW_PASS		VARCHAR2(20)	NOT NULL,
	CONCERT_ID		number			NOT NULL,
	REVIEW_TITLE	VARCHAR2(50)	NOT NULL,
	REVIEW_CONTENT	varchar2(1000) 	not null,
	REVIEW_DATE		date			not null,
	REVIEW_READCOUNT	number		not null,
	REVIEW_FILE       VARCHAR2(50),
	PRIMARY KEY(REVIEW_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade,
	FOREIGN KEY(CONCERT_ID) REFERENCES concert on delete cascade
);


CREATE TABLE LIKEY(
	LIKEY_ID	NUMBER,
	CONCERT_ID	NUMBER(10)	NOT NULL,
	MEMBER_ID	varchar2(50)	NOT NULL,
	PRIMARY KEY(LIKEY_ID),
	FOREIGN KEY(concert_id) REFERENCES concert(concert_id) on delete cascade,
	FOREIGN KEY(member_id) REFERENCES member(member_id) on delete cascade
);

CREATE TABLE CARD(
	CARD_ID		VARCHAR2(20),
	MEMBER_ID	VARCHAR2(50)	NOT NULL,
	CARD_MMYY	NUMBER	NOT NULL,
	CARD_CVV	NUMBER	NOT NULL,
	PRIMARY KEY(CARD_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

CREATE TABLE BOOK(
	BOOK_ID			NUMBER,
	CONCERT_ID		NUMBER	NOT NULL,
	MEMBER_ID		VARCHAR2(50)	NOT NULL,
	BOOK_ETICKET	VARCHAR2(20)	NOT NULL,
	BOOK_AMOUNT		NUMBER			NOT NULL,
	CARD_ID		VARCHAR2(20)	NOT NULL,
	BOOK_DATE		DATE			NOT NULL,
	BOOK_PAYMENT	NUMBER	not null,
	PRIMARY KEY(BOOK_ID),
	FOREIGN KEY(CONCERT_ID) REFERENCES CONCERT on delete cascade,
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade,
	FOREIGN KEY(CARD_ID) REFERENCES CARD on delete cascade
);

CREATE TABLE CHAT(
   CHAT_LOG_ID number(30) PRIMARY KEY,
   CHAT_LOG_ID2	number(30),
   MEMBER_ID VARCHAR2(50) NOT NULL,
   CHAT_LOG_CONTENT VARCHAR2(100) NOT NULL,
   CHAT_LOG_DATE DATE NOT NULL,
   FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create table sessId (id varchar(100));

CREATE TABLE BOARD(
	BOARD_NUM          NUMBER(5),         --글 번호(기본키)
	BOARD_NAME         VARCHAR2(30),   --작성자
	BOARD_PASS          VARCHAR2(30),   --비밀번호
	BOARD_SUBJECT      VARCHAR2(300),  --제목
	BOARD_CONTENT    VARCHAR2(4000), --내용
	BOARD_FILE             VARCHAR2(50),   --첨부될 파일 명(시스템에 저장되는 파일명)
	BOARD_ORIGINAL     VARCHAR2(50),   --첨부될 파일 명(시스템에 저장된 파일의 원래 파일명)
	BOARD_RE_REF         NUMBER(5),         --답변 글 작성시 참조되는 글의 번호
	BOARD_RE_LEV         NUMBER(5),         --답변 글의 깊이(원문글:0, 답변:1, 답변의 답변2, 답변의 답변의 답변 :3)
	BOARD_RE_SEQ         NUMBER(5),         --답변 글의 순서(원문글 기준으로 보여주는 순서)
	BOARD_READCOUNT NUMBER(5),         --글의 조회수
	BOARD_DATE DATE,                --글의 작성 날짜
	PRIMARY KEY(BOARD_NUM)
);


CREATE TABLE REPLY(
	REPLY_ID	NUMBER PRIMARY KEY,
	MEMBER_ID	VARCHAR2(50),
	REPLY_CONTENT	VARCHAR2(200),
	REG_DATE 	date		NOT NULL,
	BOARD_RE_REF	NUMBER	NOT NULL,
	FOREIGN KEY(BOARD_RE_REF) REFERENCES BOARD(BOARD_NUM) ON DELETE CASCADE,
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

CREATE TABLE RECENT_SEARCH(
	RECENT_SEARCH_ID		NUMBER,
	MEMBER_ID				VARCHAR2(20)	NOT NULL,
	RECENT_SEARCH_CONTENT	VARCHAR2(20)	NOT NULL,
	PRIMARY KEY(RECENT_SEARCH_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

