<!-- jsp에 들어가는 인코딩 문장 language(사용 스타일) 
contentType(클라이언트에 자원을 보낼때 타입을 전송 , char(클라우저가 받을 타입)) 
page(jsp 작성 타입) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 세션은 (key,value)와 비슷한(name, value)를 사용한다 -->
<!-- 조건에 세션값(세션에. 값을 가져온다("ValidMem"라는 이름을))이 있으면
<jsp페이지 프로그램 제어를 이동할 때 사용, 
다른페이지에서 가져온 자료을 제거하고 현재페이지에서 얻은 자료를 가지고 다른페이지로 이동>
(MVC1페턴으로 MVC2패턴에서는 컨트롤러가 역할을 대신함) -->
<%	if(session.getAttribute("ValidMem") == null) { %>
	<jsp:forward page="login.jsp" />
<%	}
	/* 세션에 저장된 내용은 loginOk.jsp에서 "id"와 "name"만 저장했다 */
	/* 세션에 저장된 데이터를 꺼낸다(getAttribute) */
	String name = (String)session.getAttribute("name");
	String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <%= jsp출력방식이다 => --%>
	<h1><%= name %>님 안녕하세요.</h1> <br />
	<form action="logout.jsp" method="post">
		<input type="submit" value="로그아웃">&nbsp;&nbsp;&nbsp;
		<!-- onclick : 자바스크립트 실행 이벤트로  클릭하면 이동할 페이지를 modify.jsp로 설정 -->
		<input type="button" value="정보수정" onclick="javascript:window.location='modify.jsp'">
	</form>

</body>
</html>