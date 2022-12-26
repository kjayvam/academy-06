// 닉네임, 아이디, 비밀번호, 이름, 생일, 성별, 전화번호 체크
function infoConfirm() {
    //	이름
    if (document.signUp.name.value.length == 0) {
        alert("이름은 필수사항입니다.(js)");
        signUp.name.focus();
        return;
    }
    //	아이디
    if (document.signUp.id.value.length == 0) {
        alert("아이디는 필수사항입니다.(js)");
        signUp.id.focus();
        return;
    } else if (document.signUp.id.value.length < 5) {
        alert("아이디 너무 짧아요.(js)");
        signUp.id.focus();
        return;
    } else if (document.signUp.id.value.length > 15) {
        alert("아이디 너무 길어요.(js)");
        signUp.id.focus();
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
    //	비밀번호 확인
    if (document.signUp.newPw.value != document.signUp.pwCheck.value) {
        alert("비밀번호가 일치하지 않습니다.(js)");
        signUp.pwCheck.focus();
        return;
    }

    document.signUp.submit();		// 위의 모든것이 만족하면 submit함
}