<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	response.setContentType("text/html; charset=UTF-8");
	
	
	String fileurl= "C:\\foodary\\eclipse\\workspace\\Foodary\\src\\main\\webapp\\upload";
	String saveFolder="upload";
	String encType="UTF-8";
	int Maxsize = 5*1024*1024;
	ServletContext servletContext = request.getServletContext();
	MultipartRequest mr = null;
	DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	try {
		mr = new MultipartRequest(request,fileurl,Maxsize,encType,policy);
		File realFilename = mr.getFile("fileName");
		int currentPage = Integer.parseInt(mr.getParameter("currentPage"));
		int idx = Integer.parseInt(mr.getParameter("idx"));
		String picture = realFilename.getName();
		String subject = mr.getParameter("subject");
		Date writeDate = new Date();
		String content = mr.getParameter("content");
		String name = mr.getParameter("name");
		String notice = mr.getParameter("notice");
		String id = mr.getParameter("id");
		String realFilePath = realFilename.getPath();

		FreeboardVO vo = new FreeboardVO(idx, subject, content, writeDate, 0, name, notice, picture, 0, id, realFilePath);
		out.println("<script>");
		FreeboardService.getInstance().update(vo);
		out.println("alert('" + idx + "번 글 수정완료!!!')");
		out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
		out.println("</script>");
		
	} catch (Exception e) {
		String picture = "";
		int currentPage = Integer.parseInt(mr.getParameter("currentPage"));
		int idx = Integer.parseInt(mr.getParameter("idx"));
		String subject = mr.getParameter("subject");
		Date writeDate = new Date();
		String content = mr.getParameter("content");
		String name = mr.getParameter("name");
		String notice = mr.getParameter("notice");
		String id = mr.getParameter("id");
		String realFilePath = "";
		
		FreeboardVO vo = new FreeboardVO(0, subject, content, writeDate, 0, name, notice, picture, 0, id, realFilePath);
		out.println("<script>");
		FreeboardService.getInstance().update(vo);
		out.println("alert('" + idx + "번 글 수정완료!!!')");
		out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
		out.println("</script>");
	}
%>

</body>
</html>




