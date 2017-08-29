<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<%@ include file="../include/header.jsp" %>
<style>
table{	
font-size: 20px;
margin: 0px auto;
}
.th1{
text-align: center;
}
.content{
width: 85%;
margin:0 auto;
}
.title_a{
color: black;
}
.title_a:hover{
background-color: rgba(0,0,0,.6);
color: white;
text-decoration: none;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<section class="content">
<h3 style="text-align:center;">BucketWe List</h3>
	<div class="row">
		<div class="col-lg-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title"></h3><br>
				</div>
				<!-- BOX-header  -->
				<div class="box-body" id="searchDiv">
					<select name="searchType">
						<option value="n" ${cri.searchType=='n'? 'selected':'' }>---</option>
						<option value="t" ${cri.searchType=='t'? 'selected':'' }>버킷리스트</option>
						<option value="c" ${cri.searchType=='c'? 'selected':'' }>주제</option>
					</select>
					
					<input type="text" name="keyword" value="${cri.keyword}">
					<button id="searchBtn">Search</button><br><br>
				</div>
				<div class="table-responsive"><!--  class="box-body" -->
					<table class="table table-bordered text-center" >
						<tr>
							<th class="th1" style="width:80px;">번호</th>
							<th class="th1">주제</th>
							<th class="th1">버킷리스트[댓글]</th>
							<th class="th1">등록시간</th>
							<th class="th1">조회수</th>
							<th class="th1">작성자</th>
						</tr>

						<c:forEach var="board" items="${list }">
							<tr>
								<td>${board.bno }</td>
								<td>${board.category }</td>
								<td>
								<a href="read${pageMaker.makeSearch(cri.page) }&bno=${board.bno }&fromlist=true" style=" font-weight:bold;" title="상세보기" class="title_a">${board.title }</a>[${board.replyCnt }]</td>														
								<td><fmt:formatDate value="${board.bregDate }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${board.bcnt }</td>
								<td><a href="message${pageMaker.makeSearch(cri.page) }&bno=${board.bno }&fromlist=true&id=${board.id}" title=메시지보내기>${board.id }</a></td>
							</tr>

						</c:forEach>
					</table>					
				</div>
				<button class="btn btn-primary" onclick="btnNew()" id="writeBtn">write</button>
				<div class="box-footer" style="margin-bottom: 50px;">
					<div class="text-center">
						<ul class="pagination">
				<c:if test="${pageMaker.prev}">
								<!-- 이전 페이지 있을때만 표시 -->
								<li><a href="listPage${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li ${pageMaker.cri.page == idx? 'class=active' : '' } >
									<a href="listPage${pageMaker.makeSearch(idx) }">${idx }</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<!-- 이후 페이지 있을때만 표시 -->
								<li><a href="listPage${pageMaker.makeSearch(pageMaker.endPage+1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
</section>
</body>
<script>
$(function() {
	var result= '${msg}';
	if(result=='SUCCESS'){
		alert("처리가 완료되었습니다.");
	}
	
	$("#searchBtn").click(function() {
		var keyword=$("input[name='keyword']").val();
		/* var searchType=$("select[name='searchType']").val(); */
		var searchType=$("select").val();
		location.href="listPage?searchType="+searchType+"&keyword="+keyword;
	})
})	

	function btnNew() {
		location.href = "register";
	}
</script>
<%@ include file="../include/footer.jsp" %>