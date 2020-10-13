<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//날짜 공백 체크
	function oncheck() {
		var form = document.getElementById('writeForm');
		var date = form.date.value;
		if (date == '') {
			alert("날짜를 입력하세요");
			return false;
		}
		return true;
	}
	
	//삭제 재확인
	function delConfirm(year, month) {
		var result = confirm("정말로 삭제할까요?");
		if (result) {
			location.href = "http://localhost:8081/Project_semi/hhDeleteMonthController?year="
					+ String(year) + "&month=" + String(month);
		} else {
			alert("취소 되었습니다.");
		}
	}
</script>
</head>
<body>
	<c:import url="/view/Menu.jsp" />
	<br>
	
	<!-- 새로운 월 추가 -->
	<h4 align="center">새로운 월 추가</h4>
	<form action="${pageContext.request.contextPath }/hhWriteController"
		method="post" id="writeForm" onsubmit="return oncheck()">
		<input type="hidden" name="type" value="3"> <input
			type="hidden" name="category" value="자동생성"> <input
			type="hidden" name="content" value=" "> <input type="hidden"
			name="price" value="0">
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td>날짜 :</td>
				<td><input type="month" name="date"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="생성" />
			</tr>
		</table>
	</form>
	<br>

	<!-- 월 목록 -->
	<h4 align="center">해당 월을 클릭하시면 이동합니다</h4>
	<table border="1">
		<tr>
			<th>연도</th>
			<th>월</th>
			<th>입력갯수</th>
			<th></th>
			<c:forEach var="m" items="${m }">
				<tr>
					<td>${m.getDate() }</td>
					<td><a
						href="${pageContext.request.contextPath }/hhGetMonthController?year=${m.getDate()}&month=${m.getContent()}">${m.getContent() }</a></td>
					<td>${m.getKey() }</td>
					<td><a
						href="javascript:delConfirm(${m.getDate()}, ${m.getContent()})">삭제</a></td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>