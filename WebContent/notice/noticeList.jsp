<%@page import="com.iu.notice.noticeDTO"%>
<%@page import="com.iu.notice.noticeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.notice.DBConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
    int curPage=1;
    String kind=request.getParameter("kind");
    String search=request.getParameter("search");
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
		e.printStackTrace();
	}
	if(curPage==0)
		curPage=1;
	
	int perPage=10;
	int startRow=(curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	noticeDAO noticeDAO = new noticeDAO();
	ArrayList<noticeDTO> ar = noticeDAO.selectList(startRow,lastRow);
	///////////////////////////////////////////
	int totalCount = noticeDAO.getTotalCount();
	int totalPage=0;
	if(totalCount%perPage==0){
		totalPage=totalCount/perPage;
	}else {
		totalPage=totalCount/perPage+1;
	}
	int totalBlock=0;
	int perBlock=5;
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	}else {
		totalBlock=totalPage/perBlock+1;
	}
	int curBlock =0;
	
	if(curPage%perBlock==0)
	curBlock=curPage/perBlock;	
	else
	curBlock=curPage/perBlock+1;
	
	
	//curBlock , startNum, lastNum
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	
	
	
	if(curPage<2)
		startNum=1;
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


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
	
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
	<div>
	<h2 id="fw">NOTICE</h2>
	<div id="contents">
	<table class="table table-hover">
		<tr id="tr1">
			<td><font>NO</font></td>
			<td id="subject"><font>SUBJECT</font></td>
			<td><font>NAME</font></td>
			<td class="date"><font>DATE</font></td>
			<td class="hit"><font>HIT</font></td>
		</tr>
	
		<% for(noticeDTO noticeDTO: ar){ %>
			<tr>
				<td><%=noticeDTO.getNum()%> </td>
				<td  style="text-align:left;"><a href="noticeView.jsp?num=<%=noticeDTO.getNum()%>"><%=noticeDTO.getTitle()%></a> </td>
				<td><%=noticeDTO.getWriter()%></td>
				<td><%=noticeDTO.getReg_data()%> </td>
				<td><%=noticeDTO.getHit()%> </td>	
				</tr>
				<%} %>
	</table>
		
	<div style="margin:0 auto;">
	 <ul class="pagination">
	    <li><a href="./noticeList.jsp?curPage=<%=startNum-1%>"><</a></li>
    <%	for(int i=startNum;i<=lastNum;i++){ %>
    
    <li><a href="./noticeList.jsp?curPage=<%=i%>"><%=i %></a></li>
    
    <%} %>
       <li><a href="./noticeList.jsp?curPage=<%=lastNum+1%>">></a></li>
  </ul>
	</div>
	<form action="./noticeList.jsp">
	<select name="kind">
		<option value="title">Title</option>
		<option value="writer">Writer</option>
		<option value="contenets">Contents</option>
	</select>
	<Input type="text" name="search">
	<Input type="submit" value="SEARCH">
	</form>
	<input type="button" class="btn btn-info" id="btn" value="글쓰기"> 
	
	
	</div>
	
	</div>
	
	</section> 
		<%@ include file="../temp/footer.jsp" %>
</body>
</html>