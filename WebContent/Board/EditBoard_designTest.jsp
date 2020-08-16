<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<script type="text/javascript">
function cancel(){
	var flag=confirm("취소하시겠습니까");
	if(flag){
		location.href="${pageContext.request.contextPath }/ReadController?seq=<%=request.getParameter("sequence") %>";
	}

}
</script>
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

     <!-- Edit Form Card -->
     <div class="card shadow mb-4">
       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
         <h6 class="m-0 font-weight-bold text-dark">글 수정</h6>
       </div>
       <!-- Card-body -->
      <div class="card-body">
       <div class="table-responsive">
		<form action="${pageContext.request.contextPath }/EditBoardController" method="post">
		<% request.setCharacterEncoding("utf-8"); 
		String title=request.getParameter("title");
		String content= request.getParameter("content");
		
		%>
		  <div class="form-group">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0"	>
							<tr>
					<th>글번호</th>
			<td colspan="2"><input class="form-control" type="text" value="<%=request.getParameter("sequence") %>" name="sequence" size="60" readonly>
			<br>
			</td>	
			</tr>
			<tr >
					<th >작성자 </th>	
					<td><input class="form-control" type="text" value="<%=request.getParameter("writer") %>" name="writer" size="60" readonly></td>
					</tr>	
			<tr >
					<th >작성 날짜</th>
					<td><input class="form-control" type="text" value="<%=request.getParameter("time") %>" name="time" size="60" readonly><br></td>						
			</tr>	
			<tr>
				<th>글 제목</th>
				<td><input class="form-control" type="text" value="<%=title %>" name="title" size="60" ${str }></td>
			</tr>	
			<tr>
				<th>글 내용</th>
				<td><textarea class="form-control" rows="20" cols="60" name="content" ><%=content %></textarea></td>
			</tr>	
			<tr>
				<td colspan="2">
					<input class="btn btn-secondary float-right" type="button" value="취소" onclick="cancel()">
					<input class="btn btn-dark float-right" type="submit" value="수정">
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
<c:if test="${sessionScope.id ==null }">
		<script type="text/javascript">
		alert("로그인을 해야 글 수정이 가능합니다");
		location.href="${pageContext.request.contextPath }/view/Login.jsp";
		</script>
</c:if>

</body>
</html>