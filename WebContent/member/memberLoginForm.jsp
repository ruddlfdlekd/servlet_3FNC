<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
<br><br><br><BR><BR><BR>
<form name="frm" action="memberLoginProcess">
<p>ID : <input type="text" id="id" name="id"></p>
<p>PW : <input type="password" id="pw" name="pw"></p>
<p><input type="button" id="btn" value="Login"></p>
</form> 
<br><br><br><BR><BR><BR>
	<%@ include file="../temp/footer.jsp"%>
</body>
<script type="text/javascript">
var btn = document.getElementById("btn");
btn.addEventListener("click", function() {
	var id = document.frm.id.value;
	var pw = document.frm.pw.value;
	if(id!=""&&pw!=""){
	window.open("memberLoginProcess.jsp","","top=200,left=300,width=400,height=300");
	}
	else
		alert("아이디or비밀번호를 적어주세요");
	
});









</script>





</html>