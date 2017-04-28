<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	response.sendRedirect("loginform.jsp");
%>
</body>
</html>