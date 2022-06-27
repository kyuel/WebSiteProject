<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	UserModel user = crud.get_user(id, pass);
	if(user.empty()){
		response.sendRedirect("LoginFailed.jsp");
	}
	else{
		Stores.is_login = true;
		Stores.user = user;
		response.sendRedirect("LoginSuccess.jsp");
	}
%>