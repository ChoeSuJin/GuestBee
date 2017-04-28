<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
	<title>매칭 게시판 - 글쓰기</title>
	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/view/myStyle.css" rel="stylesheet" type="text/css">

<!-- 파일(이미지) 미리보기 --> 	
<script type="text/javascript"> function readURL(input) { if (input.files && input.files[0]) { var reader = new FileReader(); reader.onload = function (e) { $('#blah').attr('src', e.target.result); } reader.readAsDataURL(input.files[0]); } } </script>	
	
	<style type="text/css">
		#title{
			height : 16;
			font-family :'돋움';
			font-size : 12;			
			text-align :center;
		}
	</style>
	
</head>
<body>

<!-- 제목--------------------------------------------------->
	<h3 class="text-center"><font color="fed36b">GuestBee</font></h3>
	
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">GuestBeed와 함께 여행을</a></li>
		<li><a data-toggle="tab" href="#menu1">여행 꿀팁</a></li>
		<li><a data-toggle="tab" href="#menu2">여행 매칭 규정</a></li>
	</ul>

	<div class="tab-content">
		<div id="home" class="tab-pane fade in active">
			<h2>GuestBee와 함께 여행을 해보아요</h2>
			<p>이제는 혼자서만 하는 여행이 아닌 새로운 인연과 함께하는 여행</p>
			
		</div>
		<div id="menu1" class="tab-pane fade">
			<h2>GuestBee의 여행 꿀팁</h2>
			<p>첫째, GuestBee의 여행정보를 참고하여 여행지를 결정한다.</p>
			<p>둘째, GuestBee의 GuestHouse에서 숙박할 곳을 예약한다..</p>
			<p>셋째, GuestBee와 함께 여행할 사람을 정하여 함께 여행한다 </p>
		</div>
		<div id="menu2" class="tab-pane fade">
			<h2>GuestBee의 규정</h2>
			<p>제1조 (목적) : 이 약관은 (주)하나투어(이하 당사라 한다.)와 여행자가 체결한 국외여행계약의 세부 이행 및 준수사항을 정함을 목적으로 합니다.</p>
			<p>제2조(당사와 여행자 의무) :</p>
			<p>1. 당사는 여행자에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내,운송,숙박 등 여행계획의 수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다.
			<p>2. 여행자는 안전하고 즐거운 여행을 위하여 여행자간 화합도모 및 여행업자의 여행질서 유지에 적극 협조하여야 합니다.</p>
			<p>제4조(계약의 구성) :</p> 
			<p>① 여행계약은 여행계약서(붙임)와 여행약관·여행일정표(또는 여행 설명서)를 계약내용으로 합니다.</p>
			<p>② 여행일정표(또는 여행설명서)에는 여행일자별 여행지와 관광내용·교통수단·쇼핑횟수·숙박장소·식사 등 여행실시일정 및 여행사 제공 서비스 내용과 여행자 유의사항이 포함되어야 합니다.</p>

		</div>
	</div>
	<br>
<!-- ----------------------------------------------------------------------------- -->



	

<div class="container">
	<!-- <b><font size="6" color="gray" align="center">글쓰기</font></b> -->
	<br>
	
	<form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data">
	<div>
	<!-- 숨겨진 아이디 값 -->
	<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
	
	
	<!-- 글상자 + 사진 -->
	 <div class="container text-center" style="width: 1200px;">
	
		<b><font size="6" color="fed36b" align="center">GuestBee와 인연을</font></b>
		<p><em>We love people! We love world!</em></p>
		<p>The world is a book and those who do not travel read only one page. -St. Augustine</p>
		
		<br>
		
		<!-- 메인 + 사진 + 구글지도 ----------------------------------------------------------------->
		<!-- 글내용 상자 -->
		<div class="row" style="float:left; width: 60%;">
			<div class="matchingSubject">
					<!-- 매칭 제목 -->
					<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 제목 :</h3>
					<div class="m_p">
						<input type="text" size= "75" maxlength="70" name ="board_subject"/>
					</div>
				</div>
				<br>
				<hr>
				
				<div class="matchingSubTitle">
					<!-- 매칭 부제목 -->
					<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 인사 : </h3>
					<div class="m_p">
						<input type="text" size= "75" maxlength="70" name ="board_subtitle"/>
					</div>
				</div>
				<br>
				<hr>
				
				<div class="matchingLocal">
					<!-- 매칭 지역코드 -->
					
					<div class="m_p">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 지역 : </h3> 
					<select name="board_local" id="board_local">
					  <option value="">지역번호 선택</option>
	                  <option value="020">seoul(02)</option>
	                  <option value="051">Busan(051)</option>
	                  <option value="064">Jeju(064)</option>
	                  <option value="032">Incheon(032)</option>
	                  <option value="054">GyeongsangBuk(054)</option>
	                  <option value="055">GyeongsangNam(055)</option>
	                  <option value="041">ChungcheongNam(041)</option>
	                  <option value="043">ChungcheongBuk(043)</option>
	                  <option value="061">JellaNam(061)</option>
	                  <option value="063">JeollaBuk(063)</option>
	                  <option value="033">Gangwon(033)</option>
					</select>
					</div>
				</div>
				
				<br>
				<br>
				
				<hr>
								
				<div class="metchingPurpose">
					<!-- 매칭 목적 -->
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 목적 : </h3>
					<div class="m_p_text">
						<input type="text" size= "75" maxlength="70" name ="board_purpose"/>
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingcontent">
					<!-- 매칭자 소개 -->
					<div class="m_p">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 소개 :</h3>
						<!-- 추후 매칭자 아이디 불러오기  -->	
						<div>

						<h4 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*꿀벌 이름 : ${sessionScope.sessionID}</h4>
						</div>	
						
						<!-- 매칭자에 대한 긴 소개글 -->
						<div>
						<h4 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*꿀벌 정보</h4>
						<textarea rows="13" cols="75" name="board_content"></textarea>
						</div>
					</div>
				</div>
				<br>
				<hr>
	
				<div class="metchingCourse">
					<!-- 매칭 코스  -->
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭코스 : </h3>
					<div class="m_p_text" data-reactid="">
						<textarea rows="10" cols="75" name = "board_course"></textarea>
					</div>
				</div>
				<br>
				<hr>

				<div class="metchingPlace">
					<!-- 정확한 매칭 장소 -->
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장소 : </h3>
					<div class="m_p_text">
						<input type="text" size= "75" maxlength="70" name ="board_place"/>
					</div>
				</div>
				<br>
				<hr>

				<div class="metchingNoted">
					<!-- 준비물 -->
					<div class="m_noted">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;준비물 & 참고사항 : </h3>
					</div>
					<div class="m_p_text">
						<textarea rows="8" cols="75" name = "board_noted"></textarea>
					</div>
				</div>
				<br>
				<hr>
				<br>
			
		
		</div>
		<!-- 사진 업로드칸 ------------------------------------------------------------------->
		<div style="float:left; width: 30%;" >  <!-- 높이 조정하기 -->
			<!-- 쥔장 사진 -->
			
			<div class="row" style="float: right;" data-reactid="">
				<p><h3>
					<font color="lightgray"> ex) 꿀벌</font>
				</h3></p>
				<!-- 사진상자 -->
				<!-- 업로드 사진 띄어주기 -->
			<!-- <form id="form1" runat="server"> -->
				<input type="file" name="board_file" onchange="readURL(this);" /><br>
				<img id="blah" src="../../img/bee.jpg" alt="your image"	style="width: 395px; height: 500px;"/>
					
			<!-- </form>	 -->	
			</div>
			<div style="float:right;">  <!-- fileUploadPro와 writepro와 연계가 가능할 듯 생각해보기 -->
				 
			</div>
			
		</div>
		
	 </div>	
		<div id = "button" align="center" style="width: 1100px;">
				<input type="reset" value="작성취소" />
				<input type="submit" value="등록" />
				
				<!-- 목록버튼 -->
				<input type="button" value="목록" action="BoardListAction.bo"/>			
		</div>
	
	</div>
	</form>
	</div>
</div>
</body>
</html>