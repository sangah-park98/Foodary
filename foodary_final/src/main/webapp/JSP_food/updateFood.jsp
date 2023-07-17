<%@page import="com.foodary.vo.UserFoodList"%>
<%@page import="com.foodary.service.UserFoodService"%>
<%@page import="com.foodary.vo.UserFoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String userFoodName = request.getParameter("userFoodName");
	String dietK = request.getParameter("userKcal");
	String dietC = request.getParameter("userCarbs");
	String dietP = request.getParameter("userProtein");
	String dietF = request.getParameter("userFat");
	String userFoodDate = request.getParameter("userFoodDate");
	String userFoodTime = request.getParameter("userFoodTime");
	
	float userKcal = Float.parseFloat(dietK);
	float userCarbs = Float.parseFloat(dietC);
	float userProtein = Float.parseFloat(dietP);
	float userFat = Float.parseFloat(dietF);
	
	
	UserFoodVO uvo = new UserFoodVO(idx, userFoodName, userKcal, userCarbs, userProtein, userFat, userFoodDate, userFoodTime);
  	UserFoodService.getInstance().UpdateUserFoodList(uvo);
	UserFoodList userFoodList = UserFoodService.getInstance().userSelectList(uvo);
	session.setAttribute("userFoodList", userFoodList);
	response.sendRedirect("foodWrite.jsp");
%>
</body>
</html>