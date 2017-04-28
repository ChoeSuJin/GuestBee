 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jsp.member.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../main/header.jsp" %>


<!DOCTYPE>
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>ID 중복 확인</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

.checkid_wrap {
	width: 300px;
	height: 200px;
	float: left;
	background: #dbe9ef;
	overflow: hidden;
}

.checkid_wrap_inn {
	width: 260px;
	height: 100px;
	float: left;
	text-align: center;
	padding: 50px 20px;
}

p {
	font-size: 14px;
}

.sp {
	font-weight: bold;
	font-size:15px;
}

.btn {
	line-height:0em;
	margin-top: 40px;
	width: 130px;
	height: 30px;
	border-radius: 30px;
	background: #336799;
	text-align: center;
	border:0px solid #fff;
	border-bottom: 3px solid rgba(255, 255, 255, 0.5);
	color:#fff;
}
</style>

</head>
<body>

<c:set var="checkid" value="${requestScope.checkid}" />
<c:set var="id" value="${param.id}" />

<div class="checkid_wrap">
<c:if test="${checkid == true }">
	<div class="checkid_wrap_inn">	
		<p><span class="sp">${id}</span>는 <br /> 이미 사용중인 아이디 입니다.</p>
		<form action="confirmId.jsp" method="post" name="checkForm">
			<p>다른 아이디를 선택하세요</p>
			<input type="button" value="닫기" onclick="setid()" class="btn" >
		</form>
	</div>
</c:if>

<c:if test="${checkid == false }">
	<div class="checkid_wrap">
		<div class="checkid_wrap_inn">
		 	<p> 입력하신 <span class="sp">${id}</span>는 <br /> 사용하실 수 있는 ID 입니다 </p>
		 	<input type="button" value="닫기" onclick="setid()" class="btn" >
		</div>
	</div>
</c:if>
</body>
</html>


<script language="javascript">
	function setid(){
	opener.document.joinForm.m_id.value="<c:out value='${id}' />";
	opener.document.joinForm.m_check.value="<c:out value='${checkid}' />";
	self.close();
	}
	
	
</script>
 










