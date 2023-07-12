<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script defer type="text/javascript" src="./js/imageRolling.js"></script>
<style type="text/css">
img {
	width: 50px;
	height: 50px;
	float: left;
}

#menubox {
	position: relative;
}

#select {
	width: 50px;
	height: 51px;
	border: 5px solid dodgerblue;
	position: absolute;
	left: 100px;
}
#menu {
	overflow: auto;
}
button {
	width: 50px;
	height: 30px;
	font-size: 16px;
	margin-left: 100px;
}
</style>
</head>
<body>
<h3 style="margin-left: 80px;">★메뉴 추천★</h3>
	<div id="menubox">
		<div id="select"></div>
		<div id="menu">
			<img alt="떡볶이" src="./images/ddbg.jpg"/>
			<img alt="돈까스" src="./images/don.jpg"/>
			<img alt="햄버거" src="./images/hamburg.jpg"/>
			<img alt="라면" src="./images/lamyun.jpg"/>
			<img alt="막창과 소주" src="./images/makchang.jpg"/>
		</div>
		<button type="button">start</button>
	</div>
</body>
</html>

