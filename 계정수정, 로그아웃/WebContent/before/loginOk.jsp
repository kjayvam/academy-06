<%@page import="com.javaEdu.model.MemberDto"%>
<%@ page import="com.javaEdu.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
/* login.jsp에서 받은 정보를 UTF-8로 받는다 */
	request.setCharacterEncoding("UTF-8");

/* login.jsp에서 name type를 보내는 것중에 name="id"인 것을 가져온다 */
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	/* dao클래스에 생성자가 숨어 있어서 밖에서 사용할 수 있게 설정 해둔 getInstance를 인스턴스로 생성 */
	MemberDao dao = MemberDao.getInstance();
	/* dao에 userCheck메소드에 인자값으로 id와 pw를 보내고 pw가 같은지 확인하여 리턴한다 */
	int checkNum = dao.userCheck(id, pw);
	/* checkNum의 리턴값으로 받은 값이 -1과 같으면 실행 */
	if(checkNum == -1) {
%>
		<script language="javascript">
		/* 자바스크립트의 알림창("적힐 내용") */
			alert("아이디가 존재하지 않습니다.");
		/* 화면 뒤로가기를 적용한다 */
			history.go(-1);
		</script>
<%
	} else if(checkNum == 0) {
%>
		<script language="javascript">
			alert("비밀번호가 틀립니다.");
			history.go(-1);
		</script>
<%
	} else if(checkNum == 1) {
		/* dao에 getMember메소드를 실행해서 dto타입으로 받아낸다(로그인한 회원의 정보가 전부 들어 있음) */
		MemberDto dto = dao.getMember(id);
		
		if(dto == null) {
%>
		<script language="javascript">
			alert("존재하지 않는 회원 입니다.");
			history.go(-1);
		</script>
<%
		} else {
			String name = dto.getName();				// 가져온 DB 정보중에 name을 변수에 저장
			session.setAttribute("id", id);				// 입력받은 데이터를 세션에 저장
			session.setAttribute("name", name);			// DB에 가져온 데이터를 세션에 저장
			session.setAttribute("ValidMem", "yes");	// 그냥 로그인 됬다는것을 표시하기 위해 사용
			response.sendRedirect("main.jsp");			// 응답한다.다른페이지로 이동("이동할 페이지")
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

