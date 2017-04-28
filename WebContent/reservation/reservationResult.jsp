<%@page import="com.guestbee.reservation.model.*"%>
<%@page import="com.guestbee.reservation.action.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ include file="../../main/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>ReservationMain</title>
<link rel="stylesheet" type="text/css"
	href="../styles/reservationResult.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASVztrdloJZnO_e0YqCNGc3biQ8a7j-ZE&callback=set&language=ko"
	async defer></script>
</head>
<style>
.roomInfo {
	width: 600px;
	height: 150px;
}

#searchCondition {
	padding: 10px;
	border: 1px gray solid;
	width: 690px;
	height: 300px;
	float: left;
}

#roomList {
	padding: 10px;
	width: 690px;
	border: 1px gray solid;
	float: left;
	margin: 0 auto;
}

#map {
	width: 600px;
	height: 600px;
	border: 1px gray solid;
	float: right;
	margin: 0 auto;
}
body {
	padding-top: 50px;
}
</style>
<script>

function set(longitude, latitude) {
	
	var lng = Number(longitude);
	var lat = Number(latitude);
	var cent = {lat: lat, lng: lng};

    var map = new google.maps.Map(document.getElementById("map"), {
      center: cent,
      scrollwheel: true,
      zoom: 16
    });
    
    var marker = new google.maps.Marker({
        position: cent,
        map: map
      });
}
	
	$(document).ready(function() {
		$(".tab-content button").click(function() {
			var value = $(this).val();
			$("#selectedRegion").val(value);
		});
		
		var myImage = $("img");
		 myImage.onerror = function() {
		      this.src="error.png";
		 }
		
	});
	
</script>

<body>

	<label id="userId" value=${ user_id } />

	<form action="ReservationResultAction.do" method="post">
		<div id="searchCondition">
			<label>도시</label> &nbsp; &nbsp; &nbsp;
			<input type="text"
				id="selectedRegion" name="region" value="${ local }"
				placeholder="지역을 선택합니다" readonly>
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal"
				data-target="#regionCategory">Open Region</button>
			<br> <label>날짜</label> <input type="date" name="date"
				value="${ date }" placeholder=" "> <br>

			<!-- 체크박스 -->
			<div class="checkbox">
				<label><input type="checkbox" name="special" value="private">
					개인실 </label> <label><input type="checkbox" name="special"
					value="shareToilet"> 공용화장실 </label> <label><input
					type="checkbox" name="special" value="wifi"> 와이파이 </label> <label><input
					type="checkbox" name="special" value="lateCheckIn"> 늦은 체크인
				</label>
			</div>

			<label>인원 수 </label> <input type="number" name="people"
				value="${ people }" min="0" max="100"> <input type="reset"
				value="검색 초기화"> <input type="submit" value="검색">
		</div>
	</form>

	<c:set var="tag" value="${ '#' }" />
	<div id="map"></div>
	<div id="roomList" class="container">
		<b>roomList</b>

		<c:forEach var="list" items="${ list }" step="1">
			<div id="room" class="well well-lg">
				<div id="textInfo" class="roomInfo" style="width:400px; height:auto; display: inline-block;">


					<label id="name" value="${ list.gh_Name }" </label>

					<text onmouseover="set(${list.gh_Longitude}, ${ list.gh_Latitude });">
					<h3>${ list.gh_Name }</h3>
					</text>
					<text>${ list.gh_Local }</text>
					<br>
					<text>${ list.gh_totalPeople }</text>
					<br>
					<text>${ list.gh_phone }</text>
					<br> <label value="${ list.gh_ID }"></label>
					
					<div id="${ list.gh_Name }" class="modal fade" role="dialog">
						<!-- modal start -->
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-body">

									<h3>${ list.gh_Name }</h3>
									<text>${ date }</text>
									<br>
									<text>${ people }명</text>
									<br>
									<text>1박 요금 ${ list.gh_Price }원</text>
									<br>
									<text>지역 ${ list.gh_Local }</text>
									예약하시겠습니까?
								</div>
								<div class="modal-footer">
									<form action="ReservationConfirmAction.do" method="post">
										<input type="hidden" name="date" value="${ date }"> <input
											type="hidden" name="user_id" value="${ sessionID }">
										<input type="hidden" name="gh_ID" value="${ list.gh_ID }">
										<input type="hidden" name="people" value="${ people }">
										<input type="hidden" name="price" value="${ list.gh_Price }">
										<input type="hidden" name="ri_name" value="${ list.gh_Name }">
										<input type="hidden" name="local" value="${ list.gh_Local }">
										<input type="submit" value="confirm" class="btn btn-success">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
									</form>
								</div>

							</div>
						</div>
					</div>
					<!-- modal end -->
				</div>
				<c:set var="imgPath" value="${ 'E:/JSP/GuestBee/WebContent/img/gh/' }"></c:set>
				<div id="imgInfo" style="float: right; size: auto;">
					<img id="${ list.gh_Name }" alt="${ list.gh_Name }" src="img/gh/${ list.gh_Img1 }"> <br>
					<button style="float: bottom; margin-top: 15px;" type="button" id="reserve" class="btn btn-info btn-sm"
						data-toggle="modal" data-target="${ tag }${ list.gh_Name }">예약하기</button>
				</div>
					


			</div>
			
			
		</c:forEach>

	</div>

	<div id="regionCategory" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<nav class="navbar navbar-default">
						<ul id="myTab" class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a
								data-target="#region1" id="region1-tab" role="tab"
								data-toggle="tab" aria-controls="region1" aria-expanded="false">서울</a></li>
							<li role="presentation" class=""><a data-target="#region2"
								role="tab" id="region2-tab" data-toggle="tab"
								aria-controls="region2" aria-expanded="false">북부</a></li>
							<li role="presentation" class=""><a data-target="#region3"
								role="tab" id="region3-tab" data-toggle="tab"
								aria-controls="region3" aria-expanded="false">중부</a></li>
							<li role="presentation" class=""><a data-target="#region4"
								role="tab" id="region4-tab" data-toggle="tab"
								aria-controls="region4" aria-expanded="false">남부</a></li>
						</ul>
					</nav>
					<div class="tab-content" style="margin-top: 30px;">
						<div role="region1" class="tab-pane fade active in" id="region1"
							aria-labelledby="reegion1-tab">
							<button name="서울" value="seoul" id="seoul"
								class="btn btn-info btn-lg region" data-dismiss="modal">서울</button>

						</div>
						<div role="region2" class="tab-pane fade" id="region2"
							aria-labelledby="region2-tab">
							<button name="강원" value="Gangwon" id="Gangwon"
								class="btn btn-info btn-lg region" data-dismiss="modal">강원</button>
						</div>
						<div role="region3" class="tab-pane fade" id="region3"
							aria-labelledby="region3-tab">
							<button name="인천" value="Incheon" id="Incheon"
								class="btn btn-info btn-lg region" data-dismiss="modal">인천</button>
							<button name="경기" value="Gyeonggi" id="Gyeonggi"
								class="btn btn-info btn-lg region" data-dismiss="modal">경기</button>
							<button name="충북" value="ChungcheonBuk" id="ChungcheonBuk"
								class="btn btn-info btn-lg region" data-dismiss="modal">충북</button>
						</div>
						<div role="region4" class="tab-pane fade" id="region4"
							aria-labelledby="region4-tab">
							<button name="제주" value="Jeju" id="Jeju"
								class="btn btn-info btn-lg region" data-dismiss="modal">제주</button>
							<button name="경북" value="GyeongsangBuk" id="GyeongsangBuk"
								class="btn btn-info btn-lg region" data-dismiss="modal">경북</button>
							<button name="경남" value="GyeongsangNam" id="GyeongsangNam"
								class="btn btn-info btn-lg region" data-dismiss="modal">경남</button>
							<button name="충남" value="ChungcheonNam" id="ChungcheonNam"
								class="btn btn-info btn-lg region" data-dismiss="modal">충남</button>
							<button name="전남" value="JellaNam" id="JellaNam"
								class="btn btn-info btn-lg region" data-dismiss="modal">전남</button>
							<button name="전북" value="JeollaBuk" id="JeollaBuk"
								class="btn btn-info btn-lg region" data-dismiss="modal">전북</button>
							<button name="부산" value="Busan" id="Busan"
								class="btn btn-info btn-lg region" data-dismiss="modal">부산</button>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>





</body>
</html>