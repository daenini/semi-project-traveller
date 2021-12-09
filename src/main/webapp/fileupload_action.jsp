<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='q_board.jsp'");
		out.println("</script>");	
		return;
	}

	MultipartRequest multipartRequest = null;
	String contextPath = application.getRealPath("");
	String saveDirectory = contextPath + "/images";
	//이미지 파일 저장되는 경로 출력
	//System.out.println(contextPath + "images");
	
	multipartRequest = new MultipartRequest(request, saveDirectory, 1024 * 1024 * 2, "UTF-8"); // 최대 10MB

	String originalFileName = multipartRequest.getFilesystemName("file"); // 원본 파일명
	String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
	String savedFileName = UUID.randomUUID() + extension; // 저장될 파일명
	
	File o_file = new File(contextPath+"\\images\\"+originalFileName);
	File s_file = new File(contextPath+"\\images\\"+savedFileName);
	o_file.renameTo(s_file); // 파일명 rename
	
	out.println("<script>");
	out.println("	window.onload=function uploadFile() {");
	out.println("		parent.getUploadFileName('"+savedFileName+"');");
	out.println("	}");
	out.println("</script>");
%>
