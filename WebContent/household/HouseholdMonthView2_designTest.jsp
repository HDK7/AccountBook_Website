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
<style>
td{text-align:center;}
</style>
</head>
<body>
	<c:import url="/view/Menu.jsp" />
	<!-- Page Wrapper -->
<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
 <div id="content">

   <!-- Begin Page Content -->
   <div class="container-fluid">
   
	<div class="card shadow mb-4">
       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
         <h6 class="m-0 font-weight-bold text-dark">해당 월을 클릭하시면 이동합니다</h6>
       </div>
		<!-- Card-body -->
      <div class="card-body">
       <div class="table-responsive">
	       
		<table class="table table-bordered" width="100%" cellspacing="0">
			<tr>
				<th>연도</th><th>월</th><th>입력갯수</th>
			<c:forEach var="m" items="${m }">
				<tr>
					<td>${m.getDate() }</td>
					<td><a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath }/hhGetGraphData?year=${m.getDate()}&month=${m.getContent()}">${m.getContent() }</a></td>
					<td>${m.getKey() }</td>
				</tr>
			</c:forEach>	
		</table>
		</div>
		</div>
		<!-- End of card body -->
       </div>
       <!-- End of card -->
		
		
	
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