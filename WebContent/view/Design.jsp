<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://kit.fontawesome.com/a876b41567.js" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

*{margin:auto}
a{text-decoration:none; color:black}
.design {text-align:center;line-height:80px;float:left;height:80px}
.top{width:99%; margin:20px}
.left{width:33%;}
.title{width:33%;}
.right{width:33%}
#join{width:40%;}
#log_state{width:40%;}
#mem_info{width:90%;}


</style>
</head>
<body>
<!--div{border:solid black 1px;}-->
<!-- session값을 읽어와서 로그인된 경우 로그아웃된 경우 나눠서 처리해야함. -->
<div class="design top">
	<div class="design left">
		<div class="design" id="mem_info">
			<c:if test="${sessionScope.flag eq true }"> <!-- 로그인한 경우만 메뉴출력 -->
				<c:if test="${sessionScope.id eq 'admin' }"> <!-- 관리자인 경우 -->
					<a href="${pageContext.request.contextPath }/MemberListController">회원관리</a>
				</c:if>
				<c:if test="${sessionScope.id ne 'admin' }"> <!-- 관리자가 아닌 경우 -->
					<a href="${pageContext.request.contextPath }/MemberSearchController">회원정보</a>
				</c:if>
			</c:if>
		</div>	
	</div>
	<div class="design title">
		<h1><a href="${pageContext.request.contextPath }/view/main.jsp"><img src="${pageContext.request.contextPath }/project_main_logo.png" height="100"></i></a></h1>
	</div>
	<div class="design right">
		<div class="design" id="join">
			<c:if test="${sessionScope.flag eq true }">
				<%=(String) session.getAttribute("id") %>님 환영합니다
			</c:if>
			<c:if test="${sessionScope.flag ne true}">
				<a href="${pageContext.request.contextPath }/view/JoinForm.jsp">회원가입</a>
			</c:if>
		</div>
		<div class="design" id="log_state">
			<% if (!session.isNew())  {%> <!-- 새로 생성된 세션이 있을 때 (로그인 시도를 한 경우) -->
				<c:if test="${sessionScope.flag }"> <!--  로그인 성공 -->
					<a href="${pageContext.request.contextPath }/LogoutController">로그아웃</a>
				</c:if>
				<c:if test="${!sessionScope.flag }"> <!-- 로그인 실패시  -->
					<a href="${pageContext.request.contextPath }/view/Login.jsp">로그인</a>
				</c:if>
			<%}else{%>
				<a href="${pageContext.request.contextPath }/view/Login.jsp">로그인</a>
			<%} %>
		</div>
	</div>
</div>

</div>
</body>
</html>