<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link href="../css/header.css">
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
		
		
	}


</script>
</head>

<body>
	
	<%@ include file="../temp/header.jsp" %>
	
	

<section>
	<div id="contents2">
	<form id="frm" name="frm" action="noticeWriteProcess.jsp" method="post">
		<table style="margin:0 auto; margin-top:200px;">
		<tr><td>
		<input type="text" name="title" id="title"  style="width:800px;">
		</td></tr>
		<tr><td>
		<textarea rows="30" cols="112" name="contents" id="ta" style="resize:none;"></textarea>
		</td></tr>
		</table>
		<div>
	<input type="button" class="btn btn-info" id="btn" value="확인" style="float:right;">
	</div>
	</form>
	</div>


</section> 

	<%@ include file="../temp/footer.jsp" %>
</body>
</html>