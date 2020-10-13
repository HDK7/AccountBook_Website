<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


<script>
<!-- 삭제 재확인 -->
function delConfirm(replyseq){
	var result = confirm("정말로 삭제할까요?");
	if(result){
	    location.href="http://localhost:8081/Project_semi/DelReplyController?replyseq=" + String(replyseq)
	}else{
	    alert("취소 되었습니다.");
	}
}

<!-- ajax를 위한 XMLHttp 함수 -->
function getXMLHttpRequest(){
	var httpRequest = null;
	
	if(window.ActiveXObject){
		try{
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			try{
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");				
			}catch(e2){ httpRequest = null;}
		}
	}
	else if(window.XMLHttpRequest){
		httpRequest = new window.XMLHttpRequest();
	}
	return httpRequest;
}

<!-- 댓글 작성 함수 -->
function writeCmt(sequence){
	var form = document.getElementById("writeCommentForm");
	var content = form.content.value;
	
	if(!content){
		alert("내용을 입력하세요.");
		return false;
	}
	else{
		var param = "content=" + content +"&sequence=" + parseInt(sequence);
		
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = checkFunc;
		httpRequest.open("POST", "http://localhost:8081/Project_semi/WriteController",true);
		httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
		httpRequest.send(param);
	}
}

<!-- 통신 완료 후 새로고침 -->
function checkFunc(){
	if(httpRequest.readyState == 4){
		var resultText = httpRequest.responseText;
		document.location.reload();					
	}
}

</script>

</head>
<body>
	<!-- 컨트롤러 Import -->
	<c:import url="/ListController">
		<c:param name="colcnt" value="10" />
		<c:param name="sequence" value="${param.sequence }" />
	</c:import>
	
	<!-- 댓글 목록 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3"
			style="margin-left: 0px; margin-right: 0px; text-align: center">
			<h6 class="m-0 font-weight-bold text-dark">댓글 목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<c:if test="${requestScope.ogsize != 0}">
					<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
						<thead style="display: none">
							<tr>
								<th width="10%">아이디</th>
								<th>내용</th>
								<th>작성시간</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="reply" items="${list }">
								<tr>
									<td>${reply.getId() }</td>
									<td>${reply.getContent() }</td>
									<td>${reply.getW_date() }</td>
									<c:if
										test="${sessionScope.id eq 'admin'||sessionScope.id eq reply.getId()}">
										<td><a
											href="javascript:delConfirm(${reply.getReplyseq()})">삭제</a></td>
									</c:if>

									<c:if
										test="${sessionScope.id != 'admin' && sessionScope.id != reply.getId() }">
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
		<!-- End of Card-body -->
	</div>
	<!-- End of Card -->
	
	<!-- 댓글 작성 버튼 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3"
			style="margin-left: 0px; margin-right: 0px; text-align: center">
			<h6 class="m-0 font-weight-bold text-dark">댓글 작성</h6>
		</div>

		<div class="card-body" style="margin-left: 0px; margin-right: 0px;">
			<form id="writeCommentForm">
				<div class="mx-auto form-group row" width=100%>
					<input class="col-sm-10 form-control" type="text" name="content" />
					<input class="col-sm-2 btn btn-secondary" type="button" value="작성" onclick="writeCmt(${param.sequence})" />
				</div>
			</form>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/js/demo/datatables-demo.js"></script>

	<style>
		div.dataTables_filter, div.dataTables_info, div.dataTables_length {
			display: none
		}
	</style>
</body>
</html>