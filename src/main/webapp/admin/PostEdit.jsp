<%@page import="common.Stores"%>
<%@page import="common.CRUD_OBJECT"%>
<%@page import="models.PostModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%
CRUD_OBJECT crud = new CRUD_OBJECT(application);
PostModel post = crud.get_post(
		request.getParameter("title"),
		request.getParameter("id")
		);
%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Post <%=post.title %></title>

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
		<div id="content-wrapper" class="d-flex flex-column">            
			<div id="content">                               
				<form class="container-fluid" style="padding-top: 1.5rem;" action="TryPostEdit.jsp">
				<!-- Circle Buttons -->
				<input type="text" value="<%=post.title %>" name="title_old" style="display:none;">
				<input type="text" value="<%=post.content %>" name="content_old" style="display:none;">
				<input type="text" value="<%=post.id %>" name="id" style="display:none;">
				<div class="card shadow mb-4" id="post_area">
					<div class="card-header py-3">
						<input class="input-title" type="text" value="<%=post.title %>" name="title">
					</div>
					<div class="card-body">
						<textarea class="input-content" name="content"><%=post.content %></textarea>
					</div>                       
				</div>
				<div style="display:flex; flex-flow:row;">
					<button id="btn_save" class="post-control-btn">저장</button>
					<a id="btn_cancel" class="post-control-btn" href="Post.jsp?title=<%=post.title %>&id=<%=post.id %>">취소</a>
				</div>
				</form>
			</div>
		</div>
	</div>           
</body>
</html>