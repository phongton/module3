use QuanLySinhVien;
select SubName,Credit as "credit max"
from Subject
where Credit =(select Max(Credit) from subject );

select m.markid, m.subid, m.studentid, m.mark, m.examtimes
from Mark m
join Subject s on s.subid= m.subid
where Mark =(select Max(mark) from mark);

select s.studentid, s.studentname, s.address ,avg(m.mark) as "điểm trung bình "
from student s
join Mark m on m.studentid=s.studentid
group by s.studentid, s.studentname , s.address
order by avg(m.mark) desc;
