<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../main/header.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReservationMain</title>
<link rel="stylesheet" type="text/css" href="../styles/reservationMain.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
	$(document).ready(function() {
		$(".tab-content button").click(function() {
			var value = $(this).val();
			alert(value);
			$("#selectedRegion").val(value);
		});
	});
	
	
</script>

<style>
body {
	padding-top : 50px;
}
</style>

<body>

	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active" >
				<img src="img/reserve1.JPG" alt="busan"style="width:100%; height:500px;">
				<div class="carousel-caption" align="center">
					
				</div>
			</div>

			<div class="item">
				<img src="img/reserve2.JPG" alt="whale" style="width:100%; height:500px;">
				<div class="carousel-caption">
					
				</div>
			</div>

			<div class="item">
				<img src="img/reserve3.JPG" alt="flower" style="width:100%; height:500px;">
				<div class="carousel-caption">
					
				</div>
			</div>
		</div>

		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>


	<div id="search">
		<form method="post" action="ReservationMainAction.do">
			<!-- 지역은 modal 창으로 선택 -->
			<label name="region">지역 선택</label>
			<button type="button" class="btn btn-info btn-sm" data-toggle="modal"
				data-target="#regionCategory">Open Region</button>
			&nbsp;&nbsp;&nbsp;
			<input type="text" id="selectedRegion" name="region" value="" placeholder="지역을 선택합니다" readonly>&nbsp;&nbsp;&nbsp;
			<label>날짜 선택 </label>
			<input type="date" name="date" value="">&nbsp;&nbsp;&nbsp;
			<label>인원 수 </label><input type="number" name="people" value="0" min="0" max="100">
			<input type="submit" value="검색" class="btn btn-primary">
			<input type="reset" value="초기화" class="btn">
		</form>
	</div>

<div class="w3-content w3-padding" style="max-width:1564px; padding-top:0!important;  ">
<!-- 인기 게스트하우스 추천 -->
  <div class="w3-container w3-padding-32" id="projects" style="padding-top:0!important;">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16" style="padding-top:0!important;margin-top:0!important;">인기 숙소 추천 </h3>
  </div>

  <div class="w3-row-padding">
  <c:forEach var="List" items="${ list }" begin="0" end="4" step="1">
 
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-gray w3-padding">${ List.gh_Name }</div>
        <img src="img/gh/${ List.gh_Img1 }" alt="${ List.gh_Img1 }" style="width:300px; height:300px;">
      </div>
    </div>
     </c:forEach>
  </div>
</div>

	<!-- 지역 선택 모달창 -->
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