<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>BucketWe</title>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/3-col-portfolio.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<style>
*{
margin: 0;
padding: 0;
}
body{
margin:0;
padding:0;
}
#menu_ul{
float: right;
}
html, body{
height: 100%;
}
</style>
<section style="margin-bottom: 80px;">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="bucketWe">BucketWe</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav" id="menu_ul">
                    <li>
                        <a href="about">About</a>
                    </li>
                    <li>
                        <a href="listPage">Services</a>
                    </li>
                    <c:if test="${login == 'admin' }">
                    <li>
                        <a href="toptenrank">List Rank</a>
                    </li>
                    </c:if>  
                    	<c:if test="${!empty login}">
                    		<li><a href="${pageContext.request.contextPath}/board/arrivemessage<%-- ?id=${login} --%>"><i>Message</i></a></li>
                    	</c:if>
                                     
                    	<c:if test="${!empty login}">
                        <li><a href="${pageContext.request.contextPath}/user/userProfile?id=${login } "><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        </c:if>
                         <li>
                        <c:if test="${empty login}">
                       <a href="${pageContext.request.contextPath}/user/login"><i class="fa fa-sign-out fa-fw"></i> Sign in</a>
                        </c:if>
                        <c:if test="${!empty login }">
                        	<a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-sign-out fa-fw"></i> Sign out</a>
                        </c:if>
                        </li>                       
                    </ul>                  
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
</section>    