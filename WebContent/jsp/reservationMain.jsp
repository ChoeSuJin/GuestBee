<!DOCTYPE html>
<html>
<head>
	<title>ReservationMain</title>
	<link rel="stylesheet" type="text/css" href="../styles/reservationMain.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<script>
        // Select all tabs
		/*$('.nav-tabs a').click(function(){
    		$(this).tab('show');
		})*/
</script>

<body>

<!-- reservationMainImg -->
<!-- imgSize=1200*300 -->
<!-- <a href="http://www.naver.com">
	<div id="reservationMainImg">
	<b>reservationMainImg</b>
</div>
</a> -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active" width="1200px" height="500px">
      <img src="../image/busan.jpg" alt="busan" style="height:500px;">
      <div class="carousel-caption" align="center">
        <h2> Image1 </h2>
      </div> 
    </div>

    <div class="item" >
      <img src="../image/whale.jpg" alt="whale" style="height:500px;">
      <div class="carousel-caption">
        <h2> Image2 </h2>
      </div> 
    </div>

    <div class="item">
      <img src="../image/flower.jpg" alt="flower" style="height:500px;">
      <div class="carousel-caption">
        <h2> Image3 </h2>
      </div> 
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<div id="search">
	<form method="post" action="reservationResult.jsp">
		<!-- 지역은 modal 창으로 선택 -->
		<label name="region">지역 선택</label>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#regionCategory">Open Region</button> &nbsp;&nbsp;&nbsp;
		<label>날짜 선택 </label>
		<input type="date" name="date" value=""> &nbsp;&nbsp;&nbsp;
		<label>인원 수 </label>
		<input type="number" name="peopleNumber" value=0>
		<input type="submit" value="검색" class="btn btn-primary">
	</form>

</div>

<div id="imgList">
	<b>imgList</b>
</div>

<div id="regionCategory" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
     <div class="modal-body">
        <nav class="navbar navbar-default">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a data-target="#region1" id="region1-tab" role="tab" data-toggle="tab" aria-controls="region1" aria-expanded="false">서울</a></li>
			  <li role="presentation" class=""><a data-target="#region2" role="tab" id="region2-tab" data-toggle="tab" aria-controls="region2" aria-expanded="false">북부</a></li>
			  <li role="presentation" class=""><a data-target="#region3" role="tab" id="region3-tab" data-toggle="tab" aria-controls="region3" aria-expanded="false">중부</a></li>
			  <li role="presentation" class=""><a data-target="#region4" role="tab" id="region4-tab" data-toggle="tab" aria-controls="region4" aria-expanded="false">남부</a></li>
			</ul>
		</nav>
		<div class="tab-content" style="margin-top: 30px;">
			<div role="region1" class="tab-pane fade active in" id="region1" aria-labelledby="reegion1-tab">
				<div id="small">서울</div>
			</div>
			<div role="region2" class="tab-pane fade" id="region2" aria-labelledby="region2-tab">
				<div id="small">강원</div>
			</div>
			<div role="region3" class="tab-pane fade" id="region3" aria-labelledby="region3-tab">
				<div id="small">인천</div>
				<div id="small">경기</div>
				<div id="small">충북</div>
			</div>
			<div role="region4" class="tab-pane fade" id="region4" aria-labelledby="region4-tab">
				<div id="small">제주</div>
				<div id="small">경북</div>
				<div id="small">경남</div>
				<div id="small">충남</div>
				<div id="small">전남</div>
				<div id="small">전북</div>
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