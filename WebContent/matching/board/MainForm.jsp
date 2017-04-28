<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

	
<html>
<head>
	<title>메인 화면</title>
	
	<style>
		/*
		레이아웃 전체 가운데 정렬 태그  
		- margin:0 auto 0 auto;(시계방향으로 위, 오른쪽, 아래, 왼쪽)
		왼쪽, 오른쪽 바깥여백을 auto로 주면 중앙정렬이 된다. 
		
		전체를 감싸주는 태그 #wrap 
		*/
		#wrap {
			width: 100%;
			height: 100%
			margin: 0 auto 0 auto;
		}
		
		#header {
			text-align: center;
			height: 150px;
			background-color: #F5F5F5;
			padding: 60px 0px;
		}

		#main {
			float: left;
			width: 100%;
			height: 100%;
			/*background-color: #FFCA6C;*/
			text-align:center;
			vertical-align: middle;
			overflow:auto;	/* 자동 스크롤 */
		}
		#footer {
			clear: left;
			height: 100px;
			background-color: #F5F5F5;
		}
	</style>
	
</head>
<body>
	<div id="wrap">
		<div id="main">
		
			<!-- contentPage가 없을 경우 FirstView.jsp를 보여준다. -->
			<c:set var="contentPage" value="${param.contentPage}"/>
			<c:if test="${contentPage==null}">	
				<jsp:include page="FirstView.jsp" />
			</c:if>
			<jsp:include page="${contentPage}" />
			
		</div>
	</div>
	
</body>
</html>