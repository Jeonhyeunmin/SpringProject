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

create table category(
	cateCode int not null auto_increment,
  category varchar(50) not null,
    
  primary key (cateCode)
);

create table mainCategory(
	mainCateCode int not null auto_increment,
  mainCategory varchar(50) not null,
  category varchar(50) not null,
    
    
  primary key (mainCateCode)
);

create table subCategory(
	subCateCode int not null auto_increment,
	subCategory varchar(50) not null,
	mainCategory varchar(50) not null,


	primary key (subCateCode)
);

create table shopReview(
  idx  int not null auto_increment,	/* 리뷰 고유번호 */
  shopIdx int not null,							/* 해당 분야의 고유번호 */
  mid  varchar(30) not null,				/* 리뷰 올린이 아이디 */
  content  text,										/* 리뷰 내용 */
  star int not null default 0,			/* 별점 부여 점수 */
  reviewDate datetime default now(),/* 리뷰 작성일 */
  good int not null default 0,
  claim varchar(3) not null default 'NO',
  
  primary key(idx),
  foreign key(mid) references customer(mid)
);

create table reviewLikes(
	idx int not null auto_increment,
	shopIdx int not null,
	reviewIdx int not null,
	customer varchar(30) not null,
	
	primary key(idx),
  foreign key(reviewIdx) references shopReview(idx),
  foreign key(shopIdx) references shop(idx)
);

create table reviewLikes(
	idx int not null auto_increment,
	shopIdx int not null,
	reviewIdx int not null,
	customer varchar(30) not null,
	
	primary key(idx),
  foreign key(reviewIdx) references shopReview(idx),
  foreign key(shopIdx) references shop(idx)
);

drop table reviewLikes;


select * from reviewLikes;
select * from shop;

desc shop;

/* 장바구니 테이블 */
create table shopCart (
  idx   int not null auto_increment,
  mid		varchar(20) not null,						/* 장바구니를 사용한 사용자의 아이디 - 로그인한 회원 아이디 */
  shopIdx 	int not null,							/* 장바구니에 담은 상품의 고유번호 */
  thumbnail		varchar(100) not null,		/* 서버에 저장된 상품의 메인 이미지 */
  shopTitle varchar(50) not null,			/* 장바구니에 담은 상품명 */
  optionSelect	varchar(100)  not null,		/* 옵션명 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  quantity		int					  not null,		/* 옵션수량 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  totalPrice	int not null,							/* 구매한 모든 항목(상품+옵션)에 따른 총 가격 */  
  cartDate datetime default now() not null,	/* 장바구니에 상품을 담은 날짜 */
  primary key(idx),
  foreign key(mid) references customer(mid) on update cascade on delete cascade
);

create table shopOrder (
  idx   int not null auto_increment,
  shopIdx 	int not null,							/* 주문한 상품의 고유번호 */
  mid		varchar(30) not null,						/* 주문한 사용자의 아이디 - 로그인한 회원 아이디 */
  shopTitle varchar(50) not null,			/* 주문한 상품명 */
  price		int not null,							/* 메인상품의 기본 가격 */
  quantity		varchar(50)  not null,		/* 옵션수량 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  couponIdx		int not null,
  coupon			int						not null default 0,
  couponDiscount int not null default 0,
  discount					int             default 0,                       /*   할인금액   */
  totalPrice	int not null,							/* 구매한 모든 항목(상품+옵션)에 따른 총 가격 */  
  thumbnail		varchar(100) not null,		/* 서버에 저장된 상품의 메인 이미지 */
  optionSelect	varchar(100)  not null,		/* 옵션명 리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  orderDate   datetime default now() not null, /* 실제 주문한 날짜 */
  primary key(idx),
  foreign key(mid) references customer(mid) on update cascade on delete cascade,
  foreign key(shopIdx) references shop(idx) on update cascade on delete restrict
);

drop table shopOrder;

