<%@page import="com.util.DBConn" %>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String str = "";

	try
	{
		Connection conn = DBConn.getConnection();
		if(conn != null)
			str += "데이터베이스 연결 성공~!!!";
	}
	catch(Exception e)
	{
		str += e.toString();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터베이스 연결 실습</h1>
	<hr>
</div>

<div>
	<h2><%=str %></h2>
</div>

</body>
</html>