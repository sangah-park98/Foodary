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
<style type="text/css">
@font-face {
    font-family: 'SUITE-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-style: normal;
}
* {
	font-family: SUITE-Bold;
	font-weight: 800;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = "";
	String password = "";
	try {
		id = request.getParameter("id").trim();
		password = request.getParameter("password").trim();
	} catch (Exception e) { }
		UserRegisterVO rvo = UserRegisterService.getInstance().selectByInfo(id, password);
		
		if(rvo == null) {
			out.println("<script>");
			out.println("alert('등록되지 않은 회원입니다')");
			out.println("location.href='foodaryMainPageBefore.jsp'");
			out.println("</script>");
		} else {
			session.setAttribute("rvo", rvo);
			pageContext.forward("foodaryMainPageAfter.jsp");
		}
%>
</body>
</html>























