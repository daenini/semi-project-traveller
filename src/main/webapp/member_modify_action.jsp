<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "login_check.jspf" %>

<%
	try{
		
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_birth = request.getParameter("m_birth");
	String m_phone = request.getParameter("m_phone");
	String m_pass = request.getParameter("m_pass");
	
	MemberService memberService = new MemberService();
	memberService.updateMember(new Member(sUserId, m_pass, m_name, m_email, m_birth, m_phone));
	
	response.sendRedirect("member_view_myinfo.jsp");
	
	
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("m_error.jsp");
	}
	
%>
