<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.guestbee.member.model.MemberBean" %> 
<%@ page import="com.guestbee.member.model.MemberDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
    <%@ include file="../../main/header.jsp" %>
<!DOCTYPE html5>
<html>
<head>
<title>Insert title here</title>



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
background: #fed36b;
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


/* --------table css----------*/

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

</style>








</head>
<body>

<c:set var="member" value="${requestScope.memberInfo}" />

<div style="margin-bottom:100px;"> <!-- ----------조정 -->
   <div id="navigation" >  
         <ul class="top-level">
   
            <li><a href="#">나의 계정</a></li>
            <li><a href="BookingInfoForm.do" style="cursor:hand;">예약 내역</a></li>   <!-- ----------조정 -->
            <li><a href="MemberModifyFormAction.do"  style="cursor:hand;">회원 정보 수정</a></li>
             <li><a href="MatchingInfo.do"  style="cursor:hand;">회원 탈퇴</a></li>
         </ul>
   </div>



           <div class="login-page">
              <div class="form">
  
             <form class="login-form" action="MemberModifyAction.do" method="post">
    
    
                <div class="join_input_box">
                
                      <table>
                             <tr>
                               <td><label for="u_id">ID : </label></td>
                               <td><input type="text" name="u_id" maxlength="50" id="u_id" class="modify_id"
                                    onkeydown="moveFocus(m_pw)" value="${member.u_id}" readonly/></td>
                             </tr>
  
                             <tr>
                               <td><label for="u_pw">비밀번호 : </label></td>
                               <td><input type="password" name="u_password" id="u_password" /></td>
                             </tr>
  
                             <tr>
                               <td><label for="u_pw2">비밀번호 확인 : </label></td>
                               <td><input type="password" naem="u_password2" id="u_password2"/></td>
                             </tr>
  
                             <tr>
                               <td><label for="u_name">이름 : </label></td>
                               <td><input type="text" name="u_name" id="u_name" value="${member.u_name}" readonly /></td>
                             </tr>
  
                             <tr>
                               <td><label for="u_phone">연락처 : </label></td>
                               <td><input type="text" name="u_phone" id="u_phone" value="${member.u_phone}" />   </td>
                             </tr>
  
                             <tr>
                               <td><label for="u_msgID">카카오톡 아이디 : </label></td>
                               <td><input type="text" name="u_msgID" id="u_msgID" value="${member.u_msgID}" />   </td>
                             </tr>
  
                             <tr>
                               <td><label for="u_email">이메일 : </label></td>
                               <td><input type="text" name="u_email" id="u_email" value="${member.u_email}" /></td>
                             </tr>
  
                             <tr>
                               <td><label for="u_birth">생일 : </label></td>
                               <td><input type="date" name="u_birth" id="u_birth" value="${member.u_birth}" readonly/></td>
                             </tr>
  
                     </table>
      
             </div>
      
               <br>
               <button type="submit">수정 완료</button>
      
          </form>
        </div>
   </div>
</div> 


</body>
</html>