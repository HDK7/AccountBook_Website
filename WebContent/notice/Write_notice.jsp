<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script>
function check(){
	var form = document.getElementById("writenoticeform");
	var title =form.title.value;
	var content =form.content.value;
	
	if(!content || !title){ // 여기까지 했음.
		alert("공란이 있습니다");
		return false;
	}	

}
</script>
<style>
</style>
</head>

<body id="page-top">

<c:import url="/view/Menu.jsp" />

<c:if test="${sessionScope.cls == '관리자' }">

<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
 <div id="content">

   <!-- Begin Page Content -->
   <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-2 text-gray-800">공지사항</h1>

     <!-- Write Form -->
     <div class="card shadow mb-4">
       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
         <h6 class="m-0 font-weight-bold text-dark">글 작성</h6>
       </div>
       
      <div class="card-body">
       <div class="table-responsive">
		<form action="${pageContext.request.contextPath }/WriteNoticeController" method="post" id="writenoticeform" onsubmit="return check()">
		<div class="form-group">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"	>
				<tr>
					<th>작성자</th>
					<td><input class="form-control" type="text" name="writer" size="60" value="${sessionScope.id }" readonly></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input class="form-control" type="text" name="title" size="60"></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea class="form-control" rows="20" cols="60" name="content"></textarea>	</td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="btn btn-secondary float-right" type="reset" value="취소">
						<input class="btn btn-dark float-right" type="submit" value="작성">
					</td>
				</tr>		
			</table>
			</div>
		</form>
		</div>
		</div>
		<!-- End of card body -->
       </div>
       <!-- End of card -->   

     </div>
     <!-- /.container-fluid -->

   </div>
   <!-- End of Main Content -->
      
	<!-- Footer -->
	<footer class="sticky-footer bg-white">
	  <div class="container my-auto">
	    <div class="copyright text-center my-auto">
	      <span>Copyright &copy; Wallet team</span>
	    </div>
	  </div>
	</footer>
	<!-- End of Footer -->
      
     </div>
  <!-- End of content Wrapper -->
</div>
<!-- End of Page Wrapper -->

</c:if>
<c:if test="${sessionScope.cls != '관리자'}">
		<script type="text/javascript">
		alert("관리자만 글작성이 가능합니다");
		location.href="${pageContext.request.contextPath }/notice/List_notice.jsp?pagenum=1";
		</script>
</c:if>
</body>
</html>