<%-- 
    Document   : userjsp
    Created on : 1 февр. 2023 г., 14:35:57
    Author     : Umman Hasan
--%>

<%@page import="com.mycompany.entity.User" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    User u = (User) request.getAttribute("user");
%>
<div>
    <form method="POST" action="user-detail">
        <input type="hidden" name="id" value="<%=u.getId()%>">

        <label> Name </label>
        <input type="text" name="name" value="<%=u.getName()%>">

        <br>

        <label> Surname </label>
        <input type="text" name="surname" value="<%=u.getSurname()%>">

        <input type="submit" name="save" value="Save">
    </form>
</div>
</body>
</html>