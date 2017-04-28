<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ include file="../../main/header.jsp" %>
<html>
<head>
<title>전체 게시글</title>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=karma">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/view/myStyle.css" rel="stylesheet" type="text/css">



<!-- <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        #topForm{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #bList{
            text-align :center;
        }
    </style> -->

	<script type="text/javascript">
        function writeForm(){
            location.href="BoardWriteForm.bo";
        }
    </script>

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
				<img src="/GuestBee/matching/board/matching5.jpg" alt="MatchingBook1"
					style="height: 500px;" width=100%;>
				<!-- 매칭시스템 1번째 사진 -->
				<div class="carousel-caption">
					<h3>서울에서도 매칭</h3>
					<p>게스트비와 함께 새로운 인연과 여행을!</p>
				</div>
			</div>

			<div class="item">
				<img src="/GuestBee/matching/board/matching7.jpg" alt="MatchingBook2"
					style="height: 500px;" width=100%;>
				<!-- 매칭시스템 2번째 사진 -->
				<div class="carousel-caption">
					<h3>부산에서도 매칭</h3>
					<p>Thank you, GuestBee - A night we won't forget.</p>
				</div>
			</div>

			<div class="item">
				<img src="/GuestBee/matching/board/matching3.jpg" alt="MatchingBook3"
					style="height: 500px;" width=100%;>
				<!-- 매칭시스템 3번째 사진 -->
				<div class="carousel-caption">
					<h3>어디서든지매칭</h3>
					<p>Even though the traffic was a mess, we had the best time.</p>
				</div>
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<!-- 메인사진과 글씨사이 -->
	<div class="container text-center" style="width: 100%;" align="center">
	<br/><br/>
		<b><font size="6" color="fed36b" align="center">GuestBee의 여행매칭</font></b>
		<p>
			<em>만나서 반가워요</em>
		</p>
		<p>혼자만 다녀왔던 여행 GuestBee와 함께 새로운 친구와 함께해요</p>
		<br>


		<!-- 상단 지역코드 -->

		<div style="width: 100%;">
			<div id="regionCategory" class="modal fade" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<nav class="navbar navbar-default">
								<ul id="myTab" class="nav nav-tabs" role="tablist">
									<li role="presentation" class="active"><a
										data-target="#region1" id="region1-tab" role="tab"
										data-toggle="tab" aria-controls="region1"
										aria-expanded="false">서울</a></li>
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
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=020'">서울</button>

								</div>
								<div role="region2" class="tab-pane fade" id="region2"
									aria-labelledby="region2-tab">
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=033'">강원</button>

								</div>
								<div role="region3" class="tab-pane fade" id="region3"
									aria-labelledby="region3-tab">
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=032'">인천</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=031'">경기</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=043'">충북</button>

								</div>
								<div role="region4" class="tab-pane fade" id="region4"
									aria-labelledby="region4-tab">
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=064'">제주</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=054'">경북</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=055'">경남</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=041'">충남</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=061'">전남</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=063'">전북</button>
									<button class="btn btn-info btn-lg region" data-dismiss="modal"
										onclick="window.location='BoardCategoryAction.bo?local=051'">부산</button>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>



			<button type="button" class="btn btn-info btn-sm" data-toggle="modal"
				data-target="#regionCategory">Open Region</button>

			<center>
				<div class="w3-main w3-content w3-padding"
					style="max-width: 100%; margin-top: 10px">

					<!--  검색 부분 -->
					<br>
					<div id="searchForm">
						<form>
							<select name="opt">
								<option value="0">제목</option>
								<option value="1">내용</option>
								<option value="2">제목+내용</option>
								<option value="3">글쓴이</option>
							</select> <input type="text" size="20" name="condition" />&nbsp; <input
								type="submit" value="검색" />
						</form>
					</div>

					<!-- 글목록 위 부분-->
					<br>

					<div id="topForm" align="right">
						<!-- 로그인됬을때 글쓰기가 보이게 -->
						<c:if test="${sessionScope.sessionID!=null}">
							<input type="button" value="글쓰기" onclick="writeForm()">
						</c:if>
					</div>
					<br>

					<!-- 게시글 목록 부분 -->
					<!-- 전체 div로 나눈 후 3개로 나누기 -->
					<!-- Hot matching page -->
					<div>
						<h3 align="left">지역별 인기여행</h3>
						<hr>
						<div class="w3-rowpadding w3-padding-16 we-center" id="people"
							style="max-width: 1200px; margin-top: 10px">
							<!-- list목록이있다면 forEach문을 이용하여 표시하기 -->
							<%--  <c:if test="${ count >0 }"> --%>
							<div align="center" style="max-width: 1100px"></div>
							<div class="center" align="left" style="max-width: 1100px">
								<c:forEach var="board" items="${requestScope.list}">
									<div class="w3-quarter">
										<!-- ###### 썸네일로 이미지 출력하기 ###### -->
										<div>
											<p>${board.board_num}</p>
										</div>
										<!-- 이미지 올리기 다시한번 확인하기 -->
										<a
											href="BoardDetailAction.bo?num=${board.board_num}&pageNum=${spage}">
											<div>
												<!-- 이미지 -->
												<img src="/GuestBee/matching/${board.board_file }"
													alt="metching1" style="width: 90%; height: 35%;">
											</div> <br>
											<div>${board.board_subject}</div>
											<div>
												<a href="#">${board.board_id}</a>
												<div>${board.board_subtitle}</div>
												<p>게시 날짜 ${board.board_date}</p>
												<p>조회수 ${board.board_count}</p>
												<br>
												<br>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>

						<!-- 게시판 원형 폼 -->
						<%--  <c:forEach var="board" items="${requestScope.list}">
            <tr>
            	<!-- 사진 업로드 하는방법 배우기 -->            
            	<td><img src="D:/Java/th147_Jsp_Servlet/workspace/project_matching/WebContent/m_UploadFolder/" +  board.board_file >${ board.board_file }</td>
                <td>${board.board_num}</td>
                <td>
                    <a href="BoardDetailAction.bo?num=${board.board_num}&pageNum=${spage}">
                    ${board.board_subject}
                    </a>
                </td>
                <td>
                    <a href="#">
                    ${board.board_id}
                    </a>
                </td>
                <td>${board.board_date}</td>
                <td>${board.board_count}</td>
                
               
            </tr>
        </c:forEach> --%>

					</div>
			</center>

			<!-- 페이지 넘버 부분  페이징처리 부분###########################-->
			<br> <br>
			
			
		</div>
		
	</div>
	<hr>
	<center><div style="margin: left; float: bottom; width: 100%;">
				<div id="pageForm">
					<c:if test="${startPage != 1}">
						<a href='BoardListAction.bo?page=${startPage-1}'>[이전 ]</a>
					</c:if>

					<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
						<c:if test="${pageNum == spage}">${pageNum}&nbsp;
            			</c:if>
						<c:if test="${pageNum != spage}">
							<a href='BoardListAction.bo?page=${pageNum}'>${pageNum}&nbsp;</a>
						</c:if>
					</c:forEach>

					<c:if test="${endPage != maxPage }">
						<a href='BoardListAction.bo?page=${endPage+1}'>[다음]</a>
					</c:if>
				</div>
			</div></center>
	<!-- 전체글 수  -->
	<%--  <div align="right">
	<h5>글 목록(전체 글 : ${ count } )</h5>
	<c:if test="${ count ==0 }">
	<div align = "center">게시판에 저장된 글이 없습니다.</div>
	</c:if>
  </div> --%>

</body>
</html>