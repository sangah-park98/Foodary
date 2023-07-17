<%@page import="com.foodary.vo.UserFoodVO"%>
<%@page import="com.foodary.service.UserFoodService"%>
<%@page import="com.foodary.vo.UserFoodList"%>
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
<%
   request.setCharacterEncoding("UTF-8");
   String dietWriteDate = request.getParameter("dietWriteDate");
   String dietWriteTime = request.getParameter("dietWriteTime");
   String userFoodDate = request.getParameter("dietWriteDate");
   String userFoodTime = request.getParameter("dietWriteTime");
   out.println(dietWriteDate);
   out.println(dietWriteTime);
   
   DietVO dietvo = new DietVO();
   dietvo.setDietWriteDate(dietWriteDate);
   dietvo.setDietWriteTime(dietWriteTime);
   
//   out.println(dietWriteDate + ", " + dietWriteTime);
   DietService service = DietService.getInstance();
   
//   1페이지 분량의 메인글을 얻어온다.
   DietList dietList = service.selectDietList(dietvo);
   out.println(dietList);
   
   UserFoodVO userfoodvo = new UserFoodVO();
   userfoodvo.setUserFoodDate(dietWriteDate);
   userfoodvo.setUserFoodTime(dietWriteTime);
   
   UserFoodList userFoodList = UserFoodService.getInstance().userSelectDietList2(userfoodvo);
   out.println(userFoodList);
//   공지글과 메인글의 목록을 request 영역에 저장해서 메인글을 화면에 표시하는 페이지(listView.jsp)로 넘겨준다.
   request.setAttribute("dietList", dietList);
   request.setAttribute("userFoodList", userFoodList);
   pageContext.forward("dietView.jsp");
 
%>

</body>
</html>