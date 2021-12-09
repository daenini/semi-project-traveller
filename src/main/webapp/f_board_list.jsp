<%@page import="com.itwill.traveller.faq.Faq"%>
<%@page import="com.itwill.traveller.faq.FaqService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String sUserId = (String)session.getAttribute("sUserId");
%>
<%
	
	int pageSize = 10; //한 페이지에 출력할 게시물 수
	
	
	//페이지 링크를 클릭한 번호(현재 페이지)
	String pageNum = request.getParameter("pageNum");
	
	//페이지 링크를 클릭한게 없다면(최초 사이트 들어갈때) 1번 페이지로 설정
	if(pageNum == null) {
		pageNum = "1";
	}
	
	//연산을 하기위한 pageNum의 형변환(currentPage)
	int currentPage = Integer.parseInt(pageNum);
	
	/*
	해당 페이지에서 시작할 게시물 / 마지막 게시물
	startRow(첫번째 게시물) = (currentPage(현재 페이지) - 1 ) * pageSize(한 페이지 게시물 수) + 1	
	*/
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	//DB에 저장되어있는 총 갯수
	int count = 0;
	
	//faqService 불러와서 정의한 메소드 출력 후 count에 저장
	FaqService faqService = new FaqService();
	count = faqService.getCount();
	
	//faqService에 정의한 getList메소드 호출해서 컬렉션 객체로 저장
	ArrayList<Faq> faqList = new ArrayList<Faq>();
	
	//DB에 갯수가 1개 이상이라면 SQL문에 선언한 데이터를 가지고온다.
	if(count > 0) {
		faqList = faqService.getList(startRow, endRow);
	}





%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>자주찾는질문[FAQ]</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function q_write() {
				location.href = "q_write.jsp";
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
		<h3 style="text-align: center;">자주찾는질문[FAQ]</h3><hr/>
		<button type="button" class="btn btn-primary" onclick="q_write();">문의하기</button>
		<h5 style="text-align: right;">총 게시물 수 : <%= count %></h5><br/>
		<table class = "table table-striped">
		<%
			if (count > 0) {  //DB에 게시물이 존재한다면
				
				for(int i = 0; i < faqList.size(); i++){
					Faq faq = faqList.get(i);
		
		%>
			<tr>
				<th>Q</th>
				<th><a href="f_view.jsp?f_no=<%= faq.getF_no() %>"><%= faq.getF_question() %></a></th>
			</tr>
		<%
			}
				
				} else {
		%>
		
			<tr class = "danger">
				<th>게시글이 존재하지 않습니다.</th>
			</tr>
		
		<%
				}
		%>
		</table>
		</div>
			<div class="text-center">
			<ul class="pagination" style="justify-content: center;">
				<%
					//페이징 처리
					if(count > 0) {
						// 총 페이지의 수
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						//count(총 게시물)을 pageSize(10설정)나누면 나머지가 4이므로 0이 아닌 1의 값을 가진다.
						
						/*
						  한 페이지에 보여줄 페이지 (링크) 갯수<<<>>>안에있는거
						  ex) (<<<<<1,2,3,4,5,6,7,8,9,10>>>>  > 다음 >> 마지막)
						*/
						int pageBlock = 5;
						
						//한 페이지에 보여줄 시작 및 끝 번호
						int startPage = ((currentPage - 1)/pageBlock) * pageBlock + 1;
						int endPage = startPage + pageBlock - 1;
						
						//마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
						if(endPage > pageCount) {
							endPage = pageCount;
						}
						
						if(startPage > pageBlock) {
				%>
							<li class="page-item"><a class="page-link" href = "f_board_list.jsp?pageNum=1">&lt;&lt;</a></li>
							<li class="page-item"><a class="page-link" href = "f_board_list.jsp?pageNum=<%= startPage - 5 %>">&lt;</a></li>
				<%							
						}
						
						for(int i = startPage; i <= endPage; i++) { //페이지 블록번호
							
							if(i == currentPage){ //현재 페이지에는 링크를 설정X
				%>
								<li class="page-item active"><a class="page-link" href = "f_board_list.jsp?pageNum=<%= i %>"><%= i %></a></li>
				<%				
							} else { //현재 페이지가 아닌 경우 링크 설정
								
				%>
								<li class="page-item"><a class="page-link" href = "f_board_list.jsp?pageNum=<%= i %>"><%= i %></a></li>
				<%				
								
							}
						}  //for end
						
						if(endPage < pageCount){
						//현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클 경우 다음 링크 생성
				%>
								<li class="page-item"><a class="page-link" href = "f_board_list.jsp?pageNum=<%= startPage + 5 %>">&gt;</a></li>
								<li class="page-item"><a class="page-link" href = "f_board_list.jsp?pageNum=<%= pageCount %>">&gt;&gt;</a></li>
				<%			
						}
						
					}
				%>
				</ul><br>
			</div>
        <%
        	if(!(sUserId == null) && sUserId.equals("admin")){
        %>
		<div align="center"><button type="button" class="btn btn-primary" value="" onclick="location.href='f_write.jsp'">게시물 등록</button></div>
		<%
		}
		%>
		
		
		
		
		
		
		
		
		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
        </section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
