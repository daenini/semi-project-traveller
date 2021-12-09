<%@page import="com.itwill.traveller.faq.Faq"%>
<%@page import="com.itwill.traveller.faq.FaqService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String f_no = request.getParameter("f_no");

	if(f_no == null){
		response.sendRedirect("f_board.jsp");
		return;
	}
	
	FaqService faqService = new FaqService();
	Faq faq = faqService.selectByNo(Integer.parseInt(f_no));

	if(faq == null){
		out.println("<script>");
		out.println("alert('게시글이 삭제되었거나 존재하지 않습니다.')");
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
        <title>Sample</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script>
        	function submit() {
				var form = document.getElementById("f_form");
				if(form.question.value.trim() == ""){
					alert("질문을 입력하세요.");
					form.question.focus();
					return;
				}
				if(form.answer.value.trim() == ""){
					alert("답변을 입력하세요.");
					form.answer.focus();
					return;
				}
				form.action = "f_modify_action.jsp";
				form.method = "POST";
				form.submit();
				
			}
        	
        	function cancel() {
				location.href="f_board_list.jsp";
			}
        </script>
    </head>
    <body>
    <jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
        <!-- Section-->
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5 container px-4 px-lg-5 mt-5">
        <form id="f_form">
        	<!-- PK번호 --><input type="hidden" name=f_no value="<%= faq.getF_no() %>">
			질문 <input type="text" name=question style="width: 1000px" value ="<%= faq.getF_question() %>"><br/><br/><br/>
			　　 <textarea rows="10" name=answer style="width: 1000px"><%= faq.getF_answer() %></textarea>
        </form>
        <div align="center">
        <button type="button" class="btn btn-primary" onclick="submit();">수정</button>
        <button type="button" class="btn btn-primary" onclick="cancel();">취소</button>
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
