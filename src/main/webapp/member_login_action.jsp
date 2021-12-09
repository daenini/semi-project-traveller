
<%@page import="com.itwill.traveller.member.exception.PasswordMismatchException"%>
<%@page import="com.itwill.traveller.member.exception.MemberNotFoundException"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_login_form.jsp");
		return;
	}
%>

<%
	try{
	String m_id = request.getParameter("id");
	String m_pass = request.getParameter("password");
	
	MemberService memberService = new MemberService();
	boolean login = memberService.login(m_id, m_pass);
	if(login){
		session.setAttribute("sUserId", m_id);
		response.sendRedirect("index.jsp");		
	}

	
	} catch(MemberNotFoundException e) {
		e.printStackTrace();
		String msgId = e.getMessage();
		response.sendRedirect("member_login_form.jsp?msgId=" + URLEncoder.encode(msgId, "UTF-8"));
	} catch(PasswordMismatchException e) {
		e.printStackTrace();
		String msgPass = e.getMessage();
		response.sendRedirect("member_login_form.jsp?msgPass=" + URLEncoder.encode(msgPass, "UTF-8"));
	} catch(Exception e) {
		e.printStackTrace();
	}

%>