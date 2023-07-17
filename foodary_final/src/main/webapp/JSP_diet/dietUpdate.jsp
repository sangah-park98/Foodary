<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식목록</title>
<!-- bootstrap -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="./js/dietUpdate.js" defer="defer"></script> 
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
<body onload = "showNutrient()">
<div class="container">
      <div class="header">
      <jsp:include page="./headerAfter.jsp"></jsp:include>
   </div>
<div class="dietContent_title">
   <b><i class="bi bi-cup-straw"></i>식단 수정</b>
</div>

<%
   request.setCharacterEncoding("UTF-8");

   // diet 데이터
   String dietWriteDate = request.getParameter("dietWriteDate");
   String dietWriteTime = request.getParameter("dietWriteTime");
   String dietMemo = request.getParameter("dietMemo");

   // userfood 데이터
   String userFoodName = request.getParameter("userFoodName");
   String userKcal = request.getParameter("userKcal");
   String userCarbs = request.getParameter("userCarbs");
   String userProtein = request.getParameter("userProtein");
   String userFat = request.getParameter("userFat");

   	//food 데이터
   	 String[] foodNames;
      String[] kcals;
      String[] carbs;
      String[] proteins;
      String[] fats;
   
       // 요청 파라미터에서 데이터 가져오기
       foodNames = request.getParameterValues("foodName");
       kcals = request.getParameterValues("kcal");
       carbs = request.getParameterValues("carbs");
       proteins = request.getParameterValues("protein");
       fats = request.getParameterValues("fat");

       if (foodNames == null) {
           foodNames = new String[]{};
           kcals = new String[]{};
           carbs = new String[]{};
           proteins = new String[]{};
           fats = new String[]{};
      } else {
	       // 세션에 데이터 저장
	       session.setAttribute("foodNames", foodNames);
	       session.setAttribute("kcals", kcals);
	       session.setAttribute("carbs", carbs);
	       session.setAttribute("proteins", proteins);
	       session.setAttribute("fats", fats);
      }

		if (session.getAttribute("foodNames") != null) {
		    // 세션으로부터 데이터 가져오기
		    foodNames = (String[]) session.getAttribute("foodNames");
		    kcals = (String[]) session.getAttribute("kcals");
		    carbs = (String[]) session.getAttribute("carbs");
		    proteins = (String[]) session.getAttribute("proteins");
		    fats = (String[]) session.getAttribute("fats");
		    
		    request.setAttribute("foodNames", foodNames);
			request.setAttribute("kcals", kcals);
			request.setAttribute("carbs", carbs);
			request.setAttribute("proteins", proteins);
			request.setAttribute("fats", fats);
		}
		
		String userFoodDate = request.getParameter("userFoodDate");
		String userFoodTime = request.getParameter("userFoodTime");
	    request.setAttribute("userFoodDate", userFoodDate);
	    request.setAttribute("userFoodTime", userFoodTime); 
%>
<div class="main" style="text-align: center;" align="center">
<input id="id" type="hidden" name="id" value="${rvo.id}"/>
<input id="height" type="hidden" name="height" value="${rvo.height}">
<input id="currentWeight" type="hidden" name="currentWeight" value="${rvo.currentWeight}">
<input id="goalWeight" type="hidden" name="goalWeight" value="${rvo.goalWeight}">
<input id="age" type="hidden" name="age" value="${rvo.age}">
<input id="gender" type="hidden" name="gender" value="${rvo.gender}"/>
<c:if test="${rvo.state eq 'health'}">
    <input id="health" type="radio" name="mode" value="health" checked="checked" style="display: none;"/>
    <input id="diet" type="radio" name="mode" value="diet" style="display: none;"/>
</c:if>
<c:if test="${rvo.state eq 'diet'}">
    <input id="health" type="radio" name="mode" value="health" style="display: none;"/>
    <input id="diet" type="radio" name="mode" value="diet" checked="checked" style="display: none;"/>
</c:if>
<c:set var="active" value="${rvo.active}"/>
<select name="active" style="height: 40px; display: none;">
   <option value="다시" name="active" 
      <c:if test="${active == '다시'}">selected="selected"
      </c:if>>활동량 선택
   </option>
     <option value="1.2" name="active" 
        <c:if test="${active == '1.2'}">selected="selected"
        </c:if>>많이 앉아있는 경우
     </option>
   <option value="1.375" name="active" 
      <c:if test="${active == '1.375'}">selected="selected"
      </c:if>>앉아있는 일이 적은 경우
   </option>
   <option value="1.55" name="active" 
      <c:if test="${active == '1.55'}">selected="selected"
      </c:if>>움직임이 많은 경우
   </option>
   <option value="1.725" name="active" 
      <c:if test="${active == '1.725'}">selected="selected"
      </c:if>>운동 될 움직임을 할 경우
   </option>
   <option value="1.9" name="active" 
      <c:if test="${active == '1.9'}">selected="selected"
      </c:if>>매우 많은 운동량
   </option>
</select>

<%--       <input type="hidden" id="userFoodDate" name="userFoodDate" value="${userFoodDate}" />
      <input type="hidden" id="userFoodTime" name="userFoodTime" value="${userFoodTime}" /> --%>
         <span style="background: #fafcd9; font-size: 50pt; font-weight: 900;">푸드어리 수정</span>
<form accept-charset="UTF-8" action="dietViewUpdateOK.jsp" method="post">
   <c:set var="list" value="${userFoodList.list}"/>
	<div class="diet">
   <table width="1400" align="center" border="1" cellpadding="10" cellspacing="0">
	      <!-- 1 -->
	      <tr>
	         <td colspan="2" class="text-center">
	            <label for="ateDate">일시</label>
	         </td>
            <td colspan="6">
               <input type="Date" id="userFoodDate" name="userFoodDate" value="${list[0].userFoodDate}" style="width: 48%; height: 90%;"/>       
            </td>
            <td colspan="6">            
               <input type="Time" id="userFoodTime" name="userFoodTime" value="${list[0].userFoodTime}" style="width: 48%; height: 90%;"/>       
           </td>
		</tr>     
	    <%--  <tr>
            <td colspan="6">
               <input type="Date" id="userFoodDate" name="userFoodDate" value="${userFoodDate}" style="width: 48%; height: 90%;"/>       
            </td>
            <td colspan="6">            
               <input type="Time" id="userFoodTime" name="userFoodTime" value="${userFoodTime}" style="width: 48%; height: 90%;"/>       
           </td>
         </tr> --%>
          <!-- 2 -->
         <tr>
         <td colspan="3" class="text-center" style="font-size: 13px;">
            <label for="food">음식 검색</label>
         </td>
         <td colspan="6" align="center">
            <input type="text" id="food" name="food" style="width:95%;" />      
         </td>
         <td colspan="2" align="center">
          <button type="button" onclick="foodList()">검색</button> 
         </td>
      </tr>
      </table>
     <table width="1400" align="center" border="1" cellpadding="10" cellspacing="0">
      <tbody id="tableBody">
      <!-- 3 -->
      <c:set var="foodNames" value="${requestScope.foodNames}" />
      <c:set var="kcals" value="${requestScope.kcals}" />
      <c:set var="carbs" value="${requestScope.carbs}" />
      <c:set var="proteins" value="${requestScope.proteins}" />
      <c:set var="fats" value="${requestScope.fats}" />
      <c:if test="${not empty foodNames}">
      <c:forEach var="index" begin="0" end="${fn:length(foodNames) - 1}">
        <tr>
         <td colspan="2">
            <label for="foodName">음식이름</label>
         </td>
         <td colspan="2">
            <input type="text" id="dietFoodName" name="dietFoodName" value="${foodNames[index]}" />
         </td>
         
         <td>
            <label for="totalcalorie">칼로리</label>
         </td>
         
         <td colspan="2" id="kcal">
            <input type="text" id="dietKcal" name="dietKcal" value="${kcals[index]}"/>      
         </td>
         
         <td>
            <label for="carbo">탄수화물</label>
         </td>
         
         <td id="carbs">
            <input type="text" id="dietCarbs" name="dietCarbs" value="${carbs[index]}"/>      
         </td>
         
         <td>
            <label for="protein">단백질</label>
         </td>
         
         <td id="proteins">
           <input type="text" id="dietProtein" name="dietProtein" value="${proteins[index]}"/>       
         </td>
         
         <td>
            <label for="province">지방</label>
         </td>
         
         <td id="fats">
            <input type="text" id="dietFat" name="dietFat" value="${fats[index]}"/>      
         </td>
         <td align="center">
             <input type="button" value="추가" onclick="foodPlus(<c:out value='${index}' />)"/>
         </td>
      </tr>
      </c:forEach>
    </c:if>
    <c:if test="${empty foodNames}">
     <tr>
     </tr>
   </c:if>
    </tbody>
    </table>
    
      <!-- 4 -->
     <table width="1400" align="center" border="1" cellpadding="11" cellspacing="0">
      <tbody id="tableBody">
     <fmt:requestEncoding value="UTF-8"/>
      <!-- foodWriteInsert.jsp에서 request 영역에 저장한 foodList에서 1페이지 분량의 글을 꺼내온다. -->
      <c:set var="list" value="${userFoodList.list}"/>
      <c:forEach var="uvo" items="${list}" varStatus="status">
      <tr>
        <td align="center">
          내 식단
        </td>
        <td colspan="2" class="text-center">
          <label for="foodName">음식이름</label>
        </td>
        <td colspan="2" class="text-center">
          <input type="text" id="userFoodName_${status.index}" name="userFoodName_${status.index}" value="${uvo.userFoodName}"/>   
        </td>
        <td class="text-center">
          <label for="totalcalorie">칼로리</label>
        </td>
        <td colspan="2" class="kcals" id="kcal">
          <input type="text" id="userKcal_${status.index}" name="userKcal_${status.index}" value="${uvo.userKcal}"/>      
        </td>
        <td>
          <label for="carbo">탄수화물</label>
        </td>
        <td class="carbs">
          <input type="text" id="userCarbs_${status.index}" name="userCarbs_${status.index}" value="${uvo.userCarbs}"/>      
        </td>
        <td>
          <label for="protein">단백질</label>
        </td>
        <td class="proteins">
          <input type="text" id="userProtein_${status.index}" name="userProtein_${status.index}" value="${uvo.userProtein}"/>       
        </td>
        <td class="text-center">
          <label for="province">지방</label>
        </td>
        <td class="fats">
          <input type="text" id="userFat_${status.index}" name="userFat_${status.index}" value="${uvo.userFat}"/>      
        </td>
        <td align="center">
          <input type="button" value="수정" onclick="updateUserFood(${uvo.idx}, ${status.index})"/>
          <input type="button" value="삭제" onclick="location.href='dietDeleteFood.jsp?idx=${uvo.idx}&userFoodDate=${userFoodDate}&userFoodName=${uvo.userFoodName}&userFoodTime=${userFoodTime}&userKcal=${uvo.userKcal}&userCarbs=${uvo.userCarbs}&userProtein=${uvo.userProtein}&userFat=${uvo.userFat}'"/>
        </td>
      </tr>
    </c:forEach>
    </tbody>
    </table>
    <table width="1400" align="center" border="1" cellpadding="10" cellspacing="0">
   <!-- 4 -->
   <c:set var="list" value="${dietList.list}"/>
	<input type="text"  name="dietIdx" value="${list[0].idx}"/> 
   <tr>
      <td colspan="2" class="text-center">
         <label for="memo">메모</label>
      </td>
      <td colspan="12">
         <textarea 
            id="memo"
            rows="10" 
            name="dietMemo" 
            style="resize: none; width: 97%; height: 75%; vertical-align: middle;"
            >${list[0].dietMemo}</textarea>
      </td>
   </tr>
   <!-- 5 -->
   <tr>
      <td colspan="3" class="text-center">
         <label for="totalcalorie">사진첨부</label>
      </td>
      <td colspan="10" align="center">
         <input type="text" id="province" name="province" placeholder="사진파일명" style="width: 95%;"/>   
      </td>   
      <td align="center">
        <input type="button" value="파일선택" onclick="location.href='showDiet.jsp'"/>
      </td>
   </tr>
    </table>
    <!-- 6 -->
</div>
    <table width="1400" align="center" border="1" cellpadding="3" cellspacing="0">
     <tr>
        <td colspan="3" style="height: 40px;">
           <div class="progress" style="height: 40px;">
             <div id="kcalGraph" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
             aria-valuemin="0" aria-valuemax="100" style="width:0%; height: 40px;">
               칼로리
             </div>
           </div>
         </td>   
      </tr>
     <!-- 7 -->
      <tr>
       <td style="width: 33.3%;">
          <div class="progress" style="height: 40px;">
            <div id="carbsGraph" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
            aria-valuemin="0" aria-valuemax="100" style="width:0%; height: 40px;">
              탄수화물
               </div>
          </div>
       </td>
       <td style="width: 33.3%;">
             <div class="progress" style="height: 40px;">   
                  <div id="proteinGraph" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
                     aria-valuemin="0" aria-valuemax="100" style="width:0%; height: 40px;">
                    단백질
                  </div>
             </div>
       </td>      
       <td style="width: 33.3%;">
          <div class="progress" style="height: 40px;">
               <div id="fatGraph" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="50"
                  aria-valuemin="0" aria-valuemax="100" style="width:0%; height: 40px;">
                 지방
               </div>
          </div>
       </td>   
    </tr>
    <!-- 8 -->
    <tr>
       <td colspan="3" class="text-center">
          <input type="button" value="식단보기" onclick="location.href='/foodary/JSP_diet/dietList.jsp'"/>
          <input type="submit" value="수정완료"/>
       </td>
    </tr>
   </table>
  </form>
   
   

   
</body>
</html>