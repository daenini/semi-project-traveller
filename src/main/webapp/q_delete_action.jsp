<%@page import="com.itwill.traveller.qna.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='q_board.jsp'");
		out.println("</script>");	
		return;
	}
	
	try{
		request.setCharacterEncoding("UTF-8");
		String no = request.getParameter("no");
		
		QnaService qnaService = new QnaService();
	
		qnaService.deleteQna(Integer.parseInt(no));
		
		response.sendRedirect("q_board.jsp");	
			
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("q_error.jsp");
	}
%>