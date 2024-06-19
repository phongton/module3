use quanlybanhang;
select oID, oDate, o
from oder;
select c.cid ,c.cname, p.pname as 'San Pham Da Mua'
from customer c
join oder o on c.cid=o.cid
join oderdetail od on o.oid=od.oid
join product p on od.pid=p.pid;

select c.cid , c.cname 
from customer c
where c.cid not in(
select distinct cid
from oder);
select c.cid ,c.cname
from customer c 
LEFT JOIN oder o ON c.cID = o.cID
WHERE o.cID IS NULL;

select o.oid ,o.oDate , sum(p.pprice * od.odqty) as 'tongtien'
from oder o
join oderdetail od on od.oid=o.oid
join product p on od.pid = p.pid 
group by o.oid,o.odate;



