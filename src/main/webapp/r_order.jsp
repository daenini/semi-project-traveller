<%@page import="java.text.DecimalFormat"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.cart.Cart"%>
<%@page import="com.itwill.traveller.product.ProductService"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@page import="com.itwill.traveller.cart.CartService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="com.itwill.traveller.reservation.ReservationItem"%>
<%@page import="com.itwill.traveller.reservation.ReservationDao"%>
<%@page import="com.itwill.traveller.reservation.ReservationService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sUserId = (String)session.getAttribute("sUserId");
	if(sUserId == null){
		response.sendRedirect("member_login_form.jsp");
		return;
	}
%>
<%
	String buyType = request.getParameter("buyType");    //p_detail(direct주문) or cart_view(select주문)
	String p_no = request.getParameter("p_no");          //p_detail form
	String p_qty = request.getParameter("p_qty");		 //p_detail form
	String[] cart_no_array = request.getParameterValues("cart_item_no");  //cart_view form
	
	if(buyType==null)buyType="";
	if(p_no==null)p_no="";
	if(p_qty==null)p_qty="";
	if(cart_no_array==null)cart_no_array=new String[]{};
	
	ReservationService reservationService = new ReservationService();
	CartService cartService = new CartService();
	MemberService memberService  = new MemberService();
	ProductService productService = new ProductService();

	ArrayList<Cart> cartList = new ArrayList<Cart>();
	Member member = memberService.selectById(sUserId);
			
	if (buyType.equals("cart_select")) {
		for(String cart_no : cart_no_array){
			cartList.add(cartService.getProductByCno(Integer.parseInt(cart_no)));
		}
	} else if (buyType.equals("direct")) {
		Product product = productService.getProduct(Integer.parseInt(p_no));
		cartList.add(new Cart(0, Integer.parseInt(p_qty), product, member));
		
	}
%>	
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>예약하기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script>
        	function set_method() {
        		var checkedMethod = document.querySelector("input[name='method']:checked").value;
        		document.getElementById('method').value = checkedMethod;
			}
        </script>
    </head>
    <body>
    <jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
        <!-- Section-->
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5 container px-4 px-lg-5 mt-5">
        	<h1 class="text-center fw-bolder">예약하기</h1>
        	<br>
			<div class="row row-cols-5 row-cols-md-5 cols-xl-2 justify-content-center">
	                <div class="col my-auto">
		            	<h3 class="my-auto py-2 text-center fw-bolder text-start">상품</h3><hr/>
	            	</div>
					<div class="col my-auto" >
		            	<h3 class="my-auto py-2 text-center fw-bolder text-start">출발일</h3><hr/>
	            	</div>
					<div class="col my-auto" >
		            	<h3 class="my-auto py-2 text-center fw-bolder text-start">인원</h3><hr/>
	            	</div>
					<div class="col my-auto" >
		            	<h3 class="my-auto py-2 text-center fw-bolder text-start">금액</h3><hr/>
	            	</div>
	            	<div class="col my-auto" >
		            	<h3 class="my-auto py-2 text-center fw-bolder text-start">수량</h3><hr/>
	            	</div>
	            	<% int totPrice = 0;
	            	for(Cart cart:cartList) { 
	            		totPrice += cart.getC_qty()*cart.getProduct().getP_price();	
	            	%>
			            <div class="col my-auto">
			            	<p class="my-2 py-2 text-center"><%= cart.getProduct().getP_name()%></p>
						</div>
			            <div class="col my-auto">
			            	<p class="my-2 py-2 text-center"><%= cart.getProduct().getP_date()%></p>
						</div>
			            <div class="col my-auto">
			            	<p class="my-2 py-2 text-center"><%= cart.getC_qty()%>명</p>
						</div>
						<div class="col my-auto">
			            	<p class="my-2 py-2 text-center"><%= new DecimalFormat("#,##0").format(cart.getProduct().getP_price())%></p>
						</div>
			            <div class="col my-auto">
			            	<p class="my-2 py-2 text-center"><%= cart.getC_qty()%></p>
						</div>
					<%} %>
					<div class="col my-auto text-center" style="width: 100% !important">
						<br>
						<h3>총 금액 : <%= new DecimalFormat("#,##0").format(totPrice) %>원</h3>
						<div class="col my-auto">
			            	<div class="my-auto py-2" onchange="set_method()">
								<input class="form-check-input" type="radio" name="method" id="card" value="카드결제" checked>
								<label class="form-check-label" for="card">
									카드결제
								</label>
								<input class="form-check-input" type="radio" name="method" id="deposit" value="무통장입금">
								<label class="form-check-label" for="deposit">
									무통장입금
								</label>
							</div>
						</div>
					</div>
					<div class="col my-auto text-center" style="width: 100% !important">
						<br>
						<form method="post" action="r_order_action.jsp">
							<input type="hidden" name="p_qty" value="<%= p_qty%>">
							<input type="hidden" name="buyType" value="<%= buyType%>">
							<input type="hidden" name="p_no" value="<%=p_no%>">
							<input type="hidden" id="method" name="method" value="카드결제">
							<%for(String c_no:cart_no_array){ %>
								<input type="hidden" id="c_item_no" name="c_item_no" value="<%= c_no%>">
							<%} %>
							<button type="submit" class="btn btn-secondary justify-content-center" style="max-width: 100px !important;" onclick="goOrder(this.form)">결제하기</button>
						</form>
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