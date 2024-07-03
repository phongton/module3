<%--
  Created by IntelliJ IDEA.
  User: Laptop K1
  Date: 27/06/2024
  Time: 2:36 CH
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="product.css">
    <title>Product</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form method="post" action="product">
    <input type="text" name="desciption" placeholder="Product Description"/><br/>
    <input type="text" name="price" placeholder="List Price"/><br/>
    <input type="text" name="percent" placeholder="Discount Percent"/><br/>
    <button type="submit"> Calculate Discount </button>
</form>
</body>
</html>