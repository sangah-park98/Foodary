<%@page import="com.foodary.service.UserRegisterService"%>
<%@page import="com.foodary.service.UserRegisterService"%>
<%@page import="com.foodary.vo.UserRegisterVO"%>
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

	UserRegisterVO rvo = (UserRegisterVO)session.getAttribute("rvo");
	
   	String name = request.getParameter("name");
   	String id = request.getParameter("id");
   	String email = request.getParameter("email");
    UserRegisterService.getInstance().infoUpdate(name, id, email);
%>


<%
   out.println("<script>");
   out.println("alert('" + name + "님 회원 정보 수정 완료!')");
   out.println("location.href='myPageOK.jsp?idx=" + rvo.getIdx() +"'");
   out.println("</script>");
%>

</body>
</html>