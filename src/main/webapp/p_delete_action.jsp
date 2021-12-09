<%@page import="com.itwill.traveller.product.ProductService"%>
<%@page import="com.itwill.traveller.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.');");
	out.println("location.href='p_deltail.jsp'");
	out.println("</script>");
	return;
}
%>
<%
request.setCharacterEncoding("UTF-8");
try{
String deleteP = request.getParameter("p_no");

ProductService productService = new ProductService();

int deleteRowCount = productService.deleteProduct(Integer.parseInt(deleteP));

if(deleteRowCount < 1){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.');");
	out.println("location.href='p_insert.jsp'");
	out.println("</script>");
	return;
}
response.sendRedirect("p_list.jsp");

} catch (Exception e) {
	e.printStackTrace();
}

%>