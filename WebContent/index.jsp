

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guestbee Main</title>
</head>
<c:if test="${ check eq true }">
<script type="text/javascript">
alert("성공적으로 예약되었습니다.");
</script>
</c:if>
<body onload="window.location.href='Main.do'">	

</body>
</html>
