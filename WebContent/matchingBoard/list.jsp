<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"  %>
     --%>
<!DOCTYPE>
<html>
<head>
<title>GuestBee 여행 매칭</title>
</head>
<div id = "old_alert"></div> <!-- 뒤로가기 -->
<div id = ""></div> <!-- 앞으로 -->
<div id = "header"></div> <!-- header 통합 header 붙여넣기 -->
<main id="main" role="main" class="page_Matching"> <!-- 본문 -->
  <div id = "matchingMain"> <!-- 카테고리 -->
	
	<h3 class="category">카테고리</h3>
	<ul class="area_list_unstyled"> <!-- 지역 카테고리 내용들 --> 
	::before <!-- 이건 뭘까?? -->
		<li class="cateBox"> <!-- 서울 -->
			<a href="/korea?area=Seoul&page=1" data-type="role" data-tag="서울" class>
				<span class="text">서울</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 부산 -->
			<a href="/korea?area=Busan&page=1" data-type="role" data-tag="부산" class>
				<span class="text">부산</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 인천 -->
			<a href="/korea?area=Incheon&page=1" data-type="role" data-tag="부산" class>
				<span class="text">인천</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 제주 -->
			<a href="/korea?area=Jeju&page=1" data-type="role" data-tag="부산" class>
				<span class="text">제주</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 경기도 -->
			<a href="/korea?area=Gyeonggi&page=1" data-type="role" data-tag="부산" class>
				<span class="text">경기도</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 강원도 -->
			<a href="/korea?area=Gangwon&page=1" data-type="role" data-tag="부산" class>
				<span class="text">강원도</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 충청북도 -->
			<a href="/korea?area=ChungcheongBuk&page=1" data-type="role" data-tag="부산" class>
				<span class="text">충청북도</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 충청남도 -->
			<a href="/korea?area=ChungcheongNam&page=1" data-type="role" data-tag="부산" class>
				<span class="text">부산</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 전라북도 -->
			<a href="/korea?area=JeollaBuk&page=1" data-type="role" data-tag="부산" class>
				<span class="text">부산</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 전라남도 -->
			<a href="/korea?area=JellaNam&page=1" data-type="role" data-tag="부산" class>
				<span class="text">전라남도</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 경상북도 -->
			<a href="/korea?area=GyeongsangBuk&page=1" data-type="role" data-tag="부산" class>
				<span class="text">경상북도</span>
			</a>
		</li>
		<li class="cateBox"> <!-- 경상남도 -->
			<a href="/korea?area=GyeongsangNam&page=1" data-type="role" data-tag="부산" class>
				<span class="text">경상남도</span>
			</a>
		</li>
	</ul>
	<div class="clearfix">
  		::before
  		::after
  	</div>
  </div>
  <div class="contents">  <!-- 본문에서 메인 -->
  	<div class="wrap">
  		<div class="main all">
  			<section class="section people">
  			<ul class="list_unstyled list clearfix"> <!-- 리스트 구조 정렬 -->
  			::before
  				<li>
  					<div class="card user more shadow" data-url="" itemscope itemtype="http://schema.org/Person"> <!-- url 태그 설정 / 내용 설정하기 -->
  						<div class="user thumb">
  							<div class="thumbnail">
  								<a href=""> <!-- 클릭하면 연결되는 주소 설정 -->
  									<img src="" alt class="img" itemprop="image">  <!-- 이미지 설정 -->
  								</a>
  							</div>
  						</div>
  						<div class="user_info">
  							<a href="" target="_blank" class="in" itemprop="url"> <!-- 이름을 클릭하면 해당 상세페이지로 넘어갈 수 있도록 -->
  								<p class="nowrap name" itemprop="name">즐거운 여행</p>  <!-- 유저 이름 혹은 여행 제목 -->
  							</a>
  							<p class="nowrap travelArea"></p> <!-- 카드 안의 지역표시 -->
  							<p class="nowrap kakaoID"></p> <!-- 카카오톡 아이디 -->
  						</div>
  						<div class="user_action">
  							<from method="d">
  							</from>
  						</div>
  					</div>
  				</li>
  			</ul>
  			</section>
  		</div>
  	</div>
  	<div class="clearfix">
  	</div>
  	<div></div>
  </div>
</main>
<body>

</body>
</html>