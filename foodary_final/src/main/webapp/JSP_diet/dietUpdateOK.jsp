<%@page import="com.foodary.vo.UserFoodVO"%>
<%@page import="com.foodary.vo.UserFoodList"%>
<%@page import="com.foodary.service.UserFoodService"%>
<%@page import="com.foodary.vo.DietVO"%>
<%@page import="com.foodary.vo.DietList"%>
<%@page import="com.foodary.service.DietService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="dvo" class="com.foodary.vo.DietVO">
   <jsp:setProperty property="*" name="dvo"/>
</jsp:useBean>

<jsp:useBean id="uvo" class="com.foodary.vo.UserFoodVO">
   <jsp:setProperty property="*" name="uvo"/>
</jsp:useBean>


<%
   request.setCharacterEncoding("UTF-8");
   String dietWriteDate = request.getParameter("dietWriteDate");
   String dietWriteTime = request.getParameter("dietWriteTime");

   DietVO dietvo = new DietVO();
   dietvo.setDietWriteDate(dietWriteDate);
   dietvo.setDietWriteTime(dietWriteTime);

   DietList dietList = DietService.getInstance().selectDietList(dietvo);
   out.println(dietList);

   
   UserFoodVO userfoodvo = new UserFoodVO();
   userfoodvo.setUserFoodDate(dietWriteDate);
   userfoodvo.setUserFoodTime(dietWriteTime);
   UserFoodList userFoodList = UserFoodService.getInstance().userSelectDietList2(userfoodvo);
   //out.println(userFoodList);
   
   session.removeAttribute("foodNames");
	session.removeAttribute("kcals");
	session.removeAttribute("carbs");
	session.removeAttribute("proteins");
	session.removeAttribute("fats");
	
   session.setAttribute("dietList", dietList);
   session.setAttribute("userFoodList", userFoodList);
   response.sendRedirect("dietUpdate.jsp");

%>



</body>
</html>