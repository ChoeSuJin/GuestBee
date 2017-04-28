<%@page import="com.guestbee.InfoModel.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
    <%@ include file="../../main/header.jsp" %>
<link href="../css/Mycss.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	padding-top: 50px;
}

.icon-bar {
	width: 100%;
	background-color: #555;
	overflow: auto;
}

.icon-bar a {
	float: left;
	width: 20%;
	text-align: center;
	padding: 12px 0;
	transition: all 0.3s ease;
	color: white;
	font-size: 23px;
}

.icon-bar a:hover {
	background-color: #000;
}

.active {
	background-color: #4CAF50 !important;
}
</style>

<title>InformationDetail</title>
<meta charset="UTF-8">
</head>
<body>

	<div class="icon-bar">
		<a class="active" href="#">Information</a> <a href="#info1">Review</a> <a href="#info2">comment</a>
	</div>
	<br>
	<!-- 코멘트페이지 코드 -->
	<div  class="container"  style="margin-left: 70px; margin-right: 70px;">
		<div class="row" style="float: left;" >
		<div style="border: 2px solid black; padding: 10px; float: left; width: 1200px;">
		<div style="width:40%; float:left;">
			<img style=" float:left; height:40%; width:100%" src="/GuestBee/info/${DetailList.b_Img1 }" />
			<br/><br/>
			<div style="margin-top: 25%; width:100%; ">
			<img style="float:left; width: 25%; height:25%;" src="/GuestBee/info/${DetailList.b_Img2 }"/>
			<img style="float:left; width: 25%; height:25%;" src="/GuestBee/info/${DetailList.b_Img3 }"/>
			<img style="float:left; width: 25%; height:25%;" src="/GuestBee/info/${DetailList.b_Img4 }"/>
			<img style="float:left; width: 25%; height:25%;" src="/GuestBee/info/${DetailList.b_Img5 }"/>
			</div>
		</div>
		<div id="information" style="width:60%;float:right; margin-top: 70px; padding-left: 50px;">
			<h2>${ DetailList.b_Name }</h2>
			<p>영업시간 : 연중무휴(오전 11시~오후11시)</p>
			<p>주소 : ${ DetailList.b_Address }</p>
			<p>
				홈페이지 : <a href="http://www.theminda.com/spot/view.php?spotno=739">http://tabelog.com/kr/osaka/A2701/A270202/27087004/</a>
			</p>
		</div>

		<br><br>
		<h1 id="info1" style="margin-top:40%;">Review</h1>
		<pre>
	<text>${DetailList.b_Content }</text>

  </pre>
	</div>
	
		
			
		</div>
		<div class="row" style="margin-top: 100px;">
		<div id="info2" style="border: 1px solid black; padding: 10px; float: left; width: 1200px;">
			
			<h3>comment</h3>
				<form action="writePro.do" method="post">
					<div class="form-group">
						<input name="b_BoardNum" type="hidden" value="${contentNum}">
						<input name="r_BoardNum" type="hidden" value="5"> 
						
						Name: <input type="text" name="r_UserID" placeholder="이름을 입력하세요">
					</div>
					<div class="form-group">
						 <input type="hidden" name="r_Password"
							value="1">
					</div>
					<div>
						<textarea rows="20" cols="130" name="r_content" placeholder="내용을 작성하세요"></textarea>
					</div>
					<div>
						<input name="r_Date" type="hidden">
					</div>
					<input type="submit"  value="댓글 입력" class="btn btn-success green">
				</form>
			</div>
</div>
.
			<div class="row">
				<table class="table table-condensed">
					<c:forEach var="list" items="${ReplyList}">
						<tr>
							
							<td>날짜: ${list.r_Date}</td>
							<td>이름: ${list.r_UserID}</td>
							<td>내용: ${list.r_content}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

	

</body>
</html>