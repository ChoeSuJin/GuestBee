<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../main/header.jsp" %>
<!DOCTYPE>
<html>

<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/modernizr.custom.32033.js"></script>

<script type="text/javascript">
	$(document).ready(function () {
    $('.forgot-pass').click(function(event) {
      $(".pr-wrap").toggleClass("show-pass-reset");
    }); 
    
    $('.pass-reset-submit').click(function(event) {
      $(".pr-wrap").removeClass("show-pass-reset");
    }); 
});
	
	
	// 아이디 중복 여부 판단 함수
	function openConfirmid(form) {
		if (form.m_id.value == "") { //아이디를 입력했는지 검사
			alert("아이디를 입력하세요");
			return;
		}
		//url과 사용자 입력 id를 조회합니다.
		url = "MemberConfirmIdAction.do?id=" + form.m_id.value;

		//새로운 윈도우를 연다.
		open(
				url,
				"confirm",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
		}
	
	
	
	</script>



	<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #fed36b; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #fed36b, #8DC26F);
  background: -moz-linear-gradient(right, #fed36b, #8DC26F);
  background: -o-linear-gradient(right, #fed36b, #8DC26F);
  background: linear-gradient(to left, #fed36b, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

.new_box input{width:auto!important;}
	</style>
</head>
<body>

<div class="login-page">
  <div class="form">
  
    <form class="login-form" action="MemberJoinAction.do" method="post">
      <input type="text" name="u_id"placeholder="아이디" required="required"/>
      <!-- <input type="button" name="confirm_id" class="join_idck_btn" value="중복확인" onclick="openConfirmid(this.form)" /> -->
      
      <input type="password" name="u_password" placeholder="비밀번호" required="required"/>
      <input type="password" name="u_password2" placeholder="비밀번호 확인" required="required"/>
     
     <br>
     <br>
      <input type="text" name="u_name" placeholder="이름" required="required"/>
      <input id="tel" name="u_phone" type="tel" autocomplete="off" placeholder="전화번호(-없이 입력하시오.)" required="required"/></li> <!--  번호 사이마다 영역 나누기  -->  
      <input type="text" name="u_msgID" placeholder="KakaoTalk 아이디" required="required"/>
      <input id="email"	name="u_email" type="email" placeholder="example@email.com"
					autocomplete="off" required="required" /></li> <!-- 타입이 email일 때 required를 하면 형식에 맞춰서 입력됐는지도 확인함 -->
      <input type="date" name="u_birth" placeholder="생년월일" required="required"/> <br> <!-- 생년월일 인거를 알려주기  -->
      <div class="new_box">
      <span class="title"><input type="radio" name="u_gender" value="0" selected required="required">여자 
      &nbsp;&nbsp;&nbsp;<input type="radio" name="u_gender" value="1" required=required"> 남자</span> 
      <!-- <input type="file"/> <br>  -->  
      </div>
      
      <button type="submit">회원가입</button>
    </form>
  </div>
</div>


<!-- script -->
    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/placeholdem.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script src="assets/js/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/scripts.js"></script>



</body>
</html>