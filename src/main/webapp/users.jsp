<%-- 
    Document   : userjsp
    Created on : 1 февр. 2023 г., 14:35:57
    Author     : Umman Hasan
--%>

<%@page import="com.mycompany.entity.User" %>
<%@page import="com.mycompany.main.Context" %>
<%@page import="com.mycompany.dao.inter.UserDaoInter" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Users</title>
    <link rel="stylesheet" href="asset/css/users.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


</head>
<body>
<%
    UserDaoInter userDao = Context.instanceUserDao();

    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String nationalityIdStr = request.getParameter("nId");
    Integer nationalityId = null;
    if (nationalityIdStr != null && !nationalityIdStr.trim().isEmpty()) {
        nationalityId = Integer.parseInt(nationalityIdStr);
    }

    List<User> list = userDao.getAll(name, surname, nationalityId);
%>
<div class="container my-container">
    <div class="row">
        <div class="col-4">
            <form method="GET" action="users.jsp">
                <%--@declare id="name"--%>
                <%--@declare id="surname"--%>
                <div class="form-group my-form-control ">
                    <label for="name"> name: </label>
                    <input class="form-control" placeholder="enter name" type="text" name="name" value="">
                </div>
                <div class="form-group my-form-control">
                    <label for="surname"> surname: </label>
                    <input class="form-control" placeholder="enter surname" type="text" name="surname" value="">
                    <input type="hidden" name="id" value="">
                </div>
                <input class="btn btn-primary" type="submit" name="search" value="Search">
            </form>
        </div>
    </div>
    <div class="all_users">
        <table class="table">
            <thead>
            <tr>
                <th>name</th>
                <th>surname</th>
                <th>nationality</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%
                for (User u : list) {
            %>
            <tr>
                <td><%=u.getName()%>
                </td>
                <td><%=u.getSurname()%>
                </td>
                <td><%=u.getNationality().getName() == null ? "N/A" : u.getNationality().getName()%>
                </td>
                <td style="width: 5px">
                    <form action="userdata" method="POST">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <input type="hidden" name="action" value="dlt">
                        <button class="btn btn-danger" type="submit" value="delete">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </form>
                </td>
                <td style="width: 5px">
                    <form action="userdata" method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <input type="hidden" name="action" value="upd">
                        <button class="btn btn-success" type="submit" value="update">
                            <i class="fa-solid fa-square-pen"></i>
                        </button>
                    </form>
                </td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" async="" src="asset/js/fontawesome.js"></script>
</body>
</html>
