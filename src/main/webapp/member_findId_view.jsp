
<%@page import="com.itwill.traveller.member.Member"%>
<%@page import="com.itwill.traveller.member.exception.PasswordMismatchException"%>
<%@page import="com.itwill.traveller.member.exception.MemberNotFoundException"%>
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@page import="java.net.URLEncoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("member_find_id.jsp");
		return;
	}
%>

<%
	String m_name = request.getParameter("m_name");
	String m_phone = request.getParameter("m_phone");
	
	MemberService memberService = new MemberService();
	
	Member findmember = memberService.findId(m_name, m_phone);

%>

   <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>아이디 찾기</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="startbootstrap/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" />
        <script type="text/javascript">
         	function findPw() {
				window.open("member_find_pw.jsp","findPw","width=640, height=400,  resizable=no, scrollbars=no")
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
        				<h3 style="text-align: center;">아이디 찾기</h3>
        				<div class = "panel-body" style="background-color: #F2F2F2;">

        				<div class="form-group">
        				<label for = "m_name"> 찾으시는 아이디는 </label>
        					<div> "<strong> <%=findmember.getM_id() %> </strong>"입니다</div>
        				</div>
        				<!-- 이름 form-group end -->
        				<br/>
        				<div class = "form-group" style="margin: 0px">
	        				<button type="button" class="btn btn-primary" onclick="findPw();" style="width: 100%; padding: 5px; height: 50px; font-size: 20px;"><span style="font-weight: bold;">비밀번호 찾기</span></button>	
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