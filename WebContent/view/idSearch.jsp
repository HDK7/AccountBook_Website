<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		var emailTxt = document.idSearchTem.email;
		
		if (emailTxt.value=="") {	// id값이 없을 때
			alert("이메일을 입력하세요")
			emailTxt.value=""
			emailTxt.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<br><br><br><br>
	<form action="${pageContext.request.contextPath }/MemberIdSearchController" name="idSearchTem" method="post" onsubmit="return check()" style="text-align:center;">
		<h4> 가입시 입력한 이메일을 입력하세요. </h4>
		<input type="text" name="email" id="userEmail">
		<input type="submit" value="다음">
	</form>
</body>
</html>