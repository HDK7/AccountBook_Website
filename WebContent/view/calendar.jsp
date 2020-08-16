<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table
    {
        border:1px solid #BDBDBD;
        text-align:center;
        width:80%;
        height:500px;
    }
</style>
<script>
	// javascript Trie구현
	//alert("확인");
	function lpad(str, padLen, padStr) { // lpad
	    if (padStr.length > padLen) {
	        console.log("오류 : 채우고자 하는 문자열이 요청 길이보다 큽니다");
	        return str;
	    }
	    str += ""; // 문자로
	    padStr += ""; // 문자로
	    while (str.length < padLen)
	        str = padStr + str;
	    str = str.length >= padLen ? str.substring(0, padLen) : str;
	    return str;
	}
	//console.log(lpad("01", 5, "0")); // 00001
	//console.log(lpad("01", 5, "01")); // 01010
	
	var test = ${cresult };
	//document.write( typeof test ); // object type
	console.log(test);
	for (var i in test)	// 확인용
	{
	  // console.log()함수를 이용해 array
	  console.log(String(test[i]));
	  console.log(typeof String(test[i]));
	}
	
	const Node = function () { // 각각의 노드
		this.keys = new Map(); // 현재 노드에서 갈 수 있는 문자들을 저장할 Map
		this.end = false; // 해당 문자에서 끝나는 문자열이 있는지 확인.
		this.count = 0; // 지나 갔을 때 1 씩 증가시켜, 1보다 클 경우 지나간 문자가 자신말고 더 있다는 것을 알 수 있다.
		this.plusCount = function () {
			this.count += 1;
		};
		this.setEnd = function () {
			this.end = true;
		};
		this.isEnd = function () {
			return this.end;
		};
	};
	
	const Trie = function () { // Trie 자료구조
		this.root = new Node();

		this.add = function (input, node=this.root) { // Trie에 문자열을 추가하는 메소드
			if (input.length === 0) { // 끝날 경우 end로 표시하고 종료
				node.setEnd();
		      	return;
		    } else if (!node.keys.has(input[0])) { // 첫번째 문자가 없으면 추가 해줌.
		      	node.keys.set(input[0], new Node());
		    }
		    node.plusCount(); // 지나갔다고 1 증가 시킨다.
		    return this.add(input.substr(1), node.keys.get(input[0])); // 첫번재 문자를 뺀 문자열과, 해당 값의 Map으로 재귀
		};
		
		this.isWord = function (word) { // 있는 문자인지 확인 하는 메소드
		    let node = this.root;
		    while (word.length > 1) {
		      if (!node.keys.has(word[0])) {
		        return false;
		      } else {
		        node = node.keys.get(word[0]);
		        word = word.substr(1);
		      }
		    } // 마지막 문자가 해당 key에 있고 그 node가 end이면 true 아닐 경우 false
		    return node.keys.has(word) && node.keys.get(word).isEnd() ? true : false;
		  };
	};
	
	const myTrie = new Trie();
	
	for (var i in test)	{
		myTrie.add(String(test[i]));
	}
	
	//console.log(myTrie.isWord('200804'));
	//console.log(myTrie.isWord('200803'));
	//console.log(myTrie.isWord('200805'));
 	// javascript 달력구현

	var today = new Date(); // 오늘 날짜
	var date = new Date();
	
	function beforem() //이전 달을 today에 값을 저장
	{ 
	    today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	    build(); //만들기
	}
	
	function nextm()  //다음 달을 today에 저장
	{
	    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	    build();
	}
	
	function build()
	   {
	       var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
	       var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
	       var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
	       var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
	       yearmonth.innerHTML = today.getFullYear() + "년 "+ (today.getMonth() + 1) + "월"; //년도와 월 출력
	       //console.log(lpad("01", 5, "0"));
	       console.log(today.getFullYear());
	       console.log(String(today.getFullYear()).substring(2,4)); // String(today.getFullYear()).substring(2,4); // 년도
	       console.log(today.getMonth());
	       console.log(lpad(String(today.getMonth()),2,"0")); // lpad(String(today.getMonth()),2,"0")); // 월
	       
	       if(today.getMonth()+1==12) //  눌렀을 때 월이 넘어가는 곳
	       {
	           before.innerHTML=(today.getMonth())+"월";
	           next.innerHTML="1월";
	       }
	       else if(today.getMonth()+1==1) //  1월 일 때
	       {
	       before.innerHTML="12월";
	       next.innerHTML=(today.getMonth()+2)+"월";
	       }
	       else //   12월 일 때
	       {
	           before.innerHTML=(today.getMonth())+"월";
	           next.innerHTML=(today.getMonth()+2)+"월";
	       }
	       
	      
	       // 남은 테이블 줄 삭제
	       while (tbcal.rows.length > 2) 
	       {
	           tbcal.deleteRow(tbcal.rows.length - 1);
	       }
	       var row = null;
	       row = tbcal.insertRow();
	       var cnt = 0;
	   
	       // 1일 시작칸 찾기
	       for (i = 0; i < nMonth.getDay(); i++) 
	       {
	           cell = row.insertCell();
	           cnt = cnt + 1;
	       }
	      
	       // 달력 출력
	       for (i = 1; i <= lastDate.getDate(); i++) // 1일부터 마지막 일까지
	       { 
	           cell = row.insertCell();
	           // innerHTML을 통해서 이미지 추가도 가능하다.
	           // 데이터베이스에서 불러온 데이터를 트라이형태로 저장해야하나??! --> 트라이 구조를 만드는데 드는 시간을 생각하면 ... (그냥 완전탐색보다 빠르긴함)
	           // yearmonth.innerHTML에서 연월정보는 불러올수있다 이 값과 cnt(일)을 비교하여 효율적인 알고리즘 구성이 가능한가?
	           var test_tmp = String(today.getFullYear()).substring(2,4)+lpad(String(today.getMonth()+1),2,"0")+lpad(String(i),2,"0");
	           //console.log(test_tmp);
	           if (myTrie.isWord(test_tmp)){ // 있는지 없는지 체크
	              var img = new Image();
	              img.src = '${pageContext.request.contextPath }/attendancecheck.png';
	              console.log(img.src);
	              cell.innerHTML = '<img src="'+img.src+'" width="40px" height="40px"/>';
	           } else {
	              cell.innerHTML = i;   // 달력에 (일 수) 추가!
	           }
	           cnt = cnt + 1;
	           if (cnt % 7 == 1 && !myTrie.isWord(test_tmp)) {//일요일 계산
	               cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
	           }
	           if (cnt % 7 == 0 && !myTrie.isWord(test_tmp)) { // 1주일이 7일 이므로 토요일 계산
	               cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
	               row = calendar.insertRow();// 줄 추가
	           }
	           if(today.getFullYear()==date.getFullYear()&&today.getMonth()==date.getMonth()&&i==date.getDate()) 
	           {
	               cell.bgColor = "#BCF1B1"; //오늘날짜배경색
	           }
	       }
	       
	       //(실험 중)
	       var tmp = 7 - (cnt % 7);
	       console.log(tmp);
	       console.log(cnt);
	       for (i = 1; i <= tmp; i++) // 1일부터 마지막 일까지
	       { 
	          console.log("#");
	           cell = row.insertCell();
	           // innerHTML을 통해서 이미지 추가도 가능하다.
	           // 데이터베이스에서 불러온 데이터를 트라이형태로 저장해야하나??! --> 트라이 구조를 만드는데 드는 시간을 생각하면 ... (그냥 완전탐색보다 빠르긴함)
	           // yearmonth.innerHTML에서 연월정보는 불러올수있다 이 값과 cnt(일)을 비교하여 효율적인 알고리즘 구성이 가능한가?
	           var test_tmp = String(today.getFullYear()).substring(2,4)+lpad(String(today.getMonth()+1),2,"0")+lpad(String(i),2,"0");
	           //console.log(test_tmp);
	           cell.innerHTML = " ";
	       }
	   }
</script>
</head>
<body onload="build()">
	<table align="center" id="calendar">
        <tr>
            <td><font size=1%; color="#B3B6B3"><label onclick="beforem()" id="before" ></label></font></td>
            <td colspan="5" align="center" id="yearmonth"></td>
            <td><font size=1%; color="#B3B6B3"><label onclick="nextm()" id="next"></label></font></td>
        </tr>
        <tr>
            <td align="center" width="80px"> <font color="#FF9090">일</font></td>
            <td align="center" width="80px"> 월 </td>
            <td align="center" width="80px"> 화 </td>
            <td align="center" width="80px"> 수 </td>
            <td align="center" width="80px"> 목 </td>
            <td align="center" width="80px"> 금 </td>
            <td align="center" width="80px"><font color=#7ED5E4>토</font></td>
        </tr>
    </table>
</body>
</html>