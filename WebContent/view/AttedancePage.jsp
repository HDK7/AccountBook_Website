<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
	<c:import url="/view/Menu.jsp" /> <!-- 메뉴페이지 -->
	
	<!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content" style="margin-left:15%; margin-right:15%">

        <!-- Begin Page Content -->
        <div class="container-fluid" style="min-height:800px">
	

	<br>
	<div style="text-align:center;">
		<a class="btn btn-dark" href="${pageContext.request.contextPath }/MemberAttendanceController" target="_blank" onClick="window.open(this.href, '', 'width=300px, height=150px'); return false;">출석 체크</a>
	</div>
	<br>
	<c:import url="/AttendanceCalendarController" />
	<br>
	<br>
		</div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
	
	
</body>
</html>