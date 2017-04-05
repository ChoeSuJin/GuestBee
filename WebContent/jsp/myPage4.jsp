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


<style type="text/css">
#navigation {
font-size:0.75em; 
width:150px;
padding: 5px;
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
background: #fed36b; <!-------------------------------------->
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








<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



<div id="navigation">
   <ul class="top-level">
      <li><a href="#">회원정보</a></li>
      <li><a href="#">예약 내역</a></li>
      <li><a href="#">매칭 내역</a></li>
      <li>
         <a href="#">Portfolio</a>
         <ul class="sub-level">
            <li><a href="#">Logo Design</a></li>
            <li><a href="#">Mobile Apps</a></li>
         </ul>
      </li>
      <li>
         <a href="#">Services</a>
         <ul class="sub-level">
            <li><a href="#">Web Development</a>
            </li>
            <li><a href="#">Logo Design</a></li>
            <li>
               <a href="#">Web Hosting</a>
               <ul class="sub-level">
                  <li><a href="#">Linux</a></li>
                  <li><a href="#">Windows</a></li>
               </ul>
            </li>
         </ul>
      </li>
      <li><a href="#">Contact us</a></li>
      <li><a href="#">회원 탈퇴</a></li>
   </ul>
</div>











</body>
</html>