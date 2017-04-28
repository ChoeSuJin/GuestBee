<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.guestbee.signup.model.* "%>
<%@ page import="java.util.* "%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ include file="../../main/header.jsp" %>
<!DOCTYPE>
<html>
<head>
<title>ReservationList</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
th, td {
	text-align: center;
}
body {
padding-top : 50px;
}
</style>
<body>

<h2>관리자 페이지</h2>
  <p>${ sessionId }님 환영합니다^ㅡ^♥</p>   

<h2><form action="AdminLogout.do" method="post"></h2>
	<input type="submit" value="logout">
</form>
<table class="table table-striped">
	<th> 순번 </th>
	<th>날짜 </th>
	<th>가격</th>
	<th>인원</th>
	<th>예약자ID</th>
	<c:forEach var="list" items="${ list }">
	
	<tr>
		<td>${ list.ri_num }</td>
		
		<td>${ list.ri_Date }</td>

		
		<td>${ list.ri_Price }</td>

		
		<td>${ list.ri_People }</td>

		
		<td>${ list.ri_UserID }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>