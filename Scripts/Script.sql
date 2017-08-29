-- 게시판
CREATE TABLE bucketwe.board (
	bno        INT          NOT NULL, -- 게시글번호
	title      VARCHAR(100) NOT NULL, -- 게시글제목
	category   VARCHAR(10)  NOT NULL, -- 주제
	content    TEXT         NOT NULL, -- 게시글세부내용
	start_date DATE         NOT NULL, -- 시작날짜
	end_date   DATE         NOT NULL, -- 종료날짜
	breg_date  TIMESTAMP    NOT NULL DEFAULT now(), -- 게시판글날짜
	bcnt       INT          NOT NULL DEFAULT 0, -- 조회수
	reply_cnt  INT          NOT NULL DEFAULT 0, -- 댓글수
	id         VARCHAR(20)  NOT NULL  -- 아이디
);

-- 게시판
ALTER TABLE bucketwe.board
	ADD CONSTRAINT PK_board -- 게시판 기본키
		PRIMARY KEY (
			bno -- 게시글번호
		);

ALTER TABLE bucketwe.board
	MODIFY COLUMN bno INT NOT NULL AUTO_INCREMENT;

-- 댓글
CREATE TABLE bucketwe.reply (
	rno        INT          NOT NULL, -- 댓글
	reply_text VARCHAR(300) NOT NULL, -- 댓글내용
	rreg_date  TIMESTAMP    NOT NULL DEFAULT now(), -- 댓글날짜
	bno        INT          NOT NULL, -- 게시글번호
	id         VARCHAR(20)  NOT NULL  -- 아이디
);

-- 댓글
ALTER TABLE bucketwe.reply
	ADD CONSTRAINT PK_reply -- 댓글 기본키
		PRIMARY KEY (
			rno -- 댓글
		);

ALTER TABLE bucketwe.reply
	MODIFY COLUMN rno INT NOT NULL AUTO_INCREMENT;

-- 회원
CREATE TABLE bucketwe.bucuser (
	id    VARCHAR(20) NOT NULL, -- 아이디
	pw    VARCHAR(20) NOT NULL, -- 비밀번호
	name  VARCHAR(20) NOT NULL, -- 성명
	email VARCHAR(50) NOT NULL  -- e메일
);

-- 회원
ALTER TABLE bucketwe.bucuser
	ADD CONSTRAINT PK_bucuser -- 회원 기본키
		PRIMARY KEY (
			id -- 아이디
		);

-- 게시판사진
CREATE TABLE bucketwe.attach (
	fullName VARCHAR(200) NOT NULL, -- 파일
	bno      INT          NOT NULL, -- 게시글번호
	fregdate TIMESTAMP    NOT NULL DEFAULT now() -- 업로드날짜
);

ALTER TABLE bucketwe.attach
	ADD CONSTRAINT PK_attach -- 게시판사진 기본키
		PRIMARY KEY (
			fullName -- 파일
		);

-- 게시판
ALTER TABLE bucketwe.board
	ADD CONSTRAINT FK_bucuser_TO_board -- 회원 -> 게시판
		FOREIGN KEY (
			id -- 아이디
		)
		REFERENCES bucketwe.bucuser ( -- 회원
			id -- 아이디
		)
		ON DELETE CASCADE;

-- 댓글
ALTER TABLE bucketwe.reply
	ADD CONSTRAINT FK_board_TO_reply -- 게시판 -> 댓글
		FOREIGN KEY (
			bno -- 게시글번호
		)
		REFERENCES bucketwe.board ( -- 게시판
			bno -- 게시글번호
		)
		ON DELETE CASCADE;

-- 댓글
ALTER TABLE bucketwe.reply
	ADD CONSTRAINT FK_bucuser_TO_reply -- 회원 -> 댓글
		FOREIGN KEY (
			id -- 아이디
		)
		REFERENCES bucketwe.bucuser ( -- 회원
			id -- 아이디
		);

-- 게시판사진
ALTER TABLE bucketwe.attach
	ADD CONSTRAINT FK_board_TO_attach -- 게시판 -> 게시판사진
		FOREIGN KEY (
			bno -- 게시글번호
		)
		REFERENCES bucketwe.board ( -- 게시판
			bno -- 게시글번호
		)
		ON DELETE CASCADE;
		
select * from bucuser;	

--
--

-- 메시지
CREATE TABLE bucketwe.message (
	mno      INT          NOT NULL, -- 메시지번호
	targetid VARCHAR(20)  NOT NULL, -- 수신자
	sender   VARCHAR(20)  NOT NULL, -- 발신자
	message  VARCHAR(300) NOT NULL, -- 메시지내용
	senddate TIMESTAMP    NOT NULL DEFAULT now(), -- 발송일자
	/*id       VARCHAR(20)  NOT NULL,  -- 사용자아이디*/
	primary key(mno)
);

ALTER TABLE bucketwe.message
	MODIFY COLUMN mno INT NOT NULL AUTO_INCREMENT;

-- 메시지
ALTER TABLE bucketwe.message
	ADD CONSTRAINT FK_usertarget -- 회원 -> 수신자
		FOREIGN KEY (
			targetid -- 수신자
		)
		REFERENCES bucketwe.bucuser ( -- 회원
			id -- 아이디
		)
		ON DELETE CASCADE;

-- 메시지
ALTER TABLE bucketwe.message
	ADD CONSTRAINT FK_usersender -- 회원 -> 발신자
		FOREIGN KEY (
			sender -- 발신자
		)
		REFERENCES bucketwe.bucuser ( -- 회원
			id -- 아이디
		)
		ON DELETE CASCADE;

INSERT INTO bucketwe.message
(targetid, sender, message)
VALUES('user04', 'user01', '안녕하세요');

insert into message (targetid, sender, message) values('user01', 'user03', '우리 같이해요'),
('user04', 'user02', '우리 같이해요'),
('user01', 'user04', '우리 같이해요'),
('user04', 'user01', '우리 같이해요'),
('user02', 'user03', '우리 같이해요');

SELECT *
FROM message where targetid;

select * from message where sender='user01';	

select * from message where sender='user01' and targetid='user02';

select sender, message, senddate from message where targetid='user04';
		
INSERT INTO bucuser(id, pw, name, email) VALUES('user01', '1111', '김성환', 'aaa@gmail.com'),
('user02', '1111', '신진욱', 'aaa@gmail.com'),
('user03', '1111', '조시은', 'aaa@gmail.com'),
('user04', '1111', '황인영', 'aaa@gmail.com');

INSERT INTO board
(title, category, content, start_date, end_date, bcnt, reply_cnt, id)
VALUES('오카리나를 다루기', '음악', '1. 기본음 구역대를 모두 익히기.
2. 동요 학보를 하나 구하여서 능숙하게 다루기 까지 반복하기.', current_date, current_date, 0, 0, 'user01'),
('직접 소설을 써보기', '작문','1. 어떤 장르가 있는지 참고하여 써보고 싶은 장르가 나오는 책을 읽어보기.
2. 먼저 소설 줄거리 전체를 기획한 다음 단편으로 만들어보기.', current_date, current_date, 0, 0, 'user02'),
('수영을 배우기', '스포츠','1. 호흡법을 다루고 기본기에 적응하기.
2. 자유형으로 50m를 완주하기.
3. 배영, 접영 등 다른 수영법을 익히기.', current_date, current_date, 0, 0, 'user03'),
('가볍게 조깅하기', '운동', '1. 매일 꾸준히 시간을 10분이상 정하여 하기.
2. 일주일에 한번은 쉬도록 하되 보름이상 하여 얼마나 심폐기능이 좋아졌는지 분석하기.', current_date, current_date, 0, 0, 'user04'),
('새로운 언어를 배우기', '학습','1. 나중에 여행하거나 필요하다고 생각되는 나라에 언어를 배워보기.
2. 일상생활이 가능한 정도로 까지 학습을 하고 익숙해지면 직접 응용해보기.', current_date, current_date, 0, 0, 'user01'),
('식물을 직접 재배하기', '힐링','1. 직접 화분이나 땅에 먹고싶은 식물을 심어서 키우기.
2. 식물이 자라서 열매를 맺으면 그것을 가지고 요리를 해 먹기.', current_date, current_date, 0, 0, 'user01'),
('인테리어', '디자인','1. 집에 가구나 인테리어 용품에 위치를 바꾸거나 넣어보기.
2. 벽지를 바꾸거나 페인트 칠을 하기', current_date, current_date, 0, 0, 'user02'),
('상어밥주기', '동물사랑','1. 동물원을 방문하여 직접 부탁하여 해보기.
2. 실패한다면 어느정도가 되어야 가능한지 방법을 따로 알아보고 실행하기.', current_date, current_date, 0, 0, 'user02'),
('슬롯머신', '재산탕진','1. 라스베이거스를 방문하여 잭팟 금액이 제일 높은 슬롯머신을 찾아 당겨보기.
2. 너무 소비하지 않게 일정금액을 정하여 판돈을 걸고 판돈이 소진 되면 더 이상 하지 않기.', current_date, current_date, 0, 0, 'user02'),
('그랜드캐년', '여행','1. 각 스팟을 방문하여 한국 깃발을 흔들고 나는 자연인이다 라고 외치기.
2. 일정을 길게 잡을 거 같은 경우 미리 하이킹을 예약하여 하이킹을 하기.', current_date, current_date, 0, 0, 'user02'),
('스카이 다이빙', '익스트림스포츠','1. 기한에 정함은 없고 만 60이 되기전에 실행함.', current_date, current_date, 0, 0, 'user04');

select count(*) from board;

select * from board order by bno desc limit 1; -- 마지막인덱스로

INSERT INTO board
(title, category, content, start_date, end_date, bcnt, reply_cnt, id)
(select title, category, content, start_date, end_date, bcnt, reply_cnt, id from board);

UPDATE board
SET title='1', content='1', start_date=current_date, end_date=current_date, id='user01'
WHERE bno=256;

select * from attach;

INSERT INTO attach
(fname, bno, freg_date)
VALUES('c:/zzz/upload', 2, CURRENT_TIMESTAMP);

delete from board where bno=255;

DELETE FROM  board
WHERE bno=0;

INSERT INTO bucketwe.reply
(reply_text, rreg_date, bno, id)
VALUES('수고하십니다', CURRENT_TIMESTAMP, 823, 'user03');

select bno, bcnt, category, title,(select count(*)+1 from board where bcnt > buc.bcnt) as rank from board as buc order by rank limit 0, 10; -- 조회수 랭킹

select bno, reply_cnt, category, title,(select count(*)+1 from board where reply_cnt > buc.reply_cnt) as rank from board as buc order by rank limit 0, 10; -- 댓글수 랭킹 

UPDATE bucketwe.board
SET reply_cnt=0
WHERE bno=199;

UPDATE bucketwe.bucuser SET pw='admin', name='블랙마운틴', email='aaa@gmail.com' WHERE id='admin';


select id from bucuser;

UPDATE bucketwe.bucuser
SET pw='admin', name='관리자', email='aaa@gmail.com'
WHERE id='admin';
