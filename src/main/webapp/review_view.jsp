<%@page import="com.itwill.traveller.product.ProductService"%>
<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="com.itwill.traveller.review.Review"%>
<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	

	String sP_no = null;
	String sRv_no = null;
	ReviewService reviewService = new ReviewService();
	Review review = new Review();
	Product product = new Product();
	ProductService productService = new ProductService();
	sRv_no = request.getParameter("rv_no");
	sP_no = request.getParameter("p_no");
	
	
	if(sP_no==null){
		out.println("<script>");
		out.println("alert('선택 된 상품이 없습니다.');");
		out.println("location.href='p_list.jsp'");
		out.println("</script>");
		return;
	}
	int rv_no = Integer.parseInt(sRv_no);
	int p_no = Integer.parseInt(sP_no);
	product = productService.getProduct(p_no);
	reviewService.updateReadCount(rv_no);
	review = reviewService.findReview(rv_no);
	
	if(review == null){
		out.println("<script>");
		out.println("alert('게시글이 존재하지 않거나 삭제되었습니다.');");
		out.println("location.href='review_board_list.jsp?p_no="+p_no+"'");
		out.println("</script>");
		return;
	}
	double grade = review.getRv_grade();

	
		
	
	
    
   
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상품 리뷰 보기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
	        section > div > div:nth-child(odd) {
			    width: 35% !important;
			}
        </style>
        <script>
        function modify() {
        	var form = document.getElementById("review_form");
        	var title = form.title.value;
        	var content = form.content.value;
        	var grade = form.grade.value;
        	var p_no = form.p_no.value;
        	var rv_no = form.rv_no.value;
        	form.method='POST';
        	form.action = "review_modify.jsp";
        	form.submit();
        	
        }
        
        function check(){
			frm = document.getElementById("review_form")
			var p_no = frm.p_no.value;
			var writer = frm.rv_no.value;
			alert("게시글을 삭제하시겠습니까?");
			frm.action = "review_delete_action.jsp";
			frm.method="POST";
			frm.submit();       	
        }
        
        function reply(){
			f = document.getElementById("review_form")
			var rv_no = f.rv_no.value;
			var p_no = f.p_no.value;
			var writer = f.writer.value;
			f.action = "review_reply_form.jsp?p_no="+<%=p_no %>;
			f.method="POST";
			f.submit();       	
        }
        
        function reply_modify() {
        	var ff = document.getElementById("review_form");
        	var title = ff.title.value;
        	var content = ff.content.value;
        	var grade = ff.grade.value;
        	var p_no = ff.p_no.value;
        	var rv_no = ff.rv_no.value;
        	ff.method='POST';
        	ff.action = "review_reply_modify.jsp";
        	ff.submit();
        	
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
        <form id="review_form">
        	<table class="table">
        		<tr>
        			<th><input type="hidden" name="p_no" value="<%=review.getP_no()%>"></th>
        			<th><input type="hidden" name="rv_no" value="<%= review.getRv_no() %>"></th>
        			<th><input type="hidden" name="title" value="<%= review.getRv_title() %>"></th>
        			<th><input type="hidden" name="grade" value="<%=grade %>"></th>
        			<th><input type="hidden" name="content" value="<%= review.getRv_content() %>"></th>
        			<th><input type="hidden" name="writer" value="<%= review.getRv_writer() %>"></th>
        		</tr>
        		<tr>
        		<% 
        		
        		for(int i=0;i<grade;i++){
        			%>
        			<%="⭐"%> <%
        		}%>
        			
        		</tr>
        		<tr>
        			<th>Title</th>
        			<th><span style="color: blue; font-size: 20px"><%= review.getRv_title() %></span></th>
        		</tr>
        		
        		<tr>
        			<th>Product</th>
        			<th><span style="font-size: 15px"><%=product.getP_name()%></span></th>
        		</tr>
        		
        		
        		
        		<tr>
        			<th>ReadCount</th>
        			<th><span style="font-size: 15px"><%=review.getRv_readcount()%></span></th>
        		</tr>
        		
        		<tr>
        			<th>Writer</th>
        			<th><span style="font-size: 15px"><%= review.getRv_writer() %></span></th>
        		</tr>
        		
        		<tr>
        			<th>Content</th>
        			<th><span style=" font-size: 15px"><%= review.getRv_content() %></span></th>
        		</tr>
        		
        	</table>
        </form>
        </div>

				
        
        <br/><br/>
        <div align="center">
        
		<%
		String sUserId = (String)session.getAttribute("sUserId");
		
			if(sUserId.equals("admin") ){
			 if(!(sUserId.equals(review.getRv_writer()))){%>
				<button type="button" id="list" class="btn btn-primary" onclick = "location.href = 'review_board_list.jsp?p_no=<%=p_no%>'">목록</button>
				<button type="button" id="reply" class="btn btn-primary" onclick = "reply()">답글달기</button>
				<button type="button" id="delete" class="btn btn-primary" onclick = "check()">삭제</button>
				<%}		
			 if(sUserId.equals(review.getRv_writer())){%>
				 <button type="button" id="list" class="btn btn-primary" onclick = "location.href = 'review_board_list.jsp?p_no=<%=p_no%>'">목록</button>
				<button type="button" id="reply_modify" class="btn btn-primary" onclick = "reply_modify()">리뷰수정</button>
				<button type="button" id="delete" class="btn btn-primary" onclick = "check()">삭제</button>
			<% }
							
	}
		
			else if(sUserId == null || !(sUserId.equals(review.getRv_writer()))){
		%>
			<button type="button" id="list" class="btn btn-primary" onclick = "location.href = 'review_board_list.jsp?p_no=<%=p_no%>'">목록</button>
 		<%		
			} 
			else if(sUserId.equals(review.getRv_writer())) {
		%>	
			<button type="button" id="list" class="btn btn-primary" onclick = "location.href = 'review_board_list.jsp?p_no=<%=p_no%>'">목록</button>
			<button type="button" id="modify" class="btn btn-primary" onclick = "modify()">수정</button>
			<button type="button" id="delete" class="btn btn-primary" onclick = "check()">삭제</button>
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