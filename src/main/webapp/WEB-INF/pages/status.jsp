<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Status page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>" type="text/css"/>
    <style>
        #container{
            width: 40%;
            border: 4px solid darkblue;
            padding: 10px;
            border-radius: 50px 20px;
            margin-top: 50px;
            padding: 20px;
            margin-left: 30%;
        }
        #head{
            width: 80%;
            border: 4px solid darkblue;
            padding: 10px;
            border-radius: 50px 20px;
            margin-top: 50px;
            padding: 20px;
            margin-left: 10%;
            background: transparent;
        }
        body{background: transparent;}
    </style>
</head>
<body style="background: darkgray">
<div cssClass="container" id="head" style="background:#E1E0E0 ">
    <h1 style="margin-left: 40%; font-family: 'Comic Sans MS cursive';color: darkslategrey">Funds Bank pvt. ltd.</h1>
    <a class="btn btn-warning" href="logout.html">Logout</a>
    <h3>User:<%=session.getAttribute("user")%></h3>
</div>
<div cssClass="container" id="container" style="background:#E1E0E0 ">
<form:form modelAttribute="UserComplaint" action="status.html" method="post" cssClass="form-group">
    <label>Enter Complaint Id:</label>
    <form:input type="text" id="id" path="comId" cssClass="form-control"></form:input><br>
    <input class="btn btn-info" type="submit" value="Check Status"/>
    <a class="btn btn-primary" href="inbox.html" style="float: right">Raise Complaint</a>
</form:form>
<hr>
<table class="table">
    <thead class="thead-dark">
    <tr>
        <th>Complaint Id</th>
        <th>Description</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${complaint.comId}</td>
        <td>${complaint.description}</td>
        <td>${complaint.status}</td>
    </tr>
    </tbody>
</table>
    <span style="color: red">
    <%if(request.getAttribute("error")!=null)
    %><%{%>
        <%=request.getAttribute("error")%>
    <%}%>
        </span>
</div>
</body>
</html>
