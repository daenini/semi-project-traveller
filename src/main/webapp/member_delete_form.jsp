
<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sUserId = (String)session.getAttribute("sUserId");
	
	MemberService memberService = new MemberService();
	Member member = memberService.selectById(sUserId);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>탈퇴하기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="startbootstrap/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function deleteCheck() {
        		var form = document.getElementById("delete_form");
        		if(form.password1.value != form.password2.value){
        			alert("비밀번호가 일치하지 않습니다.");
        			return;
        		}
				form.action = "member_delete_action.jsp";
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
        <section class="py-5">
		
		        <div class="container">
        	<div class="col-lg-10"></div>
        	<div class="col-lg-10">
        		<div class="container fulid">
        			<form id="delete_form">
        				<h3 style="text-align: center;">회원탈퇴하기</h3>
        				<input type="hidden" class="form-control" name="password1" maxlength="20" value="<%= member.getM_pass() %>">
        				<input type="hidden" class="form-control" name="m_id" value="<%= member.getM_id() %>">
        				<div class = "panel-body" style="background-color: #F2F2F2">
        				<div class="form-group">
        					<span style="font-size: 20px">현재 비밀번호</span>
        					<input type="password" class="form-control" placeholder="PASSWORD" name="password2" maxlength="20">
        				</div>
        				<br/><br/>
        				<div class = "form-group">
        				<button type="button" class="btn btn-primary form-control" onclick="deleteCheck();"><span style="font-weight: bold;">회원 탈퇴하기</span></button>
        				</div>
        				</div>
        				<br/><br/>
        			</form>
        			<br/>
        		</div>
        	</div>
        	
        </div>
		
		
		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
        </section>
		<jsp:include page="/include/footer_include.jsp"></jsp:include>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="startbootstrap/js/scripts.js"></script>
    </body>
</html>
