<%@ page import="com.javaEdu.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 세션정보를 인코딩할 때 "UTF-8" */
	request.setCharacterEncoding("UTF-8");
%>
<!-- dto를 자바빈이라고 부르며 액션태그로 불러 들인다 class("자바빈 위치") id(현재페이지에서 사용할 인스턴스 이름) scope(현재페이지만 자바빈이 사용된다) -->
<jsp:useBean id="dto" class="com.javaEdu.model.MemberDto" scope="page" />
<!-- modify.jsp에서 받은 정보를 자바빈의 property("전역변수 전부") set보낸다 -->
<jsp:setProperty name="dto" property="*" />

<%
/* 세션에 저장된 name("id")를 가져온다(motify에서는 id를 입력하지 안았다) */
	String id = (String)session.getAttribute("id");
/* dto에 해당 id 저장*/
	dto.setId(id);
	MemberDao dao = MemberDao.getInstance();
/* dto에 있는 회원 정보를 dao에 보내서 정보수정을 한다 */
	int ri = dao.updateMember(dto);
	
	if(ri == 1) {
%>
	<script language="javascript">
		alert("정보수정 되었습니다.");
		document.location.href="main.jsp";
	</script>
<%
	} else {
%>
	<script language="javascript">
		alert("정보수정 실패 입니다.");
		history.go(-1);
	</script>
<%
	}
%>    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>