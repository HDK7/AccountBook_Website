<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">

function confirmDelete(id)
{
    var ans = confirm("삭제 하시겠습니까?");
    if(ans == "0")
     {
       document.location = "delete_article.asp?id="+id;
     }
}

	function del(sequence){
		var ans = confirm("삭제 하시겠습니까?");
		if(ans != "0")
			{
				location.href = "${pageContext.request.contextPath}/DelBoardController?sequence="+sequence;
			}
	     
	}
	
	function rec(sequence){

			location.href = "${pageContext.request.contextPath}/RecController?sequence="+sequence;
					
		}
	

</script>
<style>
</style>
</head>
<body>

<c:if test="${sessionScope.id == b.writer || sessionScope.id == 'admin' }">
	
		
	<form action="${pageContext.request.contextPath }/Board/EditBoard_designTest.jsp" method="post" name="editForm" onsubmit="return check()">
		<h3 >글 읽기 </h3>
		<table border="1">
			<tr>
					<th>글번호</th>
			
			<td colspan="2"><input type="text" value="${b.sequence }" name="sequence" size="45" readonly><br>
			조회수: ${b.viewcount} ♥${b.recommend_cnt } 
</td>	
			
			</tr>
			<tr >
					<th >작성자: </th>	
					<td><input type="text" value="${b.writer}" name="writer" size="45" readonly></td>
					</tr>	
			<tr >
					<th >작성 날짜</th>
					<td><input type="text" value="${b.time }" name="time" size="45" readonly></td>						
			</tr>
			
			
				
			<tr>
				<th>글 제목</th>

				<td><input type="text" value="${b.title}" name="title" readonly size="45" ></td>

				

			</tr>	
			
			
			
			
			<tr>
				<th>글 내용</th>

				<td><textarea rows="15" cols="45" readonly name="content" >${b.content}</textarea></td>

				

			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" >
					<input type="button" value="삭제" onclick="del(${b.sequence})">
					
				</td>						
			</tr>	
		</table> 
		
		<input type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/Board/List_free_designTest.jsp?pagenum=1'" >
	</form>

	<jsp:include  page="/reply/ReplyList.jsp">
		<jsp:param value="${b.sequence }" name="sequence"/>
	</jsp:include>
</c:if>	
<c:if test="${sessionScope.id != b.writer }">

<h3 >글 읽기</h3>
<form action="${pageContext.request.contextPath }/Board/EditBoard.jsp" method="post">
		<table border="1" cellspacint="0">
			<tr>
					<th>글번호</th>
			
			<td colspan="2"><input type="text" value="${b.sequence }" name="sequence" size="45" readonly><br>
			조회수: ${b.viewcount} 좋아요수:${b.recommend_cnt}
			
			
			
				</td>	
			
			</tr>
			<tr >
					<th >작성자: </th>	
					<td><input type="text" value="${b.writer}" name="writer" size="45" readonly></td>
					</tr>	
			<tr >
					<th >작성 날짜</th>
					<td><input type="text" value="${b.time }" name="time" size="45" readonly></td>						
			</tr>
			
			
				
			<tr>
				<th>글 제목</th>
				<td><input type="text" value="${b.title}" name="title" readonly size="45"  ${str }></td>
			</tr>	
			<tr>
				<th>글 내용</th>
				<td><textarea rows="15" cols="45" readonly name="content" ${str }>${b.content}</textarea></td>
			</tr>	
			
		</table> 
		<%if(request.getAttribute("like") ==null ){ %><input type="button" value="♡" onclick="rec(${b.sequence})" ><%}
			else{%><input type="button" value="♥ " onclick="rec(${b.sequence})" ><%} %>
		
		
		<input type="button" value="목록으로" onclick="location.href='${pageContext.request.contextPath}/Board/List_free_designTest.jsp?pagenum=1'" >
	</form>
		<jsp:include  page="/reply/ReplyList.jsp">
			<jsp:param value="${b.sequence }" name="sequence"/>
		</jsp:include>
</c:if>
</body>
</html>