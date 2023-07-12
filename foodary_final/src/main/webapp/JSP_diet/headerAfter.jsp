<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인후 헤더</title>
</head>
<body>
<header>
	<!-- 네비게이션 바 -->
		<div style="height: 70px; line-height: 70px; display: flex; justify-content: space-between; background: #f0f0f0">
			<div style="padding-left : 20px;">
				<a href="/foodary_final/JSP_food/foodWrite.jsp" style="font-size: 20pt; color: black; text-decoration: none;">식단 쓰기</a><br/>
				<a href="/foodary_final/JSP_diet/dietList.jsp" style="font-size: 20pt; color: black; text-decoration: none;">식단 보기</a><br/>
				<a href="/foodary_final/JSP_freeboard/list.jsp" style="font-size: 20pt; color: black; text-decoration: none;">자유게시판</a>
			</div>
			<div style="padding-right : 20px;">
				<a class="navbar-form navbar-right" href="/foodary_final/JSP_main/foodaryMainPageAfter.jsp"
				style="font-family: 'insungitCutelivelyjisu'; position:relative;  margin-top: 0; font-size: 30pt; font-weight:900; color: black; text-decoration: none;">Foodary</a>
			</div>
		</div>
</header>
</body>
</html>