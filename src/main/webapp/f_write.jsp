<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	String sUserId = (String)session.getAttribute("sUserId");
	if(sUserId == null || !sUserId.equals("admin")) {
		out.println("<script>");
		out.println("alert('관리자만 접근 가능합니다.');");
		out.println("location.href='f_board.jsp'");
		out.println("</script>");	
	}
%> --%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>FAQ 등록</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        
        <script type="text/javascript">
        	function cancel() {
				if(confirm("취소하시겠습니까 ?")){
					location.href = "f_board_list.jsp";
				}
			}
        	
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
				form.action = "f_write_action.jsp";
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
        <div class="container">
        <form id="f_form">
        	<!-- 작성자 --><input type="hidden" name=admin value="admin">
		<div class="form-group">
        		<input type="text" class="form-control" placeholder="질문을 입력하세요." name="question">
        </div>
        <br/>
        <div class="form-group">
        		<textarea rows="10" name=answer style="width: 1000px"></textarea>
        </div>
        </form>
        <div align="center">
        <button type="button" class="btn btn-primary" onclick="submit();">등록</button>
        <button type="button" class="btn btn-primary" onclick="cancel();">취소</button>
        </div>
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
