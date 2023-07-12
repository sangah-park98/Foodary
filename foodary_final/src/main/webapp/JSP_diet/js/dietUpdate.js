function lockDate() {
	$('#userFoodDate').attr('readonly', 'readonly');
}

function lockTime() {
	$('#userFoodTime').attr('readonly', 'readonly');
}

function resetDateTime() {
	var result = confirm("시간을 재설정하면 입력하신 데이터가 사라집니다. \n 다시 설정하시겠습니까?");
		if(result){
			$('#dietWriteDate').removeAttr('readonly');
			$('#dietWriteTime').removeAttr('readonly');
		} else{
		   // =============================== 나중에 처리 =============================================
		}
}

function foodList() {
	//console.log('테스트');
    var userFoodDate = document.getElementById("userFoodDate").value;
    var userFoodTime = document.getElementById("userFoodTime").value;
    //console.log(date + time);
    var url = "./updateFoodList.jsp?userFoodDate=" + userFoodDate + "&time=" + userFoodTime;
    location.href = url;
}


//인덱스 활용 음식 저장 형태 완료 
function foodPlus(index) {
	console.log(index);
    var userFoodName = document.getElementsByName("dietFoodName")[index].value;
    var kcal = document.getElementsByName("dietKcal")[index].value;
    var carbs = document.getElementsByName("dietCarbs")[index].value;
    var protein = document.getElementsByName("dietProtein")[index].value;
    var fat = document.getElementsByName("dietFat")[index].value;
    var userFoodTime = document.getElementById("userFoodTime").value;
    var userFoodDate = document.getElementById("userFoodDate").value;
    console.log(userFoodTime);
    console.log(userFoodDate);
    console.log(carbs);
    // Redirect to foodWriteInsert.jsp with query parameters
   var url = 'dietUpdateFoodInsert.jsp' +
        '?userFoodName=' + encodeURIComponent(userFoodName) +
        '&userKcal=' + encodeURIComponent(kcal) +
        '&userCarbs=' + encodeURIComponent(carbs) +
        '&userProtein=' + encodeURIComponent(protein) +
        '&userFat=' + encodeURIComponent(fat) +
        '&userFoodTime=' + encodeURIComponent(userFoodTime) +
        '&userFoodDate=' + encodeURIComponent(userFoodDate);
    location.href = url;
}
 
/*
 idx활용, index활용 수정 완료!! */
function updateUserFood(idx , index) {
	var userFoodName = $('#userFoodName_' + index).val().trim();
	var userKcal = $('#userKcal_' + index).val().trim();
	var userCarbs = $('#userCarbs_' + index).val().trim();
	var userProtein = $('#userProtein_' + index).val().trim();
	var userFat = $('#userFat_' + index).val().trim();
	var userFoodDate = $('#userFoodDate').val().trim();
	var userFoodTime = $('#userFoodTime').val().trim();
	console.log(userProtein);
	 var url = 'dietUpdateFood.jsp' +
      '?idx=' + idx +
      '&userFoodName=' + userFoodName +
      '&userKcal=' + userKcal +
      '&userCarbs=' + userCarbs +
      '&userProtein=' + userProtein +
      '&userFat=' + userFat +
      '&userFoodDate=' + userFoodDate +
      '&userFoodTime=' + userFoodTime;
    location.href = url;
}




/*
//그래프 이동 배열형태 (완성)
$(document).ready(function() {
	  
	var kcalElements = document.getElementsByClassName("kcals");
	var carbsElements = document.getElementsByClassName("carbs");
	var proteinElements = document.getElementsByClassName("proteins");
	var fatElements = document.getElementsByClassName("fats");
	
	var userKcals = [];
	var userCarbs = [];
	var userProteins = [];
	var userFats = [];
	
	// 각 태그의 값을 배열에 저장
	for (var i = 0; i < kcalElements.length; i++) {
	  var kcalValue = kcalElements[i].querySelector("input[name='userKcal']").value;
	  var carbsValue = carbsElements[i].querySelector("input[name='userCarbs']").value;
	  var proteinValue = proteinElements[i].querySelector("input[name='userProtein']").value;
	  var fatValue = fatElements[i].querySelector("input[name='userFat']").value;
	  
	  userKcals.push(kcalValue);
	  userCarbs.push(carbsValue);
	  userProteins.push(proteinValue);
	  userFats.push(fatValue);
	}

	console.log(userFat);     // ["100", "200", "300"]
	console.log(userCarbs);    // ["50", "60", "70"]
	console.log(userProtein); // ["20", "30", "40"]
	console.log(userFat);     // ["10", "15", "20"]
	  
	var kcalSum = 0;
	var carbsSum  = 0;
	var proteinSum  = 0;
	var fatSum  = 0;
	
	for (var i = 0; i < userKcals.length; i++) {
	  kcalSum += Number(userKcals[i]);
	  carbsSum += Number(userCarbs[i]);
	  proteinSum += Number(userProteins[i]);
	  fatSum += Number(userFats[i]);
	}
	
	
	var kcalGraph = document.getElementById("kcalGraph");
	var carbsGraph = document.getElementById("carbsGraph");
	var fatGraph = document.getElementById("fatGraph");
	var proteinGraph = document.getElementById("proteinGraph");
	
	kcalGraph.style.width = kcalSum + "%";// 너비 값을 변경
	carbsGraph.style.width = carbsSum + "%";// 너비 값을 변경
	fatGraph.style.width = proteinSum + "%";// 너비 값을 변경
	proteinGraph.style.width = fatSum + "%";// 너비 값을 변경
	
	// 날짜와 시간 input 요소에 값 설정
	//document.getElementById('dietWriteDate').value = dietWriteDate;
	//document.getElementById('dietWriteTime').value = dietWriteTime;
 });

*/


 /*
function foodPlus(index) {
    var userFoodName = document.getElementsByName("dietFoodName")[index].value;
    var kcal = document.getElementsByName("dietKcal")[index].value;
    var carbs = document.getElementsByName("dietCarbs")[index].value;
    var protein = document.getElementsByName("dietProtein")[index].value;
    var fat = document.getElementsByName("dietFat")[index].value;
    var userFoodTime = document.getElementById("dietWriteTime").value;
    var userFoodDate = document.getElementById("dietWriteDate").value;
    
    // 나머지 코드 생략
      for (var i = 0; i < userFoodNames.length; i++) {
        var userFoodName = userFoodNames[i].value;
        var kcal = kcals[i].value;
        var carb = carbs[i].value;
        var protein = proteins[i].value;
        var fat = fats[i].value;
        var userFoodTime = userFoodTimes[i].value; // 수정된 부분
        var userFoodDate = userFoodDates[i].value; // 수정된 부분

        // Assign values to the VO object's properties
        var vo = {
            userFoodName: userFoodName,
            userKcal: parseFloat(kcal),
            userCarbs: parseFloat(carb),
            userProtein: parseFloat(protein),
            userFat: parseFloat(fat),
            userFoodTime: userFoodTime
        };

        // Redirect to foodWriteInsert.jsp with query parameters
        var url = 'foodWriteInsert.jsp' +
            '?userFoodName=' + encodeURIComponent(userFoodName) +
            '&userKcal=' + encodeURIComponent(kcal) +
            '&userCarbs=' + encodeURIComponent(carb) +
            '&userProtein=' + encodeURIComponent(protein) +
            '&userFat=' + encodeURIComponent(fat) +
            '&userFoodTime=' + encodeURIComponent(userFoodTime) +
            '&userFoodDate=' + encodeURIComponent(userFoodDate);
        location.href = url;
    }
} */ 
 
