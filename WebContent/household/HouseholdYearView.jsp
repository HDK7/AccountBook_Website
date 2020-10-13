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
	<!-- /householdYearGraphController -->
	<!-- http://localhost:8081/AccountBook_Website/householdYearGraphController?id=${sessionScope.id }&type=1 -->

	<jsp:include
		page="/householdYearGraphController?id=${sessionScope.id }&type=1" />
</body>
</html>