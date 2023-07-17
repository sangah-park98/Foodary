<%@page import="com.foodary.vo.FoodVO"%>
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

 <jsp:useBean id="uvo" class="com.foodary.vo.UserFoodVO">
   <jsp:setProperty property="*" name="uvo"/>
</jsp:useBean> 


<%

   request.setCharacterEncoding("UTF-8");

   int dietidx = Integer.parseInt(request.getParameter("dietIdx"));
   out.println(dietidx);
    String dietMemo = request.getParameter("dietMemo");
    String dietWriteDate = request.getParameter("userFoodDate");
    String dietWriteTime = request.getParameter("userFoodTime");
	out.println(dietMemo);
	out.println(dietWriteDate);
    DietVO dietvo = new DietVO();
   dietvo.setIdx(dietidx);
   dietvo.setDietMemo(dietMemo);
   dietvo.setDietWriteDate(dietWriteDate);
   dietvo.setDietWriteTime(dietWriteTime);
   
 
 	out.println("<script>");
   // diet 테이블에서 idx를 이용하여 수정하기
   DietService.getInstance().UpdateDiet(dietvo);
	out.println(dietWriteDate);
    out.println("alert('수정 완료!')");
   out.println("location.href='/foodary_final/JSP_diet/dietList.jsp?dietWriteDate="+ dietWriteDate + "'");
   out.println("</script>"); 
 %>

</body>
</html>