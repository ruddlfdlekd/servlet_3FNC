<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String fail = request.getParameter("fail");
	Cookie[] ar = request.getCookies();
	String cId = "";
	for(int i =0; i<ar.length; i++){
		if(ar[i].getName().equals("id")){
			cId =ar[i].getValue();	
			break;
		}
	}
	
	%>   
    
    
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet">
</head>
<body>

	<%@ include file="../temp/header.jsp"%>
<section id="main">
<div id="mainContents">
<form name="frm" action="memberLoginProcess.jsp" method="post">
<p>ID : <input type="text" id="id" name="id" value="<%=cId%>"></p>
<p>PW : <input type="password" id="pw" name="pw"></p>
<p><input type="button" id="btn" value="LogIn"></p>
ID 저장하기 : <input type="checkbox" value="save" name="save"> 
</form> 
<span id="fa"></span>
</div>
</section>
	<%@ include file="../temp/footer.jsp"%>
</body>



<script type="text/javascript">
var btn = document.getElementById("btn");
if(1==<%=fail%>)
	document.getElementById("fa").innerHTML="<font color='red'>로그인 실패 아이디나 비밀번호를 확인해주세요</font>";

btn.addEventListener("click", function() {
	var id = document.frm.id.value;
	var pw = document.frm.pw.value;
	if(id==""||pw==""){
		document.getElementById("fa").innerHTML="<font color='red'>아이디나 비밀번호를 입력해주세요</font>";
	}
	else
		document.frm.submit();
		
	
	
});






</script>





</html>