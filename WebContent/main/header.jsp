<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#menu {
	margin-left: 30%;
}
body {
	padding-bottom: 50px;
}
</style>
<c:set var="sessionId" value="${ sessionID }" />
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="Main.do"><img src="/GuestBee/main/logo.png" alt="GuestBee" style="width: 130px; height: 50px;"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul id="menu" class="nav navbar-nav navbar-center">
					<li><a href="ReservationMainForm.do">Reservation</a></li>
					<li><a href="InfoMainForm.do">Info</a></li>
					<li><a href="/GuestBee/matching/board/BoardListAction.bo">Matching</a></li>
				</ul>
				<c:if test="${ sessionId eq null }">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="LoginForm.do"> 로그인</a></li>
						<li><a href="JoinForm.do">회원가입</a></li>
						<li><a href="AdminLoginForm.do">admin</a></li>
					</ul>
				</c:if>
				<c:if test="${ sessionId ne null }">	
					<ul class="nav navbar-nav navbar-right">
						<li><a>${ sessionId }님 환영합니다</a></li>
						<li><a href="MyPageForm.do">MyPage</a></li>
						<li><a href="MemberLogoutAction.do">Logout</a></li>
						
					</ul>
				</c:if>
			</div>

		</div>
		</div>
	</nav>

</body>
</html>