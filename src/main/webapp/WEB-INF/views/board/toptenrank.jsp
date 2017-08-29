<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Top 10</title>
<style>
body{
width:100%;
margin: 0 auto;
text-align: center;
}
table{
font-size: 20px;
float: left;
}
th, td{
width: 70px;
}
.th1{
text-align: center;
}
tr:NTH-CHILD(2), tr:NTH-CHILD(3), tr:NTH-CHILD(4){
background-color: rgba(189, 189,189, 0.2);
} 
</style>
</head>
<body>
<h3>BucketWe TOP10</h3><br>
<div id="top10__main_div" style="width:90%;height:400px;margin:0 auto;">
	<div id="top10__main_sub" style="width:90%;height:400px;margin:0 auto;">
	<table class="table table-bordered text-center">
		<caption>조회수 순위</caption>
		<tr>
			<th class="th1">글번호</th>
			<th class="th1">조회수</th>
			<th class="th1">주제</th>
			<th class="th1">제목</th>
			<th class="th1">순위</th>			
		</tr>
		<c:forEach items="${toplist }" var="item" varStatus="status">
		<tr>		
			<td>${item.bno }</td>
			<td>${item.bcnt }</td>
			<td>${item.category }</td>
			<td style="font-weight: bold;">${item.title }</td>
			<td>${status.count }</td>			
		</tr>
		</c:forEach>
	</table>
	<table class="table table-bordered text-center">
	<caption>댓글수 순위</caption>
		<tr>
			<th class="th1">글번호</th>
			<th class="th1">댓글수</th>
			<th class="th1">주제</th>
			<th class="th1">제목</th>
			<th class="th1">순위</th>			
		</tr>
		<c:forEach items="${replylist }" var="item2" varStatus="status">
		<tr>		
			<td>${item2.bno }</td>
			<td>${item2.replyCnt }</td>
			<td>${item2.category }</td>
			<td style="font-weight: bold;">${item2.title }</td>
			<td>${status.count }</td>			
		</tr>
		</c:forEach>
	</table>
	</div>
</div>	
<div style="height:100px;clear:both;"></div>
<%@ include file="../include/footer.jsp" %>	
</body>
</html>