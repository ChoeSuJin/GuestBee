<!DOCTYPE html5>
<html>
<head>
	<title>ReservationMain</title>
<link rel="stylesheet" type="text/css" href="../styles/reservationResult.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASVztrdloJZnO_e0YqCNGc3biQ8a7j-ZE&callback=initialize&language=ko" async defer></script>
</head>


<body>


<script>
     function initialize() {
        // Create a map object and specify the DOM element for display.
        var map = new google.maps.Map(document.getElementById("map"), {
          center: {lat: 37.402329, lng: 127.107062},
          scrollwheel: true,
          zoom: 16
        });
      }

</script>



<div id="searchCondition">
	<label>도시</label><input type="text" name="city" value="" placeholder="도시를 입력하세요.">	<br>
	<label>날짜</label><input type="date" name="date" placeholder=" "> <br>

	<label>가격범위</label>	<br>			<!-- 범위설정 -->
	<label>예약/결제방법</label>			<!-- checkbox -->
	<div class="checkbox">
      <label><input type="checkbox" name="notNow"> 현장결제 </label>
      <label><input type="checkbox" name="Now"> 즉시결제 </label>
    </div>
	<label>객실 시설</label>				<!-- 체크박스 -->
	<div class="checkbox">
      <label><input type="checkbox" name="private"> 개인실 </label>
      <label><input type="checkbox" name="shareToilet"> 공용화장실 </label>
      <label><input type="checkbox" name="wifi"> 와이파이 </label>
      <label><input type="checkbox" name="lateCheckIn"> 늦은 체크인 </label>
    </div>

	<input type="reset" value="검색 초기화">
	<input type="submit" value="검색">
</div>

<div id="map">
	
</div>
<div id="roomList">
	<b>roomList</b>
</div>



</body>
</html>