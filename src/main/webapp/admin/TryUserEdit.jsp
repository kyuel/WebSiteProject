<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String auth = request.getParameter("auth");
	String id_old = request.getParameter("id_old");
	String pass_old = request.getParameter("pass_old");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	boolean res = crud.edit_user(id, pass, auth, id_old, pass_old);
	if(res){
		response.sendRedirect("UserManage.jsp");
	}
	else{
		response.sendRedirect(String.format("UserEdit.jsp?res=false&id=%s&pass=%s&auth=%s",id_old, pass_old, auth));
	}
%>