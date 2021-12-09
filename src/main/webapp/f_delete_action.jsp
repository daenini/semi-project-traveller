<%@page import="com.itwill.traveller.faq.FaqService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='f_deltail.jsp'");
		out.println("</script>");
		return;
	}
%>

<%
	try{
	FaqService faqService = new FaqService();
	String f_no = request.getParameter("f_no");
	
	faqService.deleteFaq(Integer.parseInt(f_no));
	out.println("<script>");
	out.println("alert('삭제되었습니다.');");
	out.println("location.href='f_board_list.jsp'");
	out.println("</script>");
	
	
	} catch(Exception e) {
		e.printStackTrace();
	}

%>
