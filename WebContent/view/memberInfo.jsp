<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<script>
function check() {
	var idTxt = document.InsertForm.id;
	var pwTxt = document.InsertForm.pwd;
	var nameTxt = document.InsertForm.name;
	var emailTxt = document.InsertForm.email;
	var addressTxt = document.InsertForm.address;
	
	//alert("?"); //출력확인
	
	
	if (pwTxt.value=="") {
		alert("비밀번호를 입력하세요")
		pwTxt.value=""
		pwTxt.focus();
		return false;
	}
	
	if (nameTxt.value=="") {
		alert("이름을 입력하세요")
		nameTxt.value=""
		nameTxt.focus();
		return false;
	}
	
	if (emailTxt.value=="") {
		alert("이메일을 입력하세요")
		emailTxt.value=""
		emailTxt.focus();
		return false;
	}
	
	if (addressTxt.value=="") {
		alert("주소를 입력하세요")
		addressTxt.value=""
		addressTxt.focus();
		return false;
	}
}
	
</script>
<body>
	<!-- request의 m객체에 정보저장 -->
	<c:import url="/view/Menu.jsp" />
	
  <div id="wrapper">

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content" style= "margin-left: 30%; margin-right: 30%;">

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">회원 정보 수정</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3" style="margin-left: 0px; margin-right: 0px; text-align:center">
              <h6 class="m-0 font-weight-bold text-dark">회원 정보</h6>
            </div>
            
            <div class="card-body" style= "margin-left: 5%; margin-right: 5%;">
            	<form action="${pageContext.request.contextPath }/MemberEditController" method="post" name="InsertForm" onsubmit="return check()">
					<div class="form-group row">
						<label for="id" class="col-sm-4">
						아이디 : 
						</label>
						<input class="col-sm-8 form-control" type="text" name="id" value="${m.id }" readonly><br>
					</div>
					
					<div class="form-group row">
						<label for="pwd" class="col-sm-4"> 
						비밀번호 : 
						</label>
						<input class="col-sm-8 form-control" type="password" name="pwd" value="${m.password }"><br>
					</div>	
					<div class="form-group row">
						<label for="name" class="col-sm-4"> 
						이름 : 
						</label>	
						<input class="col-sm-8 form-control" type="text" name="name" value="${m.name }"><br>
					</div>
					<div class="form-group row">
						<label for="email" class="col-sm-4"> 
						이메일 : 
						</label>
						<input class="col-sm-8 form-control" type="text" name="email" value="${m.email }"><br>
					</div>
					<div class="form-group row">
						<label for="address" class="col-sm-4"> 
						주소 : 
						</label>
						<input class="col-sm-8 form-control" type="text" name="address" value="${m.address }"><br>
					</div>
					<div class="form-group row">
						<label for="address" class="col-sm-4"> 
						점수 : 
						</label>
						<input class="col-sm-8 form-control" type="text" name="score" value="${m.score }" readonly><br>
					</div>
					<div class="form-group row">
						<label for="status" class="col-sm-4"> 
						상태 : 
						</label>	
						<input class="col-sm-8 form-control " type="text" name="status" value="${m.status }" readonly><br>
					</div>	
					<div class="form-group row">
						<label for="cls" class="col-sm-4"> 
						등급 : 
						</label>
						<input class="col-sm-8 form-control" type="text" name="cls" value="${m.cls }" readonly><br>
					</div>
					<div class="form-group row">	
						<input class="col btn btn-dark" type="submit" onclick="return confirm('수정하시겠습니까?')" value="정보수정">
					</div>
						<a style="float:right" href="${pageContext.request.contextPath }/DelController" onclick="return confirm('탈퇴하시겠습니까?')">회원탈퇴</a>
				 </form>
				</div>
            </div>
          </div>

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
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
      
</body>
</html>