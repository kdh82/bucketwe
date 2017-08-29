<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modify</title>
<style>
.content {
	width: 85%;
	margin: 0 auto;
	margin-bottom: 15%;
}
#displayImg img{
 	min-width: 100%;
	max-width: 100%;
	min-height: 100%;
	max-height: 100%; 
}
</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title" style="text-align: center;">Modify BOARD</h3>
				</div>
				<!-- BOX-header  -->

				<form role="form" method="post" action="modify" enctype="multipart/form-data">
					<input type="hidden" name="page" value=${cri.page }> <input
						type="hidden" name="bno" value=${board.bno }> <input
						type="hidden" name="bcnt" value=${board.bcnt }> <input
						type="hidden" name="replyCnt" value=${board.replyCnt }>
					<div class="box-body">
						<div class="form-group">
							<label>버킷리스트</label> <input type="text" name="title"
								class="form-control" value="${board.title }">
						</div>
						<div class="form-group">
							<label>주제</label> <input type="text" name="category"
								class="form-control" value="${board.category }">
						</div>
						<div class="form-group">
							<label>시작날짜</label> <input type="date" name="startDate"
								class="form-control"
								value=<fmt:formatDate value="${board.startDate }" pattern="yyyy-MM-dd"/>>
						</div>
						<div class="form-group">
							<label>종료날짜</label> <input type="date" name="endDate"
								class="form-control"
								value=<fmt:formatDate value="${board.endDate }" pattern="yyyy-MM-dd"/>>
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="10" cols="100" name="content"
								class="form-control">${board.content }</textarea>
						</div>
						<div class="form-group">
							<label>작성자</label> <input type="text" name="id"
								class="form-control" value="${login }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>File</label><br> <input type="file" name="imgFiles"
								class="form-control" multiple="multiple"><br>
							<!-- 수정 시, 파일업로드 -->
						<div style="width:100%;float:left;">
							<c:forEach var="item" items="${board.files }">
								<div id="displayImg"
									style="width: 200px; height: 150px; position: relative;float:left;">
									<img src="displayFile?filename=${item }" style="width:90%;height:90%;">
									<button class="del" data-src="${item }" style="position: absolute; top: 10px; right: 10px;clear: both;">X</button>
								</div>
							</c:forEach>
							</div>	
						</div>
					</div>
					<div class="form-group" id="removeFile"></div>
					<div> 
						<button type="submit" class="btn btn-primary" style="clear: both;">Modify</button>
					</div>
				</form>
			</div>
			<!-- BOX BODY -->
		</div>
	</div>
</section>
<script>
	$(document).on("click","button.del", function(event) {
						event.preventDefault();

						var item = $(this).attr("data-src");
						var inputObj = $("<input type='hidden' name ='delfile' value='"+item+"'>");
						/* alert(item); */
						$("#removeFile").append(inputObj);
						$(this).parent().hide();
					});
</script>
<%@ include file="../include/footer.jsp"%>