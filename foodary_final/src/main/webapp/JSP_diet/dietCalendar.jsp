<%@page import="com.foodary.calendar.MyCalendar"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>
<link rel="stylesheet" href="css/calendar_css.css"/>
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script src="./js/dietCalendar.js"></script>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8"); 

	Calendar calendar = Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH) + 1;
	int day = calendar.get(Calendar.DATE);

	try {
		year = Integer.parseInt(request.getParameter("year"));
		month = Integer.parseInt(request.getParameter("month"));
		day = 1;
		
		// month에 13이 넘어왔으면 달력에는 다음해 1월을 표시해야 하고 month에 0이 넘어왔으면 달력에는 
		// 전년도 12월을 표시해야 한다.
		if(month >= 13) {
			year++;
			month = 1;
		}else if(month <= 0) {
			year--;
			month = 12;
		}
	}catch(NumberFormatException e) {
		
	}


%>
<table width="700" border="1" align="center" cellpadding="5" cellspacing="2">
	<tr>
		<th>

			<button class="button button1"
				type="button" 
				onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'">이전달</button>
		</th> 

		<th id="title" colspan="5">
			<%=year%>년 <%=month%>월
		</th>
	
 		<th>
			<button type="button"
				class="button button2" 
				onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'">다음달</button>
		</th> 
	</tr>	
	<tr>
		<th id="sunday">일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th id="saturday">토</th>
	</tr>	
	<!-- 달력에 날짜를 출력한다. -->
	<tr>
	
<%
	int week = MyCalendar.weekDay(year, month, 1);

//	빈 칸에 출력할 전달 날짜의 시작일
	int start = 0;

	if(month == 1) {
		start = 31 - week;
	}else {
		start = MyCalendar.lastDay(year, month - 1) - week; // 2 ~ 12월
	}
	

//	1일이 출력될 위치(요일)을 맞추기 위해 달력을 출력할 달 1일의 요일만큼 반복하며 전 달의 날짜를 출력한다.
	for(int i=0; i<week; i++) { 
		if(i == 0) {
			out.println("<td><button id='beforesun'>" + (month == 1? 12 : (month-1)) + "/" + ++start + "</button></td>");			
		}else {
			out.println("<td><button class='before'>" + (month == 1? 12 : (month-1)) + "/" + ++start + "</button></td>");						
		}
	}

//	1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력한다.
	for(int i=1; i<=MyCalendar.lastDay(year, month); i++) {
		
		// 대체 공휴일
		// 삼일절, 어린이날, 광복절, 개천절, 한글날, 설날, 추석, 석가탄신일이 토요일 또는 
		// 일요일과 겹치는 경우 그 다음 첫 번째 비 공휴일을 대체 공휴일로 한다.
		boolean flag0301 = false;
		int subHoliday0301 = 0;
		if(MyCalendar.weekDay(year, 3, 1) == 6) {
			flag0301 = true;
			subHoliday0301 = 3;
		}else if(MyCalendar.weekDay(year, 3, 1) == 0) {
			flag0301 = true;
			subHoliday0301 = 2;
		}
		
		boolean flag0505 = false;
		int subHoliday0505 = 0;
		if(MyCalendar.weekDay(year, 5, 5) == 6) {
			flag0505 = true;
			subHoliday0505 = 7;
		}else if(MyCalendar.weekDay(year, 5, 5) == 0) {
			flag0505 = true;
			subHoliday0505 = 6;
		}
		
		boolean flag0815 = false;
		int subHoliday0815 = 0;
		if(MyCalendar.weekDay(year, 8, 15) == 6) {
			flag0815 = true;
			subHoliday0815 = 17;
		}else if(MyCalendar.weekDay(year, 8, 15) == 0) {
			flag0815 = true;
			subHoliday0815 = 16;
		}
		
		boolean flag1003 = false;
		int subHoliday1003 = 0;
		if(MyCalendar.weekDay(year, 10, 3) == 6) {
			flag1003 = true;
			subHoliday1003 = 5;
		}else if(MyCalendar.weekDay(year, 10, 3) == 0) {
			flag1003 = true;
			subHoliday1003 = 4;
		}
		
		boolean flag1009 = false;
		int subHoliday1009 = 0;
		if(MyCalendar.weekDay(year, 10, 9) == 6) {
			flag1009 = true;
			subHoliday1009 = 11;
		}else if(MyCalendar.weekDay(year, 10, 9) == 0) {
			flag1009 = true;
			subHoliday1009 = 10;
		}
		
		
				
		
		// 양력 공휴일
		if(month == 1 && i == 1) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>신정</span></button></a></td>");
		}else if(month == 3 && i == 1) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>삼일절</span></button></a></td>");
		}else if(month == 5 && i == 1) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>근로자의날</span></button></a></td>");
		}else if(month == 5 && i == 5) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>어린이날</span></button></a></td>");
		}else if(month == 6 && i == 6) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>현충일</span></button></a></td>");
		}else if(month == 8 && i == 15) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>광복절</span></button></a></td>");
		}else if(month == 10 && i == 3) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>개천절</span></button></a></td>");
		}else if(month == 10 && i == 9) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>한글날</span></button></a></td>");
		}else if(month == 12 && i == 25) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>성탄절</span></button></a></td>");
		}
		
		
		
		// 대체 공휴일
		else if(flag0301 && month == 3 && i == subHoliday0301) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
					"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>대체공휴일</span></button></a></td>");
		}else if(flag0505 && month == 5 && i == subHoliday0505) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
					"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>대체공휴일</span></button></a></td>");
		}else if(flag0815 && month == 8 && i == subHoliday0815) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
					"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>대체공휴일</span></button></a></td>");
		}else if(flag1003 && month == 10 && i == subHoliday1003) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
					"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>대체공휴일</span></button></a></td>");
		}else if(flag1009 && month == 10 && i == subHoliday1009) {
			out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" + 
			"<button class='holiday' onclick='dayCheck(" + year + "," + month + "," + i + ")'>" + i + "<br><span>대체공휴일</span></button></a></td>");
		}
		
		// 공휴일을 제외한 나머지 날짜
		else {
 			
			switch(MyCalendar.weekDay(year, month, i) % 7) {
				
				case 0:  // 일요일
					out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) 
						+ "'>" + "<button id='day' onclick='dayCheck(" + year + "," + month + "," + i +")'>" + i + "</button></a></td>");
					break;
				case 6:  // 토요일
					out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" +
						"<button id='day' onclick='dayCheck(" + year + "," + month + "," + i +")'>" +
									 + i + "</button></a></td>");
					break;
				default:  // 평일
					out.println("<td><a href='dietListView.jsp?dietWriteDate=" + year + "-" + String.format("%02d", month) + "-" + String.format("%02d", i) + "'>" +
							"<button id='day' onclick='dayCheck()'>" +
										 + i + "</button></a></td>");
					break;
			} 
		
		}
		
		//	출력한 날짜(i)가 토요일이고 그 달의 마지막 날짜가 아니면 줄을 바꾼다.
		if(MyCalendar.weekDay(year, month, i) == 6 && i != MyCalendar.lastDay(year, month)) {
			out.println("</tr><tr>");
		}	
	}

// 	다음달 1일의 요일을 계산한다.
	if(month == 12) {
		week = MyCalendar.weekDay(year + 1, 1, 1); // 12월
	}else {
		week = MyCalendar.weekDay(year, month + 1, 1); // 1 ~ 11월
	}

//	다음달 1일이 일요일이면 남는 빈 칸이 없으므로 다음달 날짜를 출력할 필요가 없다.
	if(week != 0) {
//		날짜를 다 출력하고 남은 빈 칸에 다음달 날짜를 다음달 1일의 요일부터 토요일까지 반복하며
//		출력한다.
		start = 1;
		for(int i=week; i<=6; i++) {
			if(i == 6) {
				out.println("<td><button id='aftersat'>" + (month == 12? 1 : (month + 1)) + "/" + start++ + "</button></td>");
			}else {
				out.println("<td><button class='after'>" + (month == 12? 1 : (month + 1)) + "/" + start++ + "</button></td>");
				
			}
		}
	}

%>
<!-- 값 불러오는 거 확인 -->
<form action="?" method="post">
	<input type='hidden' name='sendYear' value=""/>
	<input type='hidden' name='sendMonth' value=""/>
	<input type='hidden' name='sendDay' value=""/>
</form>

<% /* dietList.jsp로 날짜 데이터 넘기기 */
//	response.sendRedirect("dietListView.jsp?dietWriteDate=" + year + "-" + month + "-" + day);
%>
	
	</tr>
	<!-- 년, 월을 선택된 년도와 달의 달력으로 한번에 넘어가게 한다. -->
	<tr>
		<td id="choice" colspan="7">
	<form action="#" method="post" onsubmit="navigateToSelectedMonth(event)">
		<fieldset>
			<legend>년</legend>
			<select class="select" name="year">
<%
				for(int i=1900; i<=2100; i++) {
					if(calendar.get(Calendar.YEAR) == i) {
						out.println("<option selected='selected'>" + i + "</option>");					
					}else {
						out.println("<option>" + i + "</option>");							
					}
				}
%>						
			</select>
			</fieldset>
		<fieldset >
			<legend>월</legend>
			<select class="select" name="month">
<%
				for(int i=1; i<=12; i++) {
					if(calendar.get(Calendar.MONTH) + 1 == i) {
						out.println("<option selected='selected'>" + i + "</option>");	
					}else {
						out.println("<option>" + i + "</option>");					
					}
				}
%>							
			</select>
			</fieldset>
			<input class="select" type="submit" value="날짜 지정"/>
		</form> 
		
		</td>
	</tr>
</table>


</body>
</html>