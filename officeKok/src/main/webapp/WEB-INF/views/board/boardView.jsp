<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
	</script>
	<!-- 	flash attribute -->
	<c:remove var="message" scope="session" />
</c:if>

	<!-- begin page-header -->
	
	<h1 class="page-header">${board.deptnm} 게시판 </h1>
	<!-- end page-header -->
		<hr>
<table class="table table-bordered"    style=" border-collapse: collapse">
	<tbody>
		<tr style="background-color: #F8ECE0;" >
			<td colspan="2">
				<span style="font-size:1.3em;">${board.title } </span> <div class="pull-right"><i class="fas fa-lg fa-fw m-r-10 fa-eye"></i> ${board.readcnt }</div><br><br>
				<span style="font-size:0.8em;">${board.reusername} | ${board.regdt } |  ${board.moddt }  </span>
			</td>
		</tr >

		<tr>
			<td><c:if test="${not empty board.attatchList }">
					<i class="fas fa-lg fa-fw m-r-10 fa-file-archive"></i> 
					<c:forEach items="${board.attatchList }" var="attatch"
						varStatus="vs">
						<c:url value="/board/download.do" var="downloadURL">
							<c:param name="what" value="${attatch.postattno }" />
						</c:url>
						<a href="${downloadURL }">${attatch.postattfilename }
							${vs.last?'':','}</a>
					</c:forEach>
				</c:if> <c:if test="${empty board.attatchList }">
					첨부파일 없음.
				</c:if></td>
		</tr>

		<tr class="content1">
				<td colspan="2"><textarea style="border:none;" readonly rows="30" cols="180">${board.postcontent }</textarea></td>
		</tr>
		
	</tbody>
</table>

<div class="mb-3">
	<input type="button" value="목록으로" class="btn btn-secondary"
		onclick="history.back();" /> 
		<input type="hidden" id="boardUpdateBtn"
		value="수정" class="btn btn-primary" /> 
		<input type="hidden"
		id="boardDelBtn" value="삭제" class="btn btn-danger" />
		
	<c:url value="/board/boardInsert.do" var="boardReplyURL">
		<c:param name="parent" value="${board.boardno }" />
	</c:url>
	<input type="button" value="답글쓰기" class="btn btn-default" id="boardRepBtn"
		onclick="location.href='${boardReplyURL}';" />
</div>
<form id="boardUpdateForm"
	action="${pageContext.request.contextPath }/board/boardUpdate.do">
	<input type="hidden" name="what" required value="${board.postno }" />
</form>
<form id="boardDeleteForm"
	action="${pageContext.request.contextPath }/board/boardDelete.do"
	method="post">
	<input type="hidden" name="postno" required value="${board.postno }" />
</form>
<div id = "replyremove">
<form method="post" class="form-inline" id="replyInsertForm"
	action="${pageContext.request.contextPath }/reply/replyInsert.do">
	<input type="hidden" name="replyno" /> <input type="hidden"
		name="postno" value="${board.postno }" />
	<table class="col-md-10">
		<tr>  
			<td colspan="2">
				<div class="input-group">
					<textarea class="form-control mb-2 mr-2" rows="2"
						placeholder="내용 200자 이내" maxlength="200" name="replycontent"></textarea>
				</div>
				
			</td>
			<td colspan="3"><input type="submit" value="전송"
				class="btn btn-primary" /> <input type="reset" value="취소"
				class="btn btn-warning" /></td>
		</tr>
	</table>  
</form>
<h4><i class="fas fa-lg fa-fw m-r-10 fa-comment"></i> <span class="text-inverse">comment</span></h4>
<table id="replyTable" class="table table-bordered">
</table>


	<div id="pagingArea">
	</div>
	<div>
<form id="searchForm"
	action="${pageContext.request.contextPath }/reply/replyList.do">
	<input type="hidden" name="what" value="${board.postno }" /> <input
		type="hidden" name="page" />
</form>
<div class="modal fade" id="replyModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<div class="jstreeArea">
					<div id="jstree-checkable">
					</div>
				</div>
			</div>
		  
		</div>
	</div>
</div>
<form id="replyDeleteForm"
	action="${pageContext.request.contextPath }/reply/replyDelete.do"
	method="post">
	<input type="hidden" name="replyno" required /> <input type="hidden"
		name="postno" required value="${board.postno}" />
</form>
<script type="text/javascript">


var memNickname = '${emp.empnm}';
var	memberSeq  =  '${board.empnm}';
var receiverEmail = '${board.empmail}'; 
var essayboard_seq = '${what}';	
var boardno = '${board.boardno}';	

	
if(${board.empno}===${emp.empno}){
	
	$('#boardUpdateBtn').attr("type" , "button");
	$('#boardDelBtn').attr("type" , "button");
}

if(${board.boardno}== 11){
	$('#replyremove').remove();
	$('#boardRepBtn').attr("type" , "hidden");
	
}

/**
 * 
 */
//====================게시글 관리 버튼 이벤트 처리==============
let boardDeleteForm = $("#boardDeleteForm");
let boardUpdateForm = $("#boardUpdateForm");
$("#boardUpdateBtn").on("click", function(){
	boardUpdateForm.submit();
});
$("#boardDelBtn").on("click", function(){
	if(!confirm("지우시겠습니까?")) return false;
	boardDeleteForm.submit();
});
//====================댓글 CRUD==========================
	function commonSuccess(resp){
		if(resp.result == "OK"){
			replyInsertForm.get(0).reset();
			replyModal.modal("hide");
			searchForm.submit();
		}else if(resp.message){
			alert(resp.message);
		}
	}
	let options ={
		dataType : "json",
		success :commonSuccess,
		error : function(errResp) {
			console.log(errResp);
		},
		clearForm:true
	}
	
	
	let option ={
			dataType : "json",
			success :commonSuccess,
			error : function(errResp) {
				console.log(errResp);
			},
//여기 부분이 웹소켓으로 보내는 부분입니다.			
			complete : function(resp){
				let socketMsg = "reply," + memNickname +","+ memberSeq +","+ receiverEmail +","+ essayboard_seq+"," + boardno;
				console.log("msgmsg : " + socketMsg);
				socket.send(socketMsg);
			}
//
		
			
		}
	
	
	
	
	
	
	
	function updateReply(event){
		let reply = $(this).parents("tr:first").data("reply");
		$(replyUpdateForm).find("[name='replyno']").val(reply.replyno);
		$(replyUpdateForm).find("[name='postno']").val(reply.postno);
		$(replyUpdateForm).find("[name='replycontent']").val(reply.replycontent);
		replyModal.modal("show");
	}
	function deleteReply(event){
		if(!confirm("지우시겠습니까?")) return false;
		let reply = $(this).parents("tr:first").data("reply");
		$(replyDeleteForm).find("[name='replyno']").val(reply.replyno);
		$(replyDeleteForm).submit();
	}
	let listTable = $("#replyTable").on("click", ".updateBtn", updateReply)
									.on("click", ".delBtn", deleteReply);
	let replyModal = $("#replyModal").on("hidden.bs.modal", function(){
		$(this).find("form").get(0).reset();
	});
	
	let replyInsertForm = $("#replyInsertForm").ajaxForm(option);
	let replyUpdateForm = replyModal.find("form").ajaxForm(options);
	let replyDeleteForm = $("#replyDeleteForm").ajaxForm(options);
//========================================================	
	
//====================페이징 및 검색==========================
	let pagingArea = $("#pagingArea");
	let pagingA = pagingArea.on('click', "a" ,function(){
		let page = $(this).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	});
	
	let searchForm = $("#searchForm").ajaxForm({
		dataType : "json",
		success : function(resp) {
			
			if(${board.boardno}== 11){
				return false;
			}
			listTable.find("tbody").empty();
			pagingArea.empty();
			let replyList = resp.data;
			let trTags = [];
			if(replyList){
				$(replyList).each(function(idx, reply){
					if(reply.empno===${emp.empno}){
						let tr = $("<tr>");
						tr.append(
								$("<td id='name'>").text(reply.empnm+ "|"+reply.deptnm + "|" +reply.replydate).append(
										
										$("<input>").attr({
											type:"button",
											value:"삭제"
										}).addClass("btn btn-danger mr-2 delBtn pull-right"),
										$("<input>").attr({
											type:"button",
											value:"수정"
										}).addClass("btn btn-info mr-2 updateBtn pull-right"),	
										$("<div>").text(reply.replycontent)


								)
										
						).data("reply", reply);
						trTags.push(tr);
					}else{
					let tr = $("<tr>");
					tr.append(
							$("<td id='name'>").text(reply.empnm+ "|"+reply.deptnm + "|" +reply.replydate).append(
							$("<div>").text(reply.replycontent)
							)
					).data("reply", reply);
					trTags.push(tr);
					}
					//end
				});
			}else{
				trTags.push(
					$("<tr>").html(
						$("<td>").text("댓글이 없음.")									
					)
				);
			}
			listTable.html(trTags);
			if(replyList.length>0)
				pagingArea.html(resp.pagingHTML_BS);
		},
		error : function(errResp) {
			console.log(errResp);
		}
	}).submit(); // 페이지 로드 후 1페이지의 댓글 요청.
//========================================================	
	
	var AlarmData = {
			"myAlarm_receiverEmail" : '${board.empmail}',
			"myAlarm_callerNickname" : "퐁퐁",
			"myAlarm_title" : "댓글 알림",
			"myAlarm_content" : '${board.empmail}'
	};
</script>
	
<script>
$('#replyModal').appendTo("body");
</script>

