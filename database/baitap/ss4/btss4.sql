use QuanLySinhVien;
SELECT 
    SubName, Credit AS 'credit max'
FROM
    Subject
WHERE
    Credit = (SELECT 
            MAX(Credit)
        FROM
            subject);

SELECT 
    m.markid, m.subid, m.studentid, m.mark, m.examtimes
FROM
    Mark m
        JOIN
    Subject s ON s.subid = m.subid
WHERE
    Mark = (SELECT 
            MAX(mark)
        FROM
            mark);

SELECT 
    s.studentid,
    s.studentname,
    s.address,
    AVG(m.mark) AS 'điểm trung bình '
FROM
    student s
        JOIN
    Mark m ON m.studentid = s.studentid
GROUP BY s.studentid , s.studentname , s.address
ORDER BY AVG(m.mark) DESC
