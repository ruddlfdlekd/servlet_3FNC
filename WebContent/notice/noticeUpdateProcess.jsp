
<%@page import="com.iu.notice.noticeDAO"%>
<%@page import="com.iu.notice.noticeDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.iu.notice.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int result =0;
	noticeDAO noticeDAO = new noticeDAO();
	noticeDTO noticeDTO = noticeDAO.select(Integer.parseInt(request.getParameter("num")));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	System.out.println(noticeDTO.getTitle());
	System.out.println(noticeDTO.getWriter());
	System.out.println(noticeDTO.getContents());
	System.out.println(noticeDTO.getHit());
	System.out.println(noticeDTO.getNum());
	System.out.println(noticeDTO.getReg_data());
	result = noticeDAO.update(noticeDTO);
	
	
	
	String s = "Fail";
	if(result>0){
		s="Success";
	}
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
document.location.href="./noticeView.jsp?num=<%=noticeDTO.getNum()%>";	
</script>
</body>
</html>