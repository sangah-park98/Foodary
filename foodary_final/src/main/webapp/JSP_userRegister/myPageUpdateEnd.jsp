<%@page import="com.foodary.service.UserRegisterService"%>
<%@page import="com.foodary.vo.UserRegisterVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   UserRegisterVO rvo = (UserRegisterVO)session.getAttribute("rvo");
   
   String id = request.getParameter("id");
   String name = rvo.getUsername();
   String height = request.getParameter("height");
   String currentWeight = request.getParameter("currentWeight");
   String goalWeight = request.getParameter("goalWeight");
   String age = request.getParameter("age");
   String state = request.getParameter("mode");
   String active = request.getParameter("active");
   UserRegisterService.getInstance().userUpdate(id, height, currentWeight, goalWeight, age, state, active);

   out.println("<script>");
   out.println("alert('" + name + "님 회원 정보 수정 완료!')");
   out.println("location.href='myPageOK.jsp?idx=" + rvo.getIdx() +"'");
   out.println("</script>");
%>
</body>
</html>