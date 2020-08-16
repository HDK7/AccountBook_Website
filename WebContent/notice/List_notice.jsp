<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>Insert title here</title>

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


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
   <div class="container-fluid" style="min-height:800px">

     <!-- Page Heading -->
     <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	   
	
	<div class="card shadow mb-4">
       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
         <h6 class="m-0 font-weight-bold text-dark">글 목록</h6>
       </div>
       <div class="card-body">
       	<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">	
		     <thead>
		         <tr>
		            <th>글번호</th>
		            <th width=400px>제목</th>
		            <th>작성자</th>
		            <th>작성시간</th>
		            <th>조회수</th>
		         </tr>
		       </thead>
       			<tbody>
		         <c:forEach var="b" items="${list }">
		            <tr>
		               <td>${b.sequence}</td>
		               <td>
		                  <a href="${pageContext.request.contextPath }/ReadNoticeController?seq=${b.sequence }" style="color:black">${b.title}</a>
		               </td>
		               <td>${b.writer}</td>
		               <td>${b.time}</td>
		               <td>${b.viewcount}</td>
		            </tr>
		         </c:forEach>
      			 </tbody>
   			</table>
         </div>
         <!-- End of table -->
         	   <a href="${pageContext.request.contextPath}/notice/Write_notice.jsp" class="btn btn-dark float-right">글작성</a>
		</div>
		<!-- End of card body -->
		<!-- 
      <c:forEach var="i" begin="1" end="${totalpage }">
      	<a href="${pageContext.request.contextPath }/notice/List_notice.jsp?pagenum=${i}" class="btn btn-primary mx-auto">${i}</a>
      </c:forEach>
		 -->
        </div>
        <!-- End of card -->

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
      
	
	</div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
      
  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>


  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/js/demo/datatables-demo.js"></script>
  
  <script type="text/javascript">
  $("#dataTable").DataTable({
		order: [ [ 0, "desc" ] ]
	});
  </script>
  

<style>
div.dataTables_info{ display: none}
</style>
	
	

</body>
</html>