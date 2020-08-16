<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><br><br>
	<div style="text-align:center;">
		<c:if test="${email_flag eq true }">
			<h4>조회한 아이디</h4>
			<%=(String)request.getAttribute("encrpytion_id") %>
			<br><br>
			<input type="button" value="닫기" onclick="return window.close()">
		</c:if>
		<c:if test="${email_flag eq false }">
			<br>
			입력하신 이메일로 가입한 아이디가 존재하지 않습니다.<br><br><br>
			<input type="button" value="닫기" onclick="return window.close()">
		</c:if>
	</div>
</body>
</html>