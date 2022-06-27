<%@page import="common.Stores"%>
<%@page import="models.UserModel"%>
<%@page import="common.CRUD_OBJECT"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String title_old = request.getParameter("title_old");
	String content_old = request.getParameter("content_old");	
	String post_id = request.getParameter("id");
	

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	CRUD_OBJECT crud = new CRUD_OBJECT(application);
	boolean res = crud.update_post(title, content, title_old, content_old, post_id);
	if(res){
		response.sendRedirect("PostManage.jsp");
	}
	else{
		response.sendRedirect(String.format("PostEdit.jsp?title=%s&id=%s",title_old, post_id));
	}
%>