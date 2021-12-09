<%@page import="com.itwill.traveller.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sUserId = (String)session.getAttribute("sUserId");
	if(sUserId == null){
		out.println("<script>");
		out.println("alert('로그인 후 이용가능한 서비스입니다.');");
		out.println("location.href='member_login_form.jsp'");
		out.println("</script>");
	}
%>

<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("p_list.jsp");
		return;
	}

	String c_no = request.getParameter("cart_no");
	String c_qty = request.getParameter("cart_qty");
	CartService cartService = new CartService();
	
	if(c_qty.equals("0")){
		cartService.deleteByPno(Integer.parseInt(c_no));
	} else {
		cartService.updateNumberQty(Integer.parseInt(c_qty), Integer.parseInt(c_no));
	}
	
	response.sendRedirect("cart_view.jsp");
	
%>