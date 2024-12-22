create table customer (
  idx     	int not null auto_increment,	/* 회원 고유번호 */
  mid				varchar(30)  not null,				/* 회원 아이디(중복불허) */
  pwd				varchar(100) not null,				/* 회원 비밀번호(SHA256 암호화처리) */
  name			varchar(30)  not null,				/* 회원 성명(중복허용) */
  gender		char(2)	not null default '여자',	/* 회원 성별 */
  birthday	datetime default now(),					/* 회원 생일 */
  tel				varchar(15),								/* 전화번호 : 010-1234-5678 */
  address		varchar(100),								/* 주소(우편번호:다음 API 활용) */
  email			varchar(60) not null,				/* 이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
  photo			varchar(100) default 'noimage.jpg',	/* 회원 사진 */
  level     int default	1,							/* 회원 등급(1:일반회원, 2:업체, 99:관리자*/
  userInfor char(3) default '공개',				/* 회원의 정보 공개유무(공개/비공개) */
  userDel		char(2) default 'NO',				/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  point			int default 100,						/* 회원 누적포인트(최초가입포인트는 100, 1회방문시 10포인트증가, 1일 최대 50포인트까지 허용, 물건구매시 100원당 1포인트 증가) */
  startDate datetime default now(),			/* 최초 가입일 */
  lastDate  datetime default now(),			/* 마지막 접속일(탈퇴시는 탈퇴한 날짜) */
  primary key(idx),
  unique key(mid)
);