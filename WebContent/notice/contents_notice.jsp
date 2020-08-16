<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a876b41567.js" crossorigin="anonymous"></script>

<script type="text/javascript">

	function del(sequence){
		var ans = confirm("삭제 하시겠습니까?");
		if(ans != "0")
			{
				location.href = "${pageContext.request.contextPath}/DelNoticeController?sequence="+sequence;
			}
	     
	}
	function list(){
		location.href ="${pageContext.request.contextPath}/NoticeListController"
	}


</script>


<style>
#heartBtn{
  cursor: pointer;
}
</style>
</head>
<body>

<c:if test="${sessionScope.id == b.writer }">
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
	     <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	
	     <!-- Edit Form Card -->
	     <div class="card shadow mb-4">
	       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
	         <h6 class="m-0 font-weight-bold text-dark">글읽기</h6>
	       </div>
	       <!-- Card-body -->
	      <div class="card-body">
	       <div class="table-responsive">		
	       		
	<form action="${pageContext.request.contextPath }/notice/EditBoard_notice.jsp" method="get">
		
		<table border="1" cellspacint="0">
				<tr>
						<th>글번호</th>
				
				<td colspan="2"><input class="form-control" type="text" value="${b.sequence }" name="sequence" size="60" readonly>
				<i class="far fa-eye">${b.viewcount}</i> </td>	
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
			
			<input class="btn float-right" type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/NoticeListController' "><br>
		 </div>
		</form>
	
</c:if>	

<c:if test="${sessionScope.id != b.writer }">

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
	     <h1 class="h3 mb-2 text-gray-800">공지사항</h1>
	
	     <!-- Edit Form Card -->
	     <div class="card shadow mb-4">
	       <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
	         <h6 class="m-0 font-weight-bold text-dark">글읽기</h6>
	       </div>
	       <!-- Card-body -->
	      <div class="card-body">
	       <div class="table-responsive">		
	       		
	<form action="${pageContext.request.contextPath }/notice/EditBoard_notice.jsp" method="post">
		
		<table border="1" cellspacint="0">
				<tr>
						<th>글번호</th>
				
				<td colspan="2"><input class="form-control" type="text" value="${b.sequence }" name="sequence" size="60" readonly>
				<i class="far fa-eye">${b.viewcount }</i> </td>	
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

			</table> 
			
			<input class="btn float-right" type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/NoticeListController'" ><br>
		 </div>
		</form>
	
</c:if>







</body>
</html>