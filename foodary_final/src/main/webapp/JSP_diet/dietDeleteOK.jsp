<%@page import="com.foodary.vo.DietList"%>
<%@page import="com.foodary.service.UserFoodService"%>
<%@page import="com.foodary.service.DietService"%>
<%@page import="com.foodary.vo.UserFoodVO"%>
<%@page import="com.foodary.vo.DietVO"%>
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

//   out.println(dietWriteDate);
//   out.println(dietWriteTime);
   
   DietVO dvo = new DietVO();
   int idx = Integer.parseInt(request.getParameter("idx"));
   String dietWriteDate = request.getParameter("dietWriteDate");
   String dietWriteTime = request.getParameter("dietWriteTime");
   out.println(dietWriteDate + dietWriteTime);
   out.println(idx);
   dvo.setIdx(idx);


   String userFoodDate = request.getParameter("dietWriteDate");
   String userFoodTime = request.getParameter("dietWriteTime");
   UserFoodVO uvo = new UserFoodVO();
   uvo.setUserFoodDate(userFoodDate);
   uvo.setUserFoodTime(userFoodTime);
   out.println("<script>");
   // diet 테이블에서 idx를 이용하여 삭제하기
   DietService.getInstance().deleteDietList(idx);
   // userfood 테이블에서 날짜, 시간을 통해 삭제하기
   UserFoodService.getInstance().deleteUser(uvo);
   out.println("alert('삭제 갈김')");
   // 데이터가 아무것도 없으면 dietWriteDate에 null 값이 넘어감(수정 필요!)
   out.println("location.href='/foodary_final/JSP_diet/dietList.jsp?dietWriteDate="+ dietWriteDate + "'");
   out.println("</script>"); 


%>

</body>
</html>