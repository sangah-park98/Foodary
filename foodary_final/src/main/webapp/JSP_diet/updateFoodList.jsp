<%@page import="com.foodary.vo.FoodList"%>
<%@page import="com.foodary.vo.FoodVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.foodary.service.FoodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식 넣기</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <script type="text/javascript" src="./js/updateFoodView.js" defer="defer"></script> 
<style type="text/css">

	.dietContent_title {
		float: left;
		width: 100%;
		height: 100px;
		line-height: 100px;
		text-align: center;
		background-color: #dedede;
		font-size: 35px;
	}

	table {
		margin: 0 auto;
	}
	
	td, th {
		height: 50px;
	}

</style>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받는다.
	int currentPage = 1;
   	String userFoodDate = request.getParameter("userFoodDate");
  	String userFoodTime = request.getParameter("userFoodTime");
	  session.setAttribute("userFoodDate", userFoodDate);
	  session.setAttribute("userFoodTime", userFoodTime);
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {
		
	}
	
	 // 카테고리와 검색어를 받는다.
	  String foodName = request.getParameter("foodName"); //검색어
	  String list = request.getParameter("list"); //목록으로 돌아오는 변수
	//  넣어온 검색어가 있으면 카테고리와 검색어를 세션에 저장하고 넘어온 검색어가 없으면 세션에 저장된 카테고리와 검색어를
	//  저장한다.
	  if(foodName != null) {
		  foodName = foodName.trim().length() == 0 ? "" : foodName;
	    session.setAttribute("foodName" , foodName);
	  } else {
		  foodName = (String) session.getAttribute("foodName");
	  }
	  if(list != null) {
		  foodName = null;
	    session.removeAttribute("foodName");
	  }
	  
	  FoodService service = FoodService.getInstance();
//		1페이지 분량의 메인글을 얻어온다.
		FoodList foodList = service.selectList(currentPage);
	  if(foodName == null || foodName.trim().length() == 0) { //검색어가 넘어왔는가?
//	    검색어가 입력되지 않은 경우
	    foodList = service.selectList(currentPage);
	  } else {
//	    검색어가 입력되고 카테고리가 "내용"인 경우
	    foodList = service.selectListFood(currentPage , foodName);
	  }	  
	  
	//foodWrite.jsp에서 날짜와 시간을 띄우기 위해 세션에 값을 저장한다. 
/* 	String dietWriteDate = request.getParameter("userFoodDate");
  	String dietWriteTime = request.getParameter("userFoodTime");
	  request.setAttribute("userFoodDate", dietWriteDate);
	  request.setAttribute("userFoodTime", dietWriteTime); */

	request.setAttribute("foodList", foodList);
	request.setAttribute("currentPage", currentPage);
	pageContext.forward("updateFoodListView.jsp");
%>

</body>
</html>