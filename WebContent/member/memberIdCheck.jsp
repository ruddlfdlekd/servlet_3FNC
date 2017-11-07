<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% 
   request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
  	
   MemberDAO memberDAO = new MemberDAO();
   
   String s = memberDAO.idcheck(id);
	
   
  
	   
	
   
   
  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>check!</h1>
<h3><%=s%></h3>
<% if(s.equals("아이디 중복")){ %>
<form name="frm" action="memberIdCheck.jsp?id="+id>
<input type="text" id="id" name="id">
<input type="submit"> 
<%} %>
<%if(s.equals("아이디 생성 가능")){ %>
<input type="button" id ="btn" value="사용하기">
<%} %>
</form>
</body>
<script type="text/javascript">
var btn = document.getElementById("btn");
btn.addEventListener("click", function() {
	window.opener.document.frm.id.value="<%=id%>";
	window.opener.document.frm.check.checked=true;
	window.self.close();
});



</script>





</html>