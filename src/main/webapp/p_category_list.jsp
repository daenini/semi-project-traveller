<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@page import="java.util.Collections"%>
<%@page import="java.awt.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="com.itwill.traveller.product.ProductDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.traveller.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String category = request.getParameter("p_category");

if (category == null || category =="") {
	response.sendRedirect("p_list.jsp");
	return;
}

ProductService productService = new ProductService();
ArrayList<Product> ProductList = productService.getCategoryProduct(category);
ReviewService reviewService = new ReviewService();
int count = 0;
count = Collections.frequency(ProductList,category); // Collections.frequency() -> list에서 특정 값 개수 세는 메소드

int pageSize = 10; // 한 페이지에 출력 할 레코드 수

// 페이지 링크를 클릭한 번호 / 현재 페이지
String pageNum = request.getParameter("pageNum");
if(pageNum == null){ //클릭한게 페이지가 없으면 1번 페이지를
	pageNum = "1";
}
// 연산을 하기 위한 pageNum Int로 형변환
int currentPage = Integer.parseInt(pageNum);
/*
 해당 페이지에서 시작 / 끝
 startRow(첫번째 게시물) = (currentPage(현재 페이지) - 1 ) * pageSize(한 페이지 게시물 수) + 1
*/
int startRow = (currentPage -1)* pageSize+1;
int endRow = currentPage * pageSize;

ArrayList<Product> productList = new ArrayList<Product>();
if(count > 0) {
	productList = productService.getList(startRow, endRow);
}
%>
<!DOCTYPE html>
<html lang="kr">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title><%=category %> 패키지 상품</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script type="text/javascript">
    	function cart_insert_action(formId) {
			var form = document.getElementById(formId);
			form.action = "cart_insert_action.jsp";
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
        <span style="color:maroon; padding-left: 50px; font-size: 20px;"><strong>해당 상품의 이미지를 클릭하시면 상세보기로 넘어갑니다.</strong></span>
			<div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <%
			for (Product product : ProductList) {
		%>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <a href = "p_detail.jsp?p_no=<%= product.getP_no() %>"><img class="card-img-top" src="<%=product.getP_image_path()%>" alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <% 
                                   		double p_grade = reviewService.getProductGrade(product.getP_no());
        								for(int i=0;i<p_grade;i++){
        									%>
        										<%="⭐"%> <%
        									}%> </li>
                                    <h5 class="fw-bolder"><%=product.getP_name()%></h5>
                                    <!-- Product price-->
                                    <h6><%=new DecimalFormat("#,##0").format(product.getP_price())%>원</h6>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
								<form id = "cart_form_<%= product.getP_no() %>">
								<input type = "hidden" name = "c_qty" value = "1" size = "4">
								<input type = "hidden" name = "p_no" value = "<%= product.getP_no() %>">
								<button type = "button" class = "btn btn-outline-dark mt-auto" onclick="cart_insert_action('cart_form_<%= product.getP_no() %>');">장바구니 담기</button>
								</form>
                                </div>
                            </div>
                        </div>
                    </div>
		<%
        		}
		%> 
				</div>
			</div>

		<div class="text-center">
				<ul class="pagination" style="justify-content: center;"><!-- 페이징 -->
					<%
					if(count > 0){
						int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
						// 한 페이지에 보여줄 페이지 블럭(링크) 수
						int pageBlock = 5;
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount){
							endPage = pageCount;
						}
						
						if(startPage > pageBlock){
						%>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=1%>"> << </a></li>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=startPage - pageBlock%>"> < </a></li>
						<%	
						}
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
							%>
								<li class="page-item active"><a class="page-link" href="?pageNum=<%=i%>"><%=i %></a></li>
							<%									
							}else{ // 현재 페이지가 아닌 경우 링크 설정
							%>
								<li class="page-item"><a class="page-link" href="?pageNum=<%=i%>"><%=i %></a></li>
							<%	
							}
						}
						if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
						%>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=startPage + pageBlock%>"> > </a></li>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=pageCount%>"> >> </a></li>
						<%
						}
					}
					%>
				</ul><br>
				<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='p_list.jsp'" />전체보기</button>
				<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='f_board_list.jsp'" />문의하기</button>
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
