<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>비밀번호 변경</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript" src="./js/userRegister.js"></script>
</head>
<body>

<form action="newPassword.jsp" method="post">
	<div>
		비밀번호 변경<br/>
		<span style="text-decoration: underline;">안전한 비밀번호로 내 정보를 보호하세요.</span><br/><br/>
		<input id="currentpassword" name="currentpassword" type="password" placeholder="현재 비밀번호"/><br/>
		<input id="newpassword" name="newpassword" type="password" placeholder="새 비밀번호" onkeyup="passwordCheckFunction()"/><br/>
		<input id="newpasswordcheck" name="newpasswordcheck" type="password" placeholder="새 비밀번호 확인" onkeyup="passwordCheckFunction()"/><br/>
		<h5 id="passwordCheckMessage" style="color: red; font-weight: bold;"></h5>
	</div>
	<div>
		<input id="newpassword" type="submit" name="newpassword" value="확인"/>
		<input type="button" value="취소" onclick="location.href='/foodary_final/JSP_main/foodaryMainPageAfter.jsp'"/>
	</div>
	<input type="hidden" name="currentpassword" value="<%= request.getParameter("currentpassword") %>">
	<input type="hidden" name="newpassword" value="<%= request.getParameter("newpassword") %>">
	<input type="hidden" name="newpasswordcheck" value="<%= request.getParameter("newpasswordcheck") %>">
</form>
</body>
</html>
