# QuestionBank

## 프로젝트 소개
Test1

문제 은행입니다.

## 프로젝트 개요
- 개발 기간 : 1주 (11/16 ~ 11/18)
- 참여 인원 : 1인
- 개발 도구 : Eclipse, Tomcat9, MariaDB
- 개발 언어 : JSP, Java
- 플랫폼 : Windows
- lib : cos, jxl, mariadb driver

## 프로젝트 분석

### DataBase

![db_show](https://user-images.githubusercontent.com/102167336/205581925-f1122578-b101-4703-9d4c-2d4597c371a0.PNG)

DB 테이블 구성도

Insert_rand.java로 데이터 입력

### MathProblem.jsp

![mathproblem1_new](https://user-images.githubusercontent.com/102167336/205579930-f9fe212b-8924-43a1-90bb-d831f73721ee.PNG)
![mathproblem2_new](https://user-images.githubusercontent.com/102167336/205579924-c45c985d-c5a8-4ffc-8877-f36033378ca0.PNG)

무작위 10개  뽑아서 출력 후 계산을 하여 제출 버튼을 누르면 점수가 출력

조회 버튼을 누르면 관리자 페이지로 이동

### Lookup.jsp

![main](https://user-images.githubusercontent.com/102167336/205583176-3bc04386-aa75-41af-afb0-0dbfc9bf411a.PNG)

<- Button

MathProblem.jsp로 돌아감

Import Button 

Import_java.java 참조하여 데이터 삽입
(.xls 파일만 가능)

Insert Button

Insert.jsp로 이동 후 Insert_rand.java 참조하여 random 삽입

Drop() Hyper Link

Delete.jsp로 이동 후 해당 행 삭제 후 데이터 정리