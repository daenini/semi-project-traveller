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
	
	String c_no = request.getParameter("cart_no");
	CartService cartService = new CartService();
	cartService.deleteByPno(Integer.parseInt(c_no));
	out.println("<script>");
	out.println("alert('해당 상품이 삭제되었습니다.')");
	out.println("location.href='cart_view.jsp'");
	out.println("</script>");
	
	} catch(Exception e) {
		e.printStackTrace();
	}
%>