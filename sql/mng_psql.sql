
alter role mnguide set search_path = mnguide;
DO $$
DECLARE
    rec RECORD;
BEGIN
	    FOR rec IN (SELECT tablename FROM pg_tables WHERE schemaname = 'mnguide') LOOP
	        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(rec.tablename) || ' CASCADE';
	    END LOOP;
	
	 
	    FOR rec IN (SELECT sequencename FROM pg_sequences WHERE schemaname = 'mnguide') LOOP
	        EXECUTE 'DROP SEQUENCE IF EXISTS ' || quote_ident(rec.sequencename);
	    END LOOP;
	
	  
	    FOR rec IN (SELECT viewname FROM pg_views WHERE schemaname = 'mnguide') LOOP
	        EXECUTE 'DROP VIEW IF EXISTS ' || quote_ident(rec.viewname);
	    END LOOP;
END $$;



--회원 테이블
CREATE SEQUENCE SEQ_USER
START WITH 1;

CREATE TABLE MEMBER(
	USER_NO INT PRIMARY KEY,
	USER_ID VARCHAR(100) NOT NULL UNIQUE,
	USER_PWD VARCHAR(100) NOT NULL,
	USER_NAME VARCHAR(100) NOT NULL,
	USER_NICKNAME VARCHAR(100),
	USER_GENDER VARCHAR(1) NOT NULL CHECK(USER_GENDER IN('M','F')),
	USER_EMAIL VARCHAR(100) NOT NULL UNIQUE,
	ENROLL_DATE DATE NOT NULL DEFAULT CURRENT_DATE,
	MODIFY_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN NOT NULL DEFAULT TRUE,
	USER_BIRTHDAY DATE NOT NULL,
	USER_PHONE CHAR(15) NOT NULL UNIQUE, 
	USER_KIND CHAR(1) NOT NULL CHECK(USER_KIND IN ('Y','N')) DEFAULT 'N'
); 

-- 카테고리
CREATE SEQUENCE SEQ_LCTG
START WITH 1;


CREATE TABLE LOCATION_CATEGORY(
	LOCATION_CATEGORY_NO INT PRIMARY KEY,
	CATEGORY_NAME VARCHAR(100) NOT NULL UNIQUE
);


-- 반려동물 분류
CREATE SEQUENCE SEQ_PKI
START WITH 1;

CREATE TABLE PET_KIND(
	PET_KIND_NO INT PRIMARY KEY,
	PET_KIND_NAME VARCHAR(100) NOT NULL UNIQUE
);

CREATE SEQUENCE SEQ_PS
START WITH 1;

-- 반려동물 크기
CREATE TABLE PET_SIZE(
	PET_SIZE_NO INT PRIMARY KEY,
	PET_SIZE_NAME VARCHAR(100) NOT NULL, 
	PET_KIND_NO INT NOT NULL,

	FOREIGN KEY(PET_KIND_NO) REFERENCES PET_KIND(PET_KIND_NO) ON DELETE CASCADE
);


-- 반려동물
CREATE SEQUENCE SEQ_PET
START WITH 1;

CREATE TABLE PET (
	 PET_NO INT PRIMARY KEY,
	 PET_NAME VARCHAR(100) NOT NULL,
	 PET_BIRTHDAY DATE,
	 PET_GENDER CHAR(1) CHECK(PET_GENDER IN ('M','F')) NOT NULL,
	 USER_NO INT NOT NULL,
	 PET_SIZE_NO INT NOT NULL,
	 
	 FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
	 FOREIGN KEY(PET_SIZE_NO) REFERENCES PET_SIZE(PET_SIZE_NO) ON DELETE CASCADE
);


-- 장소 공통 정보
CREATE SEQUENCE SEQ_LOC
START WITH 1;

CREATE TABLE LOCATION(
	LOCATION_NO INT PRIMARY KEY,
	LOCATION_NAME VARCHAR(100) NOT NULL,
	LOCATION_PHONE CHAR(15) NOT NULL UNIQUE,
	EXPLANATION TEXT NOT NULL DEFAULT '장소설명을 넣어주세요',
	LOCATION_STAR double precision DEFAULT 0.0 NOT NULL,
	RESERVATION_LINK TEXT,
	BUSINESS_NO VARCHAR(100) NOT NULL UNIQUE,
	ADDRESS VARCHAR(255) NOT NULL,
	ENROLL_DATE DATE NOT NULL DEFAULT CURRENT_DATE,
	MODIFY_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN DEFAULT TRUE NOT NULL,
	USER_NO INT NOT NULL,
	LOCATION_CATEGORY_NO INT DEFAULT 1 NOT NULL, -- 카테고리 넘버 1번 무조건 기타로 둘 것
	
	FOREIGN KEY (USER_NO) REFERENCES MEMBER (USER_NO) ON DELETE CASCADE,
	FOREIGN KEY (LOCATION_CATEGORY_NO)REFERENCES LOCATION_CATEGORY(LOCATION_CATEGORY_NO) ON DELETE SET DEFAULT
);

-- 장소옵션
CREATE SEQUENCE SEQ_LOPT
START WITH 1;


CREATE TABLE LOCATION_OPTION (
	LOCATION_OPTION_NO INT PRIMARY KEY,
	GOODS VARCHAR(100) ,
	GOODS_PRICE VARCHAR(100),
	ROOM_INFO VARCHAR(255),
	ROOM_STATUS BOOLEAN DEFAULT TRUE NULL,
	CAPACITY INT NOT NULL,
	LOCATION_NO INT NOT NULL,

	FOREIGN KEY(LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE
);



--찜 
CREATE SEQUENCE SEQ_PICK
START WITH 1;

CREATE TABLE PICK(
	PICK_NO INT PRIMARY KEY,
	USER_NO INT NOT NULL,
	LOCATION_NO INT NOT NULL,
	
	FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
	FOREIGN KEY(LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE

);


--출입등급
CREATE SEQUENCE SEQ_ENT
START WITH 1;

CREATE TABLE ENTER_GRADE (

  ENTER_NO INT PRIMARY KEY,
  LOCATION_NO INT NOT NULL UNIQUE,
  PET_SIZE_NO INT NOT NULL UNIQUE,

  FOREIGN KEY (LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE,
  FOREIGN KEY (PET_SIZE_NO) REFERENCES PET_SIZE(PET_SIZE_NO) ON DELETE CASCADE
  
);


-- 리뷰

CREATE SEQUENCE SEQ_REV
START WITH 1;

CREATE TABLE REVIEW(
	REVIEW_NO INT PRIMARY KEY,
	REVIEW_STAR INT NOT NULL CHECK(REVIEW_STAR BETWEEN 1 AND 5),
	REVIEW_CONTENT TEXT NOT NULL,
	ENROLL_DATE DATE NOT NULL DEFAULT CURRENT_DATE,
	MODIFY_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN NOT NULL DEFAULT TRUE,
	USER_NO INT NOT NULL,
	LOCATION_NO INT NOT NULL,
	
	FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
	FOREIGN KEY (LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE
	
);

-- 사장님 답글
CREATE SEQUENCE SEQ_OWRE
START WITH 1;



CREATE TABLE OWNER_REPLY(
	OWNER_REPLY_NO INT PRIMARY KEY,
	OWNER_REPLY_CONTENT TEXT NOT NULL,
	ENROLL_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	MODIFY_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN DEFAULT TRUE NOT NULL,
    REVIEW_NO INT NOT NULL UNIQUE,
   
    FOREIGN KEY (REVIEW_NO) REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE
    
);

--운영시간

CREATE SEQUENCE SEQ_OPER
START WITH 1;

CREATE TABLE OPERATION_TIME(
	OPERATION_NO INT PRIMARY KEY,
	DAYS VARCHAR(30),
	START_TIME TIME,
	END_TIME TIME,
	REST_STATUS BOOLEAN DEFAULT FALSE,
	LOCATION_NO INT NOT NULL UNIQUE,
	
    FOREIGN KEY (LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE
);


--////////-----

-- 게시물 카테고리

CREATE SEQUENCE SEQ_BOCA
START WITH 1;

CREATE TABLE BOARD_CATEGORY(
	
	BOARD_CATEGORY_NO INT PRIMARY KEY,
	CATEGORY_NAME VARCHAR(100) NOT NULL
);


-- 게시물

CREATE SEQUENCE SEQ_BORD
START WITH 1;

CREATE TABLE BOARD (
	BOARD_NO INT PRIMARY KEY,
	BOARD_TITLE VARCHAR(200) NOT NULL,
	BOARD_CONTENT TEXT NOT NULL,
	COUNT INT DEFAULT 0 NOT NULL CHECK(COUNT>=0),
	CREATE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	EDIT_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN DEFAULT TRUE NOT NULL,
	USER_NO INT NOT NULL,
	BOARD_CATEGORY_NO INT NOT NULL,
	
	FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
	FOREIGN KEY (BOARD_CATEGORY_NO) REFERENCES BOARD_CATEGORY(BOARD_CATEGORY_NO) ON DELETE SET NULL
	
);



-- 쇼츠
CREATE SEQUENCE SEQ_SHORT
START WITH 1;

CREATE TABLE SHORTS (
	SHORTS_NO INT PRIMARY KEY,
	SHORTS_CONTENT TEXT,
	COUNT INT DEFAULT 0 CHECK(COUNT>=0) NOT NULL,
	ENROLL_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	MODIFY_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN DEFAULT TRUE NOT NULL,
	USER_NO INT NOT NULL,
	
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE

);



-- 영상

CREATE SEQUENCE SEQ_VIDEO
START WITH 1;


CREATE TABLE VIDEO(
	VIDEO_NO INT PRIMARY KEY,
	ORIGIN_NAME VARCHAR(255) NOT NULL,
	CHANGE_NAME VARCHAR(255) NOT NULL,
	FILE_PATH VARCHAR(255) NOT NULL,
	SHORTS_NO INT UNIQUE NOT NULL,

    FOREIGN KEY (SHORTS_NO) REFERENCES SHORTS(SHORTS_NO) ON DELETE CASCADE
);



-- 댓글
CREATE SEQUENCE SEQ_REPLY
START WITH 1;

CREATE TABLE REPLY(
	REPLY_NO INT PRIMARY KEY,
	REPLY_CONTENT VARCHAR(255) NOT NULL, 
	CREATE_DATE DATE DEFAULT CURRENT_DATE NOT NULL,
	EDIT_DATE DATE DEFAULT CURRENT_DATE,
	STATUS BOOLEAN DEFAULT TRUE NOT NULL,
	USER_NO INT NOT NULL,
	BOARD_NO INT,
	SHORTS_NO INT,
	
	REPLY_RE_NO INT,
	
	
	FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
    FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
    FOREIGN KEY (SHORTS_NO) REFERENCES SHORTS(SHORTS_NO) ON DELETE CASCADE,
    FOREIGN KEY (REPLY_RE_NO) REFERENCES REPLY(REPLY_NO) ON DELETE CASCADE

);

-- 좋아요
CREATE SEQUENCE SEQ_GOOD
START WITH 1;

 CREATE TABLE GOOD(
   GOOD_NO INT PRIMARY KEY,
   COUNT INT DEFAULT 0 NOT NULL CHECK(COUNT>=0),
   USER_NO INT NOT NULL,
   BOARD_NO INT,
   SHORTS_NO INT,
   
   FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
   FOREIGN KEY (BOARD_NO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
   FOREIGN KEY (SHORTS_NO) REFERENCES SHORTS(SHORTS_NO) ON DELETE CASCADE
 );

-- 쿠폰

CREATE SEQUENCE SEQ_CUPON
START WITH 1;

CREATE TABLE COUPON (
	COUPON_NO INT PRIMARY KEY,
	COUPON_CONTENT TEXT NOT NULL,
	COUPON_EXPIRATION_PERIOD INT NOT NULL DEFAULT -1 CHECK(COUPON_EXPIRATION_PERIOD >=-1), -- 입력 안 할 시 영구
	STATUS BOOLEAN DEFAULT TRUE NOT NULL,
	COUNT INT DEFAULT 1 CHECK(COUNT >=0) NOT NULL,
	LOCATION_NO INT NOT NULL,

   FOREIGN KEY (LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE

);

-- 쿠폰 보유

CREATE SEQUENCE SEQ_HACO
START WITH 1;


CREATE TABLE HAVING_COUPON(
	HAVING_COUPON_NO INT PRIMARY KEY,
	STATUS BOOLEAN DEFAULT FALSE NOT NULL,
	USER_NO INT NOT NULL,
	COUPON_NO INT NOT NULL,
	HAVING_EXPIRATION_PERIOD DATE,
	
	FOREIGN KEY (COUPON_NO) REFERENCES COUPON(COUPON_NO) ON DELETE CASCADE,
    FOREIGN KEY (USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

-- 사진
CREATE SEQUENCE SEQ_PIC
START WITH 1;

CREATE TABLE PICTURE(
	PIC_NO INT PRIMARY KEY,
	ORIGIN_NAME VARCHAR(255) NOT NULL,
	CHANGE_NAME VARCHAR(255) NOT NULL,
	FILE_PATH VARCHAR(255) NOT NULL,
	FILE_LEVEL INT DEFAULT 1 NOT NULL,
	
	LOCATION_NO INT,
	LOCATION_OPTION_NO INT,
	REVIEW_NO INT,
	USER_NO INT,
	PET_NO INT,
	BOARD_NO INT,
	
   FOREIGN KEY(LOCATION_NO) REFERENCES LOCATION(LOCATION_NO) ON DELETE CASCADE,
   FOREIGN KEY(LOCATION_OPTION_NO) REFERENCES LOCATION_OPTION(LOCATION_OPTION_NO) ON DELETE SET NULL,
   FOREIGN KEY(REVIEW_NO) REFERENCES REVIEW(REVIEW_NO) ON DELETE CASCADE,
   FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE,
   FOREIGN KEY(PET_NO) REFERENCES PET(PET_NO) ON DELETE CASCADE,
   FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);


-- insert into LOCATION_CATEGORY values(nextval('SEQ_LCTG'),'여행/숙소');

-- insert into member values(nextval('SEQ_USER'),'toribro3761','1234',
-- 	'신형우','toribro','M','java3761@gmail.com',DEFAULT,NULL,DEFAULT,'1998-04-16','010-5118-3761',DEFAULT);


-- -- 경기도 가평군 북면 꽃넘이길 43
-- -- 경기도 남양주시 화도읍 북한강로 1542-1 1층 ,https://www.instagram.com/gum_1687
-- -- 경기도 파주시 법원읍 애룡길 194 원두막
-- -- 경기도 남양주시 수동면 비룡로 1621-99 소소온기 , http://sosoongi.modoo.at/

-- insert into location values(nextval('SEQ_LOC'),'아름다운장소','02-2111-1234','반려견과 함께할 수 있는 아름다운 장소입니다.'
-- 	,4.2,'http://www.weclard.com','01-0121457-222',' 경상북도 경주시 외동읍 죽동길 160-100',default,null,default,currval('SEQ_USER'),currval('SEQ_LCTG'));
-- insert into location values(nextval('SEQ_LOC')+10,'아름다운장소','02-2211-1234','반려견과 함께할 수 있는 아름다운 장소입니다.'
-- 	,4.2,'http://www.weclard.com','01-01237-222',' 경상북도 경주시 외동읍 죽동길 160-100',default,null,default,currval('SEQ_USER'),currval('SEQ_LCTG')+10);


-- insert into pick values(nextval('SEQ_PICK'),currval('SEQ_USER'),currval('SEQ_LOC'));
-- insert into pick values(nextval('SEQ_PICK'),currval('SEQ_USER'),currval('SEQ_LOC'));

-- select *from LOCATION_CATEGORY;
-- select *from member;
-- select *from location;
-- select *from pick;

-- delete from location;
-- delete from LOCATION_CATEGORY;
-- delete from  member;

-- SELECT COUNT(*) FROM PICK;


commit;


---더미데이터---


--회원
INSERT INTO MEMBER (USER_NO, USER_ID, USER_PWD, USER_NAME, USER_NICKNAME, USER_GENDER, USER_EMAIL, USER_BIRTHDAY, USER_PHONE, USER_KIND, STATUS)
VALUES 
(nextval('SEQ_USER'), 'user1', 'pwd1', 'John Doe', 'Johnny', 'M', 'john.doe1@example.com', '1990-01-01', '010-1234-0001', 'Y', TRUE),
(nextval('SEQ_USER'), 'user2', 'pwd2', 'Jane Doe', 'Janie', 'F', 'jane.doe2@example.com', '1991-02-02', '010-1234-0002', 'N', TRUE),
(nextval('SEQ_USER'), 'user3', 'pwd3', 'Alice Smith', 'Alice', 'F', 'alice.smith3@example.com', '1992-03-03', '010-1234-0003', 'Y', TRUE),
(nextval('SEQ_USER'), 'user4', 'pwd4', 'Bob Johnson', 'Bobby', 'M', 'bob.johnson4@example.com', '1993-04-04', '010-1234-0004', 'N', TRUE),
(nextval('SEQ_USER'), 'user5', 'pwd5', 'Charlie Brown', 'Charlie', 'M', 'charlie.brown5@example.com', '1994-05-05', '010-1234-0005', 'Y', TRUE),
(nextval('SEQ_USER'), 'user6', 'pwd6', 'Diana Prince', 'Diana', 'F', 'diana.prince6@example.com', '1995-06-06', '010-1234-0006', 'N', TRUE),
(nextval('SEQ_USER'), 'user7', 'pwd7', 'Edward Elric', 'Ed', 'M', 'edward.elric7@example.com', '1996-07-07', '010-1234-0007', 'Y', TRUE),
(nextval('SEQ_USER'), 'user8', 'pwd8', 'Fiona Shrek', 'Fiona', 'F', 'fiona.shrek8@example.com', '1997-08-08', '010-1234-0008', 'N', TRUE),
(nextval('SEQ_USER'), 'user9', 'pwd9', 'George Lucas', 'George', 'M', 'george.lucas9@example.com', '1998-09-09', '010-1234-0009', 'Y', TRUE),
(nextval('SEQ_USER'), 'user10', 'pwd10', 'Hannah Montana', 'Hannah', 'F', 'hannah.montana10@example.com', '1999-10-10', '010-1234-0010', 'N', TRUE),
(nextval('SEQ_USER'), 'user11', 'pwd11', 'Isaac Newton', 'Isaac', 'M', 'isaac.newton11@example.com', '2000-11-11', '010-1234-0011', 'Y', TRUE),
(nextval('SEQ_USER'), 'user12', 'pwd12', 'Jack Sparrow', 'Jack', 'M', 'jack.sparrow12@example.com', '2001-12-12', '010-1234-0012', 'N', TRUE),
(nextval('SEQ_USER'), 'user13', 'pwd13', 'Lara Croft', 'Lara', 'F', 'lara.croft13@example.com', '2002-01-13', '010-1234-0013', 'Y', TRUE),
(nextval('SEQ_USER'), 'user14', 'pwd14', 'Michael Jordan', 'Mike', 'M', 'michael.jordan14@example.com', '2003-02-14', '010-1234-0014', 'N', TRUE),
(nextval('SEQ_USER'), 'user15', 'pwd15', 'Nancy Drew', 'Nancy', 'F', 'nancy.drew15@example.com', '2004-03-15', '010-1234-0015', 'Y', TRUE),
(nextval('SEQ_USER'), 'user16', 'pwd16', 'Oscar Wilde', 'Oscar', 'M', 'oscar.wilde16@example.com', '2005-04-16', '010-1234-0016', 'N', TRUE),
(nextval('SEQ_USER'), 'user17', 'pwd17', 'Peter Parker', 'Peter', 'M', 'peter.parker17@example.com', '2006-05-17', '010-1234-0017', 'Y', TRUE),
(nextval('SEQ_USER'), 'user18', 'pwd18', 'Quincy Adams', 'Quincy', 'M', 'quincy.adams18@example.com', '2007-06-18', '010-1234-0018', 'N', TRUE),
(nextval('SEQ_USER'), 'user19', 'pwd19', 'Rachel Green', 'Rachel', 'F', 'rachel.green19@example.com', '2008-07-19', '010-1234-0019', 'Y', TRUE),
(nextval('SEQ_USER'), 'user20', 'pwd20', 'Steve Rogers', 'Steve', 'M', 'steve.rogers20@example.com', '2009-08-20', '010-1234-0020', 'N', TRUE),
(nextval('SEQ_USER'), 'user21', 'pwd21', 'Tony Stark', 'Tony', 'M', 'tony.stark21@example.com', '2010-09-21', '010-1234-0021', 'Y', TRUE),
(nextval('SEQ_USER'), 'user22', 'pwd22', 'Uma Thurman', 'Uma', 'F', 'uma.thurman22@example.com', '2011-10-22', '010-1234-0022', 'N', TRUE),
(nextval('SEQ_USER'), 'user23', 'pwd23', 'Vince Vaughn', 'Vince', 'M', 'vince.vaughn23@example.com', '2012-11-23', '010-1234-0023', 'Y', TRUE),
(nextval('SEQ_USER'), 'user24', 'pwd24', 'Wanda Maximoff', 'Wanda', 'F', 'wanda.maximoff24@example.com', '2013-12-24', '010-1234-0024', 'N', TRUE),
(nextval('SEQ_USER'), 'user25', 'pwd25', 'Xander Harris', 'Xander', 'M', 'xander.harris25@example.com', '2014-01-25', '010-1234-0025', 'Y', TRUE),
(nextval('SEQ_USER'), 'user26', 'pwd26', 'Yvonne Strahovski', 'Yvonne', 'F', 'yvonne.strahovski26@example.com', '2015-02-26', '010-1234-0026', 'N', TRUE),
(nextval('SEQ_USER'), 'user27', 'pwd27', 'Zachary Levi', 'Zach', 'M', 'zachary.levi27@example.com', '2016-03-27', '010-1234-0027', 'Y', TRUE),
(nextval('SEQ_USER'), 'user28', 'pwd28', 'Abigail Breslin', 'Abby', 'F', 'abigail.breslin28@example.com', '2017-04-28', '010-1234-0028', 'N', TRUE),
(nextval('SEQ_USER'), 'user29', 'pwd29', 'Benedict Cumberbatch', 'Ben', 'M', 'benedict.cumberbatch29@example.com', '2018-05-29', '010-1234-0029', 'Y', TRUE),
(nextval('SEQ_USER'), 'user30', 'pwd30', 'Catherine Zeta-Jones', 'Catherine', 'F', 'catherine.zeta30@example.com', '2019-06-30', '010-1234-0030', 'N', TRUE);



--카테고리 테이블

INSERT INTO LOCATION_CATEGORY (LOCATION_CATEGORY_NO, CATEGORY_NAME)
VALUES 
(nextval('SEQ_LCTG'), 'Category1'),
(nextval('SEQ_LCTG'), 'Category2'),
(nextval('SEQ_LCTG'), 'Category3'),
(nextval('SEQ_LCTG'), 'Category4'),
(nextval('SEQ_LCTG'), 'Category5'),
(nextval('SEQ_LCTG'), 'Category6'),
(nextval('SEQ_LCTG'), 'Category7'),
(nextval('SEQ_LCTG'), 'Category8'),
(nextval('SEQ_LCTG'), 'Category9'),
(nextval('SEQ_LCTG'), 'Category10'),
(nextval('SEQ_LCTG'), 'Category11'),
(nextval('SEQ_LCTG'), 'Category12'),
(nextval('SEQ_LCTG'), 'Category13'),
(nextval('SEQ_LCTG'), 'Category14'),
(nextval('SEQ_LCTG'), 'Category15'),
(nextval('SEQ_LCTG'), 'Category16'),
(nextval('SEQ_LCTG'), 'Category17'),
(nextval('SEQ_LCTG'), 'Category18'),
(nextval('SEQ_LCTG'), 'Category19'),
(nextval('SEQ_LCTG'), 'Category20'),
(nextval('SEQ_LCTG'), 'Category21'),
(nextval('SEQ_LCTG'), 'Category22'),
(nextval('SEQ_LCTG'), 'Category23'),
(nextval('SEQ_LCTG'), 'Category24'),
(nextval('SEQ_LCTG'), 'Category25'),
(nextval('SEQ_LCTG'), 'Category26'),
(nextval('SEQ_LCTG'), 'Category27'),
(nextval('SEQ_LCTG'), 'Category28'),
(nextval('SEQ_LCTG'), 'Category29'),
(nextval('SEQ_LCTG'), 'Category30');



-- 반려동물 분류
INSERT INTO PET_KIND (PET_KIND_NO, PET_KIND_NAME)
VALUES 
(nextval('SEQ_PKI'), 'Kind1'),
(nextval('SEQ_PKI'), 'Kind2'),
(nextval('SEQ_PKI'), 'Kind3'),
(nextval('SEQ_PKI'), 'Kind4'),
(nextval('SEQ_PKI'), 'Kind5'),
(nextval('SEQ_PKI'), 'Kind6'),
(nextval('SEQ_PKI'), 'Kind7'),
(nextval('SEQ_PKI'), 'Kind8'),
(nextval('SEQ_PKI'), 'Kind9'),
(nextval('SEQ_PKI'), 'Kind10'),
(nextval('SEQ_PKI'), 'Kind11'),
(nextval('SEQ_PKI'), 'Kind12'),
(nextval('SEQ_PKI'), 'Kind13'),
(nextval('SEQ_PKI'), 'Kind14'),
(nextval('SEQ_PKI'), 'Kind15'),
(nextval('SEQ_PKI'), 'Kind16'),
(nextval('SEQ_PKI'), 'Kind17'),
(nextval('SEQ_PKI'), 'Kind18'),
(nextval('SEQ_PKI'), 'Kind19'),
(nextval('SEQ_PKI'), 'Kind20'),
(nextval('SEQ_PKI'), 'Kind21'),
(nextval('SEQ_PKI'), 'Kind22'),
(nextval('SEQ_PKI'), 'Kind23'),
(nextval('SEQ_PKI'), 'Kind24'),
(nextval('SEQ_PKI'), 'Kind25'),
(nextval('SEQ_PKI'), 'Kind26'),
(nextval('SEQ_PKI'), 'Kind27'),
(nextval('SEQ_PKI'), 'Kind28'),
(nextval('SEQ_PKI'), 'Kind29'),
(nextval('SEQ_PKI'), 'Kind30');


--반려동물 크기
INSERT INTO PET_SIZE (PET_SIZE_NO, PET_SIZE_NAME, PET_KIND_NO)
VALUES 
(nextval('SEQ_PS'), 'Small', 1),
(nextval('SEQ_PS'), 'Medium', 2),
(nextval('SEQ_PS'), 'Large', 3),
(nextval('SEQ_PS'), 'Small', 4),
(nextval('SEQ_PS'), 'Medium', 5),
(nextval('SEQ_PS'), 'Large', 6),
(nextval('SEQ_PS'), 'Small', 7),
(nextval('SEQ_PS'), 'Medium', 8),
(nextval('SEQ_PS'), 'Large', 9),
(nextval('SEQ_PS'), 'Small', 10),
(nextval('SEQ_PS'), 'Medium', 11),
(nextval('SEQ_PS'), 'Large', 12),
(nextval('SEQ_PS'), 'Small', 13),
(nextval('SEQ_PS'), 'Medium', 14),
(nextval('SEQ_PS'), 'Large', 15),
(nextval('SEQ_PS'), 'Small', 16),
(nextval('SEQ_PS'), 'Medium', 17),
(nextval('SEQ_PS'), 'Large', 18),
(nextval('SEQ_PS'), 'Small', 19),
(nextval('SEQ_PS'), 'Medium', 20),
(nextval('SEQ_PS'), 'Large', 21),
(nextval('SEQ_PS'), 'Small', 22),
(nextval('SEQ_PS'), 'Medium', 23),
(nextval('SEQ_PS'), 'Large', 24),
(nextval('SEQ_PS'), 'Small', 25),
(nextval('SEQ_PS'), 'Medium', 26),
(nextval('SEQ_PS'), 'Large', 27),
(nextval('SEQ_PS'), 'Small', 28),
(nextval('SEQ_PS'), 'Medium', 29),
(nextval('SEQ_PS'), 'Large', 30);



--반려동물 테이블

INSERT INTO PET (PET_NO, PET_NAME, PET_BIRTHDAY, PET_GENDER, USER_NO, PET_SIZE_NO)
VALUES 
(nextval('SEQ_PET'), 'Buddy', '2020-01-01', 'M', 1, 1),
(nextval('SEQ_PET'), 'Bella', '2019-02-02', 'F', 2, 2),
(nextval('SEQ_PET'), 'Max', '2018-03-03', 'M', 3, 3),
(nextval('SEQ_PET'), 'Luna', '2017-04-04', 'F', 4, 4),
(nextval('SEQ_PET'), 'Charlie', '2016-05-05', 'M', 5, 5),
(nextval('SEQ_PET'), 'Lucy', '2015-06-06', 'F', 6, 6),
(nextval('SEQ_PET'), 'Cooper', '2014-07-07', 'M', 7, 7),
(nextval('SEQ_PET'), 'Daisy', '2013-08-08', 'F', 8, 8),
(nextval('SEQ_PET'), 'Rocky', '2012-09-09', 'M', 9, 9),
(nextval('SEQ_PET'), 'Molly', '2011-10-10', 'F', 10, 10),
(nextval('SEQ_PET'), 'Teddy', '2010-11-11', 'M', 11, 11),
(nextval('SEQ_PET'), 'Maggie', '2009-12-12', 'F', 12, 12),
(nextval('SEQ_PET'), 'Oscar', '2008-01-13', 'M', 13, 13),
(nextval('SEQ_PET'), 'Sophie', '2007-02-14', 'F', 14, 14),
(nextval('SEQ_PET'), 'Tucker', '2006-03-15', 'M', 15, 15),
(nextval('SEQ_PET'), 'Chloe', '2005-04-16', 'F', 16, 16),
(nextval('SEQ_PET'), 'Jack', '2004-05-17', 'M', 17, 17),
(nextval('SEQ_PET'), 'Lola', '2003-06-18', 'F', 18, 18),
(nextval('SEQ_PET'), 'Zeus', '2002-07-19', 'M', 19, 19),
(nextval('SEQ_PET'), 'Zoe', '2001-08-20', 'F', 20, 20),
(nextval('SEQ_PET'), 'Duke', '2000-09-21', 'M', 21, 21),
(nextval('SEQ_PET'), 'Riley', '1999-10-22', 'F', 22, 22),
(nextval('SEQ_PET'), 'Buster', '1998-11-23', 'M', 23, 23),
(nextval('SEQ_PET'), 'Layla', '1997-12-24', 'F', 24, 24),
(nextval('SEQ_PET'), 'Bruno', '1996-01-25', 'M', 25, 25),
(nextval('SEQ_PET'), 'Nala', '1995-02-26', 'F', 26, 26),
(nextval('SEQ_PET'), 'Murphy', '1994-03-27', 'M', 27, 27),
(nextval('SEQ_PET'), 'Stella', '1993-04-28', 'F', 28, 28),
(nextval('SEQ_PET'), 'Gus', '1992-05-29', 'M', 29, 29),
(nextval('SEQ_PET'), 'Piper', '1991-06-30', 'F', 30, 30);



-- 장소 공통정보 테이블

INSERT INTO LOCATION (LOCATION_NO, LOCATION_NAME, LOCATION_PHONE, EXPLANATION, LOCATION_STAR, RESERVATION_LINK, BUSINESS_NO, ADDRESS, USER_NO, LOCATION_CATEGORY_NO, STATUS)
VALUES 
(nextval('SEQ_LOC'), 'Location1', '010-1234-0001', 'Description1', 4.5, 'http://example.com/1', 'BN123', 'Address1', 1, 1, TRUE),
(nextval('SEQ_LOC'), 'Location2', '010-1234-0002', 'Description2', 4.0, 'http://example.com/2', 'BN124', 'Address2', 2, 2, TRUE),
(nextval('SEQ_LOC'), 'Location3', '010-1234-0003', 'Description3', 4.2, 'http://example.com/3', 'BN125', 'Address3', 3, 3, TRUE),
(nextval('SEQ_LOC'), 'Location4', '010-1234-0004', 'Description4', 4.8, 'http://example.com/4', 'BN126', 'Address4', 4, 4, TRUE),
(nextval('SEQ_LOC'), 'Location5', '010-1234-0005', 'Description5', 3.9, 'http://example.com/5', 'BN127', 'Address5', 5, 5, TRUE),
(nextval('SEQ_LOC'), 'Location6', '010-1234-0006', 'Description6', 4.1, 'http://example.com/6', 'BN128', 'Address6', 6, 6, TRUE),
(nextval('SEQ_LOC'), 'Location7', '010-1234-0007', 'Description7', 4.3, 'http://example.com/7', 'BN129', 'Address7', 7, 7, TRUE),
(nextval('SEQ_LOC'), 'Location8', '010-1234-0008', 'Description8', 4.4, 'http://example.com/8', 'BN130', 'Address8', 8, 8, TRUE),
(nextval('SEQ_LOC'), 'Location9', '010-1234-0009', 'Description9', 4.6, 'http://example.com/9', 'BN131', 'Address9', 9, 9, TRUE),
(nextval('SEQ_LOC'), 'Location10', '010-1234-0010', 'Description10', 4.7, 'http://example.com/10', 'BN132', 'Address10', 10, 10, TRUE),
(nextval('SEQ_LOC'), 'Location11', '010-1234-0011', 'Description11', 4.9, 'http://example.com/11', 'BN133', 'Address11', 11, 11, TRUE),
(nextval('SEQ_LOC'), 'Location12', '010-1234-0012', 'Description12', 4.0, 'http://example.com/12', 'BN134', 'Address12', 12, 12, TRUE),
(nextval('SEQ_LOC'), 'Location13', '010-1234-0013', 'Description13', 4.1, 'http://example.com/13', 'BN135', 'Address13', 13, 13, TRUE),
(nextval('SEQ_LOC'), 'Location14', '010-1234-0014', 'Description14', 4.3, 'http://example.com/14', 'BN136', 'Address14', 14, 14, TRUE),
(nextval('SEQ_LOC'), 'Location15', '010-1234-0015', 'Description15', 4.5, 'http://example.com/15', 'BN137', 'Address15', 15, 15, TRUE),
(nextval('SEQ_LOC'), 'Location16', '010-1234-0016', 'Description16', 4.7, 'http://example.com/16', 'BN138', 'Address16', 16, 16, TRUE),
(nextval('SEQ_LOC'), 'Location17', '010-1234-0017', 'Description17', 4.6, 'http://example.com/17', 'BN139', 'Address17', 17, 17, TRUE),
(nextval('SEQ_LOC'), 'Location18', '010-1234-0018', 'Description18', 4.4, 'http://example.com/18', 'BN140', 'Address18', 18, 18, TRUE),
(nextval('SEQ_LOC'), 'Location19', '010-1234-0019', 'Description19', 4.2, 'http://example.com/19', 'BN141', 'Address19', 19, 19, TRUE),
(nextval('SEQ_LOC'), 'Location20', '010-1234-0020', 'Description20', 4.0, 'http://example.com/20', 'BN142', 'Address20', 20, 20, TRUE),
(nextval('SEQ_LOC'), 'Location21', '010-1234-0021', 'Description21', 4.1, 'http://example.com/21', 'BN143', 'Address21', 21, 21, TRUE),
(nextval('SEQ_LOC'), 'Location22', '010-1234-0022', 'Description22', 4.3, 'http://example.com/22', 'BN144', 'Address22', 22, 22, TRUE),
(nextval('SEQ_LOC'), 'Location23', '010-1234-0023', 'Description23', 4.5, 'http://example.com/23', 'BN145', 'Address23', 23, 23, TRUE),
(nextval('SEQ_LOC'), 'Location24', '010-1234-0024', 'Description24', 4.7, 'http://example.com/24', 'BN146', 'Address24', 24, 24, TRUE),
(nextval('SEQ_LOC'), 'Location25', '010-1234-0025', 'Description25', 4.6, 'http://example.com/25', 'BN147', 'Address25', 25, 25, TRUE),
(nextval('SEQ_LOC'), 'Location26', '010-1234-0026', 'Description26', 4.4, 'http://example.com/26', 'BN148', 'Address26', 26, 26, TRUE),
(nextval('SEQ_LOC'), 'Location27', '010-1234-0027', 'Description27', 4.2, 'http://example.com/27', 'BN149', 'Address27', 27, 27, TRUE),
(nextval('SEQ_LOC'), 'Location28', '010-1234-0028', 'Description28', 4.0, 'http://example.com/28', 'BN150', 'Address28', 28, 28, TRUE),
(nextval('SEQ_LOC'), 'Location29', '010-1234-0029', 'Description29', 4.1, 'http://example.com/29', 'BN151', 'Address29', 29, 29, TRUE),
(nextval('SEQ_LOC'), 'Location30', '010-1234-0030', 'Description30', 4.3, 'http://example.com/30', 'BN152', 'Address30', 30, 30, TRUE);


-- 장소 옵션 테이블

INSERT INTO LOCATION_OPTION (LOCATION_OPTION_NO, GOODS, GOODS_PRICE, ROOM_INFO, CAPACITY, LOCATION_NO, ROOM_STATUS)
VALUES 
(nextval('SEQ_LOPT'), 'Goods1', 'Price1', 'Room1', 10, 1, TRUE),
(nextval('SEQ_LOPT'), 'Goods2', 'Price2', 'Room2', 20, 2, TRUE),
(nextval('SEQ_LOPT'), 'Goods3', 'Price3', 'Room3', 30, 3, TRUE),
(nextval('SEQ_LOPT'), 'Goods4', 'Price4', 'Room4', 40, 4, TRUE),
(nextval('SEQ_LOPT'), 'Goods5', 'Price5', 'Room5', 50, 5, TRUE),
(nextval('SEQ_LOPT'), 'Goods6', 'Price6', 'Room6', 60, 6, TRUE),
(nextval('SEQ_LOPT'), 'Goods7', 'Price7', 'Room7', 70, 7, TRUE),
(nextval('SEQ_LOPT'), 'Goods8', 'Price8', 'Room8', 80, 8, TRUE),
(nextval('SEQ_LOPT'), 'Goods9', 'Price9', 'Room9', 90, 9, TRUE),
(nextval('SEQ_LOPT'), 'Goods10', 'Price10', 'Room10', 100, 10, TRUE),
(nextval('SEQ_LOPT'), 'Goods11', 'Price11', 'Room11', 110, 11, TRUE),
(nextval('SEQ_LOPT'), 'Goods12', 'Price12', 'Room12', 120, 12, TRUE),
(nextval('SEQ_LOPT'), 'Goods13', 'Price13', 'Room13', 130, 13, TRUE),
(nextval('SEQ_LOPT'), 'Goods14', 'Price14', 'Room14', 140, 14, TRUE),
(nextval('SEQ_LOPT'), 'Goods15', 'Price15', 'Room15', 150, 15, TRUE),
(nextval('SEQ_LOPT'), 'Goods16', 'Price16', 'Room16', 160, 16, TRUE),
(nextval('SEQ_LOPT'), 'Goods17', 'Price17', 'Room17', 170, 17, TRUE),
(nextval('SEQ_LOPT'), 'Goods18', 'Price18', 'Room18', 180, 18, TRUE),
(nextval('SEQ_LOPT'), 'Goods19', 'Price19', 'Room19', 190, 19, TRUE),
(nextval('SEQ_LOPT'), 'Goods20', 'Price20', 'Room20', 200, 20, TRUE),
(nextval('SEQ_LOPT'), 'Goods21', 'Price21', 'Room21', 210, 21, TRUE),
(nextval('SEQ_LOPT'), 'Goods22', 'Price22', 'Room22', 220, 22, TRUE),
(nextval('SEQ_LOPT'), 'Goods23', 'Price23', 'Room23', 230, 23, TRUE),
(nextval('SEQ_LOPT'), 'Goods24', 'Price24', 'Room24', 240, 24, TRUE),
(nextval('SEQ_LOPT'), 'Goods25', 'Price25', 'Room25', 250, 25, TRUE),
(nextval('SEQ_LOPT'), 'Goods26', 'Price26', 'Room26', 260, 26, TRUE),
(nextval('SEQ_LOPT'), 'Goods27', 'Price27', 'Room27', 270, 27, TRUE),
(nextval('SEQ_LOPT'), 'Goods28', 'Price28', 'Room28', 280, 28, TRUE),
(nextval('SEQ_LOPT'), 'Goods29', 'Price29', 'Room29', 290, 29, TRUE),
(nextval('SEQ_LOPT'), 'Goods30', 'Price30', 'Room30', 300, 30, TRUE);



-- 찜 테이블
INSERT INTO PICK (PICK_NO, USER_NO, LOCATION_NO)
VALUES 
(nextval('SEQ_PICK'), 1, 1),
(nextval('SEQ_PICK'), 2, 2),
(nextval('SEQ_PICK'), 3, 2),
(nextval('SEQ_PICK'), 4, 2),
(nextval('SEQ_PICK'), 5, 2),
(nextval('SEQ_PICK'), 6, 2),
(nextval('SEQ_PICK'), 7, 7),
(nextval('SEQ_PICK'), 8, 8),
(nextval('SEQ_PICK'), 9, 9),
(nextval('SEQ_PICK'), 10, 10),
(nextval('SEQ_PICK'), 11, 11),
(nextval('SEQ_PICK'), 12, 12),
(nextval('SEQ_PICK'), 13, 13),
(nextval('SEQ_PICK'), 14, 14),
(nextval('SEQ_PICK'), 15, 15),
(nextval('SEQ_PICK'), 16, 16),
(nextval('SEQ_PICK'), 17, 17),
(nextval('SEQ_PICK'), 18, 18),
(nextval('SEQ_PICK'), 19, 19),
(nextval('SEQ_PICK'), 20, 20),
(nextval('SEQ_PICK'), 21, 21),
(nextval('SEQ_PICK'), 22, 22),
(nextval('SEQ_PICK'), 23, 23),
(nextval('SEQ_PICK'), 24, 24),
(nextval('SEQ_PICK'), 25, 25),
(nextval('SEQ_PICK'), 26, 26),
(nextval('SEQ_PICK'), 27, 27),
(nextval('SEQ_PICK'), 28, 28),
(nextval('SEQ_PICK'), 29, 29),
(nextval('SEQ_PICK'), 30, 30);



--출입 등급 테이블

INSERT INTO ENTER_GRADE (ENTER_NO, LOCATION_NO, PET_SIZE_NO)
VALUES 
(nextval('SEQ_ENT'), 1, 1),
(nextval('SEQ_ENT'), 2, 2),
(nextval('SEQ_ENT'), 3, 3),
(nextval('SEQ_ENT'), 4, 4),
(nextval('SEQ_ENT'), 5, 5),
(nextval('SEQ_ENT'), 6, 6),
(nextval('SEQ_ENT'), 7, 7),
(nextval('SEQ_ENT'), 8, 8),
(nextval('SEQ_ENT'), 9, 9),
(nextval('SEQ_ENT'), 10, 10),
(nextval('SEQ_ENT'), 11, 11),
(nextval('SEQ_ENT'), 12, 12),
(nextval('SEQ_ENT'), 13, 13),
(nextval('SEQ_ENT'), 14, 14),
(nextval('SEQ_ENT'), 15, 15),
(nextval('SEQ_ENT'), 16, 16),
(nextval('SEQ_ENT'), 17, 17),
(nextval('SEQ_ENT'), 18, 18),
(nextval('SEQ_ENT'), 19, 19),
(nextval('SEQ_ENT'), 20, 20),
(nextval('SEQ_ENT'), 21, 21),
(nextval('SEQ_ENT'), 22, 22),
(nextval('SEQ_ENT'), 23, 23),
(nextval('SEQ_ENT'), 24, 24),
(nextval('SEQ_ENT'), 25, 25),
(nextval('SEQ_ENT'), 26, 26),
(nextval('SEQ_ENT'), 27, 27),
(nextval('SEQ_ENT'), 28, 28),
(nextval('SEQ_ENT'), 29, 29),
(nextval('SEQ_ENT'), 30, 30);


-- 리뷰 테이블

INSERT INTO REVIEW (REVIEW_NO, REVIEW_STAR, REVIEW_CONTENT, USER_NO, LOCATION_NO, STATUS)
VALUES 
(nextval('SEQ_REV'), 5, '좋아요 최곱니다.~', 1, 1, TRUE),
(nextval('SEQ_REV'), 3, '좋아요 최곱니다1.~', 1, 1, TRUE),
(nextval('SEQ_REV'), 4, '좋아요 최곱니다2.~', 2, 1, TRUE),
(nextval('SEQ_REV'), 2, '좋아요 최곱니다3.~', 3, 1, TRUE),
(nextval('SEQ_REV'), 1, '좋아요 최곱니다4', 4, 1, TRUE),
(nextval('SEQ_REV'), 4, 'Review2', 2, 2, TRUE),
(nextval('SEQ_REV'), 3, 'Review3', 3, 3, TRUE),
(nextval('SEQ_REV'), 5, 'Review4', 4, 4, TRUE),
(nextval('SEQ_REV'), 4, 'Review5', 5, 5, TRUE),
(nextval('SEQ_REV'), 3, 'Review6', 6, 6, TRUE),
(nextval('SEQ_REV'), 5, 'Review7', 7, 7, TRUE),
(nextval('SEQ_REV'), 4, 'Review8', 8, 8, TRUE),
(nextval('SEQ_REV'), 3, 'Review9', 9, 9, TRUE),
(nextval('SEQ_REV'), 5, 'Review10', 10, 10, TRUE),
(nextval('SEQ_REV'), 4, 'Review11', 11, 11, TRUE),
(nextval('SEQ_REV'), 3, 'Review12', 12, 12, TRUE),
(nextval('SEQ_REV'), 5, 'Review13', 13, 13, TRUE),
(nextval('SEQ_REV'), 4, 'Review14', 14, 14, TRUE),
(nextval('SEQ_REV'), 3, 'Review15', 15, 15, TRUE),
(nextval('SEQ_REV'), 5, 'Review16', 16, 16, TRUE),
(nextval('SEQ_REV'), 4, 'Review17', 17, 17, TRUE),
(nextval('SEQ_REV'), 3, 'Review18', 18, 18, TRUE),
(nextval('SEQ_REV'), 5, 'Review19', 19, 19, TRUE),
(nextval('SEQ_REV'), 4, 'Review20', 20, 20, TRUE),
(nextval('SEQ_REV'), 3, 'Review21', 21, 21, TRUE),
(nextval('SEQ_REV'), 5, 'Review22', 22, 22, TRUE),
(nextval('SEQ_REV'), 4, 'Review23', 23, 23, TRUE),
(nextval('SEQ_REV'), 3, 'Review24', 24, 24, TRUE),
(nextval('SEQ_REV'), 5, 'Review25', 25, 25, TRUE),
(nextval('SEQ_REV'), 4, 'Review26', 26, 26, TRUE),
(nextval('SEQ_REV'), 3, 'Review27', 27, 27, TRUE),
(nextval('SEQ_REV'), 5, 'Review28', 28, 28, TRUE),
(nextval('SEQ_REV'), 4, 'Review29', 29, 29, TRUE),
(nextval('SEQ_REV'), 3, 'Review30', 30, 30, TRUE),
(nextval('SEQ_REV'), 2, '좋아요 최곱니다5', 5, 1, TRUE),
(nextval('SEQ_REV'), 3, '좋아요 최곱니다6', 6, 1, TRUE),
(nextval('SEQ_REV'), 4, '좋아요 최곱니다7', 7, 1, TRUE),
(nextval('SEQ_REV'), 5, '좋아요 최곱니다8', 8, 1, TRUE),
(nextval('SEQ_REV'), 5, '좋아요 최곱니다9', 9, 1, TRUE),
(nextval('SEQ_REV'), 5, '좋아요 최곱니다10', 10, 1, TRUE);

select *From review;
-- 사장님 답글 테이블

INSERT INTO OWNER_REPLY (OWNER_REPLY_NO, OWNER_REPLY_CONTENT, REVIEW_NO, STATUS)
VALUES 
(nextval('SEQ_OWRE'), 'OwnerReply1', 1, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply1', 2, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply3', 3, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply4', 4, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply5', 5, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply6', 6, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply7', 7, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply8', 8, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply9', 9,  TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply10', 10, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply11', 11, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply12', 12, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply13', 13, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply14', 14, TRUE),
(nextval('SEQ_OWRE'), 'OwnerReply15', 15, TRUE),
(nextval('SEQ_OWRE'), 'Reply16', 16, TRUE),
(nextval('SEQ_OWRE'), 'Reply17', 17, TRUE),
(nextval('SEQ_OWRE'), 'Reply18', 18, TRUE),
(nextval('SEQ_OWRE'), 'Reply19', 19, TRUE),
(nextval('SEQ_OWRE'), 'Reply20', 20, TRUE),
(nextval('SEQ_OWRE'), 'Reply21', 21, TRUE),
(nextval('SEQ_OWRE'), 'Reply22', 22, TRUE),
(nextval('SEQ_OWRE'), 'Reply23', 23, TRUE),
(nextval('SEQ_OWRE'), 'Reply24', 24, TRUE),
(nextval('SEQ_OWRE'), 'Reply25', 25, TRUE),
(nextval('SEQ_OWRE'), 'Reply26', 26, TRUE),
(nextval('SEQ_OWRE'), 'Reply27', 27, TRUE),
(nextval('SEQ_OWRE'), 'Reply28', 28, TRUE),
(nextval('SEQ_OWRE'), 'Reply29', 29, TRUE),
(nextval('SEQ_OWRE'), 'Reply30', 30,TRUE);

--운영시간 테이블

INSERT INTO OPERATION_TIME (OPERATION_NO, DAYS, START_TIME, END_TIME, LOCATION_NO, REST_STATUS)
VALUES 
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 1, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 2, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 3, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 4, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 5, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 6, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 7, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 8, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 9, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 10, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 11, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 12, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 13, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 14, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 15, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 16, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 17, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 18, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 19, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 20, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 21, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 22, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 23, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 24, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 25, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 26, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 27, TRUE),
(nextval('SEQ_OPER'), 'Mon-Fri', '09:00', '18:00', 28, TRUE),
(nextval('SEQ_OPER'), 'Sat-Sun', '10:00', '17:00', 29, TRUE),
(nextval('SEQ_OPER'), 'Holidays', '11:00', '16:00', 30, TRUE);



--게시물 카테고리 테이블

INSERT INTO BOARD_CATEGORY (BOARD_CATEGORY_NO, CATEGORY_NAME)
VALUES 
(nextval('SEQ_BOCA'), 'Category1'),
(nextval('SEQ_BOCA'), 'Category2'),
(nextval('SEQ_BOCA'), 'Category3'),
(nextval('SEQ_BOCA'), 'Category4'),
(nextval('SEQ_BOCA'), 'Category5'),
(nextval('SEQ_BOCA'), 'Category6'),
(nextval('SEQ_BOCA'), 'Category7'),
(nextval('SEQ_BOCA'), 'Category8'),
(nextval('SEQ_BOCA'), 'Category9'),
(nextval('SEQ_BOCA'), 'Category10'),
(nextval('SEQ_BOCA'), 'Category11'),
(nextval('SEQ_BOCA'), 'Category12'),
(nextval('SEQ_BOCA'), 'Category13'),
(nextval('SEQ_BOCA'), 'Category14'),
(nextval('SEQ_BOCA'), 'Category15'),
(nextval('SEQ_BOCA'), 'Category16'),
(nextval('SEQ_BOCA'), 'Category17'),
(nextval('SEQ_BOCA'), 'Category18'),
(nextval('SEQ_BOCA'), 'Category19'),
(nextval('SEQ_BOCA'), 'Category20'),
(nextval('SEQ_BOCA'), 'Category21'),
(nextval('SEQ_BOCA'), 'Category22'),
(nextval('SEQ_BOCA'), 'Category23'),
(nextval('SEQ_BOCA'), 'Category24'),
(nextval('SEQ_BOCA'), 'Category25'),
(nextval('SEQ_BOCA'), 'Category26'),
(nextval('SEQ_BOCA'), 'Category27'),
(nextval('SEQ_BOCA'), 'Category28'),
(nextval('SEQ_BOCA'), 'Category29'),
(nextval('SEQ_BOCA'), 'Category30');

-- 게시물 테이블

INSERT INTO BOARD (BOARD_NO, BOARD_TITLE, BOARD_CONTENT, USER_NO, BOARD_CATEGORY_NO, STATUS)
VALUES 
(nextval('SEQ_BORD'), 'Title1', 'Content1', 1, 1, TRUE),
(nextval('SEQ_BORD'), 'Title2', 'Content2', 2, 2, TRUE),
(nextval('SEQ_BORD'), 'Title3', 'Content3', 3, 3, TRUE),
(nextval('SEQ_BORD'), 'Title4', 'Content4', 4, 4, TRUE),
(nextval('SEQ_BORD'), 'Title5', 'Content5', 5, 5, TRUE),
(nextval('SEQ_BORD'), 'Title6', 'Content6', 6, 6, TRUE),
(nextval('SEQ_BORD'), 'Title7', 'Content7', 7, 7, TRUE),
(nextval('SEQ_BORD'), 'Title8', 'Content8', 8, 8, TRUE),
(nextval('SEQ_BORD'), 'Title9', 'Content9', 9, 9, TRUE),
(nextval('SEQ_BORD'), 'Title10', 'Content10', 10, 10, TRUE),
(nextval('SEQ_BORD'), 'Title11', 'Content11', 11, 11, TRUE),
(nextval('SEQ_BORD'), 'Title12', 'Content12', 12, 12, TRUE),
(nextval('SEQ_BORD'), 'Title13', 'Content13', 13, 13, TRUE),
(nextval('SEQ_BORD'), 'Title14', 'Content14', 14, 14, TRUE),
(nextval('SEQ_BORD'), 'Title15', 'Content15', 15, 15, TRUE),
(nextval('SEQ_BORD'), 'Title16', 'Content16', 16, 16, TRUE),
(nextval('SEQ_BORD'), 'Title17', 'Content17', 17, 17, TRUE),
(nextval('SEQ_BORD'), 'Title18', 'Content18', 18, 18, TRUE),
(nextval('SEQ_BORD'), 'Title19', 'Content19', 19, 19, TRUE),
(nextval('SEQ_BORD'), 'Title20', 'Content20', 20, 20, TRUE),
(nextval('SEQ_BORD'), 'Title21', 'Content21', 21, 21, TRUE),
(nextval('SEQ_BORD'), 'Title22', 'Content22', 22, 22, TRUE),
(nextval('SEQ_BORD'), 'Title23', 'Content23', 23, 23, TRUE),
(nextval('SEQ_BORD'), 'Title24', 'Content24', 24, 24, TRUE),
(nextval('SEQ_BORD'), 'Title25', 'Content25', 25, 25, TRUE),
(nextval('SEQ_BORD'), 'Title26', 'Content26', 26, 26, TRUE),
(nextval('SEQ_BORD'), 'Title27', 'Content27', 27, 27, TRUE),
(nextval('SEQ_BORD'), 'Title28', 'Content28', 28, 28, TRUE),
(nextval('SEQ_BORD'), 'Title29', 'Content29', 29, 29, TRUE),
(nextval('SEQ_BORD'), 'Title30', 'Content30', 30, 30, TRUE);

-- 쇼츠테이블

INSERT INTO SHORTS (SHORTS_NO, SHORTS_CONTENT, USER_NO, STATUS)
VALUES 
(nextval('SEQ_SHORT'), 'Shorts Content1', 1, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content2', 2, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content3', 3, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content4', 4, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content5', 5, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content6', 6, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content7', 7, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content8', 8, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content9', 9, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content10', 10, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content11', 11, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content12', 12, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content13', 13, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content14', 14, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content15', 15, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content16', 16, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content17', 17, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content18', 18, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content19', 19, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content20', 20, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content21', 21, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content22', 22, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content23', 23, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content24', 24, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content25', 25, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content26', 26, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content27', 27, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content28', 28, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content29', 29, TRUE),
(nextval('SEQ_SHORT'), 'Shorts Content30', 30, TRUE);


-- 영상 테이블


INSERT INTO VIDEO (VIDEO_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, SHORTS_NO)
VALUES 
(nextval('SEQ_VIDEO'), 'Origin1', 'Change1', 'Path1', 1),
(nextval('SEQ_VIDEO'), 'Origin2', 'Change2', 'Path2', 2),
(nextval('SEQ_VIDEO'), 'Origin3', 'Change3', 'Path3', 3),
(nextval('SEQ_VIDEO'), 'Origin4', 'Change4', 'Path4', 4),
(nextval('SEQ_VIDEO'), 'Origin5', 'Change5', 'Path5', 5),
(nextval('SEQ_VIDEO'), 'Origin6', 'Change6', 'Path6', 6),
(nextval('SEQ_VIDEO'), 'Origin7', 'Change7', 'Path7', 7),
(nextval('SEQ_VIDEO'), 'Origin8', 'Change8', 'Path8', 8),
(nextval('SEQ_VIDEO'), 'Origin9', 'Change9', 'Path9', 9),
(nextval('SEQ_VIDEO'), 'Origin10', 'Change10', 'Path10', 10),
(nextval('SEQ_VIDEO'), 'Origin11', 'Change11', 'Path11', 11),
(nextval('SEQ_VIDEO'), 'Origin12', 'Change12', 'Path12', 12),
(nextval('SEQ_VIDEO'), 'Origin13', 'Change13', 'Path13', 13),
(nextval('SEQ_VIDEO'), 'Origin14', 'Change14', 'Path14', 14),
(nextval('SEQ_VIDEO'), 'Origin15', 'Change15', 'Path15', 15),
(nextval('SEQ_VIDEO'), 'Origin16', 'Change16', 'Path16', 16),
(nextval('SEQ_VIDEO'), 'Origin17', 'Change17', 'Path17', 17),
(nextval('SEQ_VIDEO'), 'Origin18', 'Change18', 'Path18', 18),
(nextval('SEQ_VIDEO'), 'Origin19', 'Change19', 'Path19', 19),
(nextval('SEQ_VIDEO'), 'Origin20', 'Change20', 'Path20', 20),
(nextval('SEQ_VIDEO'), 'Origin21', 'Change21', 'Path21', 21),
(nextval('SEQ_VIDEO'), 'Origin22', 'Change22', 'Path22', 22),
(nextval('SEQ_VIDEO'), 'Origin23', 'Change23', 'Path23', 23),
(nextval('SEQ_VIDEO'), 'Origin24', 'Change24', 'Path24', 24),
(nextval('SEQ_VIDEO'), 'Origin25', 'Change25', 'Path25', 25),
(nextval('SEQ_VIDEO'), 'Origin26', 'Change26', 'Path26', 26),
(nextval('SEQ_VIDEO'), 'Origin27', 'Change27', 'Path27', 27),
(nextval('SEQ_VIDEO'), 'Origin28', 'Change28', 'Path28', 28),
(nextval('SEQ_VIDEO'), 'Origin29', 'Change29', 'Path29', 29),
(nextval('SEQ_VIDEO'), 'Origin30', 'Change30', 'Path30', 30);


-- 댓글 테이블

INSERT INTO REPLY (REPLY_NO, REPLY_CONTENT, USER_NO, BOARD_NO, SHORTS_NO, REPLY_RE_NO, STATUS)
VALUES 
(nextval('SEQ_REPLY'), 'Reply Content1', 1, 1, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content2', 2, 2, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content3', 3, 3, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content4', 4, 4, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content5', 5, 5, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content6', 6, 6, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content7', 7, 7, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content8', 8, 8, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content9', 9, 9, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content10', 10, 10, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content11', 11, 11, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content12', 12, 12, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content13', 13, 13, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content14', 14, 14, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content15', 15, 15, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content16', 16, 16, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content17', 17, 17, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content18', 18, 18, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content19', 19, 19, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content20', 20, 20, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content21', 21, 21, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content22', 22, 22, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content23', 23, 23, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content24', 24, 24, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content25', 25, 25, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content26', 26, 26, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content27', 27, 27, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content28', 28, 28, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content29', 29, 29, NULL, NULL, TRUE),
(nextval('SEQ_REPLY'), 'Reply Content30', 30, 30, NULL, NULL, TRUE);

-- 좋아요 테이블
INSERT INTO GOOD (GOOD_NO, COUNT, USER_NO, BOARD_NO, SHORTS_NO)
VALUES 
(nextval('SEQ_GOOD'), 1, 1, 1, NULL),
(nextval('SEQ_GOOD'), 2, 2, 2, NULL),
(nextval('SEQ_GOOD'), 3, 3, 3, NULL),
(nextval('SEQ_GOOD'), 4, 4, 4, NULL),
(nextval('SEQ_GOOD'), 5, 5, 5, NULL),
(nextval('SEQ_GOOD'), 6, 6, 6, NULL),
(nextval('SEQ_GOOD'), 7, 7, 7, NULL),
(nextval('SEQ_GOOD'), 8, 8, 8, NULL),
(nextval('SEQ_GOOD'), 9, 9, 9, NULL),
(nextval('SEQ_GOOD'), 10, 10, 10, NULL),
(nextval('SEQ_GOOD'), 11, 11, 11, NULL),
(nextval('SEQ_GOOD'), 12, 12, 12, NULL),
(nextval('SEQ_GOOD'), 13, 13, 13, NULL),
(nextval('SEQ_GOOD'), 14, 14, 14, NULL),
(nextval('SEQ_GOOD'), 15, 15, 15, NULL),
(nextval('SEQ_GOOD'), 16, 16, 16, NULL),
(nextval('SEQ_GOOD'), 17, 17, 17, NULL),
(nextval('SEQ_GOOD'), 18, 18, 18, NULL),
(nextval('SEQ_GOOD'), 19, 19, 19, NULL),
(nextval('SEQ_GOOD'), 20, 20, 20, NULL),
(nextval('SEQ_GOOD'), 21, 21, 21, NULL),
(nextval('SEQ_GOOD'), 22, 22, 22, NULL),
(nextval('SEQ_GOOD'), 23, 23, 23, NULL),
(nextval('SEQ_GOOD'), 24, 24, 24, NULL),
(nextval('SEQ_GOOD'), 25, 25, 25, NULL),
(nextval('SEQ_GOOD'), 26, 26, 26, NULL),
(nextval('SEQ_GOOD'), 27, 27, 27, NULL),
(nextval('SEQ_GOOD'), 28, 28, 28, NULL),
(nextval('SEQ_GOOD'), 29, 29, 29, NULL),
(nextval('SEQ_GOOD'), 30, 30, 30, NULL);


-- 쿠폰 테이블

INSERT INTO COUPON (COUPON_NO, COUPON_CONTENT, COUPON_EXPIRATION_PERIOD, LOCATION_NO, STATUS, COUNT)
VALUES 
(nextval('SEQ_CUPON'), 'Coupon Content1', 30, 1, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content2', 60, 2, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content3', 90, 3, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content4', 30, 4, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content5', 60, 5, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content6', 90, 6, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content7', 30, 7, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content8', 60, 8, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content9', 90, 9, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content10', 30, 10, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content11', 60, 11, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content12', 90, 12, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content13', 30, 13, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content14', 60, 14, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content15', 90, 15, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content16', 30, 16, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content17', 60, 17, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content18', 90, 18, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content19', 30, 19, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content20', 60, 20, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content21', 90, 21, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content22', 30, 22, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content23', 60, 23, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content24', 90, 24, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content25', 30, 25, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content26', 60, 26, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content27', 90, 27, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content28', 30, 28, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content29', 60, 29, TRUE, 1),
(nextval('SEQ_CUPON'), 'Coupon Content30', 90, 30, TRUE, 1);


--쿠폰 보유 테이블

INSERT INTO HAVING_COUPON (HAVING_COUPON_NO, STATUS, USER_NO, COUPON_NO, HAVING_EXPIRATION_PERIOD)
VALUES 
(nextval('SEQ_HACO'), FALSE, 1, 1, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 2, 2, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 3, 3, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 4, 4, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 5, 5, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 6, 6, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 7, 7, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 8, 8, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 9, 9, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 10, 10, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 11, 11, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 12, 12, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 13, 13, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 14, 14, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 15, 15, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 16, 16, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 17, 17, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 18, 18, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 19, 19, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 20, 20, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 21, 21, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 22, 22, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 23, 23, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 24, 24, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 25, 25, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 26, 26, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 27, 27, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 28, 28, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 29, 29, '2024-12-31'),
(nextval('SEQ_HACO'), FALSE, 30, 30, '2024-12-31');



-- 사진 테이블
select *From picture;

INSERT INTO PICTURE (PIC_NO, ORIGIN_NAME, CHANGE_NAME, FILE_PATH,FILE_LEVEL,LOCATION_NO, LOCATION_OPTION_NO, REVIEW_NO, USER_NO, PET_NO, BOARD_NO)
VALUES 
(nextval('SEQ_PIC'), 'mainImg.png', 'mainImg.png', 'resources/img/location/',1, 1, NULL, 1, 1, NULL, NULL),
(nextval('SEQ_PIC'), 'mainImg.png', 'detailImg1.png', 'resources/img/location/',1, 1, NULL, 2, 2, NULL, NULL),
(nextval('SEQ_PIC'), 'mainImg.png', 'detailImg2.png', 'resources/img/location/',1, 1, NULL, 3, 3, NULL, NULL),
(nextval('SEQ_PIC'), 'mainImg.png', 'detailImg3.png', 'resources/img/location/',1, 1, NULL, 4, 4, NULL, NULL),
(nextval('SEQ_PIC'), 'cafe.png', 'cafe.png', 'resources/img/location/',2, 1, NULL, 5, 5, NULL, NULL),
(nextval('SEQ_PIC'), 'detailImg1', 'detailImg1.png', 'resources/img/location/',2, 1, NULL, 6, 6, NULL, NULL),
(nextval('SEQ_PIC'), 'detailImg2', 'detailImg2.png', 'resources/img/location/',2, 1, NULL, 7, 7, NULL, NULL),
(nextval('SEQ_PIC'), 'detailImg3', 'detailImg3.png', 'resources/img/location/',2, 1, NULL, 8, 8, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin9', 'detailImg1.png', 'resources/img/location/',3, 1, NULL, 9, 9, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin10', 'detailImg2.png', 'resources/img/location/',3, 1, NULL, 10, 10, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin11', 'detailImg3.png', 'resources/img/location/',3, 1, NULL, 11, 11, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin12', 'cafe.png', 'resources/img/location/',3, 1, NULL, 12, 12, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin13', 'mainImg.png', 'resources/img/location/',1, 2, NULL, 13, 13, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin14', 'mainImg.png', 'resources/img/location/',1, 2, NULL, 14, 14, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin15', 'mainImg.png', 'resources/img/location/',1, 2, NULL, 15, 15, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin16', 'mainImg.png', 'resources/img/location/',1, 2, NULL, 16, 16, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin17', 'cafe.png', 'resources/img/location/',2, 2, NULL, 17, 17, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin18', 'detailImg1', 'resources/img/location/',2, 2, NULL, 18, 18, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin19', 'detailImg2', 'resources/img/location/',2, 2, NULL, 19, 19, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin20', 'detailImg3', 'resources/img/location/',2, 2, NULL, 20, 20, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin21', 'detailImg3', 'resources/img/location/',2, 2, NULL, 21, 21, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin22', 'Change22', 'resources/img/location/',3, 2, NULL, 22, 22, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin23', 'Change23', 'resources/img/location/',3, 2, NULL, 23, 23, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin24', 'Change24', 'resources/img/location/',3, 2, NULL, 24, 24, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin25', 'Change25', 'resources/img/location/',3, 2, NULL, 25, 25, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin26', 'Change26', 'resources/img/location/',1, 26, NULL, 26, 26, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin27', 'Change27', 'resources/img/location/',1, 27, NULL, 27, 27, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin28', 'Change28', 'resources/img/location/',1, 28, NULL, 28, 28, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin29', 'Change29', 'resources/img/location/',1, 29, NULL, 29, 29, NULL, NULL),
(nextval('SEQ_PIC'), 'Origin30', 'Change30', 'resources/img/location/',1, 30, NULL, 30, 30, NULL, NULL);


SELECT *FROM PICTURE ;
SELECT *FROM LOCATION;
SELECT *FROM LOCATION_OPTION;
select *from LOCATION_OPTION;


select *From review r left join owner_reply o on (r.review_no = o.review_no);

		