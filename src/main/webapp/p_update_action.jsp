<%@page import="java.util.UUID"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="com.itwill.traveller.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("p_update.jsp");
	return;
	}

request.getParameter("UTF-8");

MultipartRequest multipartRequest = null;
String contextPath = application.getRealPath("");
String saveDirectory = contextPath + "/images";
//이미지 파일 저장되는 경로 출력
//System.out.println(contextPath + "images");

multipartRequest = new MultipartRequest(request, saveDirectory, 1024 * 1024 * 2, "UTF-8"); // 최대 10MB

String originalFileName = multipartRequest.getFilesystemName("p_image"); // 원본 파일명

String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명


ProductService productService = new ProductService();

String p_no = multipartRequest.getParameter("p_no");
String p_name = multipartRequest.getParameter("p_name");
String p_price = multipartRequest.getParameter("p_price");
String p_qty = multipartRequest.getParameter("p_qty");
String p_category = multipartRequest.getParameter("p_category");
String p_image = "images/"+multipartRequest.getFilesystemName("p_image");
String p_detail = multipartRequest.getParameter("p_detail");

Product product = new Product(Integer.parseInt(p_no),
							  p_name,
							  Integer.parseInt(p_price),
							  null,
							  Integer.parseInt(p_qty),
							  p_category,
							  p_image,
							  p_detail,
							  0);
int updateRowCount = productService.updateProduct(product);

if(updateRowCount < 1){
	out.println("<script>");
	out.println("alert('잘못된 접근입니다.');");
	out.println("location.href='p_list.jsp'");
	out.println("</script>");
	return;
}
response.sendRedirect("p_list.jsp");










%>