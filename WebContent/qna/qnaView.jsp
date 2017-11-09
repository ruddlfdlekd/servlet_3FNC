<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.iu.qna.QnaDTO"%>
	<%@page import="com.iu.qna.QnaDAO"%>
	<%@page import="com.iu.qna.QnacDTO"%>
<%	

	int num =0;
	try{
	num=Integer.parseInt(request.getParameter("num"));
	}catch(Exception e){
	e.printStackTrace();
	}
	QnaDAO QnaDAO = new QnaDAO();
	QnaDTO QnaDTO = QnaDAO.select(num);
	ArrayList<QnacDTO> ar = QnaDAO.comments(num);
	QnaDAO.hit(QnaDTO.getHit(),QnaDTO.getNum());
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/reset.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	* {
		margin: 0;
		padding: 0;
	}

</style>
<link href="../css/main.css" rel="stylesheet">
<link href="../css/contents.css" rel="stylesheet">
<script type="text/javascript">

window.onload=function(){
	var btn2 = document.getElementById("btn2");
	var btn3 = document.getElementById("btn3");
	
	btn2.addEventListener("click", function(){
		location.href="./qnaUpdateForm.jsp?num=<%=QnaDTO.getNum()%>";			
	});
	btn3.addEventListener("click", function(){
		location.href="./qnaDelete.jsp?num=<%=QnaDTO.getNum()%>";
	});

	
}
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	
	

<section id="main">
<div id="mainContents">
		<h1>View</h1>
	<table class="table table-striped table-bordered table-hover" style="margin:0 auto;">
		<tr><td>
		<input type="text" name="id" id="id"  style="width:800px;" value="작성자 : <%=QnaDTO.getWriter()%>" readonly>
		</td></tr>
		<tr><td>
		<input type="text" name="title" id="title"  style="width:800px;" value="<%=QnaDTO.getTitle()%>" readonly>
		</td></tr>
		<tr><td>
		<textarea rows="30" cols="112" name="contents" id="ta" style="resize:none;" readonly><%=QnaDTO.getContents() %></textarea>
		</td></tr>
		</table>
		<div>
		<input type="button" class="btn btn-info" value="목록" style="float:right; margin-left:20px;" onClick="location.href='./qnaList.jsp';">
		<%if(memberDTO!=null&&memberDTO.getId().equals(QnaDTO.getWriter())){ %>
	<input type="button" class="btn btn-info" id="btn2" value="수정" style="float:right;">
	<input type="button" class="btn btn-info" id="btn3" value="삭제" style="float:right; margin-right:20px;">
	<%} %>
	
	</div>

	<table class="table table-striped table-bordered table-hover" style="margin:0 auto;">
	<tr><td style="width:100px;">작성자</td><td style="text-align: center; width:700px;">댓글 내용</td></tr>
	<%for(int i=0; i<ar.size(); i++){ 
							QnacDTO QnacDTO = ar.get(i);%>
	<tr><td><%=QnacDTO.getWriterc()%></td><td><%=QnacDTO.getContents()%></td></tr>
	<%} %>
	
	</table>
	
		<table class="table table-striped table-bordered table-hover" style="margin:0 auto;">
		<tr><td>
	<textarea rows="5" cols="50" value="댓글작성"></textarea>
</td></tr>
	</table>
	</div>
	
	

</section> 
<div>
</div>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>