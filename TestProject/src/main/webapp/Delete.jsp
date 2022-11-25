<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>:(</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	// Lookup.jsp에서 보낸 num 저장
	String num = request.getParameter("num");
	
	// int형으로 변형
	int nNum = Integer.parseInt(num);
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mariadb://localhost:3306/test";
		String user = "root";
		String pwd = "1q2w3e4r!";
		
		Connection conn = DriverManager.getConnection(url,user,pwd);
		
		// 해당 행을 Delete
		String sql = "DELETE FROM test_table WHERE num=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nNum);
		
		pstmt.executeUpdate(); 
		
		// Delete한 행보다 큰 행을 한칸씩 땡겨서 채워줌
		sql = "UPDATE test_table SET num = num - 1 WHERE num > ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, nNum);
		
		pstmt.executeUpdate();
		
		// num 속성에 auto_increment 초기화(안해주면 번호가 꼬임)
		sql = "ALTER TABLE test_table AUTO_INCREMENT=1";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
	}catch(ClassNotFoundException e){
		out.print(e);
	}
	catch(SQLException e){
		out.print(e);
	}
	// Lookup.jsp로 이동
	response.sendRedirect("Lookup.jsp");
	%>
</body>
</html>