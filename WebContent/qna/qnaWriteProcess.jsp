<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.iu.qna.QnaDTO"%>
	<%@page import="com.iu.qna.QnaDAO"%>
	<%@page import="com.iu.member.MemberDTO"%>
<%

int result = 0 ;
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
QnaDTO QnaDTO = new QnaDTO();
QnaDTO.setTitle(request.getParameter("title"));
QnaDTO.setWriter(((MemberDTO)session.getAttribute("member")).getId());
QnaDTO.setContents(request.getParameter("contents"));


QnaDAO QnaDAO = new QnaDAO();


result = QnaDAO.insert(QnaDTO);

String s="Fail";
if(result>0){
	s="Success";
}

request.setAttribute("message", s);
request.setAttribute("path", "qnaList.jsp");
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

</body>
</html>