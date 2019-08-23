

<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 22/08/2019
  Time: 00:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>" type="text/css"/>
    <style>
        .container{
            width: 25%;
            border: 4px solid darkblue;
            padding: 10px;
            border-radius: 50px 20px;
            margin-top: 50px;
            padding: 20px;
            margin-left: 37%;
        }
        .head1{
            width: 80%;
            border: 4px solid darkblue;
            padding: 10px;
            border-radius: 50px 20px;
            margin-top: 50px;
            padding: 20px;
            margin-left: 10%;
        }
    </style>
</head>
<body style="background: darkgray">
<div  cssClass="container" class="head1" style="background:#E1E0E0 ">
    <h1 style="margin-left: 40%; font-family: 'Comic Sans MS cursive';color: darkslategrey">Funds Bank pvt. ltd.</h1>
</div>
<div cssClass="container" class="container" style=" background: #E1E0E0;">
    <span style="color: red">
    <%if(request.getAttribute("error")!=null)
    %><%{%>
        <%=request.getAttribute("error")%>
    <%}%>
        </span>
<div cssClass="form-group">
    <form:form  modelAttribute="user" action="validateUser.html" method="post">
        <label><b>Email:</b></label>
        <form:input cssClass="form-control" path="email" required="required"></form:input>
        <label><b>Password:</b></label>
        <form:password  cssClass="form-control" path="password" required="required"></form:password><br>
        <input class="btn btn-primary" type="submit" value="Login"/>
    </form:form>
</div>
</div>
</body>
</html>
