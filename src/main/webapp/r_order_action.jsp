<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.reservation.Reservation"%>
<%@page import="com.itwill.traveller.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sUserId = (String)session.getAttribute("sUserId");
	if(sUserId == null){
		response.sendRedirect("member_login_form.jsp");
		return;
	}
%>
<%

	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='index.jsp'");
		out.println("</script>");	
		return;
	}

	try{
		String p_qty = request.getParameter("p_qty");
		String method = request.getParameter("method");
		String p_no = request.getParameter("p_no");
		String buyType = request.getParameter("buyType");
		String[] c_item_no = request.getParameterValues("c_item_no");
		
		ReservationService reservationService = new ReservationService();
		
		if(buyType.equals("cart_select")){
			reservationService.insertReservation(sUserId, method, c_item_no);
        }
		
		
		response.sendRedirect("r_view.jsp");
		
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("q_error.jsp");
	}
%>