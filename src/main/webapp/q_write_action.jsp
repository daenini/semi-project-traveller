<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.qna.Qna"%>
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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String catergory = request.getParameter("category");
		String writer = request.getParameter("writer"); // 추후 세션 구현하고 바꿀것
		String state = "미완료"; // 
		
		
		QnaService qnaService = new QnaService();
	
		qnaService.insertQna(new Qna(0,title,content,catergory,state,new Member(writer,null,null,null,null,null),new Product(1, null, 0, null, 0, null, null, null, 0)));
		
		response.sendRedirect("q_board.jsp");
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("q_error.jsp");
	}
%>