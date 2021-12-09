<%@page import="com.itwill.traveller.qna.Qna"%>
<%@page import="com.itwill.traveller.qna.QnaService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	if (no == null || no.equals("")) {
		response.sendRedirect("q_board.jsp");
		return;
	}
	
	QnaService qnaService = new QnaService();
	
	Qna qna = qnaService.selectByNo(Integer.parseInt(no));

	ArrayList<String> categoryList = new ArrayList<String>();
	
	if (qna == null) {
		out.println("<script>");
		out.println("alert('게시글이 삭제되었거나 존재하지 않습니다.');");
		out.println("location.href='q_board.jsp'");
		out.println("</script>");
		return;
	}
	
	int text_maxByte = 2000; // sql에서 Content에 정해둔 Byte수
%>

<!DOCTYPE html>
<html>
	<head>
		<title><%=qna.getQ_title() %></title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
		<script src="js/summernote.min.js"></script>
		<script src="js/summernote-ko-KR.js"></script>
		<script>
		
			function check(){
				form = document.getElementById("modifyfrm")
				var no = form.no.value;
				alert("변경사항이 저장되지 않습니다.\n그래도 괜찮으시겠습니까?");
				form.action = "q_view.jsp?p_no="+no;
				form.method="POST";
				form.submit();
			}
			function goModify() {

				frm = document.getElementById("modifyfrm")
				var title = frm.title.value;
				var writer = frm.writer.value;
				var content = frm.content.value;
				var content_max = document.getElementById("nowByte").style.color;
				
				
				
				if (title == '') {
					alert("제목을 입력해주세요");
					return false;
				}
				
				if (writer == '') {
					alert("작성자를 입력해주세요");
					return false;
				}
				
				if (content == '') {
					alert("내용을 입력해주세요");
					return false;
				}
				
				if (content_max == 'red') {
					alert("글자수를 입력해주세요");
					return false;
				}
				
				frm.submit();
			}
			
			function fileUpload(frm,input) { // 파일 업로드 폼
				if (input.files && input.files[0].size > (1024 * 1024 * 5)) { // 2MB
			        alert("이미지 용량이 2MB를 넘습니다.");
			        input.value = null;
			        return;
			    }
				frm.target="fileif"; // post할곳을 iframe으로 한다
				frm.submit();
				input.value = null;
			};
			
			function getUploadFileName(ufilename) { // IFrame에서 파일명 받아오기
				$("#summernote").summernote('insertImage', "images/"+ufilename); // 받아온 파일명을 게시글 에디터에 추가
			}
			
			$(document).ready(function() {
				$('#summernote').summernote({
					placeholder : '내용을 입력하세요',
					minHeight : 370,
					maxHeight : null,
					focus : true,
					lang : 'ko-KR',
					toolbar: [
			            [ 'style', [ 'style' ] ],
			            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough','clear'] ],
			            [ 'fontname', [ 'fontname' ] ],
			            [ 'fontsize', [ 'fontsize' ] ],
			            [ 'color', [ 'color' ] ],
			            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
			            [ 'table', [ 'table' ] ],
			            [ 'insert', [ 'link' ] ],
			            [ 'view', [ 'undo', 'redo', 'codeview', 'help' ] ],
			        ],
			        callbacks: { // summernote textarea에서 onkeyup 이벤트가 작동하지않아 콜백 이용 
			            onKeyup: function() {
			            	var maxByte = <%=text_maxByte %>;
			            	var text_val = $('#summernote').summernote('code')
			            	var text_len = text_val.length;
			            	
			            	let totalByte=0;
			                for(let i=0; i<text_len; i++){
			                	var each_char = text_val.charAt(i);
			                	var uni_char = escape(each_char) //유니코드 형식으로 변환
			                    if(uni_char.length>4){
			                    	// 한글 : 3Byte(2Byte인줄 알고있었으나 오라클에선 3Byte로 인식함)
			                        totalByte += 3;
			                    }else{
			                    	// 영문,숫자,특수문자 : 1Byte
			                        totalByte += 1;
			                    }
			                }
			                
			                if(totalByte>maxByte){
			                	alert('최대 '+<%=text_maxByte %>+'Byte까지만 입력가능합니다.');
			                    	document.getElementById("nowByte").innerText = totalByte;
			                        document.getElementById("nowByte").style.color = "red";
			                    }else{
			                    	document.getElementById("nowByte").innerText = totalByte;
			                        document.getElementById("nowByte").style.color = "green";
			                    }
			                }
			            }
				});
				$("#summernote").summernote('code', '<%=qna.getQ_content()%>');
			});
		</script>
		<style>
			.filebox input[type="file"] {  /* 파일 필드 숨기기 */
				position: absolute;
				width: 1px;
				height: 1px;
				padding: 0;
				margin: -1px;
				overflow: hidden;
				clip:rect(0,0,0,0);
				border: 0;
			}
		</style>
	</head>
		
	<body>
		<jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    	<jsp:include page="/include/top_header_include.jsp"></jsp:include>
		<!-- 파일 업로드를 위한 IFrame -->
		<iframe name="fileif" style="display: none" onchange="getUploadFileName()"></iframe>
		<!--게시글 작성을 위한 영역 -->
		<section class="py-5 container px-4 px-lg-5 mt-5">
			<div style="justify-content:center;">
				<form id="modifyfrm" method="post" action="q_modify_action.jsp">
					<!-- 추후 섹션으로 변경 -->
					<input type="hidden" name="no" value="<%=qna.getQ_no()%>">
					<!-- 카테고리 -->
				<select class="form-select" name="category" style="width: 150px;margin-bottom: 5px;">
					<option values=""><%=qna.getQ_category() %></option>
					<option values="취소/변경문의">취소/변경문의</option>
					<option values="상품문의">상품문의</option>
					<option values="환불문의">환불문의</option>
				</select>
					<!-- 작성자, 제목 -->
					<div class="input-group mb-1">
						<div class="input-group-prepend ">
							<span class="input-group-text" id="basic-addon1">작성자</span>
						</div>
						<input type="text" class="form-control" id="writer" name="writer" value="<%=qna.getMember().getM_name()%>" readonly="readonly"> 
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">제목</span>
						</div>
						<input type="text" class="form-control" id="title" name="title" value="<%=qna.getQ_title()%>">
					</div>
					<!-- 게시판 에디터 -->
					<textarea id="summernote" name="content"></textarea>
					<sup>(<span id="nowByte">0</span>/<%=text_maxByte %>/bytes)</sup>
				</form>
			</div>
			<!-- 이미지 업로드 -->
			<form name="filefrm" method="post" action="fileupload_action.jsp" enctype="multipart/form-data">
				<div class="filebox text-center">
					<!-- input type file은 CSS효과가 적용이 안돼서 label로 상호작용 -->
					<label class="btn btn-primary" for="file">이미지 업로드</label>
					<input type="file" name="file" id="file" accept="image/*" onchange="fileUpload(this.form,this)">
					<!-- 게시글 Submit -->
					
					<button id="subBtn" type="button" class="btn btn-primary" onclick="goModify()" />수정</button>
					<button id="subBtn" type="button" class="btn btn-primary" onclick="check()" />돌아가기</button>
				</div>
			</form>
		</section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
	</body>
</html>