<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDAO memberDAO = new MemberDAO();
%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div>
			<form name="frm" action="./memberUpdateProcess.jsp">
			<p>
				pw : <input type="password" name="pw" value="<%=memberDTO.getPw()%>">
			</p>
			<p>
				pw확인 : <input type="password" value="<%=memberDTO.getPw()%>">
			</p>
			<p>
				name : <input type="text" name="name"
					value="<%=memberDTO.getName()%>">
			</p>
			<p>
				email : <input type="text" name="email"
					value="<%=memberDTO.getEmail()%>">
			</p>
			<p>
				phone : <input type="text" name="phone"
					value="<%=memberDTO.getPhone()%>">
			</p>
			<p>
				age : <input type="text" name="age" value="<%=memberDTO.getAge()%>">
			</p>
			<input type="button" id="btn" value="확인"> 
			<input
				type="button" id="btn2" value="취소">
			</form>
			
		</div>
		
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
<script type="text/javascript">
var btn = document.frm.btn;
btn.addEventListener("click", function() {
	check = true;
	if(check)
		document.frm.submit();
	
	
});







</script>






</html>