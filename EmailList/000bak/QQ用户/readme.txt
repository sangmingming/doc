
1,过程
->采集的数据用阿里助手到到customers表中；http://www.localaliarm.com/admin/admin!customer.action
->备份并清空customersunique；
->用sql导数据到customersunique；insert into customersunique select * from customers group by email 
-> 清空customers;
-> 用sql导数据到customers;  insert into customers select * from customersunique 
-> 这样customers表中无重复记录，可直接用；




customer表是采集的数据有重复记录；
customerunique是整理过的表，没重复记录；



/**
 * 客户名单(有重复email)
 * flag:
 * 0=采集到的客户 （准客户）
 * 1=退订过的客户 (黑名单)
 * 2=购买过的客户 (老客户)
 * 3=购买过多次的客户  (老老客户)
 */
create table customers(
id integer primary key auto_increment,
email varchar(255) not null,
name varchar(255),
address varchar(255),
phone integer ,
flag integer not null default 0,
sex integer not null default 0,/*0=女; 1=男;*/
age integer,
create_time timestamp not null default CURRENT_TIMESTAMP, /*创建时间*/
last_modify_time   DATETIME/*最后修改时间*/
);


/**
 * 客户名单(无重复email)
 * flag:
 * 0=采集到的客户 （准客户）
 * 1=退订过的客户 (黑名单)
 * 2=购买过的客户 (老客户)
 * 3=购买过多次的客户  (老老客户)
 */
create table customersunique(
id integer primary key auto_increment,
email varchar(255) not null,
name varchar(255),
address varchar(255),
phone integer ,
flag integer not null default 0,
sex integer not null default 0,/*0=女; 1=男;*/
age integer,
create_time timestamp not null default CURRENT_TIMESTAMP, /*创建时间*/
last_modify_time   DATETIME/*最后修改时间*/
);



