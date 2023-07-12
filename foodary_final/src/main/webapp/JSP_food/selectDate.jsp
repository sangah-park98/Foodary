<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜, 시간 선택</title>
</head>
<body>
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./js/foodWrite.js" defer="defer"></script> 
<style>
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
      border: 1px solid black;
   }

</style>
</head>
<body>

<
<div class="dietContent_title">
   <b><i class="bi bi-cup-straw"></i>식단 시간 입력</b>
</div>
<form action="/foodary_final/JSP_food/foodWrite.jsp" method="post">
   <div class="diet">
      <table width="1400" align="center" border="1" cellpadding="10" cellspacing="0">
         <!-- 1 -->
         <tr>
            <td colspan="2" class="text-center">
               <label for="ateDate">일시</label>
            </td>
               <td colspan="12">
                   <input type="date" id="userFoodDate" name="userFoodDate" style="width: 43%; height: 90%;" 
                      onchange="lockDate()" value="${userFoodDate}" />
                  <input type="time" id="userFoodTime" name="userFoodTime" style="width: 43%; height: 90%;" 
                     onchange="lockTime()" value="${userFoodTime}" />
                  <button type="reset" onclick="resetDateTime()">시간 재설정</button>
                  <button type="submit" value="userFoodDate=${userFoodDate}&userFoodTime=${userFoodTime}">확인</button>
              </td>
           </tr>
       </table>
   </div>
</form>
</body>
</html>