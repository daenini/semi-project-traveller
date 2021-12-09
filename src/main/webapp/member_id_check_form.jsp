
<%@page import="com.itwill.traveller.member.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	boolean isDuplicate = false;
	String msg = "";
	
	String m_id = request.getParameter("checkId");
	if(m_id == null || m_id.equals("")){
		m_id = "";
		msg = "";
		isDuplicate = true;
	} else {
		MemberService memberService = new MemberService();
		isDuplicate = memberService.existedMember(m_id);
		if(isDuplicate){
			msg = "사용할 수 없는 아이디이거나 중복된 아이디입니다.";
		} else {
			msg = "사용할 수 있는 아이디입니다.";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>

<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}
#chk {
	text-align: center;
}
#cancelBtn {
	visibility: visible;
}
#useBtn {
	visibility: visible;
}
</style>

<script type="text/javascript">
	// 아이디 중복체크
	function idCheck() {
		var id = document.getElementById("checkId").value;
		if(id == null || id == ""){
			alert("검색할 아이디를 입력하시고 중복검사를 눌러주세요.");
			return;
		}
		document.getElementById("check_form").action = "member_id_check_form.jsp";
		document.getElementById("check_form").method = "POST";
		document.getElementById("check_form").submit();
	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.getElementById("login_form").m_id.value = document.getElementById("checkId").value;
		   //or window.close(); 똑같음
		self.close();
	
	}
	//커서
	function focus() {
		document.getElementById("checkId").focus();
	}
</script>

</head>
<body onload="focus();">
	<div id="wrap">
		<br> <b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="check_form">
				<input type="text" name="checkId" id="checkId" value="<%= m_id %>">
				<input type="button" value="중복확인" onclick="idCheck();">
			</form>
			<div id="msg"><span style="color: red;"><%= msg %></span></div>

			<br> 
			<input id="cancelBtn" type="button" value="취소" onclick="window.close();">
			<% if(!isDuplicate) { %>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue();">
			<% } %>
		</div>
	</div>
</body>
</html>