<%@page import="back.Insert_rand"%>
<%-- <%@page import="java.sql.DriverManager"%> --%>
<%-- <%@page import="java.sql.Connection"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert</title>
</head>
<body>
<%	
	// �Ű�����: �����ϴ� ��
	Insert_rand.insertData(1);

	// Lookup.jsp�� �̵�
	response.sendRedirect("Lookup.jsp");
%>

</body>
</html>