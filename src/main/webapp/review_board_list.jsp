<%@page import="com.itwill.traveller.review.ReviewService"%>
<%@page import="com.itwill.traveller.review.Review"%>
<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ReviewService reviewService = new ReviewService();
	
	int count = 0; // 레코드 수
	
	String sP_no = request.getParameter("p_no");
	if(sP_no==null){
		out.println("<script>");
		out.println("alert('상품을 선택해주세요.');");
		out.println("location.href='p_list.jsp'");
		out.println("</script>");
		return;
	}
	int p_no = Integer.parseInt(sP_no);
	count = reviewService.getCount(p_no);
	
	int pageSize = 5; // 한 페이지에 출력할 레코드 수
	
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = count - ((pageSize * currentPage) - 1);
	int endRow = count - (pageSize * (currentPage - 1));
	int paging = ((currentPage - 1) * pageSize);

	ArrayList<Review> reviewList = new ArrayList<Review>();
	if (count > 0) {
		reviewList = reviewService.selectPage(paging, p_no);
		
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<title>리뷰 게시판</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<section class="py-5 container px-4 px-lg-5 mt-5">
			<table class="table table-striped"><!-- 레코드 테이블 -->
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Review review : reviewList) {
					%>
					<tr>
						<td><%=review.getRv_no()%></td>
						<td><a href='review_view.jsp?rv_no=<%=review.getRv_no()%>&p_no=<%=review.getP_no()%>'><%=review.getRv_title()%></a></td>
						<td><%=review.getRv_writer()%></td>
						<td><%=review.getRv_date()%></td>
						<td><%=review.getRv_readcount()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination" style="justify-content: center;"><!-- 페이징 -->
					<%
					if(count > 0){
						int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
						// 한 페이지에 보여줄 페이지 블럭(링크) 수
						int pageBlock = 3;
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount){
							endPage = pageCount;
						}
						
						if(startPage > pageBlock){
						%>
							<li class="page-item"><a class="page-link" href="?p_no=<%=p_no%>&pageNum=<%=1%>"> << </a></li>
							<li class="page-item"><a class="page-link" href="?p_no=<%=p_no%>&pageNum=<%=startPage - pageBlock%>"> < </a></li>
						<%	
						}
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
							%>
								<li class="page-item active"><a class="page-link" href="?p_no=<%=p_no%>&pageNum=<%=i%>"><%=i %></a></li>
							<%									
							}else{ // 현재 페이지가 아닌 경우 링크 설정
							%>
								<li class="page-item"><a class="page-link" href="?p_no=<%=p_no%>&pageNum=<%=i%>"><%=i %></a></li>
							<%	
							}
						}
						if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
						%>
							<li class="page-item"><a class="page-link" href="?p_no=<%=p_no%>&pageNum=<%=startPage + pageBlock%>"> > </a></li>
							<li class="page-item"><a class="page-link" href="?p_no=<%=p_no%>&pageNum=<%=pageCount%>"> >> </a></li>
						<%
						}
					}
					%>
				</ul><br>
				<%
				String sUserId = (String)session.getAttribute("sUserId");
				if(sUserId==null || !(sUserId.equals("admin"))){%>

					<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='p_detail.jsp?p_no=<%=p_no %>'" />상품상세</button>
					<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='review_write_form.jsp?p_no=<%=p_no %>'" />리뷰작성</button>
					<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='f_write.jsp'" />문의하기</button>
				<%}%>
				
			</div>
		</section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>