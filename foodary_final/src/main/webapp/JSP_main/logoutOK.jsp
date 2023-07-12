<%@page import="java.util.Set"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.foodary.service.UserRegisterService"%>
<%@page import="com.foodary.vo.UserRegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 / 로그아웃</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rvo" class="com.foodary.vo.UserRegisterVO">
	<jsp:setProperty property="*" name="rvo"/>
</jsp:useBean>
<%	
	String name = request.getParameter("name");
	out.println("<script>");
	out.println("alert('" + name + "님 안녕히가세요')");
	session.removeAttribute("rvo");
	out.println("location.href='foodaryMainPageBefore.jsp'");
	out.println("</script>");
%>
</body>
</html>























