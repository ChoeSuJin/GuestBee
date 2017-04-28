<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<jsp:include page="../../main/header.jsp"></jsp:include>

<!DOCTYPE html5>
<html>
<head>
<title>myPage</title>


<!--  img hover -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




<style type="text/css">

#navigation {
font-size:0.75em; 
width:150px;
padding: 5px;

margin-left:80px;/* sidebar의 margin------------조정---------------- */
margin-top:100px;/* sidebar의 margin------------조정---------------- */

float : left;/* ------------조정---------------- */
}
#navigation ul {margin:0px; padding:0px;}
#navigation li {list-style: none;} 

ul.top-level {background:#fff;}
ul.top-level li {
margin: 0 0 3px 0;
border: solid 1px #cccccc;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
}

#navigation a {
color: #666;
cursor: pointer;
display:block;
height:25px;
line-height: 25px;
text-indent: 10px;
text-decoration:none;
width:100%;
}
#navigation a:hover{
text-decoration:none;
}



#navigation li:hover {
background: #fed36b; /*색깔 변경 */
position: relative;
}

ul.sub-level {
display: none;

}
li:hover .sub-level {
background: #fff;
border: #fff solid;
border-width: 1px;
display: block;
position: absolute;
left: 150px;
top: 5px;
}
ul.sub-level li {
border: none;
float:left;
width:150px;

}



/************ Second Level ****************/
#navigation .sub-level {
background: #fff;
border: solid 1px #cccccc;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
}

/************ Third Level ****************/
#navigation .sub-level .sub-level {
background: #fff;
margin: 0 1px 0 0;
}

/* Display one level after another */
li:hover .sub-level .sub-level {
display:none;
}
.sub-level li:hover .sub-level {
display:block;

}


/* 아래는 내용 */


.container {
  position: relative;
  width: 50%;
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #fed36b ;
}

.container:hover .overlay {
  opacity: 1;
}

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

</style>





</head>
<body>

<div style="margin-bottom:100px;"> <!-- ----------조정 -->
	<div id="navigation" >  
   		<ul class="top-level">
   
   			<li><a href="#">나의 계정</a></li>
   			<li><a href="BookingInfoForm.do" style="cursor:hand;">예약 내역</a></li>   <!-- ----------조정 -->
   			<li><a href="MemberModifyFormAction.do"  style="cursor:hand;">회원 정보 수정</a></li>
       		<li><a href="MatchingInfo.do"  style="cursor:hand;">회원 탈퇴</a></li>
   		</ul>
	</div>







<!-- ---------------------------아래는 내용---------------- -->

<!-- <div style="margin-left:180px; margin-top:100px;"> ----------조정
  <h2>default는 마이페이지 프로필로 디자인 </h2>
  <p>Hover over the buttons in the left side navigation to open them.</p>
</div>
 -->




	<div class="container" style="margin-left:350px; margin-top:100px;"> <!-- ----------내용의 margin -->

  		<img src="myPage/jsp/img/guestbeeimg5.jpg" alt="Avatar" class="image" >
  
  		<div class="overlay">
    		<div class="text">GuestBee</div>
  		</div>
	</div>



</div>

</body>
</html>