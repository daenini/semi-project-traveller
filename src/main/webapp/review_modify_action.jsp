<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@page import="com.itwill.traveller.review.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}

//1. Board 객체를 만들고 사용자가 입력한 데이터를 저장
Review review = new Review();
int rv_no = Integer.parseInt(request.getParameter("rv_no"));
int p_no = Integer.parseInt(request.getParameter("p_no"));
review.setRv_no(rv_no);
review.setRv_title(request.getParameter("title"));
review.setRv_writer(request.getParameter("writer"));
review.setRv_content(request.getParameter("content"));
review.setRv_grade(Double.parseDouble(request.getParameter("grade")));

//2. 데이터베이스에 변경된 내용 적용
ReviewService reviewService = new ReviewService();
reviewService.update(review);

//3. boardview.jsp로 이동
response.sendRedirect("review_view.jsp?rv_no="+rv_no+"&p_no="+p_no);
%>
    