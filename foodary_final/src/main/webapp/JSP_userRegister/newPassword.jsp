<%@page import="javax.swing.text.Document"%>
<%@page import="com.foodary.service.UserRegisterService"%>
<%@page import="com.foodary.vo.UserRegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
   	UserRegisterVO rvo = (UserRegisterVO) session.getAttribute("rvo");
	
	String id = rvo.getId();
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String currentpassword = request.getParameter("currentpassword");
	String newpassword = request.getParameter("newpassword");
	String newpasswordcheck = request.getParameter("newpasswordcheck");
	/* out.println(rvo.getPassword()); */
	
	
%>

<%
	UserRegisterService service = UserRegisterService.getInstance();
	//수정할 글의 비밀번호와 수정하기 위해 입력한 비밀번호를 비교해서 같으면 글을 수정한 후 목록으로 돌아가고
	//다르면 비밀번호가 올바르지 않다는 메시지를 보여준 후 목록으로 돌아간다.
	
/* 	out.println(currentpassword);
	out.println(newpassword);
	out.println(newpasswordcheck); */
	out.println("<script>");
	  if (currentpassword.trim().equals(rvo.getPassword().trim())) {
	        if (newpassword != null && newpasswordcheck != null && newpassword.equals(newpasswordcheck)) {
	        	service.newpasswordUpdate(id, currentpassword, newpassword);
	            out.println("alert('" + rvo.getUsername() + "님 비밀번호 변경 완료!')");
				out.println("location.href='/foodary_final/JSP_main/foodaryMainPageBefore.jsp'");
	            
	        } else {
	            out.println("alert('새 비밀번호가 일치하지 않습니다.')");
				out.println("location.href='/foodary_final/JSP_main/foodaryMainPageAfter.jsp'");
	            
	        }
	    } else {
	        out.println("alert('비밀번호가 올바르지 않습니다.')");
			out.println("location.href='/foodary_final/JSP_main/foodaryMainPageAfter.jsp'");
	    }
	out.println("</script>");

%>

   
</body>
</html>