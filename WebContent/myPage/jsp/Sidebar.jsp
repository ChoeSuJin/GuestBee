<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html5>
<html>
<head>
<title>Insert title here</title>

<style type="text/css">

#navigation {
font-size:0.75em; 
width:150px;
padding: 5px;

margin:100px;/* ------------조정---------------- */

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
</style>


</head>
<body>


<script type="text/javascript">  <!-- ----------조정 -->
	function goPage(value){
		if(value == 1){
			location.href="MemberModifyFormAction.do";
		}
	}
</script>

<script type="text/javascript">	
	function goPage2(value){
		if(value == 2){
			location.href="DeleteForm.jsp";
		}
	}
</script>


<script type="text/javascript">	
	function goPage3(value){
		if(value == 3){
			location.href="BookingInfoFormAction.do";
		}
	}
</script>

<div id="navigation" style="margin-top:100px;">  <!-- ----------조정 -->
   <ul class="top-level">
   
   			<li><a href="#">나의 계정</a></li>
   			<li><a onclick="goPage3(3)" style="cursor:hand;">예약 내역</a></li>   <!-- ----------조정 -->
   			<li><a onclick="goPage(1)" style="cursor:hand;">회원 정보 수정</a></li>
       		<li><a onclick="goPage2(2)" style="cursor:hand;">회원 탈퇴</a></li>
     
   </ul>
</div>




</body>
</html>