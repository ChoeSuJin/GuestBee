<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../main/header.jsp" %>
  
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

 <style>
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      height: 70%;
      margin: auto;
  }
 
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }  
  
  .slide
  </style>

</head>
<body>
<!-- 메인 상단 이미지 슬라이드 -->
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
      <img src="../image/busan.jpg" alt="busan" style="height:600px;">
      <div class="carousel-caption" align="center">
        <h2> "동행"</h2>
        <p>같은 여행지에서 새로운 인연을 만들고 싶을땐?게츠비에서 새로운 인연을 만들자!</p>
      </div> 
    </div>

    <div class="item" >
      <img src="../image/whale.jpg" alt="whale" style="height:600px;">
      <div class="carousel-caption">
        <h2>"숙박"</h2>
        <p>여러 사람들과 저렴하고 쾌적하게 즐기자!</p>
      </div> 
    </div>

    <div class="item">
      <img src="../image/flower.jpg" alt="flower" style="height:600px;">
      <div class="carousel-caption">
        <h2>"여행"</h2>
        <p>여행정보 공유하고 현지인에게 추천받아 숨어 있는 명소를 알아보자!</p>
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
<!-- 검색창 -->
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


<!-- Page content -->
<div class="w3-content w3-padding" style="max-width:1564px">
<!-- 인기 게스트하우스 추천 -->
  <!-- Project Section -->
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">인기 숙소 추천 </h3>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Seoul</div>
        <img src="../image/1.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Incheon</div>
        <img src="../image/2.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Daegu</div>
        <img src="../image/3.jpg" alt="House" style="width:100%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Busan</div>
        <img src="../image/4.jpg" alt="House" style="width:100%">
      </div>
    </div>
  </div>

  <div class="w3-row-padding">
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Daejeon</div>
        <img src="../image/5.jpg" alt="House" style="width:99%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Gwangju</div>
        <img src="../image/6.jpg" alt="House" style="width:99%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Ulsan</div>
        <img src="../image/7.jpg" alt="House" style="width:99%">
      </div>
    </div>
    <div class="w3-col l3 m6 w3-margin-bottom">
      <div class="w3-display-container">
        <div class="w3-display-topleft w3-black w3-padding">Jeju</div>
        <img src="../image/8.jpg" alt="House" style="width:99%">
      </div>
    </div>
  </div>

<!-- 인기 여행 지역 -->
<div class="w3-content w3-padding" style="max-width:1564px">
  <div class="w3-container w3-padding-32" id="projects">
    <h3 class="w3-border-bottom w3-border-light-grey w3-padding-16">인기 여행 지역 </h3>
  </div>

<div class="row text-center">
  <div class="col-sm-4">
    <div class="thumbnail">
      <img src="../image/a.jpg" alt="군산">
      <p><strong>군산</strong></p>
      <p>Tue. 04 April 2017</p>
      <button class="btn">자세히 보기</button>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="thumbnail">
      <img src="../image/b.jpg" alt="평양">
      <p><strong>평양</strong></p>
      <p>Sat. 28 November 2017</p>
      <button class="btn">자세히 보기</button>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="thumbnail">
      <img src="../image/c.jpg" alt="나주">
      <p><strong>나주</strong></p>
      <p>Sun. 12 November 2017</p>
      <button class="btn">자세히 보기</button>
    </div>
  </div>
  
</div>




<div class="container" align = "center">
  <h2>"동행"</h2>
  <p>같은 여행지에서 새로운 인연을 만들고 싶을땐?게츠비에서 새로운 인연을 만들자!</p>
  <p>게츠비에서 새로운 인연을 만들자! 동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라 만세. <br>
	무궁화 삼천리 화려강산 대한 사람, 대한으로 길이 보전하세 남산 위에 저 소나무, 철갑을 두른 듯 바람서리 <Br>
	불변함은 우리 기상일세. 무궁화 삼천리 화려강산 대한 사람, 대한으로 길이 보전하세!!!
  </p>
</div>

<!-- footer -->
  <%@ include file="../main/footer.jsp" %>
  
  
  <!-- 지역 검색 코드 -->
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