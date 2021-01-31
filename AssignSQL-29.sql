use WFADotNet
create table TblCustomer5
(
CustomerID varchar(30) not null primary key ,
Name varchar(20),
DOB date ,
city varchar(20)
)

create table TblCustomer2
(
CustomerID varchar(30) not null primary key ,
Name varchar(20),
DOB date ,
city varchar(20)
)


insert into TblCustomer5 values ('123456', 'David Letterman', '04-Apr-1949', 'Hartford'); 
insert into tblCustomer5 values ('123457', 'Barry Sanders', '12-Dec-1967','Detroit'); 
insert into tblCustomer5 values ('123458', 'Jean-Luc Picard', '9-Sep-1940', 'San Francisco'); 
insert into tblCustomer5 values ('123459', 'Jerry Seinfeld', '23-Nov-1965','New York City'); 
insert into tblCustomer5 values ('123460', 'Fox Mulder', '05-Nov-1962', 'Langley'); 
insert into tblCustomer5 values ('123461', 'Bruce Springsteen', '29-Dec-1960','Camden'); 
insert into tblCustomer5 values ('123462', 'Barry Sanders', '05-Aug-1974','Martha''s Vineyard'); 
insert into tblCustomer5 values ('123463', 'Benjamin Sisko', '23-Nov-1955','San Francisco'); 
insert into tblCustomer5 values ('123464', 'Barry Sanders', '19-Mar-1966','Langley'); 
insert into tblCustomer5 values ('123465', 'Martha Vineyard', '19-Mar-1963','Martha''s Vineyard'); 

select * from TblCustomer5


create table TblAccountType5 (TypeCode int primary key, TypeDesc varchar(30)) 
 
 insert into tblAccountType5 values (1, 'Checking'); 

insert into tblAccountType5 values (2, 'Saving'); 

insert into tblAccountType5 values (3, 'Money Market'); 

insert into tblAccountType5 values (4, 'Super Checking'); 




create table TblAccount5
(
CustomerID varchar(30) FOREIGN KEY REFERENCES TblCustomer5(CustomerID) ,
AccountNumber varchar(20) not null primary key , 
AccountTypeCode  int FOREIGN KEY REFERENCES TblAccountType5(TypeCode),
 DateOpened date default getdate(),
 Balance float
 ) 

 insert into tblAccount5 values ('123456', '123456-1', 1, '04-Apr-1993', 2200.33); 

insert into tblAccount5 values ('123456', '123456-2', 2, '04-Apr-1993', 12200.99); 

insert into tblAccount5 values ('123457', '123457-1', 3, '01-JAN-1998', 50000.00); 

insert into tblAccount5 values ('123458', '123458-1', 1, '19-FEB-1991', 9203.56); 

insert into tblAccount5 values ('123459', '123459-1', 1, '09-SEP-1990', 9999.99); 

insert into tblAccount5 values ('123459', '123459-2', 1, '12-MAR-1992', 5300.33); 

insert into tblAccount5 values ('123459', '123459-3', 2, '12-MAR-1992', 17900.42); 

insert into tblAccount5 values ('123459', '123459-4', 3, '09-SEP-1998', 500000.00); 

 

insert into tblAccount5 values ('123460', '123460-1', 1, '12-OCT-1997', 510.12); 

insert into tblAccount5 values ('123460', '123460-2', 2, '12-OCT-1997', 3412.33); 

 

insert into tblAccount5 values ('123461', '123461-1', 1, '09-MAY-1978', 1000.33); 

insert into tblAccount5 values ('123461', '123461-2', 2, '09-MAY-1978', 32890.33); 

insert into tblAccount5 values ('123461', '123461-3', 3, '13-JUN-1981', 51340.67); 

 

insert into tblAccount5 values ('123462', '123462-1', 1, '23-JUL-1981', 340.67); 

insert into tblAccount5 values ('123462', '123462-2', 2, '23-JUL-1981', 5340.67); 

 

insert into tblAccount5 values ('123463', '123463-1', 1, '1-MAY-1998', 513.90); 

insert into tblAccount5 values ('123463', '123463-2', 2, '1-MAY-1998', 1538.90); 

 

insert into tblAccount5 values ('123464', '123464-1', 1, '19-AUG-1994', 1533.47); 

insert into tblAccount5 values ('123464', '123464-2', 2, '19-AUG-1994', 8456.47); 


select * from TblCustomer5
select * from TblAccountType5
 select * from TblAccount5


 -- 1. Print customer id and balance of customers who have at least $5000 in any of their accounts.

select c.CustomerId, acc.Balance
from TblCustomer5 c join TblAccount5 acc
on c.CustomerID=acc.CustomerID
where Balance <= 5000.0

 --2.Print names of customers whose names begin with a ‘B’.  
 select * from
 TblCustomer5
 where Name Like 'B%'

 --3 Print all the cities where the customers of this bank live.  
 Select City
from TblCustomer5
			
--4.use IN [and NOT IN] clauses to list customers who live in [and don’t live in] San Francisco or Hartford. 
			
select Name,City
from TblCustomer5 
where City Not IN('Hartford','San Francisco')

--5.Show name and city of customers whose names contain the letter 'r' and who live in Langley. 
select Name ,City
from TblCustomer5 
where Name like '%r%' AND City='Langley'

--6.How many account types does the bank provide? 
select count(TypeDesc) as TotAccountType
from TblAccountType5

--7.Show a list of accounts and their balance for account numbers that end in '-1' 
			
			select AccountNumber,Balance
			from TblAccount5 
			where AccountNumber like '%-1'

			select acc.AccountNumber, acctype.TypeDesc,acc.Balance
			from TblAccountType5 acctype join TblAccount5 acc
			on acctype.TypeCode=acc.AccountTypeCode
			where AccountNumber like '%-1'

 --7 Show a list of accounts and their balance for accounts opened on or after July 1, 1990.  --
 SELECT *
FROM TblAccount5
WHERE  DateOpened >('1991-1-1');
 

--8 If all the customers decided to withdraw their money, how much cash would the bank need?
select sum(balance) as totalAmount
			from TblAccount5


--10.List account number(s) and balance in accounts held by ‘David Letterman’. . 
select AccountNumber,Balance
from TblAccount5 acc join TblCustomer5 cst
on acc.CustomerID=cst.CustomerID
where cst.Name='David Letterman'

--11.List the name of the customer who has the largest balance (in any account). 
select  tc.Name,MAX(act.Balance) as HighestBalance
from TblCustomer5 tc inner join TblAccount5 act
on tc.CustomerID=act.CustomerID group by tc.name 



--12.List customers who have a ‘Money Market’ account. 
select cst.Name
from TblCustomer5 cst inner join TblAccount5 acc on  cst.CustomerID=acc.CustomerID 
join TblAccountType5 actype on  actype.TypeCode=acc.AccountTypeCode
where actype.TypeDesc='Money Market'


-13.produce a listing that shows the city and the number of people who live in that city. 
select City, Count(City) as NoOfPeople
from TblCustomer5
group by City


--14.	Produce a listing showing customer name, the type of account they hold and the balance in that account.(Make use of Joins)
select cst.Name, actype.TypeDesc, acc.Balance
from TblCustomer5 cst inner join TblAccount5 acc on  cst.CustomerID=acc.CustomerID 
join TblAccountType5 actype on  actype.TypeCode=acc.AccountTypeCode



--15.Produce a listing that shows the customer name and the number of accounts they hold.(Make use of Joins)
select tc.Name,Count(tb.AccountNumber) as NoOfAccountHold
from TblCustomer5 tc join TblAccount5 tb
on tc.CustomerID=tb.CustomerID
group by Name

--16.Produce a listing that shows an account type and the average balance in accounts of that type.(Make use of Joins)
select atype.TypeDesc, Avg(tb.Balance) as AvgBalance
from TblAccount5 tb join TblAccountType5 atype
on tb.AccountTypeCode=atype.TypeCode
group by atype.TypeDesc