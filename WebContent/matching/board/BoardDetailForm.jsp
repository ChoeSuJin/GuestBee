<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>      
<%@ include file="../../main/header.jsp" %>

<!DOCTYPE>    
<html>
<head>
	<title>글 상세보기</title>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="/view/myStyle.css" rel="stylesheet" type="text/css">
	
	<!--board소스의 기본 css 
	<style type="text/css">
		#wrap {
			width: 800px;
			margin: 0 auto 0 auto;
		}
	
		#detailBoard{
			text-align :center;
		}
		
		#title{
			height : 16;
			font-family :'돋움';
			font-size : 12;
			text-align :center;
		}
	</style> -->
	
	<!-- //별점기능 css 추후 수정 -->
	 <style type="text/css">
	
	/* .rate_widget {
    border:     1px solid #CCC;
    overflow:   visible;
    padding:    10px;
    position:   relative;
    width:      180px;
    height:     32px;
	}
	
	.ratings_stars {
    background: url('star_empty.png') no-repeat;
    float:      left;
    height:     28px;
    padding:    2px;
    width:      32px;
	}
	
	.ratings_vote {
    background: url('star_full.png') no-repeat;
	}

	.ratings_over {
    background: url('star_highlight.png') no-repeat;
	}
	
	/* 토탈합계 */
	
	/* total_votes {
    background: #eaeaea;
    top: 58px;
    left: 0;
    padding: 5px;
    position:   absolute;  
	} 
	
	.movie_choice {
    font: 10px verdana, sans-serif;
    margin: 0 auto 40px auto;
    width: 180px;
	} */
	
	
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#777;}
	</style>
	
	
	<script type="text/javascript">
		function changeview(value)
		{
				//목록
			if(value == 0)
				location.href="BoardListAction.bo?page=${pageNum}";
				
				//답글
			else if(value == 1)
				location.href='BoardListAction.bo?num=${board.board_num}&page=${pageNum}';
		}
		
		function doAction(value)
		{
				// 수정 
			if(value == 0) 
                location.href="BoardUpdateFormAction.bo?num=${board.board_num}&page=${pageNum}";
             	// 삭제
            else if(value == 1) 
                location.href="BoardDeleteAction.bo?num=${board.board_num}";
        }
		
		var httpRequest = null;
		
		//httpRequest 객체 생성
		function getXMLHttpRequest(){
			var httpRequest = null;
			
			if(window.ActiveXObject){
				try {
					httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e2) { httpRequest = null; }
				}
			}
			else if(window.XMLHttpRequest){
			httpRequest = new window.XMLHttpRequest();
			}
			return httpRequest;
		}	
		
		 // 댓글 등록
        function writeCmt()
        {
            var form = document.getElementById("writeCommentForm");
            
            var board = form.comment_board.value
            var id = form.comment_id.value
            var content = form.comment_content.value;
            
            if(!content)
            {
                alert("내용을 입력하세요.");
                return false;
            }
            else
            {    
                var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
                    
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = checkFunc;
                httpRequest.open("POST", "CommentWriteAction.co", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
                httpRequest.send(param);
            }
        }
        
        function checkFunc(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 1){ 
                    document.location.reload(); // 상세보기 창 새로고침
                }
            }
        }
        
        // 댓글 답변창
        function cmReplyOpen(comment_num){
            var userId = '${sessionScope.sessionID}';
            
            if(userId == "" || userId == null){
                alert("로그인후 사용가능합니다.");
                return false;
            }
            else{
                // 댓글 답변창 open
                window.name = "parentForm";
                window.open("CommentReplyFormAction.co?num="+comment_num,
                            "replyForm", "width=570, height=350, resizable = no, scrollbars = no");
            }
        }
        
        // 댓글 삭제창
        function cmDeleteOpen(comment_num){
            var msg = confirm("댓글을 삭제합니다.");    
            if(msg == true){ // 확인을 누를경우
                deleteCmt(comment_num);
            }
            else{
                return false; // 삭제취소
            }
        }
    
        // 댓글 삭제
        function deleteCmt(comment_num)
        {
            var param="comment_num="+comment_num;
            
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = checkFunc;
            httpRequest.open("POST", "CommentDeleteAction.co", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8'); 
            httpRequest.send(param);
        }

        
        // 별점기능
       /*  $('.ratings_stars').Hover(
            // 마우스 오버를 처리합니다.
            function(){
                $(this).prevAll().andSelf().addClass('ratings_over');
                $(this).nextAll().removeClass('ratings_vote'); 
            },
            // mouseout을 처리합니다.
            function(){
                $(this).prevAll().andSelf().removeClass('ratings_over');
                set_votes($(this).parent());
            }
        );
        
        //서버에서 데이터 검색
        $('.rate_widget').each(function(i){
            var widget = this;
            var out_data = {
            		widget_id : $(widget).attr('id'),
            		fetch: 1	
            };
       $.post(
                'ratings.php',
                out_data,
                function(INFO){
                	$(widget).data('fsr', INFO);
                	set_votes(widget)
                }, 'json'
            );
        });
        
        //out_data 객체 설정 후 가져오기를 볼 것을 여기에 포함시킴
        {
            "widget_id": "r1",
            "number_votes": 129,
            "total_points": 344,
            "dec_avg": 2.7,
            "whole_avg": 3
        }
        
        //이건 뭘까??
        $('#one_of_your_widgets).data('fsr').widget_id;
        
        function set_votes(widget) {
        
            var avg = $(widget).data('fsr').whole_avg;
            var votes = $(widget).data('fsr').number_votes;
            var exact = $(widget).data('fsr').dec_avg;
            
            $(widget).find('.star_' + avg).prevAll().andSelf().addClass('ratings_vote');
            $(widget).find('.star_' + avg).nextAll().removeClass('ratings_vote'); 
            $(widget).find('.total_votes').text( votes + ' votes recorded (' + exact + ' rating)' );
        }
        
        $('.ratings_stars').bind('click', function() {
            var star = this;
            var widget = $(this).parent();
            
            var clicked_data = {
                clicked_on : $(star).attr('class'),
                widget_id : widget.attr('id')
            };
            $.post(
                'ratings.php',
                clicked_data,
                function(INFO) {
                    widget.data( 'fsr', INFO );
                    set_votes(widget);
                },
                'json'
            ); 
        }); */
        
        
	</script>
	
</head>
<body>


	<!-- 제목--------------------------------------------------->
	<h3 class="text-center"><font <b><font color="fed36b">GuestBee</font></h3>
	
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#home">GuestBeed와 함께 여행을</a></li>
		<li><a data-toggle="tab" href="#menu1">여행 꿀팁</a></li>
		<li><a data-toggle="tab" href="#menu2">여행 매칭 규정</a></li>
	</ul>
	<!-- 매칭간 주의사항 공지하기 -->
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
	<br><br><br>

<div>
		<b><font size="6" color="fed36b" align="center">GuestBee와 인연을</font></b>
		<p><em>We love people! We love world!</em></p>
		<p>The world is a book and those who do not travel read only one page. -St. Augustine</p>
		
		<br>
</div>

<!-- 메인 + 사진 + 구글지도 ----------------------------------------------------------------->
<div class="container">

	<!-- <form method="post" action="BoardWriteAction.bo" name="boardForm" enctype="multipart/form-data"> -->
	
	<!-- 숨겨진 아이디 값 -->
	<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
		
<!-- 글상자 + 사진 -->
	<div class="container text-center" style="width: 1200px;">
		<br>
		<!-- 글삭제 -->
		<div>
			<c:if test="${seesionScope.sessionID !=null }">
				<c:if test="${sessionScope.sessionID == board.bard_id }">
					<input type="button" value="수정" onclick="doAction(0)">
					<input type="button" value="삭제" onclick="doAction(1)">
				</c:if>
			</c:if>
		</div>
		
		<!-- 게시판 전체 상자 -->
	<div class="row" style="float:left; width: 60%;">
		<div class="matchingSubject">
					<!-- 매칭 제목 -->
					<div class="m_p">
					<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 제목  </h3>
					<h4>${board.board_subject}</h4>
					</div>
				</div>
				<br>
				<hr>
	
		<div class="matchingSubTitle">
					<!-- 매칭 부제목 -->
					<div class="m_p">
					<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 인사 </h3>
					<h4>${board.board_subtitle}</h4>
					</div>
				</div>
				<br>
				<hr>
		
		<div class="matchingLocal">
					<!-- 매칭 부제목 -->
					<div class="m_p">
					<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 지역 </h3>
					<h4>${board.board_local}</h4> 
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingPurpose">
					<!-- 매칭 목적 -->
					<div class="m_p_text">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭 목적 </h3>
						<h4>${board.board_purpose}</h4>
					</div>
				</div>
				<br>
				<hr>
				
				<div class="metchingcontent">
					<!-- 매칭자 소개 -->
					<div class="m_p">
						<!-- 추후 매칭자 아이디 불러오기  -->	
						<div>
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭자 정보 </h3>
						<font size="4" color="#d3d3d3" align="left"> 꿀벌 이름   </font>
						<h4> ${sessionScope.sessionID} </h4>
						</div>	
						<!-- 매칭자에 대한 긴 소개글 -->
						<div>
						<font size="4" color="#d3d3d3" align="left"> 꿀벌 정보  </font>
						<h4 > ${board.board_content} </h4>
						</div>
					</div>
				</div>
				<br>
				<hr>
	
				<div class="metchingCourse">
					<!-- 매칭 코스  -->
					<div class="m_p_text" data-reactid="">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매칭코스 : ${board.board_course} </h3>
					</div>
				</div>
				<br>
				<hr>

				<div class="metchingPlace">
					<!-- 정확한 매칭 장소 -->
					<div class="m_p_text">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장소 : ${board.board_place}</h3>
					</div>
				</div>
				<br>
				<hr>

				<div class="metchingNoted">
					<!-- 준비물 -->
					<div class="m_noted">
						<h3 align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;준비물 & 참고사항 : ${board.board_noted}</h3>
					</div>
				</div>
				<br>
				<hr>
				<br>
				
				<!-- 목록으로 가는 칸 -->
				<button onclick="window.location='BoardListAction.bo'"> 목 록  </button>
				
		</div>		
		<!-- 사진 업로드칸 ------------------------------------------------------------------->
		<div style="float:left; width: 35%; ">  <!-- 높이 조정하기 -->
			<!-- 쥔장 사진 -->

			<div class="row" style="float: right;">
				<p>
				<h3>
					<font color="lightgray"> ${sessionScope.sessionID} </font>
				</h3>
				</p>
				<!-- 사진상자 -->
				<!-- 업로드 사진 띄어주기 -->
				<img src="/GuestBee/matching/${ board.board_file }" alt="Random Name"
					style="width: 395px; height: 500px;">
			<br><br>
			<!-- 별점기능 ----------------------------------------------------------------------------->
			<font size="4" color="fed36b" align="center"> 꿀벌들의 여행에 별점을 주세요 </font>
			<p class="star_rating" >
   			 <a href="#" class="on" name="1">★</a>
   			 <a href="#" class="on" name="2">★</a>
   			 <a href="#" class="on" name="3">★</a>
   			 <a href="#" name="4">★</a>
    		 <a href="#" name="5">★</a>
    		 <script>
			$(".star_rating a").click(function(){
	            $(this).parent().children("a").removeClass("on");
	            $(this).addClass("on").prevAll("a").addClass("on");
	            return false;
	      	});
			</script>
			</p>
			
			</div>
			
			
			
    </div>
</div>
			
		</div>
	<br><br>

	
	<!-- 댓글 부분 ---------------------------------------------------------------------------------------->
	 <div id="comment">
        <table border="1" bordercolor="lightgray">
    <!-- 댓글 목록 -->    
    <c:if test="${requestScope.commentList != null}">
        <c:forEach var="comment" items="${requestScope.commentList}">
        
            <tr>
                <!-- 아이디, 작성날짜 -->
                 <td width="150">
                    <div>
                        <c:if test="${comment.comment_level > 1}">
                            &nbsp;&nbsp;&nbsp;&nbsp; <!-- 답변글일경우 아이디 앞에 공백을 준다. -->
                            <img src="img/reply_icon.gif">
                        </c:if>
                    
                        ${comment.comment_id}<br>
                        <font size="2" color="lightgray">${comment.comment_date}</font>
                    </div>
                </td>
                <!-- 본문내용 -->
                <td width="550">
                    <div class="text_wrapper">
                        ${comment.comment_content}
                    </div>
                </td>
                <!-- 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <a href="#" onclick="cmReplyOpen(${comment.comment_num})">[답변]</a><br>
                    <!-- 댓글 작성자만 수정, 삭제 가능하도록 --> 
                    <c:if test="${comment.comment_id == sessionScope.sessionID}">
                        <a href="#">[수정]</a><br>    
                        <a href="#" onclick="cmDeleteOpen(${comment.comment_num})">[삭제]</a>
                    </c:if>   
     
                    </div>
                </td>
            </tr>
            
        </c:forEach>
    </c:if>
            
            <!-- 로그인 했을 경우만 댓글 작성가능 -->
            <c:if test="${sessionScope.sessionID !=null}">
            <tr bgcolor="#F5F5F5">
            <form id="writeCommentForm">
                <input type="hidden" name="comment_board" value="${board.board_num}">
                <input type="hidden" name="comment_id" value="${sessionScope.sessionID}">
                <!-- 아이디-->
                <td width="150">
                    <div>
                        ${sessionScope.sessionID}
                    </div>
                </td>
                <!-- 본문 작성-->
                <td width="550">
                    <div>
                        <textarea name="comment_content" rows="4" cols="70" ></textarea>
                    </div>
                </td>
                <!-- 댓글 등록 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>    
                    </div>
                </td>
            </form> 
            </tr>
            </c:if>
    
        </table>
    </div>
</div>    
 
 <!-- 연락하는 칸----------------------------------------------------------------------------- -->
	<div class="container2">
  <h3 class="text-center">연락처</h3>
  <p class="text-center"><em>${board.board_subtitle}</em></p>
  <div class="row test">
    <div class="col-md-4">
      <p>Fan? Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>${board.board_local}</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: </p>   <!-- 연락처 추가 -->
      <p><span class="glyphicon glyphicon-envelope"></span>Email: youkidong62@naver.com</p> 
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div>
  </div>
</div>
 
</body>
</html>

</body>
</html>