<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	String s = request.getParameter("save");
	
	if(s!=null){
		Cookie c = new Cookie("id",memberDTO.getId());
		c.setMaxAge(600);
		c.setPath("/");
		response.addCookie(c);
	}
	else{
		Cookie c = new Cookie("id", memberDTO.getId());
		c.setMaxAge(0);
		c.setPath("/");
		response.addCookie(c);
	}
	
	MemberDAO memberDAO = new MemberDAO();
	memberDTO = memberDAO.login(memberDTO);
	
	String path = "./memberLoginForm.jsp?fail=1";
	if(memberDTO != null){
		
		session.setAttribute("member", memberDTO);
		path = "../index.jsp";
	}
	response.sendRedirect(path);

	
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