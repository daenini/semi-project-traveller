<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.traveller.reservation.ReservationItem"%>
<%@page import="com.itwill.traveller.reservation.Reservation"%>
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
	String no = request.getParameter("r_no");
	if (no == null || no.equals("")) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	ReservationService reservationService = new ReservationService();
	Reservation reservation = reservationService.view(sUserId, Integer.parseInt(no));
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상세예약내역</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
    <jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
        <!-- Section-->
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5 container px-4 px-lg-5 mt-5">
        	<h1 class="text-start fw-bolder">상세예약내역</h1>
        	<br>
        	<table class = "table table-striped" style="text-align: center;">
        		<tr class = "active">
					<td>예약번호</td>
					<td>예약날짜</td>
					<td>결제방법</td>
					<td>예약자</td>
					<td></td>
        		</tr>
        		<tr>
        			<td><%= reservation.getR_no() %></td>
        			<td><%= reservation.getR_date() %></td>
        			<td><%= reservation.getR_method() %></td>
        			<td><%= reservation.getM_id() %></td>
        		</tr>
        	</table>
        	<br/>
			<table class="table align-middle">
				<thead>
					<tr>
					  <!-- 사진 -->
					  <th scope="col" style="text-align:center !important;"></th> 
					  <th scope="col" style="text-align:center !important;">상품명</th>
					  <th scope="col" style="text-align:center !important;">인 원</th>
					  <th scope="col" style="text-align:center !important;">가 격</th>
					  <th scope="col" style="text-align:center !important;">출발일</th>
					  <th scope="col" style="text-align:center !important;">여행 지역</th>
					</tr>
				</thead>
				<tbody>
					<%
						int totPrice = 0;
						for(ReservationItem item:reservation.getReservationItemList()){
							totPrice += item.getProduct().getP_price() * item.getRi_qty();
					%>
					
						<tr>
							<td class="text-center my-auto py-2" style="width: 215px;"><a href="p_detail.jsp?p_no=<%=item.getProduct().getP_no()%>"><img src="<%=item.getProduct().getP_image_path()%>" style="height: 200px; width: 200px"></a></td>
							<td class="text-center my-auto py-2"><%= item.getProduct().getP_name() %></td>
							<td class="text-center my-auto py-2"><%= item.getRi_qty() %></td>
							<td class="text-center my-auto py-2"><%= new DecimalFormat("#,##0").format(totPrice) %></td>
							<td class="text-center my-auto py-2"><%= item.getProduct().getP_date() %></td>
							<td class="text-center my-auto py-2"><%= item.getProduct().getP_category() %></td>
						</tr>
					<%} %>
				</tbody>
			</table>
			
			<div align="center">
				<a href = "r_view.jsp" class = "btn btn-secondary justify-content-center">주문목록</a>
				<a href = "p_list.jsp" class = "btn btn-secondary justify-content-center">상품보기</a>
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