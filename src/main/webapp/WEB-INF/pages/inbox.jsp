<%--
  Created by IntelliJ IDEA.
  User: Prasad
  Date: 22/08/2019
  Time: 08:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>" type="text/css"/>
<%--    <script type="text/javascript" src="<c:url value="/js/main.js"/>" />--%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" type="text/css">

    <style>
        #container{
            width: 50%;
            border: 4px solid darkblue;
            padding: 10px;
            border-radius: 50px 20px;
            margin-top: 50px;
            padding: 20px;
            margin-left: 25%;
            background: transparent;
        }
        #head{
            width: 80%;
            border: 4px solid darkblue;
            padding: 10px;
            border-radius: 50px 20px;
            margin-top: 50px;
            padding: 20px;
            margin-left: 10%;

        }
        body{
            background: transparent;
        }
    </style>
    <script>
        function dynamicdropdown(listindex)
        {
            switch (listindex)
            {
                case "B101" :
                    document.getElementById("accId").options[0]=new Option("Select Account ID","");
                    document.getElementById("accId").options[1]=new Option("A1001","A1001");
                    document.getElementById("accId").options[2]=new Option("A1002","A1002");
                    document.getElementById("accId").options[3]=new Option("A1003","A1003");
                    document.getElementById("accId").options[4]=new Option("A1004","A1004");
                    break;
                case "B102" :
                    document.getElementById("accId").options[0]=new Option("Select Account ID","");
                    document.getElementById("accId").options[1]=new Option("A2001","A2001");
                    document.getElementById("accId").options[2]=new Option("A2002","A2002");
                    document.getElementById("accId").options[3]=new Option("A2003","A2003");
                    document.getElementById("accId").options[4]=new Option("A2004","A2004");
                    break;
                case "B103" :
                    document.getElementById("accId").options[0]=new Option("Select Account ID","");
                    document.getElementById("accId").options[1]=new Option("A3001","A3001");
                    document.getElementById("accId").options[2]=new Option("A3002","A3002");
                    document.getElementById("accId").options[3]=new Option("A3003","A3004");
                    document.getElementById("accId").options[4]=new Option("A3004","A3004");
                    break;
            }
            return true;
        }
    </script>
</head>
<body style="background: darkgray">
<div cssCass="container" id="head" style="background:#E1E0E0 ">
    <h1 style="margin-left: 40%; font-family: 'Comic Sans MS cursive';color: darkslategrey">Funds Bank pvt. ltd.</h1>
        <a class="btn btn-warning" href="logout.html">Logout</a>
        <h3>User:<%=session.getAttribute("user")%></h3>
</div>
<div cssClass="container" id="container" style="background:#E1E0E0 ">

    <h1>Welcome User</h1>
    <div cssClass="form-group">
    <form:form modelAttribute="complaint" action="complaintForm.html" method="post">
        <label>Branch Code :</label>
<%--        <form:input type="text" path="branchCode" required="required"></form:input>--%>
        <form:select  cssClass="form-control" onchange="javascript:dynamicdropdown(this.options[this.selectedIndex].value);" required="required" path="branchCode">
            <form:option value="">Select Branch Code</form:option>
            <form:option value="B101">B101</form:option>
            <form:option value="B102">B102</form:option>
            <form:option value="B103">B103</form:option>
        </form:select><br>
        <label>Account Id :</label>
        <script type="text/javascript" language="JavaScript">
            document.write('<form:select  path="accountId" cssClass="form-control" id="accId" required="required"><form:option value="">Select Accound ID</form:option></form:select>')
        </script>
        <noscript>
            <form:select path="accountId" cssClass="form-control" id="accId" required="required">
                <form:option value="A1001">A1001</form:option>
                <form:option value="A1002">A1002</form:option>
            </form:select>
        </noscript><br>
        <label>Email :</label>
        <form:input type="email" path="email" required="required" value='<%=session.getAttribute("user")%>' cssClass="form-control"></form:input>
        <br><label>Complaint Category : </label>
        <form:select path="category" cssClass="form-control" required="required">
            <form:option value="">Select Category</form:option>
            <form:option value="Internet Banking">Internet Banking</form:option>
            <form:option value="General Banking">General Banking</form:option>
            <form:option value="Others">Others</form:option>
        </form:select>
        <br><label>Description : </label>
        <form:textarea path="description" cssClass="form-control" required="required"></form:textarea>
        <br><input class="btn btn-success" type="submit" value="Log complaint"/>
        <a class="btn btn-info" href="status.html" style="float: right">Check Status</a>
    </form:form>
    </div>
</div>
<%--</div>--%>
</body>
</html>