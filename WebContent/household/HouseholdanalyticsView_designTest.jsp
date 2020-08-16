<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function moveback(){
	location.href="${pageContext.request.contextPath }/hhSelectMonthController2"
}
</script>
</head>
<body>
<c:import url="/view/Menu.jsp" />

<!-- Page Wrapper -->
<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
 <div id="content" style="margin-left:15%; margin-right:15%">

   <!-- Begin Page Content -->
   <div class="container-fluid">



<h4 align="center">${year }년 ${month }월 통계</h4>

<div class="row">
<div class="col-lg-5" style="margin-top:0px;">

	<h4 align="center">수입</h4>
	
	<c:if test = "${empty in}">
			<h4 align="center">작성이 필요합니다</h4>
			<br>
	</c:if>
	<c:if test = "${not empty in}">
	<c:import url="/household/HouseholdAnalyticsIn.jsp" />
	<table>
		<tr>
			<th>카테고리</th><th>금액</th>
		</tr>
		<tr>
			<td>${insum.category}</td><td>${insum.price }원</td>
		</tr>	
		<c:forEach var="input" items="${in}">
		<tr>
			<td>${input.category}</td><td>${input.price }원</td>
		</tr>	
		</c:forEach>
	</table>
	</c:if>
	<br>
</div>

<div class="col" style="text-align:center">
<h1>VS</h1><br>
<input class="btn btn-dark" type="button" value="목록 이동" onclick="javscript:moveback()" >
</div>

<div class="col-lg-5" style="margin-top:0px;">
<h4 align="center">지출</h4>

<c:if test = "${empty out}">
		<h4 align="center">작성이 필요합니다</h4>
		<br>
</c:if> 
<c:if test = "${not empty out}">
<c:import url="/household/HouseholdAnalyticsOut.jsp"/>
<table>
	<tr>
		<th>카테고리</th><th>금액</th>
	</tr>
	<tr>
			<td>${outsum.category}</td><td>${outsum.price }원</td>
	</tr>	
	<c:forEach var="output" items="${out}">
	<tr>
		<td>${output.category}</td><td>${output.price }원</td>
	</tr>	
	</c:forEach>
</table>
</c:if>
<br>

</div>
	
	</div>
	<!-- End of row -->
	
	</div>
     <!-- /.container-fluid -->

   </div>
   <!-- End of Main Content -->
      
      
     </div>
  <!-- End of content Wrapper -->
</div>
<!-- End of Page Wrapper -->
	
</body>
</html>