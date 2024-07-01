<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<h1>Result : </h1>
<c:choose>
    <c:when test="${operator eq '+'}">
        <h3> ${first} + ${second} = ${first + second}</h3>
    </c:when>
    <c:when test="${operator eq '-'}">
        <h3> ${first}-${second}=${first-second}</h3>
    </c:when>
    <c:when test="${operator eq '*'}">
        <h3> ${first}*${second}=${first*second}</h3>
    </c:when>
    <c:when test="${operator eq '/'}">
        <c:choose>
            <c:when test="${second ne 0}">
                <h3>${first} / ${second} = ${first / second}</h3>
            </c:when>
            <c:otherwise>
                <h2 style="color: red">Division by zero is not allowed.</h2>
            </c:otherwise>
        </c:choose>
    </c:when>

</c:choose>
<%--<c:choose>--%>
<%--    <c:when test="${operator eq '+'}">--%>
<%--        <h3>${first} + ${second} = ${first + second}</h3>--%>
<%--    </c:when>--%>
<%--    <c:when test="${operator eq '-'}">--%>
<%--        <h3>${first} - ${second} = ${first - second}</h3>--%>
<%--    </c:when>--%>
<%--    <c:when test="${operator eq '*'}">--%>
<%--        <h3>${first} * ${second} = ${first * second}</h3>--%>
<%--    </c:when>--%>
<%--    <c:when test="${operator eq '/'}">--%>
<%--        <c:choose>--%>
<%--            <c:when test="${second ne 0}">--%>
<%--                <h3>${first} / ${second} = ${first / second}</h3>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <h2 style="color: red">Division by zero is not allowed.</h2>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--    </c:when>--%>
<%--</c:choose>--%>
</body>
</html>
