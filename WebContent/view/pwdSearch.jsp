<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var httpRequest = null;

	function getXMLHttpRequest() {
		var httpRequest = null;

		if (window.ActiveXObject) {
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					httpRequest = null;
				}
			}
		} else if (window.XMLHttpRequest) {
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}

	function check() {
		//alert("확인중");
		var idTxt = document.pwdSearchTem.id;

		if (idTxt.value == "") { // id값이 없을 때
			alert("아이디를 입력하세요")
			idTxt.value = ""
			idTxt.focus();
			return false;
		}

		// Ajax
		idTxt = document.getElementById("userId").value; // 혹시 몰라서 한번 더 확실하게 정의
		var param = "id=" + idTxt
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callback;
		httpRequest
				.open(
						"POST",
						"http://13.209.93.8:8081/Project_semi/MemberPwdSearchController",
						true);
		httpRequest.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded'); // 헤더 선언 중요!
		httpRequest.send(param); // email="emailTxt" 전달 / 주소?뒤에 썼다고 생각하면 된다.(request값 설정)
		return false; // 이거 안쓰면 무조건 넘어감 (Login.jsp로..)
	}

	//callback함수 정의
	function callback() {
		if (httpRequest.readyState == 4) {
			var resultText = httpRequest.responseText; // 출력버퍼 확인

			if (resultText == 1) {
				alert("없는 아이디입니다.");
			} else {
				resultText = resultText.split(' '); // 공백으로 구분

				var result = resultText[0];
				var emailTxt = resultText[1];
				//result = result.trim();
				//emailTxt = emailTxt.trim();
				result = result.trim();
				emailTxt = emailTxt.trim();
				alert("등록한 이메일로 인증키를 전송하였습니다.");
				//window.close();
				location.href = 'http://13.209.93.8:8081/Project_semi/view/pwdSearchSend.jsp?Authkey='
						+ result + '&Email=' + emailTxt; // request로 authkey와 email값 전달
			}
		}
	}
</script>
</head>
<body>
	<br><br><br><br>
	<form action="#" name="pwdSearchTem" method="post"
		onsubmit="return check()" style="text-align: center;">
		<h4>비밀번호를 찾고자 하는 아이디를 입력해 주세요.</h4>
		<input type="text" name="id" id="userId"> <input type="submit" value="다음">
	</form>
</body>
</html>