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

 <jsp:useBean id="dvoup" class="com.foodary.vo.DietVO">
   <jsp:setProperty property="*" name="dvoup"/>
</jsp:useBean> 

<%
   request.setCharacterEncoding("UTF-8");

   String dietidx = request.getParameter("dietIdx");
   int dietIdx = Integer.parseInt(dietidx);
   String dietMemo = request.getParameter("dietMemo");
    String dietWriteDate = request.getParameter("FoodDate");
    String dietWriteTime = request.getParameter("FoodTime");
   
   DietVO dietvo = new DietVO();
   dietvo.setIdx(dietIdx);
   dietvo.setDietMemo(dietMemo);
   dietvo.setDietWriteDate(dietWriteDate);
   dietvo.setDietWriteTime(dietWriteTime);
   
//   out.println(dietWriteDate + ", " + dietWriteTime);
   
// diet 데이터 불러옴
//   DietService service = DietService.getInstance();
//   DietList dietList = service.selectDietList(dietvo);



//   out.println(dietList);

//   diet에서 idx 넘어오는 거 확인완료!
//   out.println(dietList.getList().get(1).getIdx());
   DietService.getInstance().UpdateDiet(dietvo);
//      out.println("diet 수정 완료!");
   
//   UserFoodVO userfoodvo = new UserFoodVO();
//   userfoodvo.setUserFoodDate(dietWriteDate);
//   userfoodvo.setUserFoodTime(dietWriteTime);
   
//   UserFoodList userFoodList = UserFoodService.getInstance().userSelectDietList2(userfoodvo);
//   out.println(userFoodList);
// 여기까지가 화면에 데이터를 출력해주는 코드(이 이후는 update)   


   
   
//   공지글과 메인글의 목록을 request 영역에 저장해서 메인글을 화면에 표시하는 페이지(listView.jsp)로 넘겨준다.
  
/* 
   request.setAttribute("dietList", dietList);
   request.setAttribute("userFoodList", userFoodList);
   pageContext.forward("dietUpdate.jsp");
 */
 
 %>

</body>
</html>