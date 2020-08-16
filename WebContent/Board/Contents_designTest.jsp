<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글 읽기</title>
<script src="https://kit.fontawesome.com/a876b41567.js" crossorigin="anonymous"></script>

<script type="text/javascript">


	function del(sequence){
		var ans = confirm("삭제 하시겠습니까?");
		if(ans != "0")
			{
				location.href = "${pageContext.request.contextPath}/DelBoardController?sequence="+sequence;
			}
	     
	}
	
	function rec(sequence){

			location.href = "${pageContext.request.contextPath}/RecController?sequence="+sequence;
			sequence.classList.toggle("fas fa-heart");	
		}
	

</script>

<style>
#heartBtn{
  cursor: pointer;
}
</style>

</head>
<body>
<c:if test="${sessionScope.id != null }">
	<c:import url="/view/Menu.jsp" />
	
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
	         <h6 class="m-0 font-weight-bold text-dark">글 읽기</h6>
	       </div>
	       <!-- Card-body -->
	      <div class="card-body">
	       <div class="table-responsive">
		
	 <!-- 내가 작성자일 때 -->
	<c:if test="${sessionScope.id == b.writer || sessionScope.id == 'admin' }">
		<form action="${pageContext.request.contextPath }/Board/EditBoard_designTest.jsp" method="get" name="editForm" onsubmit="return check()">
		  <div class="form-group">
			<table class="table table-bordered" width="100%" cellspacing="0"	>
				<tr>
						<th>글번호</th>
				<td colspan="2"><input class="form-control" type="text" value="${b.sequence }" name="sequence" size="60" readonly><br>
				<i class="far fa-eye"> ${b.viewcount} 
				<i class="fas fa-heart" style="color:pink;"></i> ${b.recommend_cnt}</td>	
				</tr>
				<tr >
						<th >작성자 </th>	
						<td><input class="form-control" type="text" value="${b.writer}" name="writer" size="60" readonly></td>
						</tr>	
				<tr >
						<th >작성 날짜</th>
						<td><input class="form-control" type="text" value="${b.time }" name="time" size="60" readonly></td>						
				</tr>				
				<tr>
					<th>글 제목</th>
					<td><input class="form-control" type="text" value="${b.title}" name="title" readonly size="60" ></td>
				</tr>	
				<tr>
					<th>글 내용</th>
					<td><textarea class="form-control" rows="20" cols="60" readonly name="content" >${b.content}</textarea></td>
				</tr>	
				<tr>
					<td colspan="2">
						<input class="btn btn-secondary float-right" type="button" value="삭제" onclick="del(${b.sequence})">					
						<input class="btn btn-dark float-right"  type="submit" value="수정" >
					</td>						
				</tr>	
			</table> 
			
			<input class="btn float-right" type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/FreeListController'" ><br>
		 </div>
		</form>
	
		<jsp:include  page="/reply/ReplyList_designTest.jsp">
			<jsp:param value="${b.sequence }" name="sequence"/>
		</jsp:include>
	
	</c:if>	
	
	<!-- 내가 작성자 아닐 때 -->
	<c:if test="${sessionScope.id != b.writer }">
		<form action="${pageContext.request.contextPath }/Board/EditBoard.jsp" method="post">
		  <div class="form-group">
			<table class="table table-bordered" width="100%" cellspacing="0"	>
				<tr>
						<th>글번호</th>
				
				<td colspan="2"><input class="form-control" type="text" value="${b.sequence }" name="sequence" size="60" readonly><br>
				<i class="far fa-eye"></i> ${b.viewcount} 
				<i class="fas fa-heart" style="color:pink;"></i> ${b.recommend_cnt}</td>
				</tr>
				<tr >
						<th >작성자</th>	
						<td><input class="form-control" type="text" value="${b.writer}" name="writer" size="60" readonly></td>
						</tr>	
				<tr >
						<th >작성 날짜</th>
						<td><input class="form-control" type="text" value="${b.time }" name="time" size="60" readonly></td>						
				</tr>
				
				
					
				<tr>
					<th>글 제목</th>
					<td><input class="form-control" type="text" value="${b.title}" name="title" readonly size="60"  ${str }></td>
				</tr>	
				<tr>
					<th>글 내용</th>
					<td><textarea class="form-control" rows="20" cols="60" readonly name="content" ${str }>${b.content}</textarea></td>
				</tr>	
				
			</table> 
			<%if(request.getAttribute("like") ==null)
			{%> <i class="far fa-heart" id="heartBtn" onclick="rec(${b.sequence})"></i><%}
			else{%><i class="fas fa-heart" id="heartBtn" style="color:pink;" onclick="rec(${b.sequence})"></i>
			<%}	%>
			
			
			<input class="btn float-right" type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/FreeListController'" ><br>
		</div>
		</form>
		
		<jsp:include  page="/reply/ReplyList_designTest.jsp">
			<jsp:param value="${b.sequence }" name="sequence"/>
		</jsp:include>
	</c:if>
	
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

<c:if test="${sessionScope.id == null }">
		<script type="text/javascript">
		alert("로그인을 해야 글읽기가 가능합니다");
		location.href="${pageContext.request.contextPath }/view/Login.jsp"
		</script>
</c:if>





</body>
</html>