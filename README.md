회원 수정
1. DTO를 생성한다.
2. session에서 회원의 정보(id, pw)를 얻어서 
3. DTO에 넣는다.
4. dao.updateMember(dto)
5. return 값이 1이면 DB update 성공함.
외)
1. FrontControoler.servlet/login.do에 세션을 저장하기 추가
2. 정보변경(modify.jsp) 페이지에 세션을 활용함

로그아웃
1. 세션 생성
2. 세션 정보 초기화
외)
1. 메인(index.jsp)페이지에 세션 사용해서 name 출력
