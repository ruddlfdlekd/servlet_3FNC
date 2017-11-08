<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    MemberDTO memberDTO = new MemberDTO();
    MemberDAO memberDAO = new MemberDAO();
    int result = memberDAO.Delete(memberDTO.getId());    
    String s="";
    
    if(result>0)
    	s="삭제성공";
    else
    	s="삭제실패";
    
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