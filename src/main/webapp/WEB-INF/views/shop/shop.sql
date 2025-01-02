create table shop(
	idx								int             not null auto_increment,         /*  업체 고유번호 */
  mid								varchar(30)     not null,                        /*   업체 아이디(중복불허) */
  company						varchar(30)     not null,                        /*   업체명(중복불허/수정가능) */
  category					varchar(30),                                     /*   카테고리(소파, 테이블)   */   
  mainCategory			varchar(30),                                     /*   카테고리(소파, 테이블)   */   
  subCategory				varchar(30),                                     /*   카테고리(소파, 테이블)   */   
  title							varchar(100)    not null,                        /* 상품명 */
  discount					int             default 0,                       /*   할인금액   */
  price							int             default 0,                       /*   원가격   */
  thumbnail				  varchar(100)    default 'noimage.jpg',           /* 썸네일 사진 */
  titleImg					varchar(100)    default 'noimage.jpg',           /* 타이틀 사진 */
  content						varchar(500)    default 'noimage.jpg',           /* 내용 */
  fSize      				int             not null,                        /* 업로드파일의 총 사이즈 */
  claim       			char(2)         default 'NO',                    /*   신고글   */
  wDate       			datetime        default now(),                   /*   올린 날   */
   
   primary key(idx),
   foreign key(mid) references partner(mid)
);

select * from shop;

desc shop;

