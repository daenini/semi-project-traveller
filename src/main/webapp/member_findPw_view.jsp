
<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.member.exception.PasswordMismatchException"%>
<%@page import="com.itwill.traveller.member.exception.MemberNotFoundException"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_find_pw.jsp");
		return;
	}
%>

<%
	String m_id = request.getParameter("m_id");

	
	MemberService memberService = new MemberService();
	
	Member findmember = memberService.selectById(m_id);

%>

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
         	function goLogin() {
				self.close();
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
        				<label for = "m_pw"> 찾으시는 비밀번호는 </label>
        					<div> "<strong> <%=findmember.getM_pass() %> </strong>"입니다</div>
        				</div>
        				<!-- 이름 form-group end -->
        				<br/>
        				<div class = "form-group" style="margin: 0px">
	        				<button type="button" class="btn btn-primary" onclick="goLogin();" style="width: 100%; padding: 5px; height: 50px; font-size: 20px;"><span style="font-weight: bold;">로그인 하기</span></button>	
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