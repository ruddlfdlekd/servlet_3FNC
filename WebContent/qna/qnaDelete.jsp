<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	QnaDAO QnaDAO = new QnaDAO();
	int result = QnaDAO.delete(num);
	String s ="삭제실패";
	
	if(result>0) 
		s = "삭제성공";
	
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">
alert('<%=s%>');
location.href="qnaList.jsp";
</script>
</html>