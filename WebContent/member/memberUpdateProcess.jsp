<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MemberDTO memberDTO = new MemberDTO(); 
		memberDTO.setId(((MemberDTO)session.getAttribute("member")).getId());
		memberDTO.setPw(request.getParameter("pw"));
    	memberDTO.setName(request.getParameter("name"));
    	memberDTO.setEmail(request.getParameter("email"));
    	memberDTO.setPhone(request.getParameter("phone"));
    	memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
    	memberDTO.setJob(((MemberDTO)session.getAttribute("member")).getJob());
    	MemberDAO memberDAO = new MemberDAO();
   	int result = memberDAO.Update(memberDTO);
    String s = "";
   	if(result>0)
   		session.setAttribute("member", memberDTO);
   	
   	
   		response.sendRedirect("./memberMyPage.jsp");
   	
   	
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