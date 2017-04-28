<%@ page import="com.guestbee.signup.model.* "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ include file="../../main/header.jsp" %>
    
<!DOCTYPE>
<html>
<head>
<title>관리자 수정 페이지</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
body {
padding-top : 50px;
}
</style>
<body>

<c:if test="${ update eq true }">
	<script>
		alert("정보가 성공적으로 수정되었습니다.");
	</script>
</c:if>


<div class="container">
  <h2>관리자 페이지</h2>
  <p>${ sessionId }님 환영합니다^ㅡ^♥</p>            
	<tr>
		<td>
			<form action="ReservationFormAction.do" method="post" >
			<input type="submit" value="reservation">
			</form>
		</td>
		<td>	 
 	 		<form action="AdminLogout.do" method="post" style="float:left;">
			<input type="submit" value="logout">
			</form>
		</td>
	</tr>
	
<table class="table table-striped">
<form action="AdminUpdatePro.do" method="post" name="updateform" >
	<tr>
		<td>숙소ID</td>
		<td><input type="text" name="gh_ID" value="${ vo.gh_ID }" readonly></td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="gh_PW" value="${ vo.gh_PW }"></td>
	</tr> 
	
	<tr>
		<td>숙소 이름</td>
		<td><input type="text" name="gh_Name" value="${ vo.gh_Name }"></td>
	</tr> 
	
	<tr>
		<td>지역</td>
		<td><input type="text" name="gh_Local" value="${ vo.gh_Local }"></td>
	</tr> 	
	
	<tr>
		<td>사진1</td>
		<td><input type="text" name="gh_Img1" value="${ vo.gh_Img1 }"></td>
	</tr> 		
	
	<tr>
		<td>와이파이</td>
		<td><input type="text" name="gh_Wifi" value="${ vo.gh_Wifi }"></td>
	</tr> 
	
	<tr>
		<td>공용화장실</td>
		<td><input type="text" name="gh_ShareToilet" value="${ vo.gh_ShareToilet }"></td>
	</tr> 
	
	<tr>
		<td>개인실</td>
		<td><input type="text" name="gh_PrivateRoom" value="${ vo.gh_PrivateRoom }"></td>
	</tr> 
	
	<tr>
		<td>늦은체크인</td>
		<td><input type="text" name="gh_LateCheck" value="${ vo.gh_LateCheck }"></td>
	</tr> 
	
	<tr>
		<td>경도</td>
		<td><input type="text" name="gh_Longitude" value="${ vo.gh_Longitude }"></td>
	</tr> 
	
	<tr>
		<td>위도</td>
		<td><input type="text" name="gh_Latitude" value="${ vo.gh_Latitude }"></td>
	</tr> 
	
	<tr>
		<td>수용인원</td>
		<td><input type="text" name="gh_TotalPeople" value="${ vo.gh_TotalPeople }"></td>
	</tr> 
	
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="gh_Phone" value="${ vo.gh_Phone }"></td>
	</tr> 

	<tr>
		<td>가격</td>
		<td><input type="text" name="gh_Price" value="${ vo.gh_Price }"></td>
	</tr> 
	
	<tr>
		<td><input type="submit" value="update"></td>
	</tr>
		
</table>
</div>
</form>
</body>
</html>