<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>register</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<script type="text/javascript">
window.onload = function(){
document.f1.onsubmit = function(){
var reg3 = /[가-힇\w\W]{1,300}/;
if(reg3.test(this.message.value)==false){
	alert("내용을 입력하세요");
	this.message.value="";
	this.message.focus();
	return false;
}
}
}
</script>
<style>
#f1{
width: 80%;
margin:0 auto;
border:1px solid black;
}	
label{
width:40%;
color: #CC0000;
font-size: 20px;
margin-left: 50px;
}
.regForm{
width: 80%;
height: 30px;
margin-left:10%;
}
.regBtn{
width: 100px;
height: 35px;
font-size: 15px;
}
.message_class{
width: 100%;
margin:0 auto;
margin-bottom: 10%;
padding-bottom: 5%;
}
</style>
<body>
<div class="message_class">
	<h3 style="margin-top:80px;text-align:center;">MESSAGE BOARD</h3><br>
	<form role="form" method="post" action="message" name="f1" id="f1">
		<label>받는사람 :</label>
		<input type="text" name="targetid" value="${board.id }" class="regForm" readonly="readonly">
		<label>내용 :</label>
		<input type="text" name="message" class="regForm"><br><br>
		<label>보낸사람 :</label>		
		<input type="text" name="sender" value="${login }" class="regForm" readonly="readonly"><br><br>
		<input type="submit" value="보내기" class="regBtn" style="background-color:orange;margin-left:10%; color:white;border-radius:10px;">
		<input type="reset" value="취소" onclick="history.back()" class="regBtn" style="background-color: blue;color: white;border-radius:10px;">
	</form>
</div>	
<%@ include file="../include/footer.jsp" %>	
</body>
</html>