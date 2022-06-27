<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	boolean res = crud.delete_user(id);
	if(res){
		response.sendRedirect("UserManage.jsp");
	}
%>