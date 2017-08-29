<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true" %>
<%@include file="../include/header.jsp" %>
<meta charset="utf-8">
<title>Read</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.10/handlebars.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<style>
#imgFiles div{
	float: left;
}
#imgFiles img{
 	min-width: 100%;
	max-width: 100%;
	min-height: 100%;
	max-height: 100%; 
}
.content{
width: 85%;
margin:0 auto;
}
</style>
<script type="text/javascript">
</script>
	<section class="content">
	<div class="row">
		<div class="col-lg-12 col-xs-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title" style="clear:both;text-align:center;">ArriveMessage Page</h3>
				</div>
			</div>
			<div class="box-body"> 
				<table class="table table-boarded">
					<tr>
						<th>번호</th>							
						<th>발신시간</th>
						<th>내용</th>
						<th colspan="2">발신자</th>
					</tr>
					
					
					<c:forEach var="listMes" items="${listMes }">
					<c:if test="${login == listMes.targetid}">
					<tr>				
					<td>${listMes.mno }</td>					
					<td><fmt:formatDate value="${listMes.senddate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${listMes.message }</td>
					<td><a href="message?id=${listMes.sender }" title="메시지보내기" id="messageSender">${listMes.sender }</a></td>
					<td><c:if test="${login == listMes.targetid }">
					<form id="fb" method="post" action="deleteMess">
						<input type="hidden" name="mno" value="${listMes.mno}">
						<input type="submit" value="삭제하기" id="messageSubmit" class="btn">
					</form>
					</c:if></td>
					</tr>
					
					</c:if>					
					</c:forEach>
					
					
					
				</table>
				<%-- 	
						<td><fmt:formatDate value="${listMes.senddate }" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
						
				<%-- <textarea style="width:100%;height:100px;">${board.content }</textarea>
				<!-- BOX-BODY  -->
				<div id="imgFiles" style="width:100%;text-align:center;padding-left:17%;float:left;">
				<c:forEach var="item" items="${board.files }">  
						<div id="displayImg" style="width:80%;height:50%;box-shadow:0 0 10px grey inset, 0 0 10px black;margin-bottom:10px;">
						<img src="displayFile?filename=${item }" style="width:50%;height:50%"></div>
						</c:forEach>
						</div>
				<div class="box-footer" style="clear:both;">
					<c:if test="${login == board.id }">
					<button class="btn btn-warning" id="modifyBtn">수정하기</button>
					</c:if>
					<c:if test="${login == board.id || login == 'admin' }">
					<button class="btn btn-danger" id="deleteBtn">삭제하기</button>
					</c:if>
					<button class="btn btn-primary" id="backBtn">돌아가기</button>
				</div>
				<form id="f1" role="form" method="post" action="">
					<input type="hidden" name="bno" value=${board.bno }> 
					<input type="hidden" name="page" value=${cri.page }> 
					<input type="hidden" name="perPageNum" value=${cri.perPageNum }>
					<c:forEach var="item" items="${board.files }">
						<input type="hidden" name="delfile" value="${item }">
					</c:forEach>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$("#deleteBtn").click(function() {
				$("#f1").attr("action", "delete");
				$("#f1").submit();
				/* alert("${board.bno}번 글을 삭제 합니다"); */
			})
			$("#backBtn").click(function() {
				$("#f1").attr("action", "listPage");
				$("#f1").attr("method", "get");
				$("#f1").submit();

			})
		})
	</script>
	
	<div class="row">
		<div class="col-md-4">
			<div class="box box-succeess">
				<div class="box-header">
					<h3 class="box-title"></h3>
				</div>
				<div class="box-body">
					<label for="newReplyWriter"></label>
					<input type="hidden" placeholder="User ID" id="newReplyWriter" value=${login} class="form-control">
					<label for="newReplyText">댓글 내용</label>
					<input type="text" placeholder="Your Message" id="newReplyText" class="form-control" required="required">
				</div>
				<div class="box-footer">
					<button class="btn" id="btnAdd" style="background-color:#CC6600; margin-top:5px;color:white;text-shadow:2px black;">댓글 추가</button>
				</div>
			</div><!-- add reply -->
			<ul class="pagination"></ul>
			<ul class="timelin" style="list-style:none;">
				<li class="time-label" id="repliesList">
					<span class="bg-green btn" id="btnList" style="background-color:#CC6600/* #E0E0E0 */;font-size:15px;color:white;text-shadow:2px black;">댓글 리스트(<span class="replycntClass">${board.replyCnt}</span>)</span>
				</li>
			</ul>
			<ul class="pagination" style="height:100px;"></ul>
		</div>
	</div> <!-- 댓글 -->

 	<div class="modal fade" id="modfyModal" role="dialog" style="background-color:rgba(0,0,0,0.8);">
		<div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">Modal Header</h4>
	        </div>
	        <div class="modal-body">
	         	<label for="newReplyWriter"></label> 
				<input type="hidden" placeholder="User ID" id="newReplyWriter2" value=${login} class="form-control">
				<label for="newReplyText">댓글 내용</label> 
				<input type="text" placeholder="300자 이내" id="newReplyText2" class="form-control">
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-info" id="replyModBtn" data-dismiss="modal">수정</button>
	        </div>
	      </div>
	    </div>
	</div>  <!--  Modal 창 -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script> -->
	<!--<script id="temp" type="text/x-handlevars-template">
		{{#each.}}
			<li class="replyLi" data-rno={{rno}} >
				<i class="fa fa-comments bg-blue"></i>
				<div class="timeline-item">
					<span class="time">
						<i class="fa fa-clock-o"></i>{{tempdate rregDate}}
					</span>
					<h3 class="timeline-header"><strong>{{rno}}</strong> -<span class="r_writer">{{id}}</span></h3>
					<div class="timeline-body">{{replyText}} </div>
					<div class="timeline-footer">
			  	     	<a class="btn btn-primary btn-xs btn_r_modify" data-toggle="modal" data-target="#modfyModal" data-rno={{rno}}>Modify</a>
						<a class="btn btn-primary btn-xs btn_r_delete" data-toggle="modal" data-rno={{rno}}>Delete</a>
					</div>			
				</div>
			</li>
		{{/each}}
	</script>  -->
	
	<script id="temp2" type="text/x-handlevars-template">
		{{#list}}
			<li class="replyLi" data-rno={{rno}} style="margin:0 auto;">				
				<div class="timeline-item" style="width: 90%;border-top:1px solid black;clear:both;list-style:none;">
					<span class="time"><p class="timeline-header"><i class="fa fa-comments bg-blue"></i>
					<strong>글번호:{{rno}}</strong> |<span class="r_writer">글쓴이:{{id}}</span></p>
					<p style="float:right;"><i class="fa fa-clock-o" style="text-align:right;">{{tempdate rregDate}}&nbsp;&nbsp;</i>&nbsp;
			{{#iff id}}				
			  	<a class="btn btn-primary btn-xs btn_r_modify" data-toggle="modal" data-target="#modfyModal" data-rno={{rno}}>수정</a>
			{{else}}
			{{/iff}}			
			{{#ifadmin id}}
				<a class="btn btn-primary btn-xs btn_r_delete" data-toggle="modal" data-rno={{rno}}>삭제</a>
			{{else}}
			{{/ifadmin}}						
				</p>
					</span>				
					댓글내용:
					<div class="timeline-body" style="width:100%;height:80px;border:3px solid blue;word-wrap:break-word;">{{replyText}}</div>
					<div style="float:right;">
					</div>			
				</div>
			</li>
		{{/list}}
	</script>
	<script type="text/javascript">
	var curPage = 1;
		Handlebars.registerHelper("tempdate", function(time) {
			var dateObj = new Date(time);
			var year = dateObj.getFullYear();
			var month = dateObj.getMonth()+1;
			var date = dateObj.getDate();
			
			return year + "/" + month + "/" + date;			
		});		
		var bno = ${board.bno };
		function getAllList() {
			$.ajax({
				//pageContext.getRequest().getContextPath(); 
				// '/'를 포함한 프로젝트 이름을 반환한다  : '/ex01'
				url: "${pageContext.request.contextPath}/replies/all/"+bno+"/"+page,
				type : "get",
				dataType: "json",
				success:function(data){
					console.log(data);
					var source = $("#temp").html();
					var template = Handlebars.compile(source);
					$(".replyLi").remove();
					$(".timeline").append(template(data));
				}
					
			})
		} // 페이징 없는 전체 리스트 가져오기
		
		
		function getPageList(page) {
			$.ajax({
				url: "${pageContext.request.contextPath}/replies/all/"+bno+"/"+page,
				type : "get",
				dataType: "json",
				success:function(data){
					console.log(data);
					var source = $("#temp2").html();
					var template = Handlebars.compile(source);
					$(".replyLi").remove();
					$(".timelin").append(template(data));
					$(".replycntClass").html(data.pageMaker.totalCount);
					var str2 = "";
					for(var i = data.pageMaker.startPage; i < data.pageMaker.endPage+1; i++){
						if(i == page){
							//str2 += "<a href='"+i+"' style='font-size:20px; font-weight:bold'>"+i+"</a>     ";
							str2 += "<li class='active'><a href='"+i+"'>"+i+"</a></li>";
						}else{
							str2 += "<li><a href='"+i+"'>"+i+"</a></li>";
						}
					}
					$(".pagination").html(str2);
				}
					
			})
		} // 페이징한 리스트 가져오기
		
		$(document).on("click", ".pagination li a", function(e) {
			e.preventDefault();
			curPage = $(this).attr("href");
			
			getPageList(curPage);
		}); // 페이지 클릭시 이동
		
		$("#btnList").click(function() {
			// 위에서 부터 읽어내려오므로.... html보다 script 하단이면 레디 태그 설정 필요 없다..
			//getAllList();
			getPageList(curPage);
		}) // list get
		
		$("#btnAdd").click(function() {
			var writer = $("#newReplyWriter").val();
			var text = $("#newReplyText").val();
			var sendData = {
					bno:bno,					
					replyText:text,
					id:writer
			};
		 if(text == null || text == ""){
			 alert("댓글을 입력하시오");
		 }else{
			 btnAddTest();
		 }
			$("#newReplyText").val("");
			// document.getElementById("newReplyText").value="";
		})	// reply add
		
		function btnAddTest(){
			var writer = $("#newReplyWriter").val();
			var text = $("#newReplyText").val();
			var sendData = {
					bno:bno,					
					replyText:text,
					id:writer
			};
			$.ajax({
				url : "${pageContext.request.contextPath}/replies/add",
				type:"post",
				dataType:"text",
				data: JSON.stringify(sendData),
				headers :{"Content-Type":"application/json"},				
				success: function(data) {
					console.log(data);					
					/* alert("test"); */
					getPageList(curPage);
				}
			})
			
		}
		
		$(document).on("click", ".btn_r_modify", function(event) {
			event.preventDefault(); // a tag 전송 막기
			var rno = $(this).attr("data-rno");
			console.log(rno +"번차례");
			$("h4.modal-title").html(rno);
			$(".modal-body").find("#newReplyWriter2").val($(this).parents("li.replyLi").find(".r_writer").html());
			$(".modal-body").find("#newReplyText2").val($(this).parents("li.replyLi").find(".timeline-body").html());
		})
			$("#replyModBtn").click(function() {
				var rno = $("h4.modal-title").html();
				var newReplyWriter2 = $("#newReplyWriter2").val();
				var newReplyText2 = $("#newReplyText2").val();
				var sendData ={
						rno:rno,
						replyText: newReplyText2,
						id :newReplyWriter2
				};
				$.ajax({
					url : "${pageContext.request.contextPath}/replies/"+rno,
					type : "put",
					dataType : "text",
					data: JSON.stringify(sendData),
					headers :{"Content-Type":"application/json"},
					success: function(data) {
						console.log(rno + "수정하기 " +data);
						if(data =="SUCCESS"){
							// 수정이 누적됩니다??? 왜죠????
						//	alert(rno+"번 댓글 수정완료");
							//getAllList();
							getPageList(curPage);
						}
					}
				})
			})
	
		
		$(document).on("click", ".btn_r_delete", function(event) {
			event.preventDefault(); // a tag 전송 막기
			var rno = $(this).attr("data-rno");
			if(confirm("정말로 삭제하시겠습니까?")){
				//글 지우기	
				$.ajax({
					url : "${pageContext.request.contextPath}/replies/"+rno,
					type : "delete",
					dataType : "text",
					data: "text",
					success: function(data) {
						console.log(rno + "삭제하기 " +data);
						if(data =="SUCCESS"){
					//		alert(rno+"번 댓글 삭제완료");
							//getAllList();
							getPageList(curPage);
						}
					}
				})
			}
		})
		
	</script>	
		<script type="text/javascript">		
			var login = "${login}";
			Handlebars.registerHelper('iff', function(conditional, options) { //conditional이 id값이다.
				  if(login==conditional) {
					  return options.fn(this);
				  } else {
					  return options.inverse(this);
				  }
				});

	</script>	
	<script type="text/javascript">		
			var login = "${login}";
			Handlebars.registerHelper('ifadmin', function(conditional, options) { //conditional이 id값이다.
				  if(login==conditional || login=='admin') {
					  return options.fn(this);
				  } else {
					  return options.inverse(this);
				  }
				});

	</script> --%>
</section>
<%@ include file="../include/footer.jsp" %>