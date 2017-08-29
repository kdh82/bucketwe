create table tbl_member(
   userid varchar(50) not null,
   userpw varchar(50) not null,
   username varchar(50) not null,
   email varchar(100),
   regdate timestamp default now(),
   updatedate timestamp default now(),
   primary key(userid)   
);

INSERT INTO book_ex.tbl_member
(userid, userpw, username, email, regdate, updatedate)
values
('user01', 'user01', 'user01', 'user01@naver.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user02', 'user02', 'user02', 'user02@naver.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user03', 'user03', 'user03', 'user03@naver.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('user04', 'user04', 'user04', 'user04@naver.com', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


create table tbl_board(
   bno int not null AUTO_increment,
   title varchar(200) not null,
   content text null,
   writer varchar(50) not null,
   regdate timestamp not null default now(),
   viewcnt int default 0,
   primary key (bno)
);

alter table tbl_board add column replycnt int default 0;

-- tbl_board
update tbl_board set replycnt = (select count(rno) from tbl_reply where bno=tbl_board.bno);



insert into tbl_board (title, content, writer) (select title, content, writer from tbl_board);
select * from tbl_board;
select count(*) from tbl_board;


create table tbl_reply(
   rno int not null auto_increment,
   bno int not null default 0,
   replytext varchar(1000) not null,
   replyer varchar(50) not null,
   regdate timestamp not null default now(),
   updatedate timestamp not null default now(),
   primary key(rno)
);

-- tbl_reply에 키 제약조건 걸기
alter table tbl_reply add constraint fk_board
foreign key(bno) references tbl_board(bno);




-- 이미지 경로
create table tbl_attach(
	fullName varchar(150) not null,
	bno int not null,
	regdate timestamp default now(),
	primary key(fullName)
);

-- tbl_attach에 키 제약조건 걸기
alter table tbl_attach add constraint fk_board_attach
foreign key (bno) references tbl_board (bno);

CREATE TABLE project(
id int NOT NULL auto_increment primary key,
title VARCHAR(50) NOT NULL,
content text NOT NULL,
startDate DATE NOT NULL,
endDate Date NOT NULL,
state varchar(5) NOT NULL
);

