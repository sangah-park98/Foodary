function dayCheck() {
//	let year = getyear;
/*	let month = getmonth; */
	
	console.log('테스트');
	var url = 'selectDiet.jsp';
	location.href = url;
//	$('#sendYear').val() = year;
//	$('#sendMonth').val() = month;
//	$('#sendDay').val() = day;
};



///////////////////////////////////이미지 캡쳐////////////////////////////////////
/*
html2canvas(document.querySelector(".diet-table")).then(canvas => {
	const link = document.createElement('a')
	link.download = 'filename'
	link.href = canvas.toDataURL()
    document.body.appendChild(link)
    link.click()
    
});

$('.btnCapture').click(function() {
	screenShot($('.foodCapture'));
});

function screenShot(target) {
	if (target != null && target.length > 0) {
		var t = target[0];
		html2canvas(t).then(function(canvas) {
			var myImg = canvas.toDataURL("image/png");
			myImg = myImg.replace("data:image/png;base64,", "");

			$.ajax({
				type : "POST",
				data : {
					"imgSrc" : myImg
				},
				dataType : "text",
				url : contextPath + "/ImgSaveTest.do",
				success : function(data) {
					console.log(data);
				},
				error : function(a, b, c) {
					alert("error");
				}
			});
		});
	}
}
*/

