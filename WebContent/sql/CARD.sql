
drop table card;
drop sequence card_seq;

CREATE TABLE CARD(
	CARD_ID		VARCHAR2(20),
	MEMBER_ID	VARCHAR2(50)	NOT NULL,
	CARD_MMYY	NUMBER	NOT NULL,
	CARD_CVV	NUMBER	NOT NULL,
	PRIMARY KEY(CARD_ID),
	FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER on delete cascade
);

create sequence card_seq increment by 1 start with 1;
SELECT * FROM CARD;
DELETE FROM CARD;

