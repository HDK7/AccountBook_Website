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
	<c:import url="/TestController"/>
	<h1>테스트합니다</h1>
	<jsp:include  page="/reply/ReplyList.jsp">
		<jsp:param value="11" name="sequence"/>
	</jsp:include>
	<h1>테스트합니다</h1>	
</body>
</html>