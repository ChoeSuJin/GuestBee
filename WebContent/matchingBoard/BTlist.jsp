<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
  <title>Bootstrap Theme The Band</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=karma">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/view/myStyle.css" rel="stylesheet" type="text/css">	
	
	<style >
	   .ul{margin: 0 auto;
    text-align: center;
    width: 1200px;
    } 
	</style>
</head>
<body>

	<!-- 메인 사진 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="../image/matching1.jpg" alt="MatchingBook1" style=height:500px; width=100%;>  <!-- 매칭시스템 1번째 사진 -->
      <div class="carousel-caption">
        <h3>서울에서도 매칭</h3>
        <p>게스트비와 함께 새로운 인연과 여행을!</p>
      </div> 
    </div>

    <div class="item">
      <img src="../image/matching2.jpg" alt="MatchingBook2" style=height:500px; width=100%;> <!-- 매칭시스템 2번째 사진 -->
      <div class="carousel-caption">
        <h3>부산에서도 매칭</h3>
        <p>Thank you, GuestBee - A night we won't forget.</p>
      </div> 
    </div>

    <div class="item">
      <img src="../image/matching3.jpg" alt="MatchingBook3" style=height:500px; width=100%;> <!-- 매칭시스템 3번째 사진 -->
      <div class="carousel-caption">
        <h3>어디서든지매칭</h3>
        <p>Even though the traffic was a mess, we had the best time.</p>
      </div> 
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- 메인사진과 글씨사이 -->
<div class="container text-center">
  <h3>GuestBee의 여행매칭</h3>
  <p><em>만나서 반가워요</em></p>
  <p>혼자만 다녀왔던 여행 GuestBee와 함께 새로운 친구와 함께해요</p>
  <br>

<!-- 카테고리 -->
<!-- main-mid-area -->
<div id = "matchingMain"> 
	
	<!-- <h3> class="category">카테고리</h3> -->
	<ul class="area_list" data-toggle="tab-hover" > <!-- 지역 카테고리 내용들 --> 
	::before <!-- 이건 뭘까?? -->
	
		<!-- 리스트 옆으로 정렬되게 수정하기 -->
		<li class="cateBox"> <!-- 서울 -->
			<a href="#matching link 1" onclick="location.href='/localMain/localList.jsp?category=020';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				서울</a>
		</li>
		<li class="cateBox"> <!-- 부산 -->
			<a href="#matching link 2" onclick="location.href='/localMain/localList.jsp?category=051';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				부산</a>
		</li>
		<li class="cateBox"> <!-- 제주 -->
			<a href="#matching link 4" onclick="location.href='/localMain/localList.jsp?category=064';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				제주</a>
		</li>
		<li class="cateBox"> <!-- 경기도 -->
			<a href="#matching link 5" onclick="location.href='/localMain/localList.jsp?category=031';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				경기도</a>
		</li>
		<li class="cateBox"> <!-- 강원도 -->
			<a href="#matching link 6" onclick="location.href='/localMain/localList.jsp?category=033';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				강원도</a>
		</li>
		<li class="cateBox"> <!-- 충청북도 -->
			<a href="#matching link 7" onclick="location.href='/localMain/localList.jsp?category=043';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				충청북도</a>
		</li>
		<li class="cateBox"> <!-- 충청남도 -->
			<a href="#matching link 8" onclick="location.href='/localMain/localList.jsp?category=041';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				충청남도</a>
		</li>
		<li class="cateBox"> <!-- 전라북도 -->
			<a href="#matching link 9" onclick="location.href='/localMain/localList.jsp?category=063';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				전라북도</a>
		</li>
		<li class="cateBox"> <!-- 전라남도 -->
			<a href="#matching link 10" onclick="location.href='/localMain/localList.jspcategory=061';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				전라남도</a>
		</li>
		<li class="cateBox"> <!-- 경상북도 -->
			<a href="#matching link 11" onclick="location.href='/localMain/localList.jsp?category=054';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				경상북도</a>
		</li>
		<li class="cateBox"> <!-- 경상남도 -->
			<a href="#matching link 12" onclick="location.href='/localMain/localList.jsp?category=055';" 
			data-toggle="tab" aria-expanded="true"> <!-- 링크타는거 수정필요 -->
				경상남도</a>
		</li>
		<li class="other"> <!-- 전체지역보기 -->
			<a href="javascript:showNationList('#category_001');"> <!-- 링크타는거 수정필요 -->
				전체지역보기 + </a>
		</li>  <!-- 전체보기 기능구현해보기 -->
	</ul>
	<div class="clearfix">
  		::before
  		::after
  	</div>
  


  
 <!-- 전체 메인 메뉴 -->
  <div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
   
   <h3 align="left">인기여행</h3>
   <!-- Hot matching page -->
  	<div class="w3-rowpadding w3-padding-16 we-center" id="people">
  		<div class="w3-quarter">
  			<img src="../image/031/6.jpg" alt="metching1" style="width:93%; height:42%;" > <!-- 매칭 첫번째 사진 -->
  			<h4>젊음과 함께하는 자전거 여행</h4>
  			<p>경기도 양평</p>
  			<p>나이 : 23~30살</p>
  			<p>나이는 28 젊음의 여행 봄날을 함께 보낼 좋은 인연을 구해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/051/1.jpg" alt="metching1" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>부산의 먹방여행!</h4>
  			<p>부산광역시</p>
  			<p>나이 : 22~28살</p>
  			<p>부산은 역시 먹방 혼밥도 좋지만 함께할 인연을 구해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/064/3.jpg" alt="metching1" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>제주도에서 봄을 즐겨요</h4>
  			<p>제주도</p>
  			<p>나이 : 20~22살</p>
  			<p>새내기 대학생들의 배낭여행 함께해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/031/7.jpg" alt="metching1" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>판교 알콜여행</h4>
  			<p>경기도 분당구</p>
  			<p>나이 : 28살</p>
  			<p>판교에서 맛있는 술집을 찾으러 다닙시다~ 승규야~</p>
  		</div>
  		
  		::after
  	</div>
  	
  	<br/>
  	<h3 align="left">경기도</h3>
  	<!-- Second matching page -->
  	<div class="w3-rowpadding w3-padding-16 we-center" id="people">
  		<div class="w3-quarter">
  			<img src="../image/031/8.jpg" alt="metching2" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>네일로 여행</h4>
  			<p>경기도~부산</p>
  			<p>나이 : 23~30살</p>
  			<p>나이는 28 젊음의 여행 봄날을 함께 보낼 좋은 인연을 구해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/031/2.jpg" alt="metching2" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>경기도의 딸기여행!</h4>
  			<p>경기도 양평</p>
  			<p>나이 : 22~28살</p>
  			<p>경기도 양평으로 딸기따러 가요~</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/031/3.jpg" alt="metching2" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>경기도에서 봄을 즐겨요</h4>
  			<p>경기도</p>
  			<p>나이 : 20~22살</p>
  			<p>새내기 대학생들의 배낭여행 함께해요 </p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/031/1.jpg" alt="metching2" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>경기도 청평 여행</h4>
  			<p>경기도 청평</p>
  			<p>나이 : 28살</p>
  			<p>한적한 곳에서 사색을 즐겨 보아요~~~~~~~~~~~~~~~</p>
  		</div>
  		::after
  	</div>
  
  <h3 align="left">부산</h3>
  		<!-- third matching page -->
  	<div class="w3-rowpadding w3-padding-16 we-center" id="people">
  		<div class="w3-quarter">
  			<img src="../image/051/2.jpg" alt="metching3" style="width:93%; height:42%;" > <!-- 매칭 첫번째 사진 -->
  			<h4>네일로 여행</h4>
  			<p>경기도~부산</p>
  			<p>나이 : 23~30살</p>
  			<p>나이는 28 젊음의 여행 봄날을 함께 보낼 좋은 인연을 구해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/051/eat6.jpg" alt="metching3" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>경기도의 먹방여행!</h4>
  			<p>경기도 양평</p>
  			<p>나이 : 22~28살</p>
  			<p>부산은 역시 먹방 혼밥도 좋지만 함께할 인연을 구해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/051/3.jpg" alt="metching3" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>경기도에서 봄을 즐겨요</h4>
  			<p>경기도</p>
  			<p>나이 : 20~22살</p>
  			<p>새내기 대학생들의 배낭여행 함께해요 ㅎㅎ</p>
  		</div>
  		<div class="w3-quarter">
  			<img src="../image/051/4.jpg" alt="metching3" style="width:93%; height:42%;"> <!-- 매칭 첫번째 사진 -->
  			<h4>경기도 알콜여행</h4>
  			<p>경기도 분당구</p>
  			<p>나이 : 28살</p>
  			<p>판교에서 맛있는 술집을 찾으러 다닙시다~ 승규야~</p>
  		</div>
  		::after
  	</div>
  	</div>
  </div>
</div>

<!-- 상단으로 이동 -->
<div id="quickMenu" class="quick b_iblock" style="display:none">
<a href="#container" class="icon_top" onclick="scrollMove('#hd');return false;">상단으로이동</a>
</div>
</body>
</html>