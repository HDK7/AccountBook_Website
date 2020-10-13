<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function oncheck() {
		var form = document.getElementById('writeForm');
		var date = form.date.value;
		if (date == '') {
			alert("날짜를 입력하세요");
			return false;
		}
		return true;
	}

	function delConfirm(year, month) {
		var result = confirm("정말로 삭제할까요?");
		if (result) {
			location.href = "http://localhost:8081/AccountBook_Website/hhDeleteMonthController?year="
					+ String(year) + "&month=" + String(month);
		} else {
			alert("취소 되었습니다.");
		}
	}
</script>
<style>
td {
	text-align: center;
}
</style>

</head>
<body>
	<c:import url="/view/Menu.jsp" />
	<br>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">


					<div class="card shadow mb-4">
						<div class="card-header py-3"
							style="margin-left: 0px; margin-right: 0px; text-align: center">
							<h6 class="m-0 font-weight-bold text-dark">새로운 월 추가</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<form
									action="${pageContext.request.contextPath }/hhWriteController"
									method="post" id="writeForm" onsubmit="return oncheck()">
									<div class="form-group">
										<input type="hidden" name="type" value="3"> <input
											type="hidden" name="category" value="자동생성"> <input
											type="hidden" name="content" value=" "> <input
											type="hidden" name="price" value="0">

										<table style="margin-left: auto; margin-right: auto;">
											<tr>
												<td>날짜 :</td>
												<td><input class="form-control" type="month"
													name="date"></td>
											</tr>
											<tr>
												<td></td>
												<td><input class="btn btn-dark float-right"
													type="submit" value="생성" />
											</tr>
										</table>
									</div>
								</form>
							</div>
						</div>
						<!-- End of card body -->
					</div>
					<!-- End of card -->

					<div class="card shadow mb-4">
						<div class="card-header py-3"
							style="margin-left: 0px; margin-right: 0px; text-align: center">
							<h6 class="m-0 font-weight-bold text-dark">해당 월을 클릭하시면 이동합니다</h6>
						</div>
						<!-- Card-body -->
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<tr>
										<th>연도</th>
										<th>월</th>
										<th>입력갯수</th>
										<th></th>
										<c:forEach var="m" items="${m }">
											<tr>
												<td>${m.getDate() }</td>
												<td><a class="btn btn-secondary btn-sm"
													href="${pageContext.request.contextPath }/hhGetMonthController?year=${m.getDate()}&month=${m.getContent()}">${m.getContent() }</a></td>
												<td>${m.getKey() }</td>
												<td><a
													href="javascript:delConfirm(${m.getDate()}, ${m.getContent()})">삭제</a></td>
											</tr>
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

	<style>
td {
	margin: 20px;
}
</style>

</body>
</html>