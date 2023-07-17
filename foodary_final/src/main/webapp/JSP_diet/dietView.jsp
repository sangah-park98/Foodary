<%@page import="com.foodary.vo.DietList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style type="text/css">

   .dietContent_title {
      float: left;
      width: 100%;
      height: 100px;
      line-height: 100px;
      text-align: center;
      background-color: #dedede;
      font-size: 35px;
   }

   table {
      margin: 0 auto;
   }
   
   td, th {
      height: 50px;
   }

</style>
</head>
<body>

<%
   request.setCharacterEncoding("UTF-8");
   
//   pageContext.setAttribute("dietList");
%>




<!-- 헤더 파일 -->   

<div class="dietContent_title">
   <b><i class="bi bi-cup-straw"></i>식단 보기</b>
</div>
<div class="diet">
<form action="dietUpdateOK.jsp" method="post">
<c:set var="list" value="${userFoodList.list}"/>
<table width="1500" align="center" border="1" cellpadding="10" cellspacing="0">

   <!-- 1 -->
   <tr>
      <th colspan="2">
         <label for="ateDate">일시</label>
      </th>
      <th colspan="8">
       <%--   <input type="text" name="dietWriteDate" value="${list[0].userFoodDate}" style="width: 48%; height: 90%;" readonly="readonly"/>
            <input type="text" name="dietWriteTime" value="${list[0].userFoodTime}" style="width: 48%; height: 90%;" readonly="readonly"/> --%>
        <input type="text" name="dietWriteDate" value="${list[0].userFoodDate}" style="width: 48%; height: 90%;" readonly="readonly"/>
            <input type="text" name="dietWriteTime" value="${list[0].userFoodTime}" style="width: 48%; height: 90%;" readonly="readonly"/> 
      </th>
   </tr>
   <!-- 2 -->
   <c:forEach var="uvo" items="${list}">
   <tr>
      <th>먹은 음식</th>
      <td align="center">
         <input type="text" name="userFoodName" value="${uvo.userFoodName}" style="width: 95%; height: 50%;" readonly="readonly"/>      
      </td>
      <th>칼로리</th>
      <td align="center">
         <input type="text" name="userKcal" value="${uvo.userKcal}" style="width: 95%; height: 50%;" readonly="readonly"/>      
      </td>
      <th>탄수화물</th>
      <td align="center">
         <input type="text" name="userCarbs" value="${uvo.userCarbs}" style="width: 95%; height: 50%;" readonly="readonly"/>   
      </td>
      <th>단백질</th>
      <td align="center">
         <input type="text" name="userProtein" value="${uvo.userProtein}" style="width: 95%; height: 50%;" readonly="readonly"/>   
      </td>
      <th>지방</th>
      <td align="center">
         <input type="text" name="userFat" value="${uvo.userFat}" style="width: 95%; height: 50%;" readonly="readonly"/>   
      </td>
   </tr>
   </c:forEach>
   <c:set var="list" value="${dietList.list}"/>
   <!-- 3 -->
   <tr>
      <th colspan="2">메모</th>
      <th colspan="8">
         <textarea 
            rows="20" 
            name="dietMemo" 
            style="resize: none; width: 97%; height: 90%; vertical-align: middle;"
            readonly="readonly"
            >${list[0].dietMemo}</textarea>
      </th>
   </tr>
   <!-- 4 -->
   <tr>
      <th colspan="2">사진</th>
      <td colspan="7">
         <input type="file" value="사진 업로드" style="margin-left: 20px;"/>
      </td>
      <th style="width: 150px;">
         <input type="button" value="업로드 완료!" style="width: 100px; height: 30px;" onclick=""/>         
      </th>
   </tr>
   <!-- 5 -->
   <tr>
      <!-- <form action="/foodary/JSP_food/selectByDateTime.jsp" method="post"> -->
      <th colspan="10">
      
         <input 
            type="submit" 
            value="수정하기"  
            style="width: 100px; height: 30px;" />&nbsp;&nbsp;   
         <input 
            type="button" 
            value="삭제하기" 
            style="width: 100px; height: 30px;"
            onclick="location.href='dietDeleteOK.jsp?idx=${list[0].idx}&dietWriteDate=${list[0].dietWriteDate}&dietWriteTime=${list[0].dietWriteTime}'"/>&nbsp;&nbsp;
         <input 
            type="button" 
            value="이미지로 저장" 
            style="width: 100px; height: 30px;"/>         
         <input 
            type="button" 
            value="목록보기" 
            onclick="location.href='main.jsp'" 
            style="width: 100px; height: 30px;"/>&nbsp;&nbsp;
      </th>
<!--       </form> -->
   </tr>
</table>
</form>
</div>

<!-- 풋터 파일 -->   

</body>
</html>