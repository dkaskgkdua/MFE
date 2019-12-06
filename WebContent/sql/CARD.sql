
drop table card;
drop sequence card_seq;

CREATE TABLE CARD(
	CARD_ID		NUMBER,
	CARD_NUM	VARCHAR2(20)	NOT NULL,
	MEMBER_ID	VARCHAR2(20)	NOT NULL,
	CARD_MMYY	NUMBER	NOT NULL,
	CARD_CVV	NUMBER	NOT NULL,
	PRIMARY KEY(CARD_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create sequence card_seq increment by 1 start with 1;
SELECT * FROM CARD;
DELETE FROM CARD;

INSERT INTO CARD VALUES(card_seq.nextval, '1111111111111111', 'abc123@mfe.com', 0628, 123);
INSERT INTO CARD VALUES(card_seq.nextval, '2222222222222222', 'abc123@mfe.com', 0628, 123);
INSERT INTO CARD VALUES(card_seq.nextval, '3333333333333333','abc123@mfe.com', 0628, 123);
INSERT INTO CARD VALUES(card_seq.nextval, '4444444444444444', 'abc123@mfe.com', 0628, 123);
INSERT INTO CARD VALUES(card_seq.nextval, '5555555555555555', 'abc123@mfe.com', 0628, 123);

INSERT INTO CARD VALUES(card_seq.nextval, '1111111111111111', 'admin@mfe.com', 0628, 123);
