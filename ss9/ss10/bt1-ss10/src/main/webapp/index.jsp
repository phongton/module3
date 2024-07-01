<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Danh Sách gái xinh</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">

  <table class="table table-hover">
    <thead>
    <tr>

      <th>Họ và tên</th>
      <th>Ngày Sinh</th>
      <th>Địa chỉ</th>
      <th>Hình ảnh</th>
    </tr>
    </thead>
    <tbody>
    <%--        for(Student student : students)--%>
    <c:forEach var="customer" items="${customers}" >
      <tr>

        <td>${customer.name}</td>
        <td>${customer.dob}</td>
        <td>${customer.address}</td>
        <td><img src="${customer.urlImage}" width="200px" height="200px"></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>