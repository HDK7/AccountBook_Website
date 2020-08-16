<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- chart.js 파일 import -->
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> <!-- 차트 링크 --> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<c:import url="/view/Menu.jsp" />

	<div class="container"> 
		<canvas id="myChart1" width="500" height="180"></canvas> 
	</div>
	<!-- 부트스트랩 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script>
		<!-- 변수입력 공간 -->
		var labels =[];
		console.log(labels);
		var data = [];
		var backgroundColor = []; //추가
		var borderColor = []; //추가
		var back_color = ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2),rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)']; //(추가)
		var border_color = ['rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)','rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)']; // (추가)
		var tmp_i = 0;
	</script>

	
	<c:forEach var="k" items="${cglist }">
		<script>
			labels.push('${k.getDate()}');
			data.push('${k.getPrice()}');
			backgroundColor.push(back_color[tmp_i]); // 추가
			borderColor.push(border_color[tmp_i]); // 추가
			//tmp_i += 1; // 추가 (색다르게할꺼면 추가)
		</script>
	</c:forEach>
	
	<script>
		console.log(labels);
		console.log(data);
	</script>
	<!-- 차트 -->
	<script> 
		console.log(labels);
		console.log(data);
		var ctx = document.getElementById('myChart1').getContext('2d'); 
		var title = "<%= request.getParameter("category") %>";
		console.log(title);
		var chart = new Chart(ctx, { // 챠트 종류를 선택 
			type: 'bar', // 'line' <수정>
			// 챠트를 그릴 데이타 
			data: { 
				labels:labels,//['January', 'February', 'March', 'April', 'May', 'June', 'July'], // 가로축 표시
				datasets: [{ 
					label: title,//'My First dataset', 
					backgroundColor: 'transparent', 
					borderColor: 'red', 
					data: data,//[0, 10, 5, 2, 20, 30, 45] // 수치
					//
					backgroundColor: backgroundColor,
					borderColor: borderColor,
					borderWidth: 1
					
				}] 
			}, 
			// 옵션 
			options: {scales :{ yAxes: [{ ticks: { beginAtZero: true } }] }
			}}); 
	</script>
</body>
</html>