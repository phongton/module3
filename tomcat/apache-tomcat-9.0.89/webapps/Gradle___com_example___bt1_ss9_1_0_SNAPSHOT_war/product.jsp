<%--
  Created by IntelliJ IDEA.
  User: tonthathoangphong
  Date: 30/06/2024
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form method="post" action="product">
    <input type="text" name="description" placeholder="Product Description"/><br/>
    <input type="text" name="price" placeholder="List Price"/><br/>
    <input type="text" name="percent" placeholder="Discount Percent"/><br/>
    <button type="submit"> Calculate Discount </button>
</form>
</body>
</html>
