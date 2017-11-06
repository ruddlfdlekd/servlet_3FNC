<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.iu.notice.noticeDTO"%>
<%@page import="com.iu.notice.noticeDAO"%>
    
<%
	int num = 0; 

	try{
		num=Integer.parseInt(request.getParameter("num"));
	}catch(Exception e){
		e.printStackTrace();
	}
	noticeDAO noticeDAO = new noticeDAO();
	noticeDTO noticeDTO = noticeDAO.select(num);
	noticeDAO.hit(noticeDTO.getHit(),noticeDTO.getNum());
	
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
	var btn4 = document.getElementById("btn4");
	
	btn2.addEventListener("click", function(){
		location.href="./noticeUpdateForm.jsp?num=<%=noticeDTO.getNum()%>";			
	});
	btn3.addEventListener("click", function(){
		location.href="./noticeDeleteProcess.jsp?num=<%=noticeDTO.getNum()%>";
	});
	btn4.addEventListener("click", function(){
		location.href="./noticeList.jsp";			
	});
	
	
}
</script>
</head>

<body>
	
	<%@ include file="../temp/header.jsp" %>
	
	

<section>
	<div id="contents2">
		<h1>View</h1>
	<table style="margin:0 auto;">
		<tr><td>
		<input type="text" name="title" id="title"  style="width:800px;" value="<%=noticeDTO.getTitle()%>" readonly>
		</td></tr>
		<tr><td>
		<textarea rows="30" cols="112" name="contents" id="ta" style="resize:none;" readonly><%=noticeDTO.getContents() %></textarea>
		</td></tr>
		</table>
		<div>
	<input type="button" class="btn btn-info" id="btn2" value="수정" style="float:right;">
	<input type="button" class="btn btn-info" id="btn3" value="삭제" style="float:right; margin-right:20px;">
	<input type="button" class="btn btn-info" id="btn4" value="목록" style="float:right; margin-right:20px;">
	</div>
	</div>


</section> 

	<%@ include file="../temp/footer.jsp" %>
</body>
</html>