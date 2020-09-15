<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
</head>

<body>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<canvas id="myChart2" width="400" height="400"></canvas>
	
	<!-- 데이터 선언 -->
	<script>
		var labels = [];
		var data = [];
		var color = [];

		function addlabel(label) {
			labels.push(label);
		}
		function adddata(adata) {
			data.push(adata);
		}
		function addcolor(acolor) {
			color.push(acolor);
		}
	</script>

	<!-- 지출 price, category 데이터 가져오기-->
	<c:forEach var="out" items="${out}">
		<script type="text/javascript">
			addlabel('${out.category}');
			adddata('${out.price}');
		</script>
	</c:forEach>
	
	<!-- 지출 color 데이터 가져오기-->
	<c:forEach var="color" items="${outcolors}">
		<script type="text/javascript">
			addcolor('${color}');
		</script>
	</c:forEach>
	
	<!-- 지출 그래프 chart -->
	<script>
		var chart = new Chart(document.getElementById('myChart2'), {
			type : 'doughnut',
			data : {
				labels : labels,

				datasets : [ {
					data : data,
					backgroundColor : color,
					hoverBackgroundColor : color
				} ]
			},
			options : {
				responsive : false,
				legend : {
					display : false
				},
				//pieceLabel: { mode:"label", position:"outside", fontSize: 11, fontStyle: 'bold' }
				plugins : {
					labels : {
						// render 'label', 'value', 'percentage', 'image' or custom function, default is 'percentage'
						render : function(args) {
							return args.label + '\n' + args.percentage + '%';
						}
					}
				}
			}
		});
	</script>
</body>
</html>