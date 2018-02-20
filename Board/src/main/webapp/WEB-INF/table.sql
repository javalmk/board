-- 게시판 테이블
CREATE TABLE board(
	num NUMBER PRIMARY KEY, -- 번호
	writer VARCHAR2(50), -- 작성자
	title VARCHAR(100), -- 제목
	content CLOB,
	regdate DATE,
	viewcount NUMBER
	);

CREATE SEQUENCE board_seq;