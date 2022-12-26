package com.javaEdu.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaEdu.model.MemberDto;

public interface Service {
	public ArrayList<MemberDto> execute(HttpServletRequest request, HttpServletResponse response);
}
