<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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

<jsp:useBean id="uvo" class="com.foodary.vo.UserFoodVO">
	<jsp:setProperty property="*" name="uvo"/>
</jsp:useBean>

<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt(request.getParameter("idx"));
	UserFoodService.getInstance().deleteUserFoodList(idx);
	
	UserFoodList userFoodList = UserFoodService.getInstance().userSelectList(uvo);
	session.setAttribute("userFoodList", userFoodList);
	response.sendRedirect("foodWrite.jsp");
%>

</body>
</html>