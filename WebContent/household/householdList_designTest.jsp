<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Custom fonts for this template -->
<link
	href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


<title>가계부</title>
<script>
	//삭제 재확인
	function delConfirm(key) {
		var result = confirm("정말로 삭제할까요?");
		if (result) {
			location.href = "http://localhost:8081/Project_semi/hhDeleteController?key="
					+ String(key)
		} else {
			alert("취소 되었습니다.");
		}
	}

	//뒤로가기
	function moveback() {
		location.href = "${pageContext.request.contextPath }/hhSelectMonthController"
	}
</script>
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
					<!-- 가계부 작성 -->
					<div class="card shadow mb-4">
						<!-- 타이틀 -->
						<div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align: center">
							<h6 class="m-0 font-weight-bold text-dark">${year}년
								${month}월 가계부 작성</h6>
						</div>
						
						<!-- 가계부 작성 폼 Import -->
						<div class="card-body">
							<c:import url="/household/householdWrite_designTest.jsp" />
						</div>
					</div>
					<!-- End of householdwrite card -->

					<!-- 가계부 목록 -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"
							style="margin-left: 0px; margin-right: 0px; text-align: center">
							<h6 class="m-0 font-weight-bold text-dark">${year}년
								${month}월 가계부 목록</h6>
						</div>

						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>날짜</th>
											<th>카테고리</th>
											<th>내용</th>
											<th>종류</th>
											<th>금액</th>
											<th>삭제</th>
										</tr>
									</thead>
									<c:forEach var="h" items="${h }">
										<c:if test="${h.type ne 3 }">
											<tr>
												<td>${h.getDate() }</td>
												<td>${h.getCategory() }</td>
												<td>${h.getContent() }</td>
												<td>
													<c:if test="${h.getType() eq 1 }">
														<!-- 수입 -->
														수입
													</c:if>
													<c:if test="${h.getType() eq 0 }">
														<!-- 지출 -->
														지출
													</c:if> 
													<c:if test="${h.getType() eq 3 }">
														<!-- 예시 -->
													</c:if>
												</td>
												<td>${h.getPrice() }</td>
												<td><a href="javascript:delConfirm(${h.getKey()})">삭제</a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
					<!-- End of card -->
					<br>
					
					<!-- 뒤로가기 버튼 -->
					<table style="margin-left: auto; margin-right: auto;">
						<tr>
							<td><input class="btn btn-dark" type="button"
								value="월 목록 이동" onclick="javscript:moveback()"></td>
						</tr>
					</table>
					<br>
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

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
		div.dataTables_info {
			display: none
		}
	</style>
</body>
</html>