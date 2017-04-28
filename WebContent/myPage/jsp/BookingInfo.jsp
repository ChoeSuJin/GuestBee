<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.guestbee.member.model.ReservationInfoBean"%>
<%@ page import="com.guestbee.member.model.MemberDAO"%>
<%@ include file="../../main/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>



<!DOCTYPE html5>
<html>
<head>
<title>Insert title here</title>

<!-- table -->





<!-- side bar -->
<style type="text/css">
#navigation {
	font-size: 0.75em;
	width: 150px;
	padding: 5px;
	
	margin-left:80px;/* sidebar의 margin------------조정---------------- */
	margin-top:100px;/* sidebar의 margin------------조정---------------- */

	float : left;/* ------------조정---------------- */	
}

#navigation ul {
	margin: 0px;
	padding: 0px;
}

#navigation li {
	list-style: none;
}

ul.top-level {
	background: #fff;
}

ul.top-level li {
	margin: 0 0 3px 0;
	border: solid 1px #cccccc;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#navigation a {
	color: #666;
	cursor: pointer;
	display: block;
	height: 25px;
	line-height: 25px;
	text-indent: 10px;
	text-decoration: none;
	width: 100%;
}

#navigation a:hover {
	text-decoration: none;
}

#navigation li:hover {
	background: #fed36b;
	position: relative;
}

ul.sub-level {
	display: none;
}

li:hover .sub-level {
	background: #fff;
	border: #fff solid;
	border-width: 1px;
	display: block;
	position: absolute;
	left: 150px;
	top: 5px;
}

ul.sub-level li {
	border: none;
	float: left;
	width: 150px;
}

/************ Second Level ****************/
#navigation .sub-level {
	background: #fff;
	border: solid 1px #cccccc;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}

/************ Third Level ****************/
#navigation .sub-level .sub-level {
	background: #fff;
	margin: 0 1px 0 0;
}

/* Display one level after another */
li:hover .sub-level .sub-level {
	display: none;
}

.sub-level li:hover .sub-level {
	display: block;
}
</style>






<!-- table -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
#table tr:hover {
	background: #fed36b; /*색깔 변경 */
	position: relative;
}
</style>







</head>
<body>


<div style="margin-bottom:100px;"> <!-- ----------조정 -->
	<div id="navigation" >  
   		<ul class="top-level">
   
   			<li><a href="#">나의 계정</a></li>
   			<li><a href="BookingInfoForm.do" style="cursor:hand;">예약 내역</a></li>   <!-- ----------조정 -->
   			<li><a href="MemberModifyFormAction.do"  style="cursor:hand;">회원 정보 수정</a></li>
       		<li><a href="MatchingInfo.do"  style="cursor:hand;">회원 탈퇴</a></li>
   		</ul>
	</div>
	<!-- <div style="margin-left:180px;">
  <h2>예약 내역</h2>
  <p>Hover over the buttons in the left side navigation to open them.</p>
</div>
 -->

			<div id="table" class="container" style="margin-left:300px; margin-top:100px; ">
				<h2>예약 내역</h2>
				<p>최근 1 년간 예약 내역입니다.</p>
				<table style="cursor: hand;" class="table table-hover">
					<thead>
						<tr>
							<th>숙소명</th>
							<th>숙소 위치</th>
							<th>여행일</th>
							<th>예약가</th>
							<th>예약인원</th>
						</tr>
					</thead>
				
				<tbody>

					<c:forEach var="list" items="${ list }">

						<tr>
							<!-- ---------------------------------------클릭하면 상세페이지로 가도록  -->


							<td>${ list.ri_name }</td>
							<td>${ list.ri_local }</td>
							<td>${ list.ri_date }</td>
							<td>${ list.ri_price }</td>
							<td>${ list.ri_people }</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</div>

</div>




</body>
</html>