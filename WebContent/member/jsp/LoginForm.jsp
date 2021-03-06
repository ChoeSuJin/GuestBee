<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../main/header.jsp" %>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html5>
<html>
<head>
<title>로그인</title>

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

<div class="login-page">
  <div class="form">
  
    <form class="login-form" action="MemberLoginAction.do"  method="post">
      <input type="text" name="u_id" placeholder="아이디" />
      <input type="password" name="u_password" placeholder="비밀번호"/>
      <button type="submit">login</button>
      <!-- <p class="message"> <a href="/JSP_DEV/member/findpw.jsp">비밀번호 찾기</a></p> -->
      <p class="message"> <a href="JoinForm.do">회원가입</a></p>
    </form>
  </div>
</div>
<c:set var="loginMsg" value="${ fail }"/>
<c:if test="${ loginMsg ne null && loginMsg eq '0' }">
<script type ="text/javascript">
				 alert('비밀번호를 확인해 주세요.');
				</script>
</c:if>

<c:if test="${ loginMsg ne null && loginMsg eq '-1' }">
<script type ="text/javascript">
				 alert('아이디를 확인해 주세요.');
</script>
</c:if>

<c:set var="msg" value="${ msg }"/>
<c:if test="${ msg eq 1 }">
	<script>
	alert("가입되었습니다! 로그인하여 들어와주세요!");
	</script>
</c:if>

</body>
</html>