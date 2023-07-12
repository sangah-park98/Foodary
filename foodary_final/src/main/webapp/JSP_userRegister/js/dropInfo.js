//	회원 탈퇴 완료 띄우기
function dropInfo1() {
  let password = document.getElementById("password").value;
  let passwordChk = document.getElementById("passwordChk").value;

  if (password === passwordChk) {
    alert("회원탈퇴가 완료되었습니다.");
    window.location.href = "/foodary_final/JSP_main/foodaryMainPageBefore.jsp";
    
  } else if (passwordChk === '') {
	alert("비밀번호를 입력해 주세요.");
  } else {
	alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	
  }
	location.href='/foodary_final/JSP_userRegister/dropInfo.jsp';
}


//	비밀번호 일치여부 실시간 반영 함수
/*
function passwordCheckFunction() {
	let password = $('#password').val();
	let passwordChk = $('#passwordChk').val();
	if(password != passwordChk) {
		$('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');

	} else {
		$('#passwordCheckMessage').html('');
	
	}
}
*/