CREATE USER musthave IDENTIFIED BY 1234; 
GRANT CONNECT, RESOURCE TO musthave;

CREATE TABLE member
(
	id VARCHAR2(30) NOT NULL,
	pass VARCHAR2(40) NOT NULL,
	auth VARCHAR2(5) default 'user' NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE post
(
	title VARCHAR2(20) NOT NULL,
	content VARCHAR2(999) NOT NULL,
	id VARCHAR2(30) NOT NULL
);
select * from post where title='2¹ø' and id='admin';

select * from post order by num desc;

alter table post add num number not null;

alter table post modify content varchar2(999);

CREATE SEQUENCE SEQ_BOARD START WITH 1 INCREMENT BY 1;
insert into post values ('bbb', 'bbb', 'bbb', seq_board.nextval);


CREATE SEQUENCE SEQ_BOARD
    MINVALUE 1 
    MAXVALUE 9999999999999999999999999999
    INCREMENT BY 1
    START WITH 1
    CACHE 20
    NOORDER
    NOCYCLE ;
