<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜, 시간 선택</title>
</head>
<body>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./css/threeGrid.css"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
<div class="container">
   <div class="header">
      <jsp:include page="./headerAfter.jsp"></jsp:include>
   </div>
      <div align="center">
         <span style="background: #baffda; font-size: 40px; font-weight: 900;">푸드어리 날짜 & 시간 입력</span>
         <br><br><br>
         <form action="/foodary_final/JSP_food/foodWrite.jsp" method="post" style="text-align: center;">
                
                <span style="background: lavender; font-size: 30pt; font-weight: 800;">날짜</span> &nbsp;&nbsp;&nbsp;
                <input type="date" id="userFoodDate" name="userFoodDate" style="width: 43%; width: 400px;"/><br><br>
               
                <span style="background: lavender; font-size: 30pt; font-weight: 800;">시간</span> &nbsp;&nbsp;&nbsp;
                <input type="time" id="userFoodTime" name="userFoodTime" style="width: 43%; width: 400px;"/><br><br><br>
                
                <button type="submit" style="border: 0; background: none; cursor: pointer;">
                   <span style="background: #fafcd9; font-size: 25pt;; font-weight: 800;">확인</span>
                </button>
         </form>
      </div>
   <div class="footer">
      <jsp:include page="./footerAfter.jsp"></jsp:include>
   </div>
</div>
</body>
</html>