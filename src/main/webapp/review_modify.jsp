<%@page import="com.itwill.traveller.review.Review"%>
<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	ReviewService reviewService = new ReviewService();
	String sUserId = (String)session.getAttribute("sUserId");
	String sP_no = request.getParameter("p_no");
	String sRv_no = request.getParameter("rv_no");
	
	if(sUserId == null){
		out.println("<script>");
		out.println("alert('로그인 후 이용가능한 서비스입니다.');");
		out.println("location.href='member_login_form.jsp'");
		out.println("</script>");
		return;
	}
	
	if(sP_no==null){
		out.println("<script>");
		out.println("alert('상품을 선택해주세요.');");
		out.println("location.href='p_list.jsp'");
		out.println("</script>");
		return;
	}
	
	int p_no = Integer.parseInt(sP_no);
	int rv_no = Integer.parseInt(sRv_no);
	Review review = reviewService.findReview(rv_no);
%>
<!DOCTYPE html>
<html>
	<head>
		<title>리뷰 수정</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="js/summernote.min.js"></script>
		<script src="js/summernote-ko-KR.js"></script>
		<script>
			function upDate() {
				frm = document.getElementById("review_write")
				var title = frm.title.value;
				var content = frm.content.value;
				var grade = frm.grade.value;
				var writer = frm.writer.value;
				var p_no = frm.p_no.value;
				var rv_no = frm.rv_no.value;
				
				if (title == "") {
					alert("제목을 입력해주세요.");
					frm.title.focus();
					return false;
				}
				
				if (content == "") {
					alert("내용을 입력해주세요.");
					frm.content.focus();
					return false;
				}
				
				frm.action = "review_modify_action.jsp";
				frm.method="POST";
				frm.submit();
			}
			
			function check(){
				frm = document.getElementById("review_write")
				var p_no = frm.p_no.value;
				alert("변경사항이 저장되지 않습니다.\n그래도 괜찮으시겠습니까?");
				frm.action = "review_board_list.jsp?p_no="+<%=p_no%>;
				frm.method="POST";
				frm.submit();
	   
	        	
	        }
			
			
		</script>	
	</head>
	
	<body>
		<jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    	<jsp:include page="/include/top_header_include.jsp"></jsp:include>
    	<br>
		<!--게시글 작성을 위한 영역 -->
		<section class="py-5 container px-4 px-lg-5 mt-5">
			<form id="review_write" method="post" action="review_modify_action.jsp">
				<!-- 작성자, 제목 -->
					<div class="input-group mb-1">
						<div class="input-group-prepend ">
							<span class="input-group-text" id="basic-addon1">Writer</span>
						</div>
						<span  class="form-control" id="basic-addon2" > <%=review.getRv_writer()%> </span>
						<input type="hidden" name="writer" value="<%=review.getRv_writer()%>">
					</div>
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">Title</span>
						</div>
						<input type="text" class="form-control" id="title" name="title" value = "<%=review.getRv_title()%>"> 
					</div>
					<div class="input-group mb-4">
						
							<select id="grade" name="grade"> 
						<%
							if(review.getRv_grade()==1.0){%>
								<option value="1.0">⭐</option>
						<%	}
						%>
						<%
							if(review.getRv_grade()==2.0){%>
								<option value="2.0">⭐⭐</option>
						<%	}
						%>
						<%
							if(review.getRv_grade()==3.0){%>
								<option value="3.0">⭐⭐⭐</option>
						<%	}
						%>
						<%
							if(review.getRv_grade()==4.0){%>
								<option value="4.0">⭐⭐⭐⭐</option>
						<%	}
						%>
						<%
							if(review.getRv_grade()==5.0){%>
								<option value="5.0">⭐⭐⭐⭐⭐</option>
						<%	}
						%>
							<option value="5.0">⭐⭐⭐⭐⭐</option> 
							<option value="4.0">⭐⭐⭐⭐</option> 
							<option value="3.0">⭐⭐⭐</option> 
							<option value="2.0">⭐⭐</option> 
							<option value="1.0">⭐</option> 
							</select> 
							
					</div>
					<div class="input-group mb-3">
					<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon4">Content</span>
						</div>
						<tr>
							<td width=1000 hight=1000 bgcolor="ffffff" align="left">
								<textarea  type="text" class="form-control" style="width: 1500px" rows = 14 id="content" name="content"><%=review.getRv_content()%></textarea>
							</td>
						</tr>	
					</div>
					
					<input type="hidden" name="p_no" value="<%=p_no%>">
					<input type="hidden" name="rv_no" value="<%=review.getRv_no()%>">
				</form>
				
			
				<div class="button text-center" >
					<!-- 게시글 Submit -->
					<button id="subBtn" type="button" class="btn btn-primary" onclick="upDate()" />수정</button>
					<button id="backBtn" type="button" class="btn btn-primary" onclick="check()" />돌아가기</button>
				</div>
			
			
			
		
		</section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>