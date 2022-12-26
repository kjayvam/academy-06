/**
 * 
 */

function infoConfirm() {
	/* 요소.폼이름.폼안에 있는 이름.type에 작성된 값.길이 */
	if(document.reg_frm.id.value.length == 0) {
		/* 알림창("작성글자") */
		alert("아이디는 필수사항입니다.");
		/* 폼이름.폼안에 있는 이름.마우스커서를 이동 */
		reg_frm.id.focus();
		return;
	}
	
	if(document.reg_frm.id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다..");
		reg_frm.id.focus();
		return;
	}
	
	if(document.reg_frm.pw.value.length == 0) {
		alert("비밀번호는 필수사항입니다.");
		reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다..");
		reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.name.value.length == 0) {
		alert("이름은 필수사항입니다..");
		reg_frm.name.focus();
		return;
	}
	
	if(document.reg_frm.id.value.length == 0) {
		alert("아이디는 필수사항입니다..");
		reg_frm.id.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일은 필수사항입니다..");
		reg_frm.eMail.focus();
		return;
	}
	/* 폼이름.전송으로 폼안에 있는 내용을 action에 보낸다 */
	document.reg_frm.submit(); //위의 모든것이 만족하면  submit함
}

function updateInfoConfirm() {
	if(document.reg_frm.pw.value == "") {
		alert("패스워드를 입력하세요.");
		document.reg_frm.pw.focus(); //password input에 focus가 가도록 함
		return;
	}
	
	if(document.reg_frm.pw.value != document.reg_frm.pw_check.value) {
		alert("비밀번호가 일치하지 않습니다..");
		reg_frm.pw.focus();
		return;
	}
	
	if(document.reg_frm.eMail.value.length == 0) {
		alert("메일은 필수사항입니다..");
		reg_frm.eMail.focus();
		return;
	}
	
	document.reg_frm.submit(); //위의 모든것이 만족하면  submit함
	
}