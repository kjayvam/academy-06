package com.javaEdu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaEdu.dao.MemberDao;
import com.javaEdu.model.MemberDto;
import com.javaEdu.service.MembersAllService;
import com.javaEdu.service.Service;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("FrontController.servlet/doGet");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("FrontController.servlet/doPost");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("FrontController.servlet/actionDo");

		String uri = request.getRequestURI(); // 프로젝트 + 파일 주소 가져온다
		String conPath = request.getContextPath(); // 프로젝트에 주소만 가져온다
		String command = uri.substring(conPath.length()); // uri에서 프로젝트 주소를 자른다 (파일주소만 가져온다)

		if (command.equals("/membersAll.do")) {

			response.setContentType("text/html; charset=UTF-8"); // 클라이언트에 보낼때 타입 전송; 클라우저가 받을 타입
			PrintWriter writer = response.getWriter(); // 클라이언트에 HTML로 보낼때 출력스트림
			writer.println("<html><head></head><body>");

			Service service = new MembersAllService();
			ArrayList<MemberDto> dtos = service.execute(request, response); // dao에서 회원들의 모든 리스트로 가져온다

			for (int i = 0; i < dtos.size(); i++) { // dtos에 저장된게 떨어질 때 까지 실행
				MemberDto dto = dtos.get(i); // i번에 있는 리스트를 가져온다
				String id = dto.getId();
				String pw = dto.getPw();
				String name = dto.getName();
				String eMail = dto.geteMail();
				Timestamp rDate = dto.getrDate();
				String address = dto.getAddress();

				writer.println(id + ", " + pw + ", " + name + ", " + eMail + ", " + rDate.toLocalDateTime() + ", "
						+ address + "<hr />");
			}

			writer.println("</body></html>");

			// 해당 JSP 페이지로 forwarding 해야 함 //board controller에서 하는 기법을 설명해줘야 함.
			// String viewPage = null;
			// RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			// dispatcher.forward(request, response);
		}
//		회원가입
		else if (command.equals("/member/insert.do")) {
			System.out.println("FrontControoler.servlet/insert.do");
			// 1. DTO를 생성한다.
			MemberDto dto = new MemberDto();
			
			// 2. request에서 회원의 정보를 얻어서
			String id = request.getParameter("id");
			String pw = request.getParameter("newPw");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			Timestamp rDate = new Timestamp(System.currentTimeMillis()); // 회원가입 가입 날짜
			String address = request.getParameter("address");
			
			// 3. DTO에 넣는다.
			dto.setId(id);
			dto.setPw(pw);
			dto.setName(name);
			dto.seteMail(email);
			dto.setrDate(rDate);
			dto.setAddress(address);
			
			// 4. dao.insertMember(dto)
			MemberDao dao = MemberDao.getInstance();
			int ri = dao.insertMember(dto);
			
			// 5. return 값이 1이면 DB insert 성공함.
			if (ri == 1) {
				System.out.println("회원가입 성공");
				// 6. 회원가입 성공 했으면 메인페이지로 이동
				response.sendRedirect("index.jsp");
			} else {
				System.out.println("회원가입 실패");
			}
		}
//		로그인
		else if (command.equals("/member/login.do")) {
			System.out.println("FrontControoler.servlet/login.do");

			// 1. request에서 회원의 정보를 얻어서
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			// 2. dao에 userCheck 를 하고
			MemberDao dao = MemberDao.getInstance();
			int ri = dao.userCheck(id, pw);
			// 3. return 값이 1이면 DB insert 성공함.
			if (ri == 1) {
				System.out.println("로그인 성공");
				MemberDto dto = dao.getMember(id);			// dao에 getMember메소드를 실행해서 dto타입으로 받아낸다(로그인한 회원의 정보가 전부 들어 있음)
				HttpSession session = request.getSession();	// 세션 생성
				String name = dto.getName();				// 가져온 DB 정보중에 name을 변수에 저장
				session.setAttribute("id", id);				// 입력받은 데이터를 세션에 저장
				session.setAttribute("name", name);			// DB에 가져온 데이터를 세션에 저장
				// 4. 회원가입 성공 했으면 메인페이지로 이동
				response.sendRedirect("index.jsp");
			} else {
				if (ri == 0) {
					System.out.println("비밀번호 불일치");
				} else if (ri == -1) {
					System.out.println("회원이 없음");
				}
				System.out.println("로그인 실패");
				response.sendRedirect("checkout.html");
			}
		} 
//		회원 수정
		else if (command.equals("/member/modify.do")) {
			System.out.println("FrontControoler.servlet/modify.do");

			// 1. DTO를 생성한다.
			MemberDto dto = new MemberDto();
			
			// 2. session에서 회원의 정보(id, pw)를 얻어서 
			String id = (String)request.getSession().getAttribute("id");
			String pw = request.getParameter("pw");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			
			// 3. DTO에 넣는다.
			dto.setId(id);
			dto.setPw(pw);
			dto.setAddress(address);
			dto.seteMail(email);
			
			// 4. dao.updateMember(dto)
			MemberDao dao = MemberDao.getInstance();
			int ri = dao.updateMember(dto);
			// 5. return 값이 1이면 DB update 성공함.
			if (ri == 1) {
				System.out.println("회원수정 성공");
				// 6. 회원가입 성공 했으면 메인페이지로 이동
				response.sendRedirect("index.jsp");
			} else {
				System.out.println("회원수정 실패");
			}
//		로그아웃
		} else if (command.equals("/member/logout.do")) {
			System.out.println("FrontControoler.servlet/logout.do");
			System.out.println("로그아웃 성공");
			HttpSession session = request.getSession();					// 세션 생성
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	}
}
