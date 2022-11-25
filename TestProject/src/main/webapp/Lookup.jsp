<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>:ㅇ</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<form action="MathProblem.jsp" style="float: left; width: 22%;">
					<input type="submit" value="<-" style="height: 25pt; width:25pt;">
				</form>
		
				<form action="Import.jsp" name="import" enctype="multipart/form-data" method="post" style="float: left; width: 41%; margin-left:50px;"> 
					<input type="file" name="file" value="파일 업로드" required accept=".xls" style="height: 23pt; font-size:14px; width:50%; margin-right:90px;">
					<!-- excel or db 데이터 행 추가 -->
					<input type="submit" value="IMPORT" style="width: 55pt; height: 25pt; font-size:15px; margin-left:5px;">
				</form>
		
				<!-- Insert.jsp로 이동 -->
				<form action="Insert.jsp" name="insert" method="post" style="float: left; width: 16%;">		
					<!-- 임의의 행 추가 -->
					<input type="submit" value="INSERT" style="width: 55pt; height: 25pt; font-size:15px; margin-right:293px;">
				</form>
			</td>
		</tr>
	</table>
	
			
	<%
	Class.forName("org.mariadb.jdbc.Driver");
	
	String url = "jdbc:mariadb://localhost:3306/test";
	String user = "root";
	String pwd = "1q2w3e4r!";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn = DriverManager.getConnection(url,user,pwd);
		
		stmt = conn.createStatement();
		
		// test_table 전체 출력
		String sql = "SELECT * FROM test_table";
		rs = stmt.executeQuery(sql);
	%>
	
	<table border="1"  style="text-align:center">
		<tr>
			<td width="70">id</td>
			<td width="70">mq_f</td>
			<td width="70">mq_b</td>
			<td width="70">ua_1</td>
			<td width="70">ua_2</td>
			<td width="70">ua_3</td>
			<td width="70">ua_4</td>
			<td width="70">answer</td>
			<TD width="70">Remark</TD>
		</tr>
		<%
			// 데이터가 null일 때까지 반복
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getInt("num") %></td>
			<td><%=rs.getInt("mq1") %></td>
			<td><%=rs.getInt("mq2") %></td>
			<td><%=rs.getInt("ua1") %></td>
			<td><%=rs.getInt("ua2") %></td>
			<td><%=rs.getInt("ua3") %></td>
			<td><%=rs.getInt("ua4") %></td>
			<td><%=rs.getInt("a") %></td>
			
			<TD>
				<!-- Delete.jsp 링크 생성. 해당 행의 num을 가져감 -->
				<A href="Delete.jsp?num=<%=rs.getInt("num")%>">Drop()</A>
			</TD>
		</tr>
		<%	
			} //end while
		%>
	</table>
		
	<%
	} catch(Exception e){
		out.print(e);
	}
	%>
	
</body>
</html>