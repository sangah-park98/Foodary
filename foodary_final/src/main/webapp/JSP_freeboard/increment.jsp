<%@page import="com.foodary.vo.UserRegisterVO"%>
<%@page import="com.foodary.service.FreeboardService"%>
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
//	listView.jsp에서 넘어오는 조회수를 증가시킬 글번호와 메인글 확인 후 돌아갈 페이지 번호를 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>
	<jsp:useBean id="rvo" class="com.foodary.vo.UserRegisterVO">
		<jsp:setProperty property="*" name="rvo"/>
	</jsp:useBean>
<%	
//	조회수를 증가시키는 메소드를 실행한다.
	FreeboardService.getInstance().increment(idx);
	request.setAttribute("rvo", rvo);
	
	response.sendRedirect("./selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "&job=contentView");
%>

</body>
</html>