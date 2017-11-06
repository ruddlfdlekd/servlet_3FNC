<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link href="../css/reset.css">
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
		btn.addEventListener("click", function(){
			location.href="./noticeWriteForm.jsp";			
		});
		
		
	}


</script>


</head>
<body>
	
	<%@ include file="../temp/header.jsp"%>
	
<form action="joinInputProcess.jsp" method="post" id="frm" name="frm">
		<p>
			ID : <input type="text" name="name" id="name">
		</p>
		<p>
			PW : <input type="password" name="password" id="password">
		</p>
		<p>
			NAME : <input type="text" name="weight" id="weight">
		</p>
		<p>
			Age : <input type="number" min="0" name="age" id="age">
		</p>
		<p>
			Weight : <input type="text" name="weight" id="weight">
		</p>
		<p>
			Height : <input type="text" name="height" id="height">
		</p>
		<p>
			Gender : M <input type="radio" value="M" name="gender"> F <input
				type="radio" value="F" name="gender">
		</p>
		<p>
			Birth : <input type="date" name="birth" id="birth">
		</p>
		<input type="button" value="Join" id="check">
		</form>
		
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>