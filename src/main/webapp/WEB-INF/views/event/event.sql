create table event(
	idx int not null auto_increment,
	title varchar(20) not null,
	subTitle varchar(20) not null,
	couponName varchar(100) not null,
	content varchar(300) not null,
	discount int not null,
	saleUnit varchar(10) not null default '%',
	startDate datetime not null,
	endDate datetime not null,
	uploadDate datetime default now(),
	
	primary key(idx)
);

create table coupon(
	idx int not null auto_increment,
	eventIdx int not null,
	mid varchar(30) not null,
	couponName varchar(100) not null,
	discount int not null,
	saleUnit varchar(10) not null default '%',
	startDate datetime not null,
	endDate datetime not null,
	status varchar(10) not null default 'active',
	createDate datetime default now() not null,
	useDate datetime,
	
	primary key(idx)
);

drop table coupon;