<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>비밀번호 찾기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="startbootstrap/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
        	function check() {
				var form = document.getElementById("find_form");
				if(form.m_id.value.trim() == ""){
					alert("아이디를 입력하세요.");
					form.m_id.focus();
					return;
				}
				form.action = "member_findPw_view.jsp";
				form.method = "POST";
				form.submit();
			}

        </script>
    </head>
    <body>
        <!-- 여기서부터 작업하시면됩니다 <Section> </Section> 사이 -->
        <section class="py-5">
            <div class="container">
        	<div class="col-lg-10"></div>
        	<div class="col-lg-10">
        		<div class="container fulid">
        			<form id="find_form">
        				<h3 style="text-align: center;">비밀번호 찾기</h3>
        				<div class = "panel-body" style="background-color: #F2F2F2;">

        				<div class="form-group">
        				<label for = "m_id"> 아이디 </label>
        					<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="m_id">
        				</div>
        				<!-- 이름 form-group end -->
        				<br/>
        				<br/><br/>
        				<div class = "form-group" style="margin: 0px">
	        				<button type="button" class="btn btn-primary" onclick="check();" style="width: 100%; padding: 5px; height: 50px; font-size: 20px;"><span style="font-weight: bold;">비밀번호 찾기</span></button>	
        				</div>
        				</div>
        				
        			</form>
        			<br/>
        			
        		</div>
        	</div>
        	
        </div>
        
		<!-- 여기까지 작업하시면됩니다 <Section> </Section> 사이 -->
        </section>

    </body>
</html>
