<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@page import="com.itwill.traveller.review.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%

  	Review review=new Review();
    ReviewService reviewService = new ReviewService();
  	
  	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='p_list.jsp'");
		out.println("</script>");	
		return;
	}
  	try{
  	int p_no = Integer.parseInt(request.getParameter("p_no"));
  	review.setRv_no(
  			Integer.parseInt(request.getParameter("rv_no")));
  
  	review.setRv_title(request.getParameter("title"));
  	review.setRv_writer(request.getParameter("writer"));
  	review.setRv_content(request.getParameter("content"));
  	reviewService.createReplay(review);
  	
  	response.sendRedirect("review_board_list.jsp?p_no="+p_no);
  	} catch(Exception e){
  		e.printStackTrace();
  		out.println("<script>");
		out.println("alert('답변을 다시 작성해주세요.');");
		out.println("location.href='p_list.jsp'");
		out.println("</script>");	
  		
  	}
    
    %>
