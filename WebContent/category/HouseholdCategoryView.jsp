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
         <h6 class="m-0 font-weight-bold text-dark">해당 카테고리를 클릭하시면 이동합니다</h6>
       </div>
		<!-- Card-body -->
      <div class="card-body">
       <div class="table-responsive">
	       
		<table class="table table-bordered" width="100%" cellspacing="0">
			<tr>
				<th>카테고리</th>
				
			<c:forEach var="list" items="${list }" >
				<c:if test="${list != '자동생성' && list != '카테고리 선택'}">
				<tr>
					<td><a class="btn btn-secondary btn-sm" href="${pageContext.request.contextPath }/CGController?category=${list }">${list }</a></td>	
				</tr>
				</c:if>
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