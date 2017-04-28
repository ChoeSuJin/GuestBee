<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ include file="../../main/header.jsp" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!DOCTYPE>
<html>
<head>



<style type="text/css">
.gallery-title {-
	font-size: 36px;
	color: #42B32F;
	text-align: center;
	font-weight: 500;
	margin-bottom: 70px;
}

.gallery-title:after {
	content: "";
	position: absolute;
	width: 7.5%;
	left: 46.5%;
	height: 45px;
	border-bottom: 1px solid #5e5e5e;
}

.filter-button {
	font-size: 18px;
	border: 1px solid #42B32F;
	border-radius: 5px;
	text-align: center;
	color: #42B32F;
	margin-bottom: 30px;
}

.filter-button:hover {
	font-size: 18px;
	border: 1px solid #42B32F;
	border-radius: 5px;
	text-align: center;
	color: #ffffff;
	background-color: #fed36b;
}

.filter-button.active {
	background-color: #42B32F;
	color: white;
}

.port-image {
	width: 100%;
}

.gallery_product {
	margin-bottom: 30px;
}
</style>

<meta charset="UTF-8">
<title>InfoMain</title>
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
			      <img style="width: 100%; height: 60%;" id="image1"
				src="info/mainimg1.jpg" alt="image1">      
			<div class="carousel-caption">
				       
				<h1>여행 맛집</h1>
				           
			</div>
			   
		</div>

		   
		<div class="item">
			      <img style="width: 100%; height: 60%;" id="image1"
				src="info/mainimg2.jpg" alt="image2">      
			<div class="carousel-caption">
				       
				<h1>여행 Story</h1>
				     
			</div>
			   
		</div>
		<div class="item">
			      <img style="width: 100%; height: 60%;" id="image1"
				src="info/mainimg3.jpg" alt="image3">      
			<div class="carousel-caption">
				       
				<h1>즐거운 여행</h1>
				     
			</div>
			   
		</div>
		 
	</div>

	 
	<!-- Left and right controls -->
	  <a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev">     <span
		class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>  
	</a>   <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next">     <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>  
	</a>
</div>
</head>
<body >
<%-- <div class="header">
	<jsp:include page="../../main/header.jsp"/>
</div> --%>



	<div class="container">
	 <div class="row">
		<div align="center">
			<a href="MainListView.do?Local=02" ><button class="btn btn-default filter-button " >서울</button></a> 
			<a href="MainListView.do?Local=051"> <button class="btn btn-default filter-button" >부산</button></a> 
				<a href="MainListView.do?Local=031"><button class="btn btn-default filter-button" >경기</button></a> 
				<a href="MainListView.do?Local=064"><button class="btn btn-default filter-button" >제주</button></a>
					 <a href="MainListView.do?Local=054"><button class="btn btn-default filter-button" >경상북도</button></a> 
					<a href="MainListView.do?Local=055"><button class="btn btn-default filter-button" >경상남도</button></a> 
					<a href="MainListView.do?Local=041"><button class="btn btn-default filter-button" >충청남도</button></a> 
					<a href="MainListView.do?Local=043"><button class="btn btn-default filter-button" >충청북도</button></a> 
					<a href="MainListView.do?Local=061"><button class="btn btn-default filter-button" >전라남도</button></a> 
					<a href="MainListView.do?Local=063"><button class="btn btn-default filter-button" >전라북도</button></a> 
					<a href="MainListView.do?Local=033"><button class="btn btn-default filter-button" >강원도</button></a>
		</div>
		 <div class="container">
			<a href="MainListForm.do"><button class="btn btn-default filter-button" style="float: right;">글쓰기</button></a>
		</div> 
		<br />                                                         
		<!-- 리스트열-->
		<c:forEach var="list" items="${list}">
			<div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6">
				<div class="w3-display-topleft w3-gray w3-padding">${list.b_Title}
				</div>
				<a href="DetailView.do?DetailList=${list.b_Boardnum}"> 
				<img src="/GuestBee/info/${list.b_Img1}" class="img-responsive" style="width: 100%; height: 50%;" name="DetailList"></a>

			</div>
			</c:forEach>		
		</div>
	</div>
</body>
</html>