<%@page import="com.iu.notice.noticeDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	noticeDAO babyDAO = new noticeDAO();
	int result =babyDAO.delete(num);
	
	String s = "Fail";
	if(result>0){
		s = "Success";
	}
		//attribute : name(String), value(Object);

		
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%= s%>');
	location.href="noticeList.jsp";
</script>