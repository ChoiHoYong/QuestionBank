<%@page import="back.MathProblemDTO"%>
<%@page import="back.MathProblemDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
	<%
	// 유저의 답, 정답 리스트 생성
	ArrayList<Integer> userAnswerList = new ArrayList<Integer>();
	ArrayList<Integer> AnswerList = new ArrayList<Integer>();
	
	// 점수
	int grade = 0;
	
	try {
		
		// MathProblem에서 보낸 데이터 저장
		for (int i = 1; i <= 10; i++) {
			AnswerList.add(Integer.parseInt(request.getParameter("a" + i)));
			userAnswerList.add(Integer.parseInt(request.getParameter("q" + i)));
		}
		
		// 점수 계산
		for (int i = 0; i < AnswerList.size(); i++) {
			if (AnswerList.get(i).equals(userAnswerList.get(i)))
		grade += 10;
		}
	} catch (Exception e) {
		out.print(e);
	}
	%>
	<br>
	<!-- 점수 출력 -->
	<font size="10em"><%=grade + "점"%></font>

</body>
</html>