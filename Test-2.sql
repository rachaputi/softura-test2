
---1

select city,count(au_id) as No_of_Authors from authors group by city

--2
select distinct city,au_fname,au_lname from authors where city not in
(select city from publishers where pub_name = 'New Moon Books')


--3
create proc AuthorsNameAndPrice(@au_fname varchar(20),@au_lname varchar(40),@price money)
as 
begin
update titles set price = @price
select au_fname,au_lname,price from authors,titles where au_fname = @au_fname
end

--4
create function fun_Tax(@qty int)
returns float
as
begin
	declare
	@tax float,
	@qty1 int
	set @qty1 = (select qty from sales)
		if(@qty1 < 10)
			set @tax = 2
		else if((@qty1 >= 10) and (@qty1 < 20))
			set @tax = 5
		else if((@qty1 >= 20) and (@qty1 <30))
			set @tax = 6
		else
		   set @tax = 7.5
	return @tax
end

select qty,dbo.fun_Tax(20) 'tax' from sales
