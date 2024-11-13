<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB연결 -->
<%@ include file = "../include/oracleCon.jsp" %>

<!-- 파라메터값 받기 설정 -->
<% 
String unq = request.getParameter("unq");
String pass = request.getParameter("pass");
%>

<!-- 공백체크 -->
<% 
  if(unq == null || pass == null ) {
%>	
	<script>
	alert("잘못된 접근입니다.");
	location="boardList.jsp";
	</script>

<% 
	return;
}
pass = pass.trim();

if(unq.equals("")|| pass.equals("")) {
%>	
	<script>
	alert("공백 입니다.");
	history.back();
	</script>

<% 
	return;
}
%> 


<!-- Delete SQL 작성 및 적용 --> 
<%
String sql ="delete from nboard where unq ='"+unq+"' and pass = '"+pass+"'";
int result = stmt.executeUpdate(sql);
if(result == 1){
%>	
	<script>
	alert("삭제완료")
	location="boardList.jsp"
	</script>	
<%	
} else {
%>	
	<script>
	alert("암호를 다시 입력해주세요")
	history.back();
	</script>		
<%	
}
%>
    