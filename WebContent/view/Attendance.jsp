<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function button_close() {
		opener.location.replace('${pageContext.request.contextPath }/view/AttedancePage.jsp');
		window.close();
	}
</script>
</head>
<body>
	<div style="text-align:center;">
	<br>
		<c:if test="${Attendance_flag eq false }">
			출석하였습니다.<br><br>
			<a class="btn btn-dark" href="#" onclick="button_close()">닫기</a>
		</c:if>
		<c:if test="${Attendance_flag eq true }">
			오늘은 이미 출석하였습니다.<br><br>
			<a class="btn btn-dark" href="#" onclick="window.close()">닫기</a>
		</c:if>
	</div>
</body>
</html>