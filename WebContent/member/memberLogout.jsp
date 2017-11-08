<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	// session.setMaxInactiveInterval(초);10분뒤 로그아웃 (session 데이터 삭제)
    session.invalidate();//로그아웃 메서드 개꿀 ㅋ
    response.sendRedirect("../index.jsp");//아무것도 안보내고 이동할때    
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>

</html>