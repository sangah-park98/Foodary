<%@page import="com.foodary.vo.DietList"%>
<%@page import="com.foodary.vo.UserFoodVO"%>
<%@page import="com.foodary.vo.DietVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodary.service.UserFoodService"%>
<%@page import="com.foodary.vo.UserFoodList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.foodary.service.DietService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>

<!-- foodWrite.jsp에서 불러옴 -->
<%
	request.setCharacterEncoding("UTF-8");
%>

 <jsp:useBean id="dvo" class="com.foodary.vo.DietVO">
	<jsp:setProperty property="*" name="dvo"/>
</jsp:useBean> 
<%
	String dietMemo = request.getParameter("dietMemo");
	String dietWriteDate = null;
	String dietWriteTime = null;
	if(request.getParameter("userFoodDate") == null) {
		 dietWriteDate = request.getParameter("dietWriteDate");
	} else {
		 dietWriteDate = request.getParameter("userFoodDate");
		 dietWriteTime = request.getParameter("userFoodTime");
	}
	//out.println(dietWriteDate  + dietWriteTime);
	dvo.setDietWriteDate(dietWriteDate);
	dvo.setDietWriteTime(dietWriteTime);
	if (dietMemo != null) {
//	foodWrite.jsp에서 넘어온 식단 Diet 테이블에 저장하는 메소드 실행
		DietService.getInstance().insert(dvo);
	} 

	session.removeAttribute("foodName");
	session.removeAttribute("kcal");
	session.removeAttribute("carbs");
	session.removeAttribute("protein");
	session.removeAttribute("fat");
//	입력한 음식글 dietListView.jsp로 넘겨준다.
	response.sendRedirect("dietListView.jsp?dietWriteDate=" + dietWriteDate); 
%>

</body>
</html>;