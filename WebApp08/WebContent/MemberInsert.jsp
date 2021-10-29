<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	
	// 이전 페이지(Test002.jsp)로부터 데이터(userName, userTel) 수신
	
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(insert)
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)" 
			+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// DB 액션 처리 → 작업 객체 생성 및 쿼리문 수행
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result < 1)
	{
		// 이러면 업로드된게 없는것 내가 잘 아는 에러 페이지를 소개시켜줄께~!!!
		response.sendRedirect("Err.jsp");
	}
	else
	{
		// 네가 머물던 리스트 페이지 주소를 다시 요청해서 찾아가봐~!!!
		// 네가 원하는 대로... 리스트 내용이 바뀌어 있을꺼야..
		response.sendRedirect("Test002.jsp");
	}
	
%>













