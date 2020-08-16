<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function oncheck(){
	var form = document.getElementById('writeForm');
	var date = form.date.value;
	if(date == ''){
		alert("날짜를 입력하세요");
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<c:import url="/view/Menu.jsp" />	
	<h4 align="center">해당 월을 클릭하시면 이동합니다</h4>
	<table border="1">
		<tr>
			<th>연도</th><th>월</th><th>입력갯수</th>
		<c:forEach var="m" items="${m }">
			<tr>
				<td>${m.getDate() }</td>
				<td><a href="${pageContext.request.contextPath }/hhGetGraphData?year=${m.getDate()}&month=${m.getContent()}">${m.getContent() }</a></td>
				<td>${m.getKey() }</td>
			</tr>
		</c:forEach>	
	</table>
	

</body>
</html>