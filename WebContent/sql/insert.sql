insert into member values('admin@mfe.com','1234','song','seoul','01063485549','rap','1');
insert into member values('1234@mfe.com','1234','koo','seoul','01022223333','rap','1');
insert into member values('test@mfe.com','1234','song','seoul','01063485549','rap,balad','1');

-- local
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
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '제주');
insert into LOCAL values(LOCAL_SEQ.NEXTVAL, '세종');

-- genre
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'balad');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'rock');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'rap');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'R&B/Soul');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'jazz');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'classic');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'pop');
insert into GENRE values(GENRE_SEQ.NEXTVAL, 'EDM');
