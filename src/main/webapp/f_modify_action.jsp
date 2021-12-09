<%@page import="com.itwill.traveller.faq.Faq"%>
<%@page import="com.itwill.traveller.faq.FaqService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("f_board_list.jsp");
		return;
	}
%>
<%
	try{
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	String f_no = request.getParameter("f_no");
	
	FaqService faqService = new FaqService();
	faqService.updateFaq(new Faq(Integer.parseInt(f_no), question, answer, null));
	
	response.sendRedirect("f_view.jsp?f_no=" + f_no);
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	
	
%>
