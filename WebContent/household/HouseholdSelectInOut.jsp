<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a876b41567.js" crossorigin="anonymous"></script>
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<c:if test="${sessionScope.id == null }">
		<script type="text/javascript">
		alert("로그인 후 가계부 관리가 가능합니다");
		location.href="${pageContext.request.contextPath }/view/Login.jsp"
		</script>
</c:if>
<c:import url="/view/Menu.jsp" />
	
<!-- Page Wrapper -->
<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
<div id="content" style="margin-left:15%; margin-right:15%">

<!-- Begin Page Content -->
<div class="container-fluid" style="min-height:800px">
<!-- Page Heading -->
     <h1 class="h3 mb-2 text-gray-800"> 나의 가계부</h1>

<div class="card shadow mb-4">	
	<div class="card-header py-3" style=" margin-left: 0px; margin-right: 0px; text-align:center">
		<h6 class="m-0 font-weight-bold text-dark">가계부 관리 메뉴</h6>
	</div>
<div class="card-body" style="margin-left:5px; margin-right:5px">
<div class="row">
<div class="col-lg-6">
 
	<div class="card mb-4 border-left-primary shadow" style="width:500px; height:200px;">
		<div class="card-header" style="border-bottom:none; background-color:white; margin-left: 0px; margin-right: 0px; text-align:center">
            <h6 class="m-0 font-weight-bold text-primary">가계부 작성</h6>
        </div>
	    <div class="card-body">
			 <a class="col btn btn-primary btn-lg btn-block" href = "${pageContext.request.contextPath }/hhSelectMonthController"> 
			 <i  style="font-size:60px;" class="fas fa-edit"></i> 
			 </a>	
		</div>
	</div>


</div>

<div class="col-lg-6">
	<div class="card mb-4 border-left-danger shadow" style="width:500px; height:200px;">
		<div class="card-header" style="border-bottom:none; background-color:white; margin-left: 0px; margin-right: 0px; text-align:center">
	          <h6 class="m-0 font-weight-bold text-danger">통합 월별 통계 보기</h6>
	       </div>
	    <div class="card-body">
			 <a class="col btn btn-danger btn-lg btn-block" href = "${pageContext.request.contextPath }/hhSelectMonthController2"> 
			 <i style="font-size:60px;" class="fas fa-chart-pie"></i>
			 </a>
		</div>
	</div>
</div>
</div>

<div class="row">
<div class="col-lg-6">
	<div class="card mb-4 border-left-info shadow" style="width:500px; height:200px;">
		<div class="card-header" style="border-bottom:none; background-color:white; margin-left: 0px; margin-right: 0px; text-align:center">
           <h6 class="m-0 font-weight-bold text-info">수입/지출 월별 통계</h6>
        </div>
	    <div class="card-body">
			 <a class="col btn btn-info btn-lg btn-block" href = "${pageContext.request.contextPath }/household/HouseholdYearView.jsp"> 
			 <i style="font-size:60px;" class="fas fa-chart-line"></i>
			 </a>
		</div>
	</div>
</div>
<div class="col-lg-6">	
	<div class="card mb-4 border-left-success shadow" style="width:500px; height:200px;">
		<div class="card-header" style="border-bottom:none; background-color:white; margin-left: 0px; margin-right: 0px; text-align:center">
           <h6 class="m-0 font-weight-bold text-success">카테고리별 월별 통계</h6>
        </div>
	    <div class="card-body">
			 <a class="col btn btn-success btn-lg btn-block" href = "${pageContext.request.contextPath }/hhSelectCategoryController"> 
			 <i style="font-size:60px;" class="fas fa-chart-bar"></i>
			 </a>
		</div>
	</div>
</div>
</div>

</div>
</div>
	
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