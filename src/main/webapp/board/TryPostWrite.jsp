<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	boolean res = crud.register_post(title, content, Stores.user.id);
	if(res){
		response.sendRedirect("Posts.jsp");
	}
	else{
		response.sendRedirect("PostWrite.jsp");
	}
%>