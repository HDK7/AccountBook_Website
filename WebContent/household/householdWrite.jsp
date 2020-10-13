<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//ajax를 위한 XMLHttp 함수
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

//공란 확인 및 전송
function hhWrite(year, month){
	var form = document.getElementById("hhWriteForm");
	var type = form.type.value;
	var date = form.date.value;
	var category = form.category.value;
	var content = form.content.value;
	var price = form.price.value;
	
	
	if(!category || !content || !price || !type ){ // 여기까지 했음.
		alert("공란이 있습니다");
		return false;
	}
	else{
		if(year != date.substring(0,4) || month !=date.substring(5,7)){
			alert("연도와 월이 다릅니다");
			return false;
		}
		else{
			var param = "content=" + content + "&type=" + type + "&date=" + date + "&category=" + category + "&price=" + price;		
		
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "http://localhost:8081/AccountBook_Website/hhWriteController",true);
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
			httpRequest.send(param);
		}
	}
}

//카테고리 추가
function hhCategoryWrite(year, month){
	var form = document.getElementById("hhWriteForm");
	var type = 3;	
	var category = form.addcategory.value;
	var content = " ";
	var price = 0;
	if(Number(month) >= 1 && Number(month) <= 9){
		month = '0' + month;
	}
	var date = year + '-' + month;	
	
	if(!category ){ // 여기까지 했음.
		alert("카테고리를 입력해 주세요");
		return false;
	}
	else{
			var param = "content=" + content + "&type=" + type + "&date=" + date + "&category=" + category + "&price=" + price;		
		
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "http://localhost:8081/AccountBook_Website/hhWriteCatController",true);
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
			httpRequest.send(param);
		}
	}
	
//카테고리 삭제
function categoryDelete(){
	var form = document.getElementById("hhWriteForm");
	var category = form.category.value;	
	var delConfirm = confirm('정말 삭제하시겠습니까?');
	if(delConfirm ){
			var param ="&category=" + category;
			
			httpRequest = getXMLHttpRequest();
			httpRequest.onreadystatechange = checkFunc;
			httpRequest.open("POST", "http://localhost:8081/AccountBook_Website/hhDeleteCategory",true);
			httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=UTF-8');
			httpRequest.send(param);
	}
	else{
		alert("취소 되었습니다");
	}
}

//서버 응답 후 새로고침
function checkFunc(){
	if(httpRequest.readyState == 4){
		var resultText = httpRequest.responseText;
		document.location.reload();					
	}
}

</script>
</head>
<body>
	<c:import url="/hhGetCatAllController" />
	
	<!-- 가계부 입력 폼 -->
	<form action="" id="hhWriteForm">
		<table style="margin-left: auto; margin-right: auto;">
			<!-- 수입지출 선택 -->
			<tr>
				<td></td>
				<td><input type="radio" name="type" value="0">지출<input
					type="radio" name="type" value="1">수입</td>
			</tr>
			
			<!-- 날짜 선택 -->
			<tr>
				<td>날짜 :</td>
				<td><input type="date" name="date"></td>
			</tr>
			
			<!-- 카테고리 선택, 삭제 -->
			<tr>
				<td>카테고리 :</td>
				<td><select name="category" id="category">
						<c:forEach var="cat" items="${cat}">
							<c:if test="${cat.category ne '자동생성'}">
								<option value="${cat.category }">${cat.category }</option>
							</c:if>
						</c:forEach>
				</select></td>
				<td><input type="button" onclick="categoryDelete()"
					value="선택 카테고리 삭제"></td>
			</tr>
			
			<!-- 카테고리 추가 -->
			<tr>
				<td></td>
				<td><input type="text" name="addcategory"></td>
				<td><input type="button"
					onclick="hhCategoryWrite(${year}, ${month})" value="카테고리추가"></td>
			</tr>
			
			<!-- 내용 -->
			<tr>
				<td>내용 :</td>
				<td><input type="text" name="content"></td>
			</tr>
			
			<!-- 금액 -->
			<tr>
				<td>금액 :</td>
				<td><input type="number" name="price"></td>
			</tr>
			
			<!-- 초기화, 제출 -->
			<tr>
				<td></td>
				<td><input type="button" value="작성 완료"
					onclick="hhWrite(${year},${month})"> <input type="reset"
					value="초기화"></td>
			</tr>
		</table>
	</form>
</body>
</html>