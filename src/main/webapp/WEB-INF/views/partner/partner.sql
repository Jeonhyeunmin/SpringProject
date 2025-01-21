create table partner(
  idx         	 int             not null auto_increment,        
  logo        	 varchar(300)    default 'noimage.png',          
  mid         	 varchar(30)     not null,                       
  pwd         	 varchar(100)    not null,                       
  company     	 varchar(30),                                    
  ceoName     	 varchar(30)     not null,                       
  businessNumber varchar(30)     not null,                       
  email       	 varchar(60)     not null,                       
  tel         	 varchar(15),                                    
  address     	 varchar(100),                                   
  level       	 int							,                              
  startDay     	 datetime        default now(),                  
  lastDate    	 datetime        default now(),                  
  accept				 varchar(3)			 default 'NO',	
  
  primary key(idx),
  unique key(mid)
);

drop table partner;