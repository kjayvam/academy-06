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
<% if(session.getAttribute("ValidMem") != null) { %>
	<jsp:forward page="main.jsp" />
<% } %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- mtea : 문서의 초기 정보를 설정할때 사용하며 jsp에서 <%@ 지시어 %>와 같은 역할을 한다 --%>
<!-- http-equiv : content와 반드시 같이 사용되어야 함("Content-Type"은 문서의 문자 인코딩 방식을 명시함)
명시 타입으로 인코딩, 새로코침 시간, 우선적으로 적용할 스타일시트를 명시 할 수 있다 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<!-- 폼~/폼 사이에 있는 내용을 action에 적힌 장소로 이동, method로 보내는 타입을 정한다 -->
	<form action="loginOk.jsp" method="post">
	
	<!-- name : name type(또는 value) 방식으로 값을 전송할 때 사용 -->
	<!-- 조건 (세션안에 name value가 있으면 ) {세션안에 name("id")의 value를 출력한다} -->
		아이디 : <input type="text" name="id" value="<% if(session.getAttribute("id") != null) out.println(session.getAttribute("id")); %>"> <br />
		비밀번호 : <input type="password" name="pw"><br />
		<input type="submit" value="로그인"> &nbsp;&nbsp;
		
		<!-- onclick : 자바스크립트 실행 이벤트로  클릭하면 이동할 페이지를 join.jsp로 설정 -->
		<input type="button" value="회원가입" onclick="javascript:window.location='join.jsp'">
	</form>
</body>
</html>

