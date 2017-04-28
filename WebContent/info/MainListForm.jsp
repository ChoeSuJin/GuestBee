<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ include file="../../main/header.jsp" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<link href="../css/Mycss.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<html>
<style>
body {
	padding-top: 50px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MainList Inputform</title>
</head>
<body>
	<div
		style="MARGIN-LEFT: 5%; margin-right: 5%; margin-top: 2%; border: 2px solid #fed36b; padding: 10px; float: left; width: 1200px;">
		<div class="container">
		 <h1 style="text-align: center; color: yellow;">Input Information</h1>
			<form action="MainList.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<input name="b_Boardnum" type="hidden" value="1"> 
					지역번호: <select name="b_Local">
						<option value="">지역번호 선택</option>
						<option value="02">seoul(02)</option>
						<option value="051">Busan(051)</option>
						<option value="031">Gyeonggi(031)</option>
						<option value="064">Jeju(064)</option>
						<option value="054">GyeongsangBuk(054)</option>
						<option value="055">GyeongsangNam(055)</option>
						<option value="041">ChungcheongNam(041)</option>
						<option value="043">ChungcheonBuk(043)</option>
						<option value="061">JellaNam(061)</option>
						<option value="063">JeollaBuk(063)</option>
						<option value="033">Gangwon(033)</option>
						
					</select>
					<br><br>
					 주소: <input type="text" name="b_Address" placeholder="주소를 입력하세요">
				</div>
				<br>
				<div>
				제목: <input type="text" name="b_Title" placeholder="타이틀명을 입력하세요"> 
				</div>
				<br>
				<div class="form-group">
					이름: <input type="text" name="b_Name" placeholder="이름을 입력하세요">
				</div>
				<br>	
				<div>
					<textarea rows="20" cols="120" name="b_Content" placeholder="내용을 작성하세요"></textarea>
				</div>
				<div>
					img1: <input type="file" name="b_Img1" enctype="multipart/form-data"  >
				</div>
				<div>
					img2: <input type="file"  name="b_Img2" enctype="multipart/form-data" >
				</div>
				<div>
					img3: <input type="file" name="b_Img3" enctype="multipart/form-data" >
				</div>
				<div>
					img4: <input type="file" name="b_Img4" enctype="multipart/form-data" >
				</div>
				<div>
					img5: <input type="file" name="b_Img5" enctype="multipart/form-data" >
				</div>
				<br>
				<div>
				<input type="hidden" name="b_UserID" placeholder="아이디를 입력하세요">
				</div>
				<br>
				<div>
				<input type="hidden" name="b_Password" placeholder="비밀번호를 입력하세요">
				</div>
				<div>
					<input name="B_Date" type="hidden">
				</div>
				<br>
				<input style="margin-left: 40%" type="submit"  value="등록" class="btn btn-warning #fed36b">
			</form>
		</div>
</body>
</html>