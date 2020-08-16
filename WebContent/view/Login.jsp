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

  <title>kitri login - Login</title>

  <!-- Custom fonts for this template-->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-dark">
<!-- 홍석 추가 -->
<c:if test="${flag2== false }">
		<script type="text/javascript">
		alert("로그인을 실패했습니다");
		</script>
</c:if>
  <div class="container">
<!-- 홍석 추가 -->
    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-9 mx-auto">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                  </div>
                  <form class="user" action="${pageContext.request.contextPath }/LoginController" method="post">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" name="id" placeholder="아이디">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" name="pwd" placeholder="비밀번호">
                    </div>
                    <!-- 
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                     -->
                    </div>
                    <input type="submit" class="btn btn-dark btn-user btn-block" value="Login">
                  </form>
                  <hr>
                  <div class="text-center">
               		 <a class="small" href="${pageContext.request.contextPath }/view/pwdSearch.jsp" onClick="window.open(this.href, '', 'width=500, height=300'); return false;">Forgot Password?</a>
               		 <a class="small" href="${pageContext.request.contextPath }/view/idSearch.jsp" onClick="window.open(this.href, '', 'width=500, height=300'); return false;">Forgot Id?</a>
                  </div>
                  <div class="text-center small">
                   	아이디가 없으시다면? <a href="${pageContext.request.contextPath }/view/JoinForm.jsp">회원가입</a> <!-- 정상적으로 링크 연결됨. -->
                  </div>
                  <hr>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath }/startbootstrap-sb-admin-2-gh-pages/js/sb-admin-2.min.js"></script>

</body>

</html>
