package com.javaEdu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javaEdu.model.MemberDto;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	
	private MemberDao() {
	}
	
	public static MemberDao getInstance(){
		return instance;
	}
	
	public int insertMember(MemberDto dto) {	// 회원 가입
		int ri = 0;
		
		Connection connection = null;	// DB와 연결
		PreparedStatement pstmt = null;	// DB 명령 보내기
		String query = "insert into members values (?,?,?,?,?,?)";	// insert into members(속성 마음대로 배치) values (배치에 맞는 순서) 하는것이 좋아보인다
		
		try {
			connection = getConnection();				// DB 연결을 위한 객체(만든 메소드)
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.geteMail());
			pstmt.setTimestamp(5, dto.getrDate());
			pstmt.setString(6, dto.getAddress());
			pstmt.executeUpdate();						// DB DML 조작메소드 사용
			ri = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int confirmId(String id) {  // 로그인 중복체크		// 해당 id가 있는지 체크함
		int ri = 0;
		
		Connection connection = null;	// DB와 연결
		PreparedStatement pstmt = null;	// DB 명령 보내기
		ResultSet set = null;			// DB 출력 가져오기
		String query = "select id from members where id = ?";
		
		try {
			connection = getConnection();	// DB 연결을 위한 객체(만든 메소드)
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, id);
			set = pstmt.executeQuery();		// DB 출력을 리스트로 가져오기
			if(set.next()){	// 받아온 정보가 있을때
				ri = 1;
			} else {		// 받아온 정보가 없을때
				ri = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public int userCheck( String id, String pw) { // 로그인	// 사용자 password가 맞는지 체크함
		int ri = 0;
		String dbPw;
		
		Connection connection = null; 	// DB와 연결하기
		PreparedStatement pstmt = null;	// DB에 명령을 보내기
		ResultSet set = null;			// DB에 출력값을 받아오기
		String query = "select pw from members where id = ?";	// pstmt에 보낼 글자 : members테이블에 id에 맞는 pw를 찾는다
		
		try {
			connection = getConnection();	// DB와 연결하기위해 만들어둔 메소드를 호출
			pstmt = connection.prepareStatement(query);	// connection에 명령어 보내기
			pstmt.setString(1, id);			// ? 첫번째 위치에 인자 넣기
			set = pstmt.executeQuery();		// 가져온 값을 list로 받기
			
			if(set.next()) {				// 가져온 set(list)가 있으면 실행
				dbPw = set.getString("pw");
				if(dbPw.equals(pw)) {		// 가져온 pw가 입력받은 데이터와 같은지 확인
					ri = 1;		//  Ok
				} else {
					ri = 0;		//  X
				}
			} else {
				ri = -1;		//  X	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public MemberDto getMember(String id) { // 회원 수정		//해당 id에 대한 회원정보를 모두 가지고 옴
		Connection connection = null;						// DB와 연결하기
		PreparedStatement pstmt = null;						// DB에 명령을 보내기
		ResultSet set = null;								// DB에 출력값을 받아오기
		String query = "select * from members where id = ?";
		MemberDto dto = null;								// 가져온 정보를 dto에 담아서 사용하기
		
		try {
			connection = getConnection();					// DB와 연결하기위해 만들어둔 메소드를 호출
			pstmt = connection.prepareStatement(query);		// connection에 명령어 보내기
			pstmt.setString(1, id);							// 가져온 set(list)가 있으면 실행
			set = pstmt.executeQuery();						// 가져온 값을 list로 받기
			
			if(set.next()) {							// 가져온 list를 dto에 풀어서 저장
				dto = new MemberDto();
				dto.setId(set.getString("id"));			// DB에서 가져온 id를 dto의 setId에 저장
				dto.setPw(set.getString("pw"));
				dto.setName(set.getString("name"));
				dto.seteMail(set.getString("eMail"));
				dto.setrDate(set.getTimestamp("rDate"));
				dto.setAddress(set.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	public int updateMember(MemberDto dto) { // 회원 수정		// 회원의 정보를 수정함
		int ri = 0;
		
		Connection connection = null;		// DB와 연결하기
		PreparedStatement pstmt = null;		// DB에 명령을 보내기
		String query = "update members set pw=?, eMail=?, address=? where id=?";
		
		try {
			connection = getConnection();				// DB와 연결하기위해 만들어둔 메소드를 호출
			pstmt = connection.prepareStatement(query);	// connection에 명령어 보내기
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.geteMail());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getId());
			ri = pstmt.executeUpdate();					// DB DML 조작메소드 사용
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	public ArrayList<MemberDto> membersAll() { // 관리자의 회원정보 보기		// MemberAllServcie.java에서 call하고, 모든 회원의 정보를 갖고 옴.
		
		ArrayList<MemberDto> dtos = new ArrayList<MemberDto>();		// dto를 리스트로 만든다
		Connection connection = null;		// DB와 연결하기
		PreparedStatement pstmt = null;		// DB에 명령을 보내기
		ResultSet rs = null;				// DB에 출력값을 받아오기	
		String query = "select * from members";
		
		try {
			connection = getConnection();				// DB와 연결하기위해 만들어둔 메소드를 호출
			pstmt = connection.prepareStatement(query);	// connection에 명령어 보내기
			rs = pstmt.executeQuery();					// 가져온 값을 list로 받기
			
			System.out.println("============");
			while (rs.next()) {						// 가져온 회원 정보가 없을 때까지 반벅
				MemberDto dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddress(rs.getString("address"));
				dtos.add(dto);								// 회원들의 모든 정보를 저장한다
			}
			System.out.println("--------------------------");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dtos;
		
	}
	
	private Connection getConnection() { //DBCP connection을 얻기위함, context.xml에 DBCP 정보 셋팅되어야 함.
		
		Context context = null;			// DB 조작 및 실행
		DataSource dataSource = null;	// DB 연결을 위한 주소
		Connection connection = null;	// DB 와 연결
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
}
