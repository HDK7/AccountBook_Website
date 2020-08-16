<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>
</head>
<body>
	
	
	<c:import url="/FreeListController"></c:import>	
	
		
		
	   <h3>글 목록</h3>
	   <a href="${pageContext.request.contextPath}/Board/Write_designTest.jsp" style="color:black">글작성</a>
  			
      <table border="1" cellspacing="0">
         <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성시간</th>
            <th>조회수</th>
            <th>추천수</th>
         </tr>
         <c:forEach var="b" items="${list1 }">
            <tr>
               <td>${b.sequence}</td>
               <td>
                  <a href="${pageContext.request.contextPath }/ReadController?seq=${b.sequence }" style="color:black">${b.title}</a>
               </td>
               <td>${b.writer}</td>
               <td>${b.time}</td>
               <td>${b.viewcount}</td>
               <td>${b.recommend_cnt}</td>
            </tr>
         </c:forEach>
      </table>
      
      
      <c:forEach var="i" begin="1" end="${totalpage }">
      <a href="${pageContext.request.contextPath }/Board/List_free.jsp?pagenum=${i}" style="color:black">${i}</a>
      </c:forEach>
      
      
      


	
	

</body>
</html>