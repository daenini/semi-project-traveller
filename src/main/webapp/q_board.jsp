<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.qna.QnaDao"%>
<%@page import="com.itwill.traveller.qna.Qna"%>
<%@page import="com.itwill.traveller.qna.QnaService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String search = request.getParameter("search");
	String category = request.getParameter("category");

	QnaService qnaService = new QnaService();
	
	int count = 0; // 레코드 수
	count = qnaService.getCount(search, category);
	
	ArrayList<String> categoryList = new ArrayList<String>();

	int pageSize = 10; // 한 페이지에 출력할 레코드 수
	
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null){
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);

	// 해당 페이지에서 시작할 레코드 / 마지막 레코드
	int startRow = count - ((pageSize * currentPage) - 1);
	int endRow = count - (pageSize * (currentPage - 1));
	int paging = ((currentPage - 1) * pageSize);

	ArrayList<Qna> qnaList = new ArrayList<Qna>();
	if (count > 0) {
		qnaList = qnaService.selectPage(paging);
	}
	
	if(!(search==null || search.equals(""))){
		qnaList = qnaService.selectPageSearch(search, startRow, endRow);
	}
	
	if(!(category==null || category.equals(""))){
		qnaList = qnaService.selectPageCategory(category, startRow, endRow);
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<title>QNA 게시판</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
		<script>
			function goWrite() {
				location.href='q_write.jsp';
			}
			
			function goSearch(frm) {
				var search = frm.search.value;
				location.href='q_board.jsp?search='+search
			}
			
			function goCategory() {
				var category = document.getElementById("category").value;
				location.href='q_board.jsp?category='+category;
			}
		</script>
	</head>
	
	<body>
		<jsp:include page="/include/top_nav_include.jsp"></jsp:include>
	    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
		<section class="py-5 container px-4 px-lg-5 mt-5">
			<div><!-- 카테고리, 검색 창 -->
				<select class="form-select" id="category" name="category" onchange="goCategory()" style="width: 150px; float:left;">
					<option values="">분류</option>
					<option values="취소/변경문의">취소/변경문의</option>
					<option values="상품문의">상품문의</option>
					<option values="환불문의">환불문의</option>
				</select>
				<form class="form-inline pull-right" name="goSearch" method="get">
					<input name=search type="text" class="form-control" placeholder="검색" style="width: 250px; float:right;" >
				</form>
			</div>
			<table class="table table-striped"><!-- 레코드 테이블 -->
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th>제목</th>
						<th>작성자</th>
						<th>처리상황</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Qna qna : qnaList) {
					%>
					<tr>
						<td><%=qna.getQ_no()%></td>
						<td><%=qna.getQ_category()%></td>
						<td><a href='q_view.jsp?q_no=<%=qna.getQ_no()%>'> <%=qna.getQ_title()%></a></td>
						<td><%=qna.getMember().getM_name()%></td>
						<td><%=qna.getQ_state()%></td>
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
						int pageBlock = 5;
						int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						
						if(endPage > pageCount){
							endPage = pageCount;
						}
						
						if(startPage > pageBlock){
						%>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=1%><%if(!(search==null || search.equals(""))){ out.print("&search="+search);}%><%if(!(category==null || category.equals(""))){ out.print("&category="+category);}%>"> << </a></li>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=startPage - pageBlock%><%if(!(search==null || search.equals(""))){ out.print("&search="+search);}%><%if(!(category==null || category.equals(""))){ out.print("&category="+category);}%>"> < </a></li>
						<%	
						}
						for(int i=startPage; i <= endPage; i++){
							if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
							%>
								<li class="page-item active"><a class="page-link" href="?pageNum=<%=i%><%if(!(search==null || search.equals(""))){ out.print("&search="+search);}%><%if(!(category==null || category.equals(""))){ out.print("&category="+category);}%>"><%=i %></a></li>
							<%									
							}else{ // 현재 페이지가 아닌 경우 링크 설정
							%>
								<li class="page-item"><a class="page-link" href="?pageNum=<%=i%><%if(!(search==null || search.equals(""))){ out.print("&search="+search);}%><%if(!(category==null || category.equals(""))){ out.print("&category="+category);}%>"><%=i %></a></li>
							<%	
							}
						}
						if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
						%>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=startPage + pageBlock%><%if(!(search==null || search.equals(""))){ out.print("&search="+search);}%><%if(!(category==null || category.equals(""))){ out.print("&category="+category);}%>"> > </a></li>
							<li class="page-item"><a class="page-link" href="?pageNum=<%=pageCount%><%if(!(search==null || search.equals(""))){ out.print("&search="+search);}%><%if(!(category==null || category.equals(""))){ out.print("&category="+category);}%>"> >> </a></li>
						<%
						}
					}
					%>
				</ul><br>
				<button id="subBtn" type="button" class="btn btn-primary" onclick="location.href='q_board.jsp'" />전체보기</button>
				<button id="subBtn" type="button" class="btn btn-primary" onclick="goWrite()" />문의하기</button>
			</div>
		</section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>