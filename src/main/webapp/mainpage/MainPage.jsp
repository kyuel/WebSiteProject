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
		PostModel[] posts = crud.get_posts();
	%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

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
                <div class="sidebar-brand-text mx-3">
                	<a style="color:white; text-decoration: none;" href="MainPage.jsp">
                		일단 보류
                	</a>
                </div>
            </div>

            <!-- Divider -->
			<div class="sidebar-heading">
                Notification Area
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                 <a class="nav-link" href="../notice/OurPlace.jsp">
                    <span>OurPlace</span></a>
            </li>

            <div class="sidebar-heading">
                Board Area
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="../board/Posts.jsp">
                    <span>DashBoard</span></a>
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
                <a class="nav-link" href="../admin/UserManage.jsp">
                    <span>User Manage</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="../admin/PostManage.jsp">
                    <span>Post Manage</span></a>
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
                   <div class="row">
					<%
					for(int i = 0 ; i<3 ; i++){
					%>
						<div class="card shadow mb-4">
							<div class="card-header py-3" is_flex="true">
								<a href="../board/Post.jsp?title=<%=posts[i].title %>&id=<%=posts[i].id %>&num=<%=posts[i].num %>">
						        	<h6 class="m-0 font-weight-bold text-primary"><%=posts[i].title %></h6>	
						        </a>
						        <div style="flex:1;"></div>
						        <h6 style="text-align:right;">Writer:<%=posts[i].id %></h6>
						    </div>
						    <div class="card-body">
						        <p><%=posts[i].content %></p>
						    </div>
						</div>
					<%	
					}
					%>
				</div>
			</div>
		</div>
	</div>   
</body>
</html>