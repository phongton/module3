<%--
  Created by IntelliJ IDEA.
  User: tonthathoangphong
  Date: 02/07/2024
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <a class="navbar-brand" href="#">User</a>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
      </ul>
      <form class="d-flex" method="post" action="/user?action=search">
        <input class="form-control me-2" type="search" placeholder="Search" name="txtSearch" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<div class="container">
  <form method="post">
    <div class="mb-3">
      <label for="name" class="form-label">Tên khách hàng :</label>
      <input type="text" class="form-control" id="name" name="name" required >
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Email:</label>
      <input type="text" class="form-control" id="email" name="email" required>
    </div>
    <div class="mb-3">
      <label class="form-label" for="country">Quốc tịch</label>
      <input type="text" class="form-control" id="country" name="country" required >

    </div>
    <button type="submit" class="btn btn-primary">Thêm mới</button>
  </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
