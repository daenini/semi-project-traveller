<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    ReviewService reviewService = new ReviewService();
    String p_no = request.getParameter("p_no");
    String rv_no = request.getParameter("rv_no");
    
    reviewService.remove(Integer.parseInt(rv_no));
    response.sendRedirect("review_board_list.jsp?p_no="+p_no);
   
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>