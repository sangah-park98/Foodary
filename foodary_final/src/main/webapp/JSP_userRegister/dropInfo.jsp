<%@page import="com.foodary.vo.UserRegisterVO"%>
<%@page import="com.foodary.dao.UserRegisterDAO"%>
<%@page import="com.foodary.service.UserRegisterService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>

<%
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   // out.println("테스트");

   UserRegisterVO rvo = (UserRegisterVO)session.getAttribute("rvo");

   UserRegisterService.getInstance().dropInfo(rvo.getId()); 
%>



<%
   out.println("<script>");
   out.println("location.href='/foodary_final/JSP_main/foodaryMainPageBefore.jsp'");
   out.println("</script>");
%>


</body>
</html>