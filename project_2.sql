 /*                          Design a store database

Create your own store! Your store should sell one type of things, like clothing or bikes,
 whatever you want your store to specialize in. You should have a table for all the items
  in your store, and at least 5 columns for the kind of data you think you'd need to store. 
  You should sell at least 15 items, and use select statements to order your items by price
   and show at least one statistic about the items.*/
drop table store;
create table if not exists store(
    id int primary key AUTO_INCREMENT,
    name varchar(20),
    price int,
    stock int 
);
select * from store;

insert into store (name,price,stock) values('lo',3,0);
insert into store (name,price,stock) values('t',377,1);
insert into store (name,price,stock) values('peo',3550,3);
insert into store (name,price,stock) values('lod',3000,53);
insert into store (name,price,stock) values('lo2',330,93);
insert into store (name,price,stock) values('loe',300,83);
insert into store (name,price,stock) values('ld3o',100,33);

select * from store;

select name ,price
from store
where price>200 ;

select * from store;

select AVG(price) from store;


select stock 
from store 
where id=5;


update store
set price = 399
where id=1;

update store 
set stock = 44
where name ='lo';


select * from store;
