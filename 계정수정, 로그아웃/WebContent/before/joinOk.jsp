<%@page import="java.sql.Timestamp"%>
<%@page import="com.javaEdu.dao.*"%>
<!-- jsp에 들어가는 인코딩 문장 language(사용 스타일) 
contentType(클라이언트에 자원을 보낼때 타입을 전송 , char(클라우저가 받을 타입)) 
page(jsp 작성 타입) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%
	/* 보내온 장소인 join.jsp에서 받아서.받은 인코딩을 "UTF-8"로 한다 */
	request.setCharacterEncoding("UTF-8");
%>
<!-- dto를 자바빈이라고 부르며 액션태그로 불러 들인다 class("자바빈 위치") id(현재페이지에서 사용할 인스턴스 이름) -->
<jsp:useBean id="dto" class="com.javaEdu.model.MemberDto"/>
<!-- join.jsp에서 받은 정보를 자바빈의 property("전역변수 전부") set보낸다 -->
<jsp:setProperty name="dto" property="*" />
<%
		/* 자바빈.메소드(SQL의 현재 날짜 데이터 변환(현재 날짜 시간 데이터 가져오기)) */
		dto.setrDate(new Timestamp(System.currentTimeMillis()));
		MemberDao dao = MemberDao.getInstance();
		
		/* DB에 id를 주고 정보가 있는지 확인 1이면 있을때 */
		if(dao.confirmId(dto.getId()) == 1) {
%>
		<script language="javascript">
			alert("아이디가 이미 존재 합니다.");
			history.back();
		</script>
<%
		} else {
			/* 저장된 자바빈을 dao에 보낸다 */
			int ri = dao.insertMember(dto);
			if(ri == 1) {
				/* 세션에 name("id")value(getid)를 저장 */
				session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("회원가입을 축하 합니다.");
				/* 페이지 이동 login.jsp로 */
				document.location.href="login.jsp";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("회원가입에 실패했습니다.");
				document.location.href="login.jsp";
			</script>
<%
			}
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>