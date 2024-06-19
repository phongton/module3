use quanlysinhvien;
select *
from student
where studentname like 'h%';
select *	
from class
where month(startdate)=12;
select subid,subname,credit,status
from subject
where credit>=3 and credit<=5; 
SET SQL_SAFE_UPDATES = 0;
update student
set classid =2
where studentname ='hung';
SET SQL_SAFE_UPDATES = 1;

select s.studentname,sub.subname ,m.mark
from mark m 
join student s on m.studentid = s.studentid
join subject sub on m.subid=sub.subid
order by m.mark desc , s.studentname asc;