// 닉네임, 아이디, 비밀번호, 이름, 생일, 성별, 전화번호 체크
function infoChange() {
    //	비밀번호
    if (document.modify.newPw.value.length == 0) {
        alert("비밀번호는 필수사항입니다.(js)");
        modify.newPw.focus();
        return;
    } else if (document.modify.newPw.value.length < 8) {
        alert("비밀번호 너무 짧아요.(js)");
        modify.newPw.focus();
        return;
    } else if (document.modify.newPw.value.length > 15) {
        alert("비밀번호 너무 길어요.(js)");
        modify.newPw.focus();
        return;
    }
    //	비밀번호 확인
    if (document.modify.newPw.value != document.modify.pwCheck.value) {
        alert("비밀번호가 일치하지 않습니다.(js)");
        modify.pwCheck.focus();
        return;
    }

    document.modify.submit();		// 위의 모든것이 만족하면 submit함
}