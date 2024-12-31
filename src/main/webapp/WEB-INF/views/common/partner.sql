create table partner(
  idx         	 int             not null auto_increment,         /*   회원/업체 고유번호 */
  logo        	 varchar(300)    default 'noimage.png',           /*   업체 로고 */
  mid         	 varchar(30)     not null,                        /*   회원/압체 아이디(중복불허) */
  pwd         	 varchar(100)    not null,                        /*   회원/업체 비밀번호(SHA256 암호화처리) */
  company     	 varchar(30),                                     /*   업체명(개인은 null)	*/
  ceoName     	 varchar(30)     not null,                        /*   회원성명/대표자명(중복허용) */
  businessNumber varchar(30)     not null,                        /*   주민등록번호 (사업자번호)   */
  email       	 varchar(60)     not null,                        /*   이메일(아이디/비밀번호 분실시에 사용) - 형식체크필수 */
  tel         	 varchar(15),                                     /*   전화번호 : 010-1234-5678 */
  address     	 varchar(100),                                    /*   주소(우편번호:다음 API 활용) */
  userInfor			 varchar(300),
  level       	 int							,                                             /*   회원 등급(0:관리자, 1:개인, 2:인테리어업체 3:가구업체) */
  userDel     	 char(2)         default 'NO',                    /*   회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  joinDay     	 datetime        default now(),                   /*   최초 가입일 */
  lastDate    	 datetime        default now(),                   /*   마지막 접속일(탈퇴시는 탈퇴한 날짜) */
  
  primary key(idx),
  unique key(mid)
);

drop table partner;