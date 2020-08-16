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
		<c:forEach var="m" items="${news }">
			<tr>
				<td width="500" style="line-height:25px"><a href="${m.getLink() }">${m.getTitle() }</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>