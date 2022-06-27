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
	content VARCHAR2(100) NOT NULL,
	id VARCHAR2(30) NOT NULL
);
select * from post where title='2¹ø' and id='admin';