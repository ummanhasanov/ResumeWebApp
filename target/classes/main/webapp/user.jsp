<%-- 
    Document   : userjsp
    Created on : 1 февр. 2023 г., 14:35:57
    Author     : Umman Hasan
--%>

<%@page import="com.mycompany.entity.User"%>
<%@page import="com.mycompany.main.Context"%>
<%@page import="com.mycompany.dao.inter.UserDaoInter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            UserDaoInter userDao = Context.instanceUserDao();

            User u = userDao.getById(1);
        %>

        <div>
            <form method="POST" action="user.jsp">
                <input type="hidden" name="id" value="<%=u.getId()%>">

                <label> Name </label>
                <input  type="text" name="name" value="<%=u.getName()%>">

                <br>

                <label> Surname </label>
                <input  type="text" name="surname" value="<%=u.getSurname()%>">

                <input type="submit" name="save" value="Save">
            </form>
        </div>
    </body>
</html>
