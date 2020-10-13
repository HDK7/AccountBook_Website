<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//httpRequest 객체 생성
   var httpRequest = null;
   
   function getXMLHttpRequest(){
      var httpRequest = null;
   
      if(window.ActiveXObject){
           try{
               httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
           } catch(e) {
               try{
                   httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
               } catch (e2) { httpRequest = null; }
           }
       }
       else if(window.XMLHttpRequest){
           httpRequest = new window.XMLHttpRequest();
       }
       return httpRequest;    
   }
   
   function pValue() {   // 화면이 로드될때 JoinForm에 입력한 아이디값을 가져온다.
      document.getElementById("useBtn").style.visibility='hidden';
      document.getElementById("userId").value = opener.document.JoinFormTem.id.value;
   }
   
   
   function idCheck() {
      var idTxt = document.getElementById("userId").value;
      if(!idTxt) {
         alert("아이디를 입력하세요.");
         return false;
      } else if ((idTxt < "0" || idTxt > "9") && (idTxt < "A" || idTxt > "Z") && (idTxt < "a" || idTxt > "z")) { // 여기 조건 좀 애매함. 다시 정해야할듯.
         alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다");
         return false;
      } else {
         //alert(idTxt); // 여기까지 출력됨
         var param = "id="+idTxt
         httpRequest = getXMLHttpRequest();
         httpRequest.onreadystatechange = callback;
         httpRequest.open("POST","http://localhost:8081/AccountBook_Website/MemberIdCheckController",true);
         httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded'); // 헤더 선언 중요!
         httpRequest.send(param); // id="idTxt" 전달 / 주소?뒤에 썼다고 생각하면 된다.(request값 설정)
      }
         
      return false;
   }
   
   function callback() {
      if (httpRequest.readyState==4) {
         var resultText = httpRequest.responseText;
         //alert("1");
         //alert(resultText);
         if (resultText==0) { // 중복아이디가 있는 경우
            alert("사용할 수 없는 아이디 입니다.");
            document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML = "";
         } else if (resultText == 1) { // 중복아이디가 없는 경우
            document.getElementById("cancelBtn").style.visibility='hidden';
            document.getElementById("useBtn").style.visibility='visible';
            document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
         }
      }
   }
   
   function sendCheckValue() {
      opener.document.JoinFormTem.idDuplication.value="idCheck";
      opener.document.JoinFormTem.id.value=document.getElementById("userId").value;
      
      if (opener != null) {
         opener.chkForm = null;
         self.close();
      }
   }
</script>
</head>
<body onload="pValue()">
	<div id="wrap">
		<h3>아이디 중복체크</h3>
		<br>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idinput" id="userId"> <input
					type="button" value="중복확인" onclick="idCheck()">
			</form>
			<div id="msg"></div>
			<br> <input id="cancelBtn" type="button" value="취소"
				onclick="window.close()"><br> <input id="useBtn"
				type="button" value="사용하기" onclick="sendCheckValue()">
		</div>
	</div>
</body>
</html>