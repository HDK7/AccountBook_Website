<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function authCheck() {
		var inputAuthKey = document.getElementById("inputAuthkey").value;
		var Authkey = document.getElementById("Authkey").value;
		
		var email = document.getElementById("email").value;
		
		if (inputAuthKey == Authkey) {
			alert("이메일로 임시 비밀번호를 전송합니다. 잠시만 기다려주세요.");
			location.href="http://13.209.93.8:8081/Project_semi/MemberPwdMakeController?email="+email;
		} else {
			alert("인증번호를 확인하세요");
		}
	}
</script>
</head>
<body>
	<!--request.getParameter("Authkey") -->
	<!-- request.getParameter("Email") -->
	<br><br><br><br>
	<div style="text-align:center;">
		인증번호 : <input type="text" id="inputAuthkey">
		<input type="button" onclick="authCheck()" value="인증번호 확인">
		<input type="hidden" id="Authkey" value="<%=request.getParameter("Authkey") %>"> <!-- authkey를 저장하기 위한 임시 변수 -->
		<input type="hidden" id="email" value="<%=request.getParameter("Email") %>"> <!-- email을 저장하기 위한 임시 변수 -->
	</div>
</body>
</html>