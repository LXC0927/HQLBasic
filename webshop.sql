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

INSERT INTO commodity VALUES ('��ʽͯװ',120,'��','ͯװ','��ʽͯװ',1);
INSERT INTO commodity VALUES ('Ůʿ��װ',200,'��','Ůװ','Ůʿְҵ��װ',1);
INSERT INTO commodity VALUES ('��ʿ����',200,'��','��װ','��ʿ������װ',1);
INSERT INTO commodity VALUES ('�ʼǱ�����',4000,'̨','����','˫�˱ʼǱ�����',2);
INSERT INTO commodity VALUES ('�ƶ�Ӳ��',400,'��','�����ܱ�','1t�ƶ�Ӳ��',2);
INSERT INTO commodity VALUES ('Һ������',5000,'̨','����','4k����Һ������',3);
INSERT INTO commodity VALUES ('��Ͳϴ�»�',4000,'̨','ϴ�»�','��Ͳϴ�»�',3);
INSERT INTO commodity VALUES ('��hibernate��̡�',30,'��','ʵ����','����hibernate���',4);
INSERT INTO commodity VALUES ('��Java���ġ�',50,'��','ʵ����','����Java��̺���',4);
INSERT INTO commodity VALUES ('�����������',40,'��','������','����ƻ�С˵',4);
INSERT INTO commodity VALUES ('����',30,'��','�����ܱ�','16G����',2);

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

INSERT INTO customer VALUES ('����','13800000000','�й��Ϻ�����������·','13800000000@138.com','��','�Ȱ���̵ĳ���Ա',25,'1990-01-01');
INSERT INTO customer VALUES ('����','13888888888','�й���������������·','13888888888@138.com','Ů','�ᰮ�����İ���',20,'1995-02-21');
INSERT INTO customer VALUES ('����','15888888888','�й����ڡ���������·','15888888888@158.com','��','����һ������ʲôҲû������',35,'1980-04-14');
INSERT INTO customer VALUES ('����','13900000000',NULL,NULL,'��',NULL,40,'1975-01-01');

CREATE TABLE orderform (
  id int NOT NULL identity,
  customer int DEFAULT NULL,
  tradedate date DEFAULT NULL,
  status varchar(10) DEFAULT NULL,
  amount numeric(11,2) DEFAULT NULL,
  PRIMARY KEY (id)
);
alter table	orderform add constraint fk_orderform_customer foreign key (customer) references customer(id);

INSERT INTO orderform VALUES (1,'2015-04-30','���ջ�',4400);
INSERT INTO orderform VALUES (2,'2015-05-11','�ѷ���',520);
INSERT INTO orderform VALUES (3,'2015-05-13','�Ѹ���',9120);

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

INSERT INTO seller VALUES ('A��װ��','13000000000','�й�����������','www.a.com',5,'��Ӫ��ʽ��װ');
INSERT INTO seller VALUES ('B�����','15800000000','�й��㽭�����С�����','www.b.com',4,'��Ӫ����������Ӳ�Ʒ');
INSERT INTO seller VALUES ('C������','13012341234','�й��㶫�����С�����','www.c.com',4,'��Ӫ����ҵ�');
INSERT INTO seller VALUES ('D���','18600000000','�й����������С�����','www.d.com',5,'��Ӫ����ʵ�����������');