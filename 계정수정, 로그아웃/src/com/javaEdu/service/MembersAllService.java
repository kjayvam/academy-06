package com.javaEdu.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.dao.MemberDao;
import com.javaEdu.model.MemberDto;

public class MembersAllService implements Service {
	
	public MembersAllService() {
	}

	@Override
	public ArrayList<MemberDto> execute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDao dao = MemberDao.getInstance();
		return dao.membersAll();	// dao의 메소드 실행
	}

}
