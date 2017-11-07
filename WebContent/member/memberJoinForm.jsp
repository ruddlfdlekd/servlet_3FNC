<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
	}
</style>
<link href="../css/reset.css">
<link href="../css/header.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<link href="../css/contents.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp" %>

<section>
<div>
<h1>MEMBER JOIN</h1>
<br><BR><BR><BR><BR><BR><BR>
	<form name ="frm" action="./memberJoinProcess.jsp">
	<p>Id : <input type="text" name="id" id = "id" class="n"><input type="button" id="idcheck" value="중복확인"><input type="checkbox" id="check1" disabled> </p>
	<p>Pw : <input type="password" id="pw1" name="pw" class="n"> <input type="checkbox" id="pc" disabled></p>
	<p>Pw 다시 : <input type="password" id="pw2" name="pw2"></p>
	<p>Name : <input type="text" name="name" class="n"> </p>
	<p>Email : <input type="text" name="email" class="n"> </p>
	<p>Phone : <input type="text" name="phone" class="n"> </p>
	<p>Age : <input type="text" name="age" class="n"> </p>
	<p>Student <input type="radio" name="job" value="S" checked class="n"> </p>
	<p>Teacher <input type="radio" name="job" value="T" class="n"> </p>
	<input type="button" id="btn" value="확인" style="float:left;">
	</form>
	</div>
</section>
<br><BR><BR><BR><BR><BR><BR>

	<%@ include file="../temp/footer.jsp" %>
</body>
<script type="text/javascript">

var a = document.getElementsByClassName("n");
var btn = document.getElementById("btn");
var idcheck = document.getElementById("idcheck");
var pw1 = document.getElementById("pw1");
var pw2 = document.getElementById("pw2");

btn.addEventListener("click", function(){
	var check=true;
for(var i=0; i<a.length; i++){
	if(a[i].value==""){
	alert("필수 항목은 입력");
	check=false;
	break;
}
	if(check)
		document.frm.submit();
	}
});


idcheck.addEventListener("click", function() {
	var id = document.frm.id.value;
	window.open("memberIdCheck.jsp?id="+id,"","top=200,left=300,width=400,height=300");
	
	
});

z






</script>



</html>