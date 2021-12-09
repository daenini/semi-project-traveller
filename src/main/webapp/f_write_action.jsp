<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.faq.Faq"%>
<%@page import="com.itwill.traveller.faq.FaqService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='f_board_list.jsp'");
		out.println("</script>");
	}
%>

<%
	try{
		
	FaqService faqService = new FaqService();
	
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	String admin = request.getParameter("admin");
	
	faqService.insertFaq(new Faq(0, question, answer, new Member(admin, null, null, null, null, null)));
	response.sendRedirect("f_board_list.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	

%>
