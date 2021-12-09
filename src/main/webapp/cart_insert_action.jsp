<%@page import="com.itwill.traveller.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String m_id = (String)session.getAttribute("sUserId");
	if(m_id == null){
		response.sendRedirect("member_login_form.jsp");
		return;
	}
%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("cart_view.jsp");   //상품페이지 구현 시 변경
		return;
	}
%>

<%
	try {
		
	String c_qty = request.getParameter("c_qty");   //상품 상세페이지 form에 있는 ID로 변경예정
	String p_no = request.getParameter("p_no");    //상품 상세페이지 form에 있는 ID로 변경예정
	
	CartService cartService = new CartService();
	cartService.insertCart(Integer.parseInt(c_qty), Integer.parseInt(p_no), m_id);
	
	response.sendRedirect("cart_view.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	
%>
