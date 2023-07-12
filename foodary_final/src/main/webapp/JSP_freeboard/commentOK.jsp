<%@page import="com.foodary.service.FreeboardCommentService"%>
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
//	contentView.jsp에서 넘어오는 데이터를 받는다.
	int mode = Integer.parseInt(request.getParameter("mode"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="co" class="com.foodary.vo.FreeboardCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>

<%
	FreeboardCommentService service = FreeboardCommentService.getInstance();
//	contentView.jsp에서 넘어온 mode에 따라 1은 댓글 저장, 2는 댓글 수정, 3은 댓글 삭제 작업을 한다.
	out.println("<script>");
	switch (mode) {
		case 1:
			out.println("alert('댓글 저장 " + (service.insertComment(co) ? "성공" : "실패") + "')");
			break;
		case 2:
			out.println("alert('댓글 수정 " + (service.updateComment(co) ? "성공" : "실패") + "')");
			break;
		case 3:
			out.println("alert('댓글 삭제 " + (service.deleteComment(co) ? "성공" : "실패") + "')");
			break;
	}
	out.println("location.href='/foodary_final/JSP_freeboard/selectByIdx.jsp?idx=" + co.getGup() + "&currentPage=" + currentPage +
			"&job=contentView'");
	out.println("</script>");
%>

</body>
</html>






