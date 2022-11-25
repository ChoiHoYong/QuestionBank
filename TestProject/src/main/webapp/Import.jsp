<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.io.IOException"%>
<%@page import="back.Import_java"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Import</title>
</head>
<body>
<%		
	// path, path ���� ����
	String realFolder = "";
	String saveFolder = "fileSave";
	
	String encType = "utf-8";
	// 5MB
	int maxSize = 5*1024*1024;
	
	// ������ �ְ� path ����
	ServletContext context = request.getServletContext();
	realFolder = context.getRealPath(saveFolder);
	out.println("the realpath is: " + realFolder + "<br>");

	try{
		MultipartRequest multi = null;
		
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		
		Enumeration<?> params = multi.getParameterNames();
		
		while(params.hasMoreElements()){
			String name = (String) params.nextElement();
			String value = multi.getParameter(name);
		}
		
		Enumeration<?> files = multi.getFileNames();
		
		String name = (String)files.nextElement();
		// ���ϸ� ������
		String original = multi.getOriginalFileName(name);
		// path + ���ϸ� = ��� �ϼ�
		realFolder = realFolder + "\\" +original;	
		
	} catch (IOException ioe){
		out.print(ioe);
	} catch (Exception e){
		out.print(e);
	}
	
	int[][] arr_int = Import_java.getFile(realFolder);
	Import_java.insertFile(arr_int);	
	
	//Lookup.jsp�� �̵�
	response.sendRedirect("Lookup.jsp");
%>	
</body>
</html>