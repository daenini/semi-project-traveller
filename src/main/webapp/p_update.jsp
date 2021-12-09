<%@page import="com.itwill.traveller.product.Product"%>
<%@page import="com.itwill.traveller.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Product product = new Product();

ProductService productService = new ProductService();

String fP_no = request.getParameter("p_no");

Product findProduct = productService.getProduct(Integer.parseInt(fP_no));

%>
<!DOCTYPE html>
<html lang="kr">
<%
String sUserId = (String)session.getAttribute("sUserId");

if(sUserId == null || !sUserId.equals("admin")){
	out.println("<script>");
	out.println("alert('관리자만 접근 가능합니다.')");
	out.println("location.href='p_list.jsp'");
	out.println("</script>");
	return;
}

%>
<head>
<script>
function update_product() {
	if (document.pf.p_name.value == "") {
		alert("상품명을 입력하세요.");
		document.pf.guest_name.focus();
		return false;
	}
	if (document.pf.p_price.value == "") {
		alert("상품 가격을 입력하세요.");
		document.pf.p_price.focus();
		return false;
	}
	if (document.pf.p_qty.value == "") {
		alert("가능인원을 입력하세요.");
		document.pf.p_qty.focus();
		return false;
	}

	if (document.pf.p_category.value == "" || document.pf.p_category.value == "지역 선택") {
		alert("상품지역을 선택하세요.");
		document.pf.p_category.focus();
		return false;
	}
	if (document.pf.p_image.value == "") {
		alert("이미지를 등록 해주세요.");
		document.pf.p_image.focus();
		return false;
	}
	if (document.pf.p_detail.value == "") {
		alert("상품 설명을 입력해주세요.");
		document.pf.p_detail.focus();
		return false;
	}
	document.pf.action = "p_update_action.jsp";
	document.pf.method='POST';
	document.pf.submit();
}

function p_list() {
	window.location.href='p_list.jsp';
}
</script>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>상품 수정</title>
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
		<div> <!-- content -->
			<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>상품 수정</b></td>
								</tr>
							</table>
			<form id="pf" name="pf" method="post" enctype="multipart/form-data">
				<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
					<tr>
	        			<th><input type="hidden" name="p_no" value="<%= findProduct.getP_no() %>"></th>
	        		</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="33">상품명</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 300" name="p_name" value="<%=findProduct.getP_name() %>"></td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="33">상품 가격</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 300" name="p_price" value="<%=findProduct.getP_price()%>"></td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="33">가능 인원</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="text"
											style="width: 35px" name="p_qty" value="<%=findProduct.getP_qty()%>"></td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="33">상품 지역</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px">
										<select name="p_category">
										    <option value="">지역 선택</option>
										    <option value="서울">서울</option>
										    <option value="경기">경기도</option>
										    <option value="충청도">충청도</option>
										    <option value="강원도">강원도</option>
										    <option value="전라도">전라도</option>
										    <option value="경상도">경상도</option>
										    <option value="제주도">제주도</option>
										</select>
										</td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="33">상품 이미지</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><input type="file"
											style="width: 400px" name="p_image">
										</td>
					</tr>
					<tr>
						<td width=100 align=center bgcolor="E6ECDE" height="33">상품 설명</td>
										<td width=490 align="left" bgcolor="ffffff"
											style="padding-left: 10px"><textarea wrap="soft"
												style="width: 400px" rows="10" name="p_detail"><%=findProduct.getP_detail() %></textarea>
										</td>
					</tr>
				</table>
			</form>
				<table width=590 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td align=center><input type="button" value="상품수정"
							onClick="update_product();"> &nbsp; <input type="button"
							value="상품목록" onClick="p_list();">
						</td>
					</tr>
				</table>
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