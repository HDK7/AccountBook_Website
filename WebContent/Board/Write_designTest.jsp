<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>

<script type="text/javascript">

function check(){
	var form = document.getElementById("writeform");
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

<c:if test="${sessionScope.id != null }">
<!-- Page Wrapper -->
<div id="wrapper">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

  <!-- Main Content -->
 <div id="content">

   <!-- Begin Page Content -->
   <div class="container-fluid">

     <!-- Page Heading -->
     <h1 class="h3 mb-2 text-gray-800">자유게시판</h1>

     <!-- Write Form -->
     <div class="card shadow mb-4">
       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
         <h6 class="m-0 font-weight-bold text-dark">글 작성</h6>
       </div>
       
      <div class="card-body">
       <div class="table-responsive">
		<form action="${pageContext.request.contextPath }/WriteController_free" method="post" id="writeform" onsubmit="return check()">
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
      
     </div>
  <!-- End of content Wrapper -->
</div>
<!-- End of Page Wrapper -->


</c:if>
<c:if test="${sessionScope.id ==null }">
		<script type="text/javascript">
		alert("로그인을 해야 글작성이 가능합니다");
		location.href="${pageContext.request.contextPath }/view/Login.jsp";
		</script>
</c:if>

</body>
</html>