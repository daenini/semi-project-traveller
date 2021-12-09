<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.traveller.cart.Cart"%>
<%@page import="com.itwill.traveller.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sUserId = (String)session.getAttribute("sUserId");
%>
<%
	CartService cartService = new CartService();
	ArrayList<Cart> cartList = cartService.selectById(sUserId);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>장바구니</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
<%
	if(sUserId == null){
		out.println("<script>");
		out.println("alert('로그인 후 이용가능한 서비스입니다.');");
		out.println("location.href='member_login_form.jsp'");
		out.println("</script>");
	}
%>
    </head>
    <body onload = "cart_item_select_count();">
    <jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
        <!-- Section-->
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5 container px-4 px-lg-5 mt-5">
        <form name = "cart_view_form">
        	<input type = "hidden" name = "buyType">
        </form>
        
        <div class = "col-lg-12">
        	<div class = "jumbotron">
        		<h3 style="text-align: center">내 장바구니</h3>
        		<div id = "f">
        			<table class = "table table-bordered">
        				<tr>
        					<td style="text-align: center; vertical-align: middle;">선택<br/>
        					<input type = "checkbox" id = "all_select_checkbox" checked="checked" onchange="cart_item_all_select(event); cart_item_select_count();"></td>
        					<td style="text-align: center; vertical-align: middle;">이미지</td>
        					<td style="text-align: center; vertical-align: middle;">상품명</td>
        					<td style="text-align: center; vertical-align: middle;">수 량</td>
        					<td style="text-align: center; vertical-align: middle;">합 계</td>
        					<td style="text-align: center; vertical-align: middle;"></td>
        				</tr>
        			<!-- 회원 1명 장바구니 상품 시작 -->
        			<%
						int totPrice = 0;
						for(Cart cart : cartList) {
						totPrice += cart.getProduct().getP_price() * cart.getC_qty();
					%>
						<tr height="100px" style="text-align: center;" class = "active">
							<td style="text-align: center; vertical-align: middle;">
								<input type="checkbox" name="cart_item_no_check" onchange="cart_item_all_select_checkbox_deselect(); cart_item_select_count();" checked="checked" value = "<%= cart.getC_no()%>">
							</td>
							<td>
								<img src = "<%= cart.getProduct().getP_image_path() %>" width="150" height="80">
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<a href = "p_detail.jsp?p_no=<%= cart.getProduct().getP_no() %>"><%= cart.getProduct().getP_name() %></a>
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<form action="cart_update_item_action.jsp" method = "post" id = "cart_update_form_<%= cart.getC_no() %>">
									<input type = "hidden" name = "cart_no" value = "<%= cart.getC_no() %>">
									<input type = "button" value = "-" onclick="changeNumber('-', 'cart_update_form_<%= cart.getC_no() %>');">
									<input type = "text" readonly="readonly" size = "2" name = "cart_qty" value = "<%= cart.getC_qty() %>" style="text-align: center;">
									<input type = "button" value = "+" onclick="changeNumber('+', 'cart_update_form_<%= cart.getC_no() %>');">
								</form>
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<%= new DecimalFormat("#,##0").format(cart.getProduct().getP_price() * cart.getC_qty()) %>
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<form id = "cart_delete_item_form_<%= cart.getC_no() %>">
									<input type = "hidden" name = "cart_no" value = "<%= cart.getC_no() %>">
									<a href = "javascript:cart_delete_item_action('cart_delete_item_form_<%= cart.getC_no() %>');">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 28 28" class="icon--close">
										<g fill="none" fill-rule="evenodd"> <path d="M0 0H28V28H0z"></path>
										<g fill="#9B9BA0" transform="translate(6 6)" class="icon--close__group">
										<rect width="2" height="18" x="7" y="-1" rx="1" transform="rotate(-135 8 8)"></rect> <rect width="2" height="18" x="7" y="-1" rx="1"
										transform="rotate(-45 8 8)"></rect> </g> </g> </svg>
									</a>
								</form>
							</td>
							
						</tr>
					<%
						}
					%>
					<!-- 회원 1명 장바구니 상품 목록 끝 -->
        			</table>
        			<br/>
        			
					<div align="right">장바구니 상품 총 합계 : <mark style="color: black; font-weight: bold;"><%= new DecimalFormat("#,##0").format(totPrice) %>원</mark></div>
					<br/>
        			<div align="center">
        				<a href = "p_list.jsp" class = "btn btn-secondary justify-content-center">쇼핑 계속하기</a>
        				<% if(cartList.size() >= 1) { %>
        					&nbsp; &nbsp; <a href = "javascript:cart_view_form_select_submit();" class = "btn btn-secondary justify-content-center">
        						총 <span id = "cart_item_select_count"></span>개 주문하기
        					</a>
        					&nbsp; &nbsp; <a href = "javascript:cart_delete();" class = "btn btn-secondary justify-content-center">장바구니 비우기</a>
        				<% } %>
        			</div>
        		</div>
        	</div>
        </div>
		
		
		
		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
        </section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="js/cart.js"></script>
    </body>
</html>