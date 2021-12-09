<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_write_form.jsp");
		return;
	}
%>

<%
	try{
	String m_id = request.getParameter("m_id");
	String m_pass = request.getParameter("m_pass1");
	String m_name = request.getParameter("m_name");
	String m_email = request.getParameter("m_email");
	String m_birth = request.getParameter("m_birth");
	String m_phone = request.getParameter("m_phone");
	
	MemberService memberService = new MemberService();
	memberService.insertMember(new Member(m_id, m_pass, m_name, m_email, m_birth, m_phone));
	out.println("<script>");
	out.println("alert('회원가입이 완료되었습니다.');");
	out.println("location.href='member_login_form.jsp'");
	out.println("</script>");
	
	} catch(Exception e) {
		e.printStackTrace();
		response.sendRedirect("member_write_form.jsp");
	}
	
%>