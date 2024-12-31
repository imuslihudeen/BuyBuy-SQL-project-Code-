create database BuyBuy_company
create schema Manager

create table Manager.sales_data
(sales_date date,
sales_year varchar,
sales_months varchar,
cus_id varchar,
cus_age int,
cus_gender varchar,
cus_country text,
cus_state text,
prod_category varchar,
prod_subcategory varchar,
product varchar,
ord_quantity int,
unit_cost int,
unit_price int,
cost int,
revenue int)

------Preparatory codes-------
select * from Manager.sales_data
drop table Manager.sales_data

alter table Manager.sales_data
add profit int

update Manager.sales_data
set profit = (revenue-cost)

------1.Time profit_Analysis------
-----Question a------
-----Code--------
select sum(profit) from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
or 
select sum(profit) totalprofitinsixyears from Manager.sales_data
-----Question b------
-----Code--------
select sales_year,sum(profit) from Manager.sales_data
where sales_months in('Apr','May','Jun') and sales_year in('2011','2012','2013','2014','2015','2016')
group by sales_year
or 
select sales_year, sum(profit) totalprofitinsixyears from Manager.sales_data
where sales_months in('Apr','May','Jun')
group by sales_year

-----Question c------
-----Code--------
select sales_year, sum(profit) from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
group by sales_year
order by sum(profit)
or
select sales_year, sum(profit)annualprofitinsixyears from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
group by sales_year
order by sum(profit)

------ 2.Regional Profit analysis------
-----Question a------
-----Code--------
select cus_country, sum(profit) from Manager.sales_data
group by cus_country

-----Question b------
-----Code--------
select cus_country, sum(profit) from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
group by cus_country
order by sum(profit) desc
limit 3

-----Question c------
-----Code--------
select cus_country, sum(profit) from Manager.sales_data
where sales_year in ('2011','2012','2013','2014','2015','2016')
group by cus_country
order by sum(profit) asc
limit 3

------3.product revenue analysis-------
------Question a-----
------code-------
select prod_category, sum(revenue) from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
group by prod_category
order by sum(revenue) asc

------Question b-----
------code-------
select prod_category, sum(profit) from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
group by prod_category
order by sum(profit) desc
limit 2
------Question c-----
------code-------
select product, sum(profit) from Manager.sales_data
where sales_year in('2011','2012','2013','2014','2015','2016')
group by product
order by sum(profit) desc
limit 10