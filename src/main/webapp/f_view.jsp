<%@page import="com.itwill.traveller.faq.Faq"%>
<%@page import="com.itwill.traveller.faq.FaqService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FaqService faqService = new FaqService();

	String f_no = request.getParameter("f_no");
	if(f_no == null){
		response.sendRedirect("f_board_list.jsp");
		return;
	}
	
	Faq faq = faqService.selectByNo(Integer.parseInt(f_no));
	if(faq == null){
		out.println("<script>");
		out.println("alert('게시글이 존재하지 않거나 삭제되었습니다.');");
		out.println("location.href='f_board_list.jsp'");
		out.println("</script>");
		return;
	}
	
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>질문과 답변</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function qnaList() {
				location.href = "f_board_list.jsp";
			}
        	
        	function deleteCheck() {
        		var form = document.getElementById("v_form");
				if(confirm("정말로 삭제하시겠습니까 ?")){
					form.action = "f_delete_action.jsp";
					form.method = "POST";
					form.submit();
				}
			}
        	
        	function modifyForm() {
        		var form = document.getElementById("v_form");
        		form.action = "f_modify.jsp";
        		form.method = "POST";
        		form.submit();
			}
        </script>
    </head>
    <body>
    <jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
        <!-- Section-->
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5 container px-4 px-lg-5 mt-5">
        
        <div class = "container">
        <form id="v_form">
        	<table class="table">
        		<tr>
        			<th><input type="hidden" name="f_no" value="<%= faq.getF_no() %>"></th>
        		</tr>
        		<tr>
        			<th>Q</th>
        			<th><span style="font-size: 15px"><%= faq.getF_question() %></span></th>
        		</tr>
        		<tr>
        			<th>A</th>
        			<th><span style="color: blue; font-size: 15px"><%= faq.getF_answer() %></span></th>
        		</tr>
        	</table>
        </form>
        </div>
        <br/><br/>
        <div align="center">
		<%
			String sUserId = (String)session.getAttribute("sUserId");
			if(sUserId == null || !(sUserId.equals("admin"))){
		%>
			<button type="button" class="btn btn-primary" onclick="qnaList();">목록</button>
 		<%		
			} else {
		%>
		<button type="button" class="btn btn-primary" onclick="qnaList();">목록</button>
	    <button type="button" id="modify" class="btn btn-primary" onclick="modifyForm();">수정</button>
	    <button type="button" id="delete" class="btn btn-primary" onclick="deleteCheck();">삭제</button>
        <%
			}
        %>
        </div>
		
		
		
		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
        </section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
