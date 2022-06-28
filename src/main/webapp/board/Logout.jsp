<%@page import="models.UserModel"%>
<%@page import="common.Stores"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
		<%
		Stores.is_login = false;
		Stores.user = new UserModel("", "", "");
		%>
		<title>Loading</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/login.css">
        <meta http-equiv="Refresh" content="2;url=../mainpage/MainPage.jsp">
    </head>
    <body class="flex-col">
        <div style="flex:1;"></div>
        <div class="flex-row">
            <div style="flex:1;"></div>
            <label style="text-align:center;font-size:40px;">Now Logout...<br>GoodBye.. :(</label>
            <div style="flex:1;"></div>
        </div>
        <div style="flex:1;"></div>
    </body>
</html>