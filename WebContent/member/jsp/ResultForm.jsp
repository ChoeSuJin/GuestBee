<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <%@ include file="../../main/header.jsp" %>
<html>
<head>
	<title>결과 페이지</title>
</head>
<body>
	<br><br><br>
<c:set var="result" value="${ result }"/>

<c:if test="${ result eq 'sucess' }">
<script type="text/javascript">
				alert('회원정보가 삭제되었습니다.')
				location.href="/JSP_DEV/member/jsp/LoginForm.jsp" ///.................로그인 안된 메인 페이지로 
			</script>
</c:if>
<c:if test="${ result eq 'fail' }">
<script type="text/javascript">
				alert('비밀번호를 다시 입력해주세요')
				location.href="/JSP_DEV/myPage/jsp/DeleteForm.jsp"
</script>
</c:if>		
	<!-- ...................................................넘어가기  -->

	<br><br><br>
<c:set var="msg" value="${requestScope.check}" />
${msg}

<c:if test="${msg=='1'}">
	<script type="text/javascript">
					alert('회원정보가 수정되었습니다.')
					location.href="/JSP_DEV/myPage/jsp/myPage.jsp" //////////////////////////////
	</script>
</c:if> 

<c:if test="${msg=='0'}">
	<script type="text/javascript">
					alert('회원정보를 다시 수정해주세요.')
					location.href="/JSP_DEV/myPage/jsp/ModifyForm.jsp"///////////////////////
	</script>
</c:if> 

<%-- 
	<%
		/* String result2 = (String)request.getAttribute("result2"); */
		String result2 = (String)request.getAttribute("check");
		if(result2.equals("sucess"))
		{
	%>
			<script type="text/javascript">
				alert('회원정보가 수정되었습니다.')
				location.href="/JSP_DEV/myPage/jsp/ModifyForm.jsp" //////////////////////////////
			</script>
	<% 
		}
		else if(result2.equals("fail")){
	%>
			<script type="text/javascript">
				alert('회원정보를 다시 수정해주세요.')
				location.href="/JSP_DEV/myPage/jsp/ModifyForm.jsp"///////////////////////
			</script>
			<p>실패</p>
	<%
		}
	%>	 --%>
			

</body>
</html>