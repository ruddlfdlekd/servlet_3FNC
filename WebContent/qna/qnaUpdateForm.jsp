<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.iu.qna.QnaDTO"%>
	<%@page import="com.iu.qna.QnaDAO"%>
 <%
 int num = Integer.parseInt(request.getParameter("num"));

 QnaDAO QnaDAO = new QnaDAO();
 QnaDTO QnaDTO = QnaDAO.select(num);
 
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
	var btn = document.getElementById("btn");
	var btn2 = document.getElementById("btn2");
	
	
	btn.addEventListener("click", function(){
		//Form 특화
		//document.폼의name.iuput의name
		
		
		
		var n = document.getElementById("title");
		var check=true;
			if(n.value==""){
				alert("필수 항목은 입력");
				check=false;
			}
		if(check)
			document.frm.submit();
	});

	btn2.addEventListener("click", function(){
		location.href="./qnaView.jsp?num=<%=QnaDTO.getNum()%>";			
	});
		
	
}

</script>
</head>

<body>
	
	<%@include file="../temp/header.jsp"%>
	
	

<section id="main">

	<div id="contents2">
	<form id="frm" name="frm" action="qnaUpdateProcess.jsp?num=<%=QnaDTO.getNum()%>" method="post">
	<h1>Update</h1>
	<table style="margin:0 auto;">
		<tr><td>
		<input type="text" name="id" id="id"  style="width:800px;" value="작성자 : <%=QnaDTO.getWriter()%>" readonly>
		</td></tr>
		<tr><td>
		<input type="text" name="title" id="title"  style="width:800px;" value="<%=QnaDTO.getTitle()%>">
		</td></tr>
		<tr><td>
		<textarea rows="30" cols="112" name="contents" id="ta" style="resize:none;"><%=QnaDTO.getContents() %></textarea>
		</td></tr>
		</table>
	<input type="button" class="btn btn-info" id="btn" value="확인" style="float:right;">
	</form>
	<input type="button" class="btn btn-info" id="btn2" value="취소" style="float:right; margin-right:20px;">
	</div>
	


</section> 

	<%@ include file="../temp/footer.jsp" %>