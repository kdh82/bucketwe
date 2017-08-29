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
var reg1 = /[가-힇\w]{2,100}/;
var reg2 = /[가-힇\w]{1,10}/;
var reg3 = /[가-힇\w\W]{30,3000}/;
var reg4 = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
var reg5 = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;

if(reg1.test(this.title.value)==false){
	alert("제목을 입력하세요");
	this.title.value="";
	this.title.focus();
	return false;
}
if(reg2.test(this.category.value)==false){
	alert("주제를 입력하세요");
	this.category.value="";
	this.category.focus();
	return false;
}
if(reg3.test(this.content.value)==false){
	alert("세부 내용을 입력하세요");
	this.content.value="";
	this.content.focus();
	return false;
}
if(reg4.test(this.startDate.value)==false){
	alert("시작 날짜를 입력하세요");
	this.startDate.value="";
	this.startDate.focus();
	return false;
}
if(reg5.test(this.endDate.value)==false){
	alert("종료 날짜를 입력하세요");
	this.endDate.value="";
	this.endDate.focus();
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
#insertTextarea{
margin-left: 10%;
}
#imgf{
margin-left: 10%;
}
.regBtn{
width: 100px;
height: 35px;
font-size: 15px;
}
.register_board_class{
width: 100%;
margin:0 auto;
margin-bottom: 10%;
padding-bottom: 5%;
}
</style>
<body>
<div class="register_board_class">
	<h3 style="margin-top:80px;text-align:center;">REGISTER BOARD</h3><br>
	<form role="form" method="post" action="register" name="f1" id="f1" enctype="multipart/form-data">
		<label>제목 :</label>
		<input type="text" name="title" class="regForm"><br><br>
		<label>주제 :</label>
		<input type="text" name="category" class="regForm"><br><br>
		<label>세부 내용 :</label><br>
		<textarea style="width:80%;height:100px;" name="content" id="insertTextarea"></textarea><br><br>
		<label>시작날짜 :</label>
		<input type="date" name="startDate" class="regForm"><br><br>
		<label>종료날짜 :</label>
		<input type="date" name="endDate" class="regForm"><br><br>
		<label>이미지 :</label>
		<input type="file" name="imgFiles" id="imgf" multiple="multiple" class="regForm">
		<input type="hidden" name="id" value="${login }"><br><br>
		<input type="submit" value="저장" class="regBtn" style="background-color:orange;margin-left:10%; color:white;border-radius:10px;">
		<input type="reset" value="취소" onclick="history.back()" class="regBtn" style="background-color: blue;color: white;border-radius:10px;">
	</form>
</div>	
<%@ include file="../include/footer.jsp" %>	
</body>
</html>