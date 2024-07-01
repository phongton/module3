<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency converter</title>
</head>
<body>
<h2>Currency Converter</h2>
<form action="converter.jsp" method="get">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE"   /><br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Converter"/>
</form>


</body>
</html>