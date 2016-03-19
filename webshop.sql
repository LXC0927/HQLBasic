CREATE DATABASE webshop;
USE webshop;

IF EXISTS (select * from commodity)
	DROP TABLE commodity;
CREATE TABLE commodity (
  id int NOT NULL identity,
  name varchar(100) DEFAULT NULL,
  price numeric(11,2) DEFAULT NULL,
  unit varchar(50) DEFAULT NULL,
  category varchar(100) DEFAULT NULL,
  description varchar(1000) DEFAULT NULL,
  seller int DEFAULT NULL,
  PRIMARY KEY (id)
);
alter table commodity add constraint fk_commodity_seller foreign key (seller) references seller(id);

INSERT INTO commodity VALUES ('中式童装',120,'套','童装','中式童装',1);
INSERT INTO commodity VALUES ('女士套装',200,'套','女装','女士职业套装',1);
INSERT INTO commodity VALUES ('男士西服',200,'套','男装','男士西服套装',1);
INSERT INTO commodity VALUES ('笔记本电脑',4000,'台','电脑','双核笔记本电脑',2);
INSERT INTO commodity VALUES ('移动硬盘',400,'块','电脑周边','1t移动硬盘',2);
INSERT INTO commodity VALUES ('液晶电视',5000,'台','电视','4k高清液晶电视',3);
INSERT INTO commodity VALUES ('滚筒洗衣机',4000,'台','洗衣机','滚筒洗衣机',3);
INSERT INTO commodity VALUES ('《hibernate编程》',30,'本','实体书','介绍hibernate编程',4);
INSERT INTO commodity VALUES ('《Java核心》',50,'本','实体书','介绍Java编程核心',4);
INSERT INTO commodity VALUES ('《海底两万里》',40,'本','电子书','经典科幻小说',4);
INSERT INTO commodity VALUES ('优盘',30,'个','电脑周边','16G优盘',2);

CREATE TABLE customer (
  id int NOT NULL identity,
  name varchar(100) DEFAULT NULL,
  tel varchar(50) DEFAULT NULL,
  address varchar(1000) DEFAULT NULL,
  email varchar(300) DEFAULT NULL,
  sex varchar(30) DEFAULT NULL,
  description varchar(4000) DEFAULT NULL,
  age int DEFAULT NULL,
  birthday date DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO customer VALUES ('张三','13800000000','中国上海××区××路','13800000000@138.com','男','热爱编程的程序员',25,'1990-01-01');
INSERT INTO customer VALUES ('李四','13888888888','中国北京××区××路','13888888888@138.com','女','酷爱网购的白领',20,'1995-02-21');
INSERT INTO customer VALUES ('王五','15888888888','中国深圳××区××路','15888888888@158.com','男','这个家伙很懒，什么也没有留下',35,'1980-04-14');
INSERT INTO customer VALUES ('赵六','13900000000',NULL,NULL,'男',NULL,40,'1975-01-01');

CREATE TABLE orderform (
  id int NOT NULL identity,
  customer int DEFAULT NULL,
  tradedate date DEFAULT NULL,
  status varchar(10) DEFAULT NULL,
  amount numeric(11,2) DEFAULT NULL,
  PRIMARY KEY (id)
);
alter table	orderform add constraint fk_orderform_customer foreign key (customer) references customer(id);

INSERT INTO orderform VALUES (1,'2015-04-30','已收货',4400);
INSERT INTO orderform VALUES (2,'2015-05-11','已发货',520);
INSERT INTO orderform VALUES (3,'2015-05-13','已付款',9120);

CREATE TABLE orderitem (
  id int NOT NULL identity,
  ORDERID int DEFAULT NULL,
  COMMODITY int DEFAULT NULL,
  DISCOUNT numeric(11,2) DEFAULT NULL,
  ACTPRICE numeric(11,2) DEFAULT NULL,
  AMOUNT numeric(11,2) DEFAULT NULL,
  PRIMARY KEY (id)
);
alter table	orderitem add constraint fk_orderitem_ORDERID foreign key (ORDERID) references orderform(id);
alter table	orderitem add constraint fk_orderitem_COMMODITY foreign key (COMMODITY) references commodity(id);

INSERT INTO orderitem VALUES (1,4,1,4000,1);
INSERT INTO orderitem VALUES (1,5,1,400,1);
INSERT INTO orderitem VALUES (2,1,1,120,1);
INSERT INTO orderitem VALUES (2,2,1,200,1);
INSERT INTO orderitem VALUES (2,3,1,200,1);
INSERT INTO orderitem VALUES (3,6,1,5000,1);
INSERT INTO orderitem VALUES (3,7,1,4000,1);
INSERT INTO orderitem VALUES (3,8,1,30,1);
INSERT INTO orderitem VALUES (3,9,1,50,1);
INSERT INTO orderitem VALUES (3,10,1,40,1);

CREATE TABLE seller (
  id int NOT NULL identity,
  name varchar(100) DEFAULT NULL,
  tel varchar(1000) DEFAULT NULL,
  address varchar(2000) DEFAULT NULL,
  website varchar(500) DEFAULT NULL,
  star int DEFAULT NULL,
  business varchar(2000) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO seller VALUES ('A服装店','13000000000','中国北京××区','www.a.com',5,'经营各式服装');
INSERT INTO seller VALUES ('B数码店','15800000000','中国浙江杭州市××区','www.b.com',4,'经营各类数码电子产品');
INSERT INTO seller VALUES ('C电器店','13012341234','中国广东深圳市××区','www.c.com',4,'经营各类家电');
INSERT INTO seller VALUES ('D书店','18600000000','中国陕西西安市××区','www.d.com',5,'经营各类实体书与电子书');