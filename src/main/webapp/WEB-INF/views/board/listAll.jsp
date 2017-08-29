<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bucket List</title>
<style>
table{
	border: 1px solid black;
	border-collapse: collapse;
}
table tr th, td{
	border: 1px solid black;
	text-align: center;
}	
</style>
</head>
<body>
<div>
	<h3>BOARD LIST ALL</h3>
	<table>
		<tr>
			<th>글번호</th>
			<th>버킷제목</th>
			<th>주제</th>
			<th>세부내용</th>
			<th>시작날짜</th>
			<th>종료날짜</th>
			<th>글입력날짜</th>
			<th>조회수</th>
			<th>댓글수</th>
			<th>id</th>		
		</tr>	
		<c:forEach var="board" items="${list }">
			<tr>
				<td>${board.bno }</td>
				<td><a href="#" style="font-weight:bold;">${board.title }</a></td>
				<td>${board.category }</td>
				<td>${board.content}</td>
				<td><fmt:formatDate value="${board.startDate }" pattern="yyyy-MM-dd"/> </td>
				<td><fmt:formatDate value="${board.endDate }" pattern="yyyy-MM-dd"/> </td>
				<td><fmt:formatDate value="${board.bregDate }" pattern="yyyy-MM-dd HH:mm"/> </td>
				<td>${board.bcnt }</td>
				<td>${board.replyCnt }</td>
				<td>${board.id }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>