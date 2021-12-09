<%@page import="com.itwill.traveller.qna.Qna"%>
<%@page import="com.itwill.traveller.qna.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("q_no");
	
	if (no == null || no.equals("")) {
		response.sendRedirect("q_board.jsp");
		return;
	}
	
	QnaService qnaService = new QnaService();
	Qna qna = qnaService.selectByNo(Integer.parseInt(no));
	
	if (qna == null) {
		out.println("<script>");
		out.println("alert('게시글이 삭제되었거나 존재하지 않습니다.');");
		out.println("location.href='q_board.jsp'");
		out.println("</script>");
		return;
	}
	

%>

<!DOCTYPE html>
<html>
	<head>
		<title><%=qna.getQ_title() %></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
		<script>
			function goModify() {
				var ff = document.getElementById("viewfrm");
	        	var title = ff.title.value;
	        	var content = ff.content.value;
	        	var q_no = ff.no.value;
	        	var state = ff.state.value;
	        	var name = ff.name.value;
	        	var categories = ff.categories.value;
	        	
	        	if(state=="완료"){
	        		alert("처리완료 된 게시글은 수정하실 수 없습니다.");
	        		return false;
	        	}
	        	
	        	ff.method='POST';
	        	ff.action = "q_modify.jsp";
	        	ff.submit();
	        	
			}
			
			function goBoard() {
				location.href='q_board.jsp';
			}
			
			function goDelete() {
				f = document.getElementById("viewfrm")
				var no = f.no.value;
				alert("게시글을 삭제하시겠습니까?");
				f.method='POST';
				f.action = "q_delete_action.jsp";
				f.submit();
			}
	   </script>
	</head>

	<body>
		<jsp:include page="/include/top_nav_include.jsp"></jsp:include>
	    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
		<section class="py-5 container px-4 px-lg-5 mt-5" style="word-wrap:break-word;">
			<form id="viewfrm"  method="post" action="q_modify.jsp" >
				<input type="hidden" name="no" value="<%=qna.getQ_no()%>">
				<input type="hidden" name="name" value="<%=qna.getMember().getM_name()%>">
				<input type="hidden" name="title" value="<%=qna.getQ_title()%>">
				<input type="hidden" name="content" value="<%=qna.getQ_content()%>">
				<input type="hidden" name="state" value="<%=qna.getQ_state()%>">
				<input type="hidden" name="categories" value="<%=qna.getQ_category()%>">
				No. <%=qna.getQ_no()%><br><hr>
				<%=qna.getMember().getM_name()%><br><hr>
				[<%=qna.getQ_category()%>] <%=qna.getQ_title()%><br><hr>
				<%=qna.getQ_content()%><br><hr>
				<%=qna.getQ_state() %><br><hr>
				<div class="button text-center" >
					<button id="boardBtn" type="button" class="btn btn-primary" onclick="goBoard()"/>글 목록</button>
					<%
					String sUserId = (String)session.getAttribute("sUserId");
					if(sUserId.equals(qna.getMember().getM_id())) {%>
					<button id="subBtn" type="button" class="btn btn-primary" onclick="goModify()"/>수정</button>
					<button id="delBtn" type="button" class="btn btn-primary" onclick="goDelete()"/>삭제</button>
					
					<%} %>
				</div>
			</form>
		</section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>