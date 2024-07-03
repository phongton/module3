<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: tonthathoangphong
  Date: 01/07/2024
  Time: 09:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit customer</title>
</head>
<body>
<h1> Edit customer</h1>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<form method="post" action="" >
    <fieldset>Customer information</fieldset>
    <table>
        <tr>
            <td>Name : </td>
            <td><input type="text" name="name" id="name" value="${requestScope['customer'].getName()}" ></td>
        </tr>
    </table>
</form>
</body>
</html>
