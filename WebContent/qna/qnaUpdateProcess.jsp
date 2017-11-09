<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.iu.qna.QnaDTO"%>
	<%@page import="com.iu.qna.QnaDAO"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
QnaDAO QnaDAO = new QnaDAO();
QnaDTO QnaDTO = QnaDAO.select(Integer.parseInt(request.getParameter("num")));
QnaDTO.setTitle(request.getParameter("title"));
QnaDTO.setContents(request.getParameter("contents"));
int result=QnaDAO.update(QnaDTO);		
String s = "수정 실패";
if(result>0){
	s="수정 성공";
}


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
location.href="./qnaView.jsp?num=<%=QnaDTO.getNum()%>";	
</script>
</html>