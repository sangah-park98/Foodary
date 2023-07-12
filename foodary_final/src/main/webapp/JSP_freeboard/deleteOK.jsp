<%@page import="com.foodary.service.FreeboardService"%>
<%@page import="com.foodary.vo.FreeboardVO"%>
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
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

<jsp:useBean id="vo" class="com.foodary.vo.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	FreeboardService service = FreeboardService.getInstance();
	FreeboardVO original = service.selectByIdx(vo.getIdx());

//	삭제할 글의 비밀번호와 삭제하기 위해 입력한 비밀번호를 비교해서 같으면 글을 삭제한 후 목록으로 돌아가고
//	다르면 비밀번호가 올바르지 않다는 메시지를 보여준 후 목록으로 돌아간다.
	out.println("<script>");
	// 비밀번호가 일치하면 글을 삭제하는 메소드를 실행한다.
	service.delete(vo.getIdx());
	out.println("alert('" + vo.getIdx() + "번 글 삭제완료!!!')");
	out.println("location.href='/foodary_final/JSP_freeboard/list.jsp?currentPage=" + currentPage + "'");
	out.println("</script>");
%>

</body>
</html>




