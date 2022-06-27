<%@page import="models.PostModel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="models.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CRUD_OBJECT" %>
<%@ page import="common.Stores" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<%
		CRUD_OBJECT crud = new CRUD_OBJECT(application);
		UserModel[] users = crud.get_users();
	%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Custom fonts for this template-->
    <link href="../css/fontawesome/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<div class="sidebar-brand d-flex align-items-center justify-content-center">
				<div class="sidebar-brand-text mx-3">일단 보류</div>
			</div>
	        <!-- Divider -->
			<hr class="sidebar-divider">
			<!-- Heading -->
			<div class="sidebar-heading">
				Board Area
			</div>
				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item">
	                <a class="nav-link" href="../board/Posts.jsp">
						<span>DashBoard</span>
					</a>
				</li>
	            <!-- Divider -->
	            <%
	            if(Stores.is_login && Stores.user.auth.equals("admin")){
	            %>
		            <hr class="sidebar-divider">
		            <!-- Heading -->
			        <div class="sidebar-heading">
		                Admin
		            </div>
		            <!-- Nav Item -  -->
		            <li class="nav-item">
						<a class="nav-link" href="../admin/UserManage.jsp"><span>User Manage</span></a>
					</li>
		            <!-- Nav Item - Tables -->
		            <li class="nav-item">
						<a class="nav-link" href="../admin/PostManage.jsp"><span>Post Manage</span></a>
					</li>
	            <%
	            }
	            %>
		</ul>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<ul class="navbar-nav ml-auto"> 
						<li class="nav-item dropdown no-arrow">
							<a class="nav-link" href="#" role="button" onclick="document.querySelector('#user_dropdown').style.display='block'">
								<img class="img-profile" src="../img/sign-<%=Stores.is_login ? "out" : "in" %>-alt.svg">
							</a>
							<div class="dropdown-menu dropdown-menu-right shadow" id="user_dropdown">
								<%
								if(Stores.is_login){
								%>
									<div class="dropdown-item" onclick="document.querySelector('#user_dropdown').style.display='none'">
										<%= Stores.user.id %>
									</div>
									<a class="dropdown-item" href="../board/Logout.jsp">
										Logout
									</a>
								<%	
								}
								else{
								%>
									<a class="dropdown-item" href="../board/Login.jsp?cancel_url=mainpage/MainPage.jsp">
										Login
									</a>
									<a class="dropdown-item" href="../board/Signup.jsp?res=true&cancel_url=mainpage/MainPage.jsp">
										Sign-up
									</a>
								<%
								}
								%>
							</div>
						</li>
					</ul>
				</nav>
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800">User Manage</h1>
						<table class="table-user">
							<thead>
								<tr>
									<th>ID</th>
		                   			<th>PASS</th>
		                   			<th>AUTH</th>
		                   			<th></th>
	                   			</tr>
							</thead>
						<tbody>
							<%
							for(int i = 0 ; i<users.length ; i++){
							%>
								<tr>
									<td><%=users[i].id %></td>
									<td><%=users[i].pass %></td>
									<td><%=users[i].auth %></td>
									<td>
										<a href="UserEdit.jsp?id=<%=users[i].id %>&pass=<%=users[i].pass %>&auth=<%=users[i].auth %>" class="button-user-control">수정</a>
										<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="TryUserDelete.jsp?id=<%=users[i].id %>" class="button-user-control">삭제</a>
									</td>
								</tr>
							<%	
							}
							%> 
						</tbody>
					</table>
					<div style="display:flex; flex-flow:row;">
						<div style="flex:1;"></div>
							<a id="btn_edit" class="button-user-control" href="UserAdd.jsp">추가</a>
					</div>
				</div>
			</div>
		</div>
	</div>   
</body>
</html>