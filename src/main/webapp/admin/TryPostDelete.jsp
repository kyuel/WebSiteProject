<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");
	String num = request.getParameter("num");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	boolean res = crud.delete_post(title, content, id, num);
	if(res){
		response.sendRedirect("PostManage.jsp");
	}
%>