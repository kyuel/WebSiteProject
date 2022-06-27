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
				<div style="padding-top: 1.5rem;" class="container-fluid">
                            <!-- Circle Buttons -->
					<div class="card shadow mb-4" id="post_area">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary"><%=post.title %></h6>
						</div>
						<div class="card-body">
							<p><%=post.content %></p>   
						</div>
					</div>
				<%
				if((Stores.is_login && post.id.equals(Stores.user.id)) || Stores.user.auth.equals("admin")){
				%>
					<div style="display:flex; flex-flow:row;">
                   	 	<div style="flex:1;"></div>
                   	 	<a id="btn_edit" class="post-control-btn" href="PostEdit.jsp?title=<%=post.title %>&id=<%=post.id %>">수정</a>
                   	 	<a onclick="return confirm('정말로 삭제하시겠습니까?')" 
									href="TryPostDelete.jsp?title=<%=post.title %>&content=<%=post.content %>&id=<%=post.id %>" 
									class="post-control-btn" id="btn_delete">삭제</a>
                   	</div>
				<%
				}
				%>	 
			</div>
		</div>
	</div>                
</body>
</html>