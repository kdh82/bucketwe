<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bucket List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #eee;
  background-image: url("${pageContext.request.contextPath}/resources/image/glenn-carstens-peters-190592.jpg");
  background-size: cover;
  background-repeat: no-repeat;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  height: auto;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
  padding: 10px;
  font-size: 16px;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

</style>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<!-- <script type="text/javascript">
	$(function(){		
		document.f1.onsubmit = function(){
			var reg1 = /^\w{4,16}$/;
			var reg2 = /^\w{4,16}$/;

			if(reg1.test(this.id.value)==false || reg2.test(this.pw.value)==false){
				alert("아이디나 비밀번호를 잘못 입력하였습니다.");
				this.id.value="";
				this.pw.value="";
				this.id.focus();
				return false;
				}
		}
	})
</script> -->
<script>
$(function() {
	var result = false;
	var url = new URL(window.location.href);		
	result = url.searchParams.get("isExist");
	if (result == "false") {
		alert("아이디 또는 비밀번호를 확인하세요.");
	}
});
</script>
<script>
$(function() {
	$("#id").focus();
	
	$("form[name='f1']").submit(function() {
		if (checkInputEmpty($("input[name]")) == false){			
			return false;						
		}
	});
	
	
	$("#reset").click(function() {
		location.href = "${pageContext.request.contextPath}/";
	});
});
</script>
<body>
  <div class="container">
      <form class="form-signin" action="loginPost" method="post" name="f1">
        <h2 class="form-signin-heading">Sign in</h2>
        <label for="id" class="sr-only">id</label>
        <input type="text" name="id" class="form-control" placeholder="Id" id="id" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="pw" class="form-control" placeholder="Password" required>
        <br>
       <!--  <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div> -->
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
       <br>
        <!-- <a href="#">I forgot my password</a><br> -->
        <a href="registerUser" class="text-center"><!-- Register a new membership -->회원가입</a>
        <br>
      </form>
<!--       <div class="col-md-6">
		
        </div> -->
    </div> <!-- /container -->
</body>
</html>
