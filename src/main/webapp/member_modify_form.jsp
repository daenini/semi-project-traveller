<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "login_check.jspf" %>
<%
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
        <title>내정보</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="startbootstrap/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function modifyCheck() {
				var form = document.getElementById("modify_form");
				if(form.m_name.value.trim() == ""){
					alert("이름을 입력하세요.");
					form.m_name.focus();
					return;
				}
				if(form.m_email.value.trim() == ""){
					alert("이메일을 입력하세요.");
					form.m_email.focus();
					return;
				}
				if(form.m_birth.value.trim() == ""){
					alert("생년월일을 입력하세요.");
					form.m_birth.focus();
					return;
				}
				if(form.m_phone.value.trim() == ""){
					alert("휴대폰번호를 입력하세요.");
					form.m_phone.focus();
					return;
				}
				if(form.m_pass.value.trim() == ""){
					alert("비밀번호를 입력하세요.");
					form.m_pass.focus();
					return;
				}
				if(form.m_pass1.value != form.m_pass.value){
					alert("비밀번호가 일치하지 않습니다.");
					form.m_pass.select();
					return;
				}
				form.action = "member_modify_action.jsp";
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
        			<form id="modify_form">
        				<h3 style="text-align: center;">내 정보</h3>
        				<input type="hidden" class="form-control" name="m_pass1" maxlength="20" value="<%= member.getM_pass() %>">
        				<br/>
        				<div class = "panel-body" style="background-color: #F2F2F2;">
        				<div class = "form-group">
        				<label for = "m_id"> 아이디 </label>
        					<input type="text" class="form-control" name="m_id" maxlength="20" value="<%= member.getM_id() %>" readonly="readonly">
        				</div>
        				<br/>
        				<button type="button" class="btn btn-primary form-control" onclick="location.href='member_password_modify_form.jsp'"><span style="font-weight: bold;">비밀번호 변경하기</span></button><br/><br/>
        				<br/>
        				<div class="form-group">
        				<label for = "m_name"> 이름 </label>
        					<input type="text" class="form-control" name="m_name" value="<%= member.getM_name() %>">
        				</div>
        				<br/>
        				<div class="form-group">
        				<label for = "m_email"> 이메일 </label>
        					<input type="text" class="form-control" name="m_email" value="<%= member.getM_email() %>">
        				</div>
        				<br/>
        				<div class="form-group">
        				<label for = "m_birth"> 생년월일 </label>
        					<input type="text" class="form-control" name="m_birth" value="<%= member.getM_birth() %>">
        				</div>
        				<br/>
        				<div class="form-group">
        				<label for = "m_phone"> 휴대폰 번호</label>
        					<input type="text" class="form-control" name="m_phone" value="<%= member.getM_phone() %>">
        				</div>
        				<br/>
        				<div class="form-group">
        					비밀번호 확인(수정을 위해서 비밀번호를 입력하세요.)
        					<input type="password" class="form-control" name="m_pass" value="">
        				</div>
        				<br/><br/>
        				<div class = "form-group text-center">
        				<button type="button" class="btn btn-primary" onclick="modifyCheck();" style="width: 100%"><span style="font-weight: bold;">수정하기</span></button><br/><br/>
        				<button type="button" class="btn btn-primary" onclick="location.href='member_view_myinfo.jsp'" style="width: 100%"><span style="font-weight: bold;">취소하기</span></button>
        				</div>
        				</div>
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
