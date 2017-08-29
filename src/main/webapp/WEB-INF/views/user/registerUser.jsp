<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
body, html{
    height: 100%;
 	background-repeat: no-repeat;
 	background-color: #d3d3d3;
 	font-family: 'Oxygen', sans-serif;
 	background-image: url("${pageContext.request.contextPath}/resources/image/glenn-carstens-peters-190592.jpg");
 	background-repeat: no-repeat;
}

.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
.error{
		color:red;
		font-weight: bold;
		font-size : 12px;
		display: none;
		margin-left: 90px;
	}
</style>
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<%-- 		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/main.css"> --%>

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> 
<%-- <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script>
					$(function(){
						$("form[name='f1']").submit(function(){
							$(".error").css("display","none");
							if(checkInputEmpty($("input[name]"))== false){
								return false;
							}
						})	
					})
				</script> --%>
<script type="text/javascript">
window.onload = function(){
document.f1.onsubmit = function(){
var reg1 = /^[가-힇]{2,5}$/;
var reg2 = /^\w{1,30}@{1}\w{1,30}.{1}\w{1,30}$/;
var reg3 = /^\w{4,16}$/;
var reg4 = /^\w{4,16}$/;
var reg5 = /^\w{4,16}$/;

if(reg1.test(this.name.value)==false){
	alert("이름을 잘못 입력하였습니다.2~5자");
	this.name.value="";
	this.name.focus();
	return false;
}
if(reg2.test(this.email.value)==false){
	alert("이메일을 잘못 입력하였습니다.ex)OOOO@OOO.OOOO");
	this.email.value="";
	this.email.focus();
	return false;
}
if(reg3.test(this.id.value)==false){
	alert("아이디를 잘못 입력하였습니다.4~16자");
	this.id.value="";
	this.id.focus();
	return false;
}
if(reg4.test(this.pw.value)==false){
	alert("비밀번호를 잘못 입력하였습니다.4~16자");
	this.pw.value="";
	this.pw.focus();
	return false;
}
if(reg5.test(this.confirm.value)==false){
	alert("비밀번호 확인 입력을 잘못 하였습니다.");
	this.confirm.value="";
	this.confirm.focus();
	return false;
}
}
}
</script>
		<title>회원가입</title>
	</head>
	<body>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title" style=font-family:"돋움;">회원가입</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="registerUser" id="registerUser" name="f1">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">이름</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name" required="required"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="email" id="email"  placeholder="Enter your Email" required="required"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Id</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="id" id="id" placeholder="Enter your Id" required="required"/>									
									<div><button type="button" id="checkBtn" class="btn btn-default">중복확인</button><span id="checkMsg"></span></div>
									
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="pw" id="password"  placeholder="Enter your Password" required="required"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password" required="required"/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-success btn-lg btn-block login-button" id="regiUser">Register</button>
							<a href="login" class="btn btn-primary btn-lg btn-block login-button">Login</a>
						</div>

					</form>
				</div>
				<script>
/* 					$(function(){
						 $("#password").keyup(function(){
							$("font[name=check]").text("");
						})
						$("#confirm").keyup(function(){
							if($("#password").val()!=$("#confirm").val()){
								$("font[name=check]").text("");
								$("font[name=check]").html("암호틀림");
								return false;
							}else{
								$("font[name=check]").text("");
								$("font[name=check]").html("암호일치");
								return true;
							}
						})
						$("form[name='f1']").submit(function(){
							$(".error").css("display","none");
							if(checkInputEmpty($("input[name]"))== false){
								return false;
							}
						})
					
					}) */
				</script>
			</div>
		</div>
		<script>
 	$(function(){		
		$("#checkBtn").on("click", function(){
			var id = $("input[name='id']").val();
			var isVaildID;
			$.ajax({				
				url:'${pageContext.request.contextPath}/user/allUser/'+id,
				type:'post',
				dataType: "text",
				data:JSON.stringify({id:id}),
				headers : {"Content-Type" : "application/json"},
				success:function(data){	
					console.log(data);
					if(data == "success"){
						isVaildID = true;
						$("#checkMsg").html('<p style="color:green;font-size:12px;">사용가능</p>');
					}else{
						isVaildID = false;
						$("#checkMsg").html('<p style="color:red;font-size:12px;">사용불가</p>');
					}
				}	
			})
		})		
	})
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	</body>
</html>