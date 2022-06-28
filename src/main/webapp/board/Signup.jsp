<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/login.css">
    <title>SignUp!</title>
</head>
<body class="flex-col">
	<%
	String res = request.getParameter("res");
	if(res.equals("false")){
	%>
		<script>
			window.alert("Duplicated user exits");
		</script>
	<%
	}
	%>
	<div style="flex:1;"></div>
	<div class="flex-row">
		<div style="flex:1;"></div>
		<form class="login-area" action="TrySignup.jsp">
			<label class="title">Sign-Up</label>
			<div class="flex-row">
				<label class="category-field">ID</label>
				<input type="text" class="input-field" id="inp_id" name="id">
			</div>
			<div class="flex-row" style="margin-bottom:20px;">
				<label class="category-field">PW</label>
				<input type="password" class="input-field" id="inp_pw" name="pass">
			</div>
			<div class="flex-row">
				<div style="flex:1;"></div>
				<input type="submit" class="login-buttons" id="btn_signup" value="sign up">
				<a class="login-buttons" id="btn_cancel" href="../<%=request.getParameter("cancel_url") %>">Cancel</a>
			</div>
		</form>
		<div style="flex:1;"></div>
	</div>
	<div style="flex:1;"></div>
</body>
</html>