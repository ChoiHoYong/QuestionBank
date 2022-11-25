<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.function.Function"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="back.MathProblemDTO"%>
<%@page import="back.MathProblemDAO"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<title>:o</title>
<!--�ĺ��� �����ϴٰ� ���� -->
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png"> 
</head>
<body>
	<h2>���� �����Դϴ�.</h2>	
	<%
	MathProblemDAO memberDAO = new MathProblemDAO(); 
	ArrayList<MathProblemDTO> dtos = memberDAO.memberSelect();

	// DB ������ ���� �迭 ����
	int[][] lastArr = new int[150][8]; 

	// DB ������ ��������
	for (int i = 0; i < dtos.size(); i++) {
		MathProblemDTO dto = dtos.get(i);

		int id = dto.getId();

		int problem1 = dto.getProblem1();

		int problem2 = dto.getProblem2();

		int no1 = dto.getNo1();

		int no2 = dto.getNo2();

		int no3 = dto.getNo3();

		int no4 = dto.getNo4();

		int answer = dto.getAnswer();

		lastArr[i][0] = problem1;
		lastArr[i][1] = problem2;
		lastArr[i][2] = no1;
		lastArr[i][3] = no2;
		lastArr[i][4] = no3;
		lastArr[i][5] = no4;
		lastArr[i][6] = answer;
	}

	// 10���� ���� ����
	Random random = new Random();
	int[] nums = new int[10];
	for (int j = 0; j < nums.length; j++) {
		nums[j] = random.nextInt(dtos.size()) - 1;
		for (int n = 0; n < j; n++) {
			// �ߺ��� ���� ������ �ٽ� ����
			if (nums[j] == nums[n]) {
		j--;
			}
		}
	}
	%>
	
	<!-- [������ ���] ��ȸ�� �̵� -->
	<form action="Lookup.jsp" name="lookup" method="post">
		<input type="submit" value="��ȸ">
	</form>	
	
	<!-- ���� ���� ������ �ߴ� �˾�â -->
	<script type="text/javascript">
		function check() {
			if (document.mol.q1.value == "") 
				alert("1�� ���� ����.");
			else if (document.mol.q2.value == "") 
				alert("2�� ���� ����.");
		    else if (document.mol.q3.value == "") 
				alert("3�� ���� ����.");
		    else if (document.mol.q4.value == "") 
				alert("4�� ���� ����.");
			else if (document.mol.q5.value == "") 
				alert("5�� ���� ����.");
			else if (document.mol.q6.value == "") 
				alert("6�� ���� ����.");
			else if (document.mol.q7.value == "") 
				alert("7�� ���� ����.");
			else if (document.mol.q8.value == "") 
				alert("8�� ���� ����.");
			else if (document.mol.q9.value == "") 
				alert("9�� ���� ����.");
			else if (document.mol.q10.value == "") 
				alert("10�� ���� ����.");
			else
				mol.submit();
		}
	</script>
	
	<!-- ���� ��� �� Result.jsp�� ���� -->
	<form action="Result.jsp" name="mol" method="post">
		<br>
		<p>				
		<h2>����1.  &nbsp;
		<%=lastArr[nums[0]][0]%> + <%=lastArr[nums[0]][1]%></h2>
		<input type="radio" name="q1" value="<%=lastArr[nums[0]][2]%>" /><%=lastArr[nums[0]][2]%><br>
		<input type="radio" name="q1" value="<%=lastArr[nums[0]][3]%>" /><%=lastArr[nums[0]][3]%><br>
		<input type="radio" name="q1" value="<%=lastArr[nums[0]][4]%>" /><%=lastArr[nums[0]][4]%><br>
		<input type="radio" name="q1" value="<%=lastArr[nums[0]][5]%>" /><%=lastArr[nums[0]][5]%><br><br>

		<h2>����2.  &nbsp;
		<%=lastArr[nums[1]][0]%> + <%=lastArr[nums[1]][1]%></h2>
		<input type="radio" name="q2" value="<%=lastArr[nums[1]][2]%>" /><%=lastArr[nums[1]][2]%><br>
		<input type="radio" name="q2" value="<%=lastArr[nums[1]][3]%>" /><%=lastArr[nums[1]][3]%><br>
		<input type="radio" name="q2" value="<%=lastArr[nums[1]][4]%>" /><%=lastArr[nums[1]][4]%><br>
		<input type="radio" name="q2" value="<%=lastArr[nums[1]][5]%>" /><%=lastArr[nums[1]][5]%><br><br>

		<h2>����3. &nbsp;
		<%=lastArr[nums[2]][0]%> + <%=lastArr[nums[2]][1]%></h2>
		<input type="radio" name="q3" value="<%=lastArr[nums[2]][2]%>" /><%=lastArr[nums[2]][2]%><br>
		<input type="radio" name="q3" value="<%=lastArr[nums[2]][3]%>" /><%=lastArr[nums[2]][3]%><br>
		<input type="radio" name="q3" value="<%=lastArr[nums[2]][4]%>" /><%=lastArr[nums[2]][4]%><br>
		<input type="radio" name="q3" value="<%=lastArr[nums[2]][5]%>" /><%=lastArr[nums[2]][5]%><br><br>

		<h2>����4. &nbsp; 
		<%=lastArr[nums[3]][0]%> + <%=lastArr[nums[3]][1]%></h2>
		<input type="radio" name="q4" value="<%=lastArr[nums[3]][2]%>" /><%=lastArr[nums[3]][2]%><br>
		<input type="radio" name="q4" value="<%=lastArr[nums[3]][3]%>" /><%=lastArr[nums[3]][3]%><br>
		<input type="radio" name="q4" value="<%=lastArr[nums[3]][4]%>" /><%=lastArr[nums[3]][4]%><br>
		<input type="radio" name="q4" value="<%=lastArr[nums[3]][5]%>" /><%=lastArr[nums[3]][5]%><br><br>

		<h2>����5.  &nbsp;
		<%=lastArr[nums[4]][0]%> + <%=lastArr[nums[4]][1]%></h2>
		<input type="radio" name="q5" value="<%=lastArr[nums[4]][2]%>" style="font-size:20px;"/><%=lastArr[nums[4]][2]%><br>
		<input type="radio" name="q5" value="<%=lastArr[nums[4]][3]%>" style="font-size:20px;"/><%=lastArr[nums[4]][3]%><br>
		<input type="radio" name="q5" value="<%=lastArr[nums[4]][4]%>" style="font-size:20px;"/><%=lastArr[nums[4]][4]%><br>
		<input type="radio" name="q5" value="<%=lastArr[nums[4]][5]%>" style="font-size:20px;"/><%=lastArr[nums[4]][5]%><br><br>
		
		<h2>����6.  &nbsp;
		<%=lastArr[nums[5]][0]%> + <%=lastArr[nums[5]][1]%></h2>
		<input type="radio" name="q6" value="<%=lastArr[nums[5]][2]%>" style="font-size:20px;"/><%=lastArr[nums[5]][2]%><br>
		<input type="radio" name="q6" value="<%=lastArr[nums[5]][3]%>" style="font-size:20px;"/><%=lastArr[nums[5]][3]%><br>
		<input type="radio" name="q6" value="<%=lastArr[nums[5]][4]%>" style="font-size:20px;"/><%=lastArr[nums[5]][4]%><br>
		<input type="radio" name="q6" value="<%=lastArr[nums[5]][5]%>" style="font-size:20px;"/><%=lastArr[nums[5]][5]%><br><br>
		
		<h2>����7.  &nbsp;
		<%=lastArr[nums[6]][0]%> + <%=lastArr[nums[6]][1]%></h2>
		<input type="radio" name="q7" value="<%=lastArr[nums[6]][2]%>" style="font-size:20px;"/><%=lastArr[nums[6]][2]%><br>
		<input type="radio" name="q7" value="<%=lastArr[nums[6]][3]%>" style="font-size:20px;"/><%=lastArr[nums[6]][3]%><br>
		<input type="radio" name="q7" value="<%=lastArr[nums[6]][4]%>" style="font-size:20px;"/><%=lastArr[nums[6]][4]%><br>
		<input type="radio" name="q7" value="<%=lastArr[nums[6]][5]%>" style="font-size:20px;"/><%=lastArr[nums[6]][5]%><br><br>
		
		<h2>����8.  &nbsp;
		<%=lastArr[nums[7]][0]%> + <%=lastArr[nums[7]][1]%></h2>
		<input type="radio" name="q8" value="<%=lastArr[nums[7]][2]%>" style="font-size:20px;"/><%=lastArr[nums[7]][2]%><br>
		<input type="radio" name="q8" value="<%=lastArr[nums[7]][3]%>" style="font-size:20px;"/><%=lastArr[nums[7]][3]%><br>
		<input type="radio" name="q8" value="<%=lastArr[nums[7]][4]%>" style="font-size:20px;"/><%=lastArr[nums[7]][4]%><br>
		<input type="radio" name="q8" value="<%=lastArr[nums[7]][5]%>" style="font-size:20px;"/><%=lastArr[nums[7]][5]%><br><br>
		
		<h2>����9.  &nbsp;
		<%=lastArr[nums[8]][0]%> + <%=lastArr[nums[8]][1]%></h2>
		<input type="radio" name="q9" value="<%=lastArr[nums[8]][2]%>" style="font-size:20px;"/><%=lastArr[nums[8]][2]%><br>
		<input type="radio" name="q9" value="<%=lastArr[nums[8]][3]%>" style="font-size:20px;"/><%=lastArr[nums[8]][3]%><br>
		<input type="radio" name="q9" value="<%=lastArr[nums[8]][4]%>" style="font-size:20px;"/><%=lastArr[nums[8]][4]%><br>
		<input type="radio" name="q9" value="<%=lastArr[nums[8]][5]%>" style="font-size:20px;"/><%=lastArr[nums[8]][5]%><br><br>
		
		<h2>����10.  &nbsp;
		<%=lastArr[nums[9]][0]%> + <%=lastArr[nums[9]][1]%></h2>
		<input type="radio" name="q10" value="<%=lastArr[nums[9]][2]%>" style="font-size:20px;"/><%=lastArr[nums[9]][2]%><br>
		<input type="radio" name="q10" value="<%=lastArr[nums[9]][3]%>" style="font-size:20px;"/><%=lastArr[nums[9]][3]%><br>
		<input type="radio" name="q10" value="<%=lastArr[nums[9]][4]%>" style="font-size:20px;"/><%=lastArr[nums[9]][4]%><br>
		<input type="radio" name="q10" value="<%=lastArr[nums[9]][5]%>" style="font-size:20px;"/><%=lastArr[nums[9]][5]%><br><br>
		
		<!-- check()�� null Ȯ�� �� ����� �̵� --> 
		<input type="button" value="����" onclick="check()" style="width: 40pt; height: 25pt; font-size:20px;"/> 
		
		<!-- ���� ������ ���� -->
		<input type="hidden" name="a1" value="<%=lastArr[nums[0]][6]%>"> 
		<input type="hidden" name="a2" value="<%=lastArr[nums[1]][6]%>"> 
		<input type="hidden" name="a3" value="<%=lastArr[nums[2]][6]%>"> 
		<input type="hidden" name="a4" value="<%=lastArr[nums[3]][6]%>"> 
		<input type="hidden" name="a5" value="<%=lastArr[nums[4]][6]%>">
		<input type="hidden" name="a6" value="<%=lastArr[nums[5]][6]%>">
		<input type="hidden" name="a7" value="<%=lastArr[nums[6]][6]%>">
		<input type="hidden" name="a8" value="<%=lastArr[nums[7]][6]%>">
		<input type="hidden" name="a9" value="<%=lastArr[nums[8]][6]%>">
		<input type="hidden" name="a10" value="<%=lastArr[nums[9]][6]%>">
	
	</form>

</body>
</html>