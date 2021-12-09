<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msgId = request.getParameter("msgId");
	String msgPass = request.getParameter("msgPass");
	if(msgId == null) msgId = "";
	if(msgPass == null) msgPass = "";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="startbootstrap/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function loginCheck() {
				var form = document.getElementById("login_form");
				if(form.id.value.trim() == ""){
					alert("아이디를 입력하세요.");
					form.id.focus();
					return false;
				}
				if(form.password.value.trim() == ""){
					alert("비밀번호를 입력하세요.");
					form.pass.focus();
					return false;
				}
				form.action = "member_login_action.jsp";
				form.method = "POST";
				form.submit();
				return true;
			}
        	
        	function enter() {
				document.getElementById("Check").innerHTML = "";
			}
        	function findId() {
				window.open("member_find_id.jsp","findId","width=640, height=400,  resizable=no, scrollbars=no")
			}
        	function findPw() {
				window.open("member_find_pw.jsp","findPw","width=640, height=400,  resizable=no, scrollbars=no")
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
        			<form id="login_form" onsubmit="return loginCheck();">
        				<h3 style="text-align: center;">로그인</h3>
        				<div class = "panel-body" style="background-color: #F2F2F2;">
        				<div class="form-group" style="margin-top: 20px">
        					<input type="text" class="form-control" placeholder="ID" name="id" maxlength="20" onkeydown="enter();">
        					<span id=Check style="color: red; font-size: 20px"><%= msgId %></span>
        				</div>
        				<br/>
        				<div class="form-group">
        					<input type="password" class="form-control" placeholder="PASSWORD" name="password" maxlength="20" onkeydown="enter();">
        					<span id=Check style="color: red; font-size: 20px"><%= msgPass %></span>
        				</div>
        				</div>
        				<br/>
        				<input type="submit" class="btn btn-primary form-control" value="로그인하기" style="width: 100%; padding: 5px; height: 50px; font-size: 20px; font-weight: bold;">
        			</form>
        			<br/>
        			<div style="text-align: center">
        			<a href="javascript:findId()"; class="txt" style="color: black;">아이디 찾기ㅣ</a>
        			<a href="javascript:findPw()" class="txt" style="color: black;">비밀번호 찾기ㅣ</a>
        			<a href="member_write_form.jsp" class="txt" style="color: black;">회원가입</a>
        			</div>
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
