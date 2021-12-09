<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원가입</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="startbootstrap/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function signUpCheck() {
				var form = document.getElementById("login_form");
				if(form.m_id.value.trim() == ""){
					alert("아이디를 입력하세요.");
					form.m_id.focus();
					return;
				}
				if(form.m_pass1.value.trim() == ""){
					alert("비밀번호를 입력하세요.");
					form.m_pass1.focus();
					return;
				}
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
					alert("핸드폰을 입력하세요.");
					form.m_phone.focus();
					return;
				}
				if(form.m_pass1.value != form.m_pass2.value){
					alert("비밀번호가 다릅니다.");
					form.m_pass1.select();
					return;
				}
				form.action = "member_write_action.jsp";
				form.method = "POST";
				form.submit();
			}
        	
        	function openCheck() {
				window.open("member_id_check_form.jsp", "check_form", "width=600, height=300, resizable=no, scrollbars=no");
			}
        </script>
    </head>
    <body>
    <jsp:include page="/include/top_nav_include.jsp"></jsp:include>
    <jsp:include page="/include/top_header_include.jsp"></jsp:include>
        <!-- Section-->
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5 container px-4 px-lg-5 mt-5">
            <div class="container">
        	<div class="col-lg-10"></div>
        	<div class="col-lg-10 mx-auto">
        		<div class="container fulid">
        			<form id="login_form">
        				<h3 style="text-align: center;">회원가입</h3>
        				<div class = "panel-body" style="background-color: #F2F2F2;">
        				<div class="form-group">
        				<label for = "m_id"> 아이디 </label>
        				<div class = "input-group">
        					<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="m_id" value="" maxlength="20" onclick="openCheck();" readonly="readonly">
        					<span class = "input-group-btn">
        						<button type="button" class="btn btn-primary" onclick="openCheck();">아이디 중복체크</button>
        					</span>
        				</div>
        				</div>
        				<!-- 아이디 form-group end -->
        				<br/>
        				<div class="form-group">
        				<label for = "m_pass1"> 비밀번호 </label>
        					<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." name="m_pass1" maxlength="20">
        				</div>
        				<!-- 비밀번호 form-group end -->
        				<br/>
        				<div class="form-group">
        				<label for = "m_pass2"> 비밀번호 확인 </label>
        					<input type="password" class="form-control" placeholder="비밀번호를 한번 더 입력하세요." name="m_pass2" maxlength="20">
        				</div>
        				<!-- 비밀번호 확인 form-group end -->
        				<br/>
        				<div class="form-group">
        				<label for = "m_name"> 이 름 </label>
        					<input type="text" class="form-control" placeholder="이름을 입력하세요." name="m_name">
        				</div>
        				<!-- 이름 form-group end -->
        				<br/>
        				<div class="form-group">
        				<label for = "m_email">이메일</label>
        					<input type="text" class="form-control" placeholder="이메일을 입력하세요. ex)aaa@naver.com" name="m_email">
        				</div>
        				<!-- 이메일 form-group end -->
        				<br/>
        				<div class="form-group">
        				<label for = "m_birth">생년월일</label>
        					<input type="text" class="form-control" placeholder="생년월일을 입력하세요. ex)010101" name="m_birth">
        				</div>
        				<!-- 생년월일 form-group end -->
        				<br/>
        				<div class="form-group">
        				<label for = "m_phone">휴대폰 번호</label>
        					<input type="text" class="form-control" placeholder="휴대폰을 입력하세요. ex)01012345678" name="m_phone">
        				</div>
        				<!-- 휴대폰 번호 form-group end -->
        				<br/><br/>
        				<div class = "form-group" style="margin: 0px">
	        				<button type="button" class="btn btn-primary" onclick="signUpCheck();" style="width: 100%; padding: 5px; height: 50px; font-size: 20px;"><span style="font-weight: bold;">회 원 가 입</span></button>	
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
