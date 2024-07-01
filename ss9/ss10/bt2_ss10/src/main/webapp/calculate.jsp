<%--
  Created by IntelliJ IDEA.
  User: tonthathoangphong
  Date: 30/06/2024
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="calculate", method="post">
    <legend>Calculator</legend>
    <table>
        <tr>
            <td>First operand: </td>
            <td><input name="first" type="text"/></td>
        </tr>
        <tr>
            <td>Operator: </td>
            <td>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Second operand: </td>
            <td><input name="second" type="text"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Calculate"/></td>
        </tr>
    </table>
</form>

</body>
</html>
