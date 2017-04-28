<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ include file="../../main/header.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>admin 로그인</title>
</head>
<style>
body {
padding-top : 50px;
}
</style>
<body>
<c:if test="${ check eq false }">
<script>
	alert("아이디나 비밀번호가 일치하지 않습니다.");
</script>
</c:if>

<c:if test="${ sessionId == null }">

<c:if test="${ check eq false }">
<script>
	alert("아이디나 비밀번호가 일치하지 않습니다.");
</script>
</c:if>

<h2>관리자 로그인</h2>
<form action="AdminLoginProAction.do" method="post">
	
	관리자 ID<input type="text" name="id" placeholder="아디를 입력하세요"><br/>
 	PASSWORD<input type="text" name="pwd" placeholder="비번을 입력하세요">
	<input type="submit" value="login"/>
	
</form>
</c:if>

<c:if test="${ sessionId != null }">
<h3>${ sessionId }님 환영합니당!</h3>
<form action="AdminLogout.do">
	<input type="submit" value="logout">
</form>
</c:if>

</body>
</html>