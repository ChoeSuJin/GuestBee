<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>

<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

#menu {
   margin-left: 35%;
}

</style>









<script type="text/javascript">
	$(document).ready(function () {
    $('.forgot-pass').click(function(event) {
      $(".pr-wrap").toggleClass("show-pass-reset");
    }); 
    
    $('.pass-reset-submit').click(function(event) {
      $(".pr-wrap").removeClass("show-pass-reset");
    }); 
});
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
	</style>






</head>




<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button> -->
      <a class="navbar-brand" href="#">GuestBee</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul id="menu" class="nav navbar-nav navbar-center" >
         <li ><a href="//" >Reservation</a></li>
        <li ><a href="//">Info</a></li>
        <li><a href="//">Matching</a></li>
       </ul>
         <ul class="nav navbar-nav navbar-right" >
        <li><a href="/"> 로그인</a></li>
      <li><a href="//">회원가입</a></li>
      </ul>
    </div>
    
   
               
   </div>
  </div>
</nav>










<div class="login-page">
  <div class="form">
  
    <form class="login-form" action="loginOk.servlet" method="post">
      <input type="text" placeholder="아이디"/>
      <input type="password" placeholder="비밀번호"/>
      <input type="password" placeholder="비밀번호 확인"/>
     
     
     
     
     
  
     <br>
     <br>
     
      <input type="text" placeholder="이름"/>
     
      <input id="email"	name="email" type="email" placeholder="example@email.com"
					autocomplete="off" required="required" /></li> <!-- 타입이 email일 때 required를 하면 형식에 맞춰서 입력됐는지도 확인함 -->
      
      
      <input type="text" placeholder="KakaoTalk 아이디"/>
      
      
      
      
      <input id="tel" name="tel" type="tel" autocomplete="off" /></li> <!--  번호 사이마다 영역 나누기  -->
      
      <input type="date" placeholder="생년월일"/> <br> <!-- 생년월일 인거를 알려주기  -->
      
      
      <input type="file"/> <br> <!-- 사진 올리기 이쁜 css로  -->
      
      
      
      <span class="title"><input type="radio" name="gender" value="F" selected>여자 <input type="radio" name="gender" value="M"> 남자</span>
      
      
      <input type="radio" name="gender" value="F" selected>여자<input type="radio" name="gender" value="M"/>남자 <br> <!--  남 녀 다른 칸에 -->
      
      
      <button>회원가입</button>
      <p class="message"> <a href="#">비밀번호 찾기</a></p>
      <p class="message"> <a href="#">회원가입</a></p>
    </form>
  </div>
</div>










</body>
</html>