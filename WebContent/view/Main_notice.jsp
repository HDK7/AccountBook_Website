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
	<table>
		<c:forEach var="m" items="${notice }">
			<tr>
				<td width="400" style="line-height:25px"><a href="${pageContext.request.contextPath }/ReadNoticeController?seq=${m.sequence }">${m.getTitle() }</a></td>
				<td style="line-height:25px">${m.getTime() }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>