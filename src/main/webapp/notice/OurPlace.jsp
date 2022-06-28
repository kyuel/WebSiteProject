<%@page import="models.PostModel"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="models.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.CRUD_OBJECT" %>
<%@ page import="common.Stores" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<%
		CRUD_OBJECT crud = new CRUD_OBJECT(application);
		PostModel[] posts = crud.get_posts();
	%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>OurPlace</title>

    <!-- Custom fonts for this template-->
    <link href="../css/fontawesome/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.css" rel="stylesheet">
    <link href="../admin/css/styles.css" rel="stylesheet">
    
</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <div class="sidebar-brand d-flex align-items-center justify-content-center">
                <div class="sidebar-brand-text mx-3">
                	<a style="color:white; text-decoration: none;" href="../mainpage/MainPage.jsp">
                		일단 보류
                	</a>
                </div>
            </div>

            <!-- Heading -->
            <div class="sidebar-heading">
                Notification Area
            </div>
            <li class="nav-item">
                <a class="nav-link" href="../notice/OurPlace.jsp">
                    <span>OurPlace</span></a>
            </li>
            <div class="sidebar-heading">
                Board Area
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="../board/Posts.jsp">
                    <span>DashBoard</span></a>
            </li>

            <!-- Divider -->
            <%
            if(Stores.is_login && Stores.user.auth.equals("admin")){
            %>
            <hr class="sidebar-divider">

            <!-- Heading -->
	        <div class="sidebar-heading">
                Admin
            </div>

            <!-- Nav Item -  -->
            <li class="nav-item">
                <a class="nav-link" href="../admin/UserManage.jsp">
                    <span>User Manage</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="../admin/PostManage.jsp">
                    <span>Post Manage</span></a>
            </li>
            <%
            }
            %>
        </ul>

	<div id="content-wrapper" class="d-flex flex-column">
		<div id="content">
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<ul class="navbar-nav ml-auto"> 
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link" href="#" role="button" onclick="document.querySelector('#user_dropdown').style.display='block'">
							<img class="img-profile" src="../img/sign-<%=Stores.is_login ? "out" : "in" %>-alt.svg">
						</a>
                           <div class="dropdown-menu dropdown-menu-right shadow" id="user_dropdown">
						<%
						if(Stores.is_login){
						%>
							<div class="dropdown-item" onclick="document.querySelector('#user_dropdown').style.display='none'">
								<%= Stores.user.id %>
							</div>
							<a class="dropdown-item" href="../board/Logout.jsp">
								Logout
							</a>
						<%	
						}
						else{
						%>
							<a class="dropdown-item" href="../board/Login.jsp?cancel_url=mainpage/MainPage.jsp">
								Login
							</a>
							<a class="dropdown-item" href="../board/Signup.jsp?res=true&cancel_url=mainpage/MainPage.jsp">
								Sign-up
							</a>
						<%
						}
						%>
                           </div>
					</li>
				</ul>
			</nav>
			<div class="container-fluid">
				<div id="map" style="width:500px;height:400px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c35513d6868be70ce069ba460e7086e1"></script>
				<script>	
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(37.478803562789395, 126.87877393603821 ), //지도의 중심좌표.
						level: 2 //지도의 레벨(확대, 축소 정도)
					};
		
					var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				</script>
				<div class="cnt_direction clear">
					<div class="direction1">
                    	<p class="dir_tit">대중교통으로 방문하시는 경우</p>
						<div>                                                                              
                            <p style="font-size: large; font-weight:bold;" class="dir_subtit">지하철</p>
                            <p>가산디지털단지역 6번출구 나오셔서 좌측횡단보도 건너
                             좌측으로 10m 가시면 삼거리가 나옵니다. 삼거리에서 우측 방향으로
                              직진하셔서 사거리 대각선방향에 우리은행 건물 413호입니다.</p>
                            <p style="font-size: large; font-weight:bold;" class="dir_subtit">버스</p>
                        	<p>21, 571, 652, 금천 05<br>[디지털3단지월드벤쳐센터] 정류장에서 하차</p>
                        	<p><br></p>
                        	<p style="font-size: large; font-weight:bold;" class="dir_subtit">주소</p>
                        	<p>서울시 금천구 가산디지털2로 123<br>&nbsp;월드메르디앙2차 4층&nbsp; 413호</p>
                    	</div>
                    </div>
					<div class="direction2 on">
                        <p class="dir_tit">자가용으로 방문하시는 경우</p>
						<div>                                                                                  
                            <p> 서부간선도로를 타고 오다가 광명교를 타고 좌회전 후 첫 사거리에서 우회전</p>
                            <p> 가리봉5거리에서 철산방향 수출의 다리를 넘어 첫 사거리(한진사거리)에서 우회전</p>
                        	<p> 남부순환도로 구로IC로 나와 좌회전</p>
                    	</div>
                	</div>
				</div>
			</div>
		</div>
	</div>   
</body>
</html>