// 아이디 비밀번호 체크
function loginCheck() {
	//	아이디
	if (document.login.id.value.length == 0) {
		alert("아이디는 필수사항입니다.(js)");
		login.id.focus();
		return;
	} else if (document.login.id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.(js)");
		login.id.focus();
		return;
	}
    //	비밀번호
    if (document.signUp.newPw.value.length == 0) {
        alert("비밀번호는 필수사항입니다.(js)");
        signUp.newPw.focus();
        return;
    } else if (document.signUp.newPw.value.length < 8) {
        alert("비밀번호 너무 짧아요.(js)");
        signUp.newPw.focus();
        return;
    } else if (document.signUp.newPw.value.length > 15) {
        alert("비밀번호 너무 길어요.(js)");
        signUp.newPw.focus();
        return;
    }
	document.login.submit(); // 위의 모든것이 만족하면 submit함
}


// html에 onclick없애고 js로 실행하고 싶은데 안된다 왜 안되지?
// window.addEventListener("click", signUp);

// function signUp(){
// 	// 2개중 아무거나
// 	document.location = "signUp.html";
// 	// window.location = "signUp.html";
// }