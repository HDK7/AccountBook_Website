<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>회원관리Page</title>

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
<!-- id="page-top" 왜 썼는지 모르겠음. 오류나면 확인 필수 -->

<jsp:include page ="./Menu.jsp" /> 
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content" style="margin-left:15%; margin-right:15%">

        <!-- Begin Page Content -->
        <div class="container-fluid" style="min-height:800px">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">관리자 페이지</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3" style=" margin-left: 0px; margin-right: 0px; text-align:center">
              <h6 class="m-0 font-weight-bold text-dark">회원 정보</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>아이디</th>
                      <th>이름</th>
                      <th>이메일</th>
                      <th>주소</th>
        			  <th>상태</th>
        			  <th>회원등급</th>
        			  <th>점수</th>
        			  <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="m" items="${m }">
            		<c:if test="${m.getId() ne 'admin' }"> <!-- 관리자가 아닐때만 출력 -->
              		<tr>
	                  <td>${m.getId() }</td>
	                  <td>${m.getName() }</td>
	                  <td>${m.getEmail() }</td>
	                  <td>${m.getAddress() }</td>
	                  <td>${m.getStatus() }</td>
	                  <td>${m.getCls() }</td>
	                  <td>${m.getScore() }</td>
	                  <td><a href="${pageContext.request.contextPath }/MemberDelController?id=${m.getId() }" onclick="return confirm('삭제하시겠습니까?')">삭제</a></td>
				   </tr>
            	   </c:if>
         		   </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

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

</body>
<style>
div.dataTables_info{ display: none}
</style>

</html>
