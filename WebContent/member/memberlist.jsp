<%@page import="com.iu.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	
	
	
	
	String kind=request.getParameter("kind");
	String search = request.getParameter("search");
	
	if(kind==null){
		kind="id";
	}
	
	if(search==null){
		search="";
	}
	
	

	
	int curPage = 1;
	int perPage = 10;
	int perBlock = 5;
	try {
		curPage = Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {

	}
	MemberDAO memberDAO = new MemberDAO();
	int startRow = (curPage - 1) * perPage + 1;
	int lastRow = curPage * perPage;

	ArrayList<MemberDTO> ar = memberDAO.selectList(startRow, lastRow,kind,search);

	int totalCount = memberDAO.getTotalCount(kind,search);

	int totalPage = 0;
	if (totalCount % perPage == 0)
		totalPage = totalCount / perPage;
	else
		totalPage = totalCount / perPage + 1;

	int totalBlock = 0;
	if (totalPage % perBlock == 0)
		totalBlock = totalPage / perBlock;
	else
		totalBlock = totalPage / perBlock + 1;

	int curBlock = 0;
	if (curPage % perBlock == 0)
		curBlock = curPage / perBlock;
	else
		curBlock = curPage / perBlock + 1;

	int startNum = (curBlock - 1) * perBlock + 1;
	int lastNum = curBlock * perBlock;
	if (curBlock == totalBlock)
		lastNum = totalPage;
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet">
<style type = "text/css">
table,tr,td{
border:1px solid black;



}


</style>




</head>
<body>
	<%@ include file="../temp/header.jsp"%>


	<section id="main">
		<h1>Member List</h1>
		<article id="list">
			<table class="tale table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>EMAIL</th>
						<th>PHONE</th>
						<th>AGE</th>
					</tr>
				</thead>
				<tbody>
					<%for(int i=0; i<ar.size(); i++){ 
							memberDTO = ar.get(i);%>
						<tr>
							<td><%=memberDTO.getId() %></td>
							<td><%=memberDTO.getName() %></td>
							<td><%=memberDTO.getEmail() %></td>
							<td><%=memberDTO.getPhone() %></td>
							<td><%=memberDTO.getAge() %></td>
					<%}%>
				</tbody>
			</table>
		</article>
		
<form action="./memberlist.jsp">
		<select name="kind">
			<option value="id">Id</option>
			<option value="name">Name</option>
			<option value="email">Email</option>
		</select>
		<input type="text" name="search">
		<input type="submit" value="SEARCH">
	</form>
	</section>




	<%@ include file="../temp/footer.jsp"%>
</body>
</html>