<%@page import="com.iu.notice.noticeDAO"%>
<%@page import="com.iu.notice.noticeDTO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	int result = 0 ;
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	noticeDTO noticeDTO = new noticeDTO();
	noticeDTO.setTitle(request.getParameter("title"));
	System.out.println(((MemberDTO)session.getAttribute("member")).getId());
	noticeDTO.setWriter(((MemberDTO)session.getAttribute("member")).getId());
	noticeDTO.setContents(request.getParameter("contents"));
	
	
	noticeDAO noticeDAO = new noticeDAO();
	

	result = noticeDAO.insert(noticeDTO);
	
	String s="Fail";
	if(result>0){
		s="Success";
	}
	
	request.setAttribute("message", s);
	request.setAttribute("path", "noticeList.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	
	
	
	
%>



    
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert('<%=s%>');
document.location.href="noticeList.jsp"; 
</script>
</body>
</html>