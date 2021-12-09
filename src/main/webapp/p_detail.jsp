<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@page import="com.itwill.traveller.review.Review"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.traveller.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String pStr = request.getParameter("p_no");

if (pStr == null || pStr =="") {
	response.sendRedirect("p_list.jsp");
	return;
}

ProductService productService = new ProductService();
Product findProduct = productService.getProduct(Integer.parseInt(pStr));
ReviewService reviewService = new ReviewService();


%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title><%=findProduct.getP_name()%></title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<script type="text/javascript">
	function p_delete() {
		var form = document.getElementById("p_form");
		if(confirm("정말로 삭제하시겠습니까 ?")){
			form.action = "p_delete_action.jsp";
			form.method = "POST";
			form.submit();
		}
	}
	function p_update() {
		var form = document.getElementById("p_form");
		if(confirm("상품을 수정하시겠습니까 ?")){
			form.action = "p_update.jsp";
			form.method = "POST";
			form.submit();
		}
	}
	
	function r_order_form() {
		document.product_detail_form.p_qty.value = document.getElementById("form").c_qty.value;
		document.product_detail_form.method = "POST";
		document.product_detail_form.action = "r_order.jsp";
		document.product_detail_form.submit();
	}
</script>
</head>
<body>
	<jsp:include page="/include/top_nav_include.jsp"></jsp:include>
	<jsp:include page="/include/top_header_include.jsp"></jsp:include>
	<!-- Section-->
	<!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
	<section class="py-5 container px-4 px-lg-5 mt-5">
	<form name = "product_detail_form">
		<input type="hidden" name = "p_no" value="<%= findProduct.getP_no() %>">
		<input type="hidden" name = "p_qty" value="1">
		<input type="hidden" name = "buyType" value = "direct">
	</form>

		<div style="display: flex;">
			<div width=40% height=200 align=center style="float: left; padding-right: 100px"><img border=0
				src='<%=findProduct.getP_image_path()%>' width=500 height=500>
			</div>
			<div width=30% height=200 align=center class=t1 style="float: right ; padding-left: 100px">
				<div width=30% height=200 class=t1 style="float: right; padding-bottom: 30px" >
					<ol type="disc">
						<h5 style="padding-bottom: 10px"><b>상품 이름 : <%=findProduct.getP_name()%>&nbsp;&nbsp;&nbsp;</b></li>
						<h5 style="padding-bottom: 10px">가격 : <%=new DecimalFormat("#,##0").format(findProduct.getP_price())%> 원&nbsp;&nbsp;&nbsp;</li>
						<h5 style="padding-bottom: 10px">
        				<% 
        					double p_grade = reviewService.getProductGrade(findProduct.getP_no());
        					for(int i=0;i<p_grade;i++){
        						%>
        								<%="⭐"%> <%
        						}%> </li>
						<h5 style="padding-bottom: 10px"><%=findProduct.getP_detail()%></li>
					</ol>
				</div>
				
				<%
				String sUserId = (String)session.getAttribute("sUserId");
				if(sUserId == null || !(sUserId.equals("admin"))){
				%>
				<form method="post" action="cart_insert_action.jsp" id = "form">
					수량 : <input type='text' name='c_qty' value=1 size=4 class=TXTFLD>
					개 <br /> <br /> 
					<input type='hidden' name='p_no' value="<%=findProduct.getP_no()%>">
					<input type='submit' class="btn btn-primary" value=장바구니에담기 class=TXTFLD />
					<input type='button' class="btn btn-primary" value=상품주문하기 onclick="r_order_form();">	
					<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='review_board_list.jsp?p_no=<%=findProduct.getP_no() %>'" />리뷰</button>
				</form>
				
				<%
				}else{
				%>
				<form id="p_form">
				<tr>
        			<th><input type="hidden" name="p_no" value="<%= findProduct.getP_no() %>"></th>
        		</tr>
        		<button id="subBtn" type="button" class="btn btn-primary" onclick="p_update();" />상품수정</button>
				<button id="subBtn" type="button" class="btn btn-primary" onclick="p_delete();"  />상품삭제</button>
				<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='review_board_list.jsp?p_no=<%=findProduct.getP_no() %>'"  />리뷰 관리</button>
				</form>
				<%
				}
				%>
				
				</div>
				
				
			</div>
		</div>

		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
	</section>
	<jsp:include page="/include/footer_include.jsp"></jsp:include>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>