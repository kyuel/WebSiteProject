<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	boolean res = crud.register_user(id, pass, "user");
	
	if(res){
		response.sendRedirect("../mainpage/MainPage.jsp");
	}
	else{
		response.sendRedirect("Signup.jsp?res=false&cancel_url=mainpage/MainPage.jsp");
	}
%>