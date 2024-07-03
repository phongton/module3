<%--
  Created by IntelliJ IDEA.
  User: tonthathoangphong
  Date: 02/07/2024
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<h1>Sửa thông tin học sinh</h1>
<div class="container">
    <form   method="post">
        <div class="mb-3">
            <label for="name" class="form-label"></label>
            <input type="text" class="form-control" id="id" name="id" value="${student.id}" readonly maxlength="100" minlength="5">
        </div>

        <div class="mb-3">
            <label for="name" class="form-label">Tên học sinh :</label>
            <input type="text" class="form-control" id="name" name="name" value="${student.name}" required maxlength="100" minlength="5">
        </div>
        <div class="mb-3">
            <label for="address" class="form-label">Địa chỉ:</label>
            <input type="text" class="form-control" id="address" name="address" value="${student.address}" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="point"> Điểm :</label>
            <input type="text" class="form-control" id="point" name="point"  value="${student.point}" required>

        </div>
        <button type="submit" class="btn btn-primary">Sửa</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>