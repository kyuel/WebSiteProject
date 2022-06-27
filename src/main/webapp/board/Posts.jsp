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
		//UserModel model = crud.get_user("admin", "admin");
		PostModel[] posts = crud.get_posts();
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
    <link href="../mainpage/css/styles.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
</head>
<body id="page-top" style="overflow:hidden;">
	<script>
	var modal_logout = new bootstrap.Modal("#logoutModal");
	</script>
    <!-- Page Wrapper -->
    <div id="wrapper">

        

        <div id="content-wrapper" class="d-flex flex-column">

            
            <div id="content">

               
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                     <a class="btn btn-link mr-3" href="../mainpage/MainPage.jsp">
						◀
                    </a>
                    
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
                    <h1 class="h3 mb-4 text-gray-800">Posts</h1>


                            <!-- Circle Buttons -->
                        <!-- <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">제목</h6>
                            </div>
                            <div class="card-body">
                                <p>내용</p>
                            </div>
                        </div> -->
				<%
					for(int i = 0 ; i<posts.length ; i++){
				%>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<a href="../board/Post.jsp?title=<%=posts[i].title %>&id=<%=posts[i].id %>">
								<h6 class="m-0 font-weight-bold text-primary"><%=posts[i].title %></h6>
							</a>
						</div>
						<div class="card-body">
							<p><%=posts[i].content %></p>
						</div>
					</div>
				<%	
				}
				%>      
				<div style="display:flex; flex-flow:row;">
                   	 <div style="flex:1;"></div>
                   	 <a id="btn_write" class="post-control-btn" href="PostWrite.jsp">작성</a>
				</div>       
		</div>
	</div>
</div>   
</body>
</html>