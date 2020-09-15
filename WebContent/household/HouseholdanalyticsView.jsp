<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//뒤로가기
	function moveback() {
		location.href = "${pageContext.request.contextPath }/hhSelectMonthController2"
	}
</script>
</head>
<body>
	<c:import url="/view/Menu.jsp" />
	
	<!-- 타이틀 -->
	<h4 align="center">${year }년${month }월 통계</h4>
	
	<!-- 수입 통계 및 그래프 출력 -->
	<h4 align="center">수입</h4>
	
	<c:if test="${empty in}">
		<h4 align="center">작성이 필요합니다</h4>
		<br>
	</c:if>
	<c:if test="${not empty in}">
		<c:import url="/household/HouseholdAnalyticsIn.jsp" />
		<table>
			<tr>
				<th>카테고리</th>
				<th>금액</th>
			</tr>
			<c:forEach var="input" items="${in}">
				<tr>
					<td>${input.category}</td>
					<td>${input.price }원</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	
	<!-- 지출 통계 및 그래프 출력 -->
	<h4 align="center">지출</h4>

	<c:if test="${empty out}">
		<h4 align="center">작성이 필요합니다</h4>
		<br>
	</c:if>
	<c:if test="${not empty out}">
		<c:import url="/household/HouseholdAnalyticsOut.jsp" />
		<table>
			<tr>
				<th>카테고리</th>
				<th>금액</th>
			</tr>
			<c:forEach var="output" items="${out}">
				<tr>
					<td>${output.category}</td>
					<td>${output.price }원</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<br>
	
	<!-- 뒤로가기 버튼 -->
	<table style="margin-left: auto; margin-right: auto;">
		<tr>
			<td><input type="button" value="목록 이동" onclick="javscript:moveback()"></td>
		</tr>
	</table>
</body>
</html>