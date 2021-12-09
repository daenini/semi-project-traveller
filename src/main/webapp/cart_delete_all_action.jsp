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
		response.sendRedirect("cart_view.jsp");
		return;
	}
%>

<%
	try {
		
	CartService cartService = new CartService();
	cartService.deleteAll(m_id);
	response.sendRedirect("cart_view.jsp");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
%>