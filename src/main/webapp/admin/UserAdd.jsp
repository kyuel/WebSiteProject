<%@page import="common.Stores"%>
<%@page import="common.CRUD_OBJECT"%>
<%@page import="models.PostModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User Add</title>

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
				<form class="container-fluid" style="padding-top: 1.5rem;" action="TryUserAdd.jsp">
                            <!-- Circle Buttons -->
					<div class="card shadow mb-4" id="post_area">
						<div class="card-header py-3">
							<input class="input-id" type="text" placeholder="id" name="id">
						</div>
						<div class="card-body">
							<input class="input-pass" type="text" placeholder="password" name="pass">
						</div>
						<div style="display:flex; flex-flow:row;">
                       		<label class="label-user">AUTH</label>
                       		<select name="auth">
                       			<option value="admin">admin</option>
                       			<option value="user">user</option>
                       		</select>
						</div>  
					</div>
					<div style="display:flex; flex-flow:row;">
						<div style="flex:1;"></div>
						<button id="btn_save" class="post-control-btn">저장</button>
						<a id="btn_cancel" class="post-control-btn" href="UserManage.jsp">취소</a>
					</div>
				</form>
			</div>
		</div>
	</div>                
</body>
</html>