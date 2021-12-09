<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.traveller.reservation.Reservation"%>
<%@page import="java.util.ArrayList"%>
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
/*
	if(request.getMethod().equalsIgnoreCase("GET")){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다.');");
		out.println("location.href='index.jsp'");
		out.println("</script>");	
		return;
	}
*/
	ReservationService reservationService = new ReservationService();
	ArrayList<Reservation> viewList = reservationService.viewAll(sUserId);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>예약내역</title>
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
        	<h1 class="text-start fw-bolder">예약내역</h1>
        	<br>
			<table class="table align-middle">
				<thead>
					<tr>
					  <th scope="col" style="text-align:center !important;">예약번호</th>
					  <th scope="col" style="text-align:center !important;">상품정보</th>
					  <th scope="col" style="text-align:center !important;">금액</th>
					  <th scope="col" style="text-align:center !important;">예약일</th>
					</tr>
				</thead>
				<tbody>
					<%for(Reservation reservation:viewList){ %>
						<tr>
							<td class="text-center my-auto py-2"><%= reservation.getR_no()%></td>
							<td class="text-center my-auto py-2"><a href="r_view_detail.jsp?r_no=<%=reservation.getR_no()%>"><%= reservation.getR_desc()%></a></td>
							<td class="text-center my-auto py-2"><%= new DecimalFormat("#,##0").format(reservation.getR_price())+"원"%></td>
							<td class="text-center my-auto py-2"><%= reservation.getR_date()%></td>
						</tr>
					<%} %>
				</tbody>
			</table>
		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
        </section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>