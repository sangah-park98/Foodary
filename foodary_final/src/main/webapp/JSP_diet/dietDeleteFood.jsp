<%@page import="com.foodary.service.UserFoodService"%>
<%@page import="com.foodary.vo.UserFoodVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	int idx = Integer.parseInt(request.getParameter("idx"));
	out.println(idx);
	UserFoodService.getInstance().deleteUserFoodList(idx);
	//pageContext.forward("dietUpdate.jsp");
	/* 
	String referer = request.getHeader("Referer");
	if (referer != null && referer.contains("foodWrite.jsp")) {
	    out.println("foodWrite.jsp");
	    //pageContext.forward("foodWrite.jsp");
	} else if (referer != null && referer.contains("/foodary_final/JSP_diet/dietUpdate.jsp")) {
		out.println("dietUpdate");
	    //pageContext.forward("/foodary_final/JSP_diet/dietUpdate.jsp");
	} */
%>

</body>
</html>