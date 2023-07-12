<%@page import="com.foodary.vo.UserRegisterVO"%>
<%@page import="com.foodary.dao.UserRegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 신청</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="./js/dropInfo.js" defer="defer"></script>
</head>
<body>
    
<h2>비밀번호 재확인</h2>
<h5>회원탈퇴를 위해 비밀번호를 다시 한 번 입력해 주세요.</h5>
<div class="container" style="margin-top: 20px;">
	<form>
		<table width="350" border="1" cellpadding="5" cellspacing="0">
			<tr>
				<th style="vertical-align: middle;">비밀번호</th>
				<td colspan="2">
					<input 
						id="password" 
						value="${rvo.password}"
						name="password" 
						type="password"
						onkeyup="passwordCheckFunction()"
						readonly="readonly"
						/>
				</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">비밀번호 확인</th>
				<td colspan="2">
					<input 
						id="passwordChk" 
						type="password" 
						name="passwordChk" 
						placeholder="비밀번호를 입력하세요." 
						autocomplete="off" 
						onkeyup="passwordCheckFunction()"
						/>
						
					<h5 id="passwordCheckMessage" style="color: red; font-weight: bold;"></h5>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input id="dropInfo" type="button" name="dropInfo" value="확인" onclick="dropInfo1()"/>
				</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>