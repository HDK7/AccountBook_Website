<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function delConfirm(replyseq){
	var result = confirm("정말로 삭제할까요?");
	if(result){
	    location.href="http://localhost:8081/Project_semi/DelReplyController?replyseq=" + String(replyseq)
	}else{
	    alert("취소 되었습니다.");
	}
}

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
function checkFunc(){
	if(httpRequest.readyState == 4){
		var resultText = httpRequest.responseText;
		document.location.reload();					
	}
}

</script>
</head>
<body>
	<c:import url="/ListController">
		<c:param name="colcnt" value = "10"/>
		<c:param name="sequence" value="${param.sequence }"/>
	</c:import>
	<h3>댓글 목록</h3>	
		<c:if test="${requestScope.ogsize != 0}"> 
			<table border="1" cellspacing="0" >
				<c:forEach var="reply" items="${list }">
					<tr>
						<td>${reply.getId() }</td><td>${reply.getContent() }</td><td>${reply.getW_date() }</td>
							<c:if test="${sessionScope.id eq 'admin'||sessionScope.id eq reply.getId()}">  
								<td><a href="javascript:delConfirm(${reply.getReplyseq()})">삭제</a></td>
							</c:if>					
					</tr>
				</c:forEach>
			</table>	
		</c:if> 
		<%-- 
		<c:forEach var="pagenum" begin= "1" end  = "${size}">
			<a href="http://localhost:8081/Project_semi/ReadController?seq=5&pagenum=${pagenum}" >${pagenum}</a>
		</c:forEach>
		--%>
	
	
	<h3>댓글 작성</h3>
		<form id="writeCommentForm">
			<input type="text" name="content"/><input type="button" value="작성" onclick="writeCmt(${param.sequence})" />
		</form>
</body>
</html>