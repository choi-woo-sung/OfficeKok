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
	
	
	let options ={
			dataType : "json",
			success :commonSuccess,
			error : function(errResp) {
				console.log(errResp);
			},
			clearForm:true
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
	
	let replyInsertForm = $("#replyInsertForm").ajaxForm(options);
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
			listTable.find("tbody").empty();
			pagingArea.empty();
			let replyList = resp.data;
			let trTags = [];
			if(replyList){
				$(replyList).each(function(idx, reply){
					let tr = $("<tr>");
					tr.append(
							$("<td id='name'>").text(reply.empnm+ "|"+reply.deptnm + "|" +reply.replydate).append(
							$("<div>").text(reply.replycontent)
							),
							$("<td>").append(
								$("<input>").attr({
									type:"button",
									value:"수정"
								}).addClass("btn btn-info mr-2 updateBtn"),		
								$("<input>").attr({
									type:"button",
									value:"삭제"
								}).addClass("btn btn-danger mr-2 delBtn")		
							)	
					).data("reply", reply);
					trTags.push(tr);
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