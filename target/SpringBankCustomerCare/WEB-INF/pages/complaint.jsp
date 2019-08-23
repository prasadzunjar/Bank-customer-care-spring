<%--
  Created by IntelliJ IDEA.
  User: przu0719
  Date: 8/22/2019
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>"/>
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
<div cssCass="container" id="head" style="background:#E1E0E0 ">
    <h1 style="margin-left: 40%; font-family: 'Comic Sans MS cursive';color: darkslategrey">Funds Bank pvt. ltd.</h1>
    <a class="btn btn-warning" href="logout.html">Logout</a>
    <h3>User:<%=session.getAttribute("user")%></h3>
</div>
<div cssClass="container" id="container" style="background:#E1E0E0 ">
<h2>Thanks for Raising the complaint!!</h2><br><br>
<span style="color:green; font-style: italic">
<h1> Complaint Id for this request is ${comp_id}</h1>
</span>
<hr>
<a class="btn btn-info" href="status.html">Check Status</a>
<hr>
<a class="btn btn-primary" href="inbox.html">Raise Complaint</a>
<hr>
</div>
</body>
</html>
