

$(function() {
	let listTable = $("#noteTable");
	let pagingArea = $("#pagingArea");
	
	let pagingA = pagingArea.on('click', "a" ,function(){
		let page = $(this).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	});
	
	$("#pagecount").change(function() {
		let page = pagingArea.data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	})
	
	let searchForm = $("#searchForm").on("submit", function(event){
		event.preventDefault();
		let url = this.action?this.action:location.href;
		let method = this.method?this.method:"get";
		let data = $(this).serialize(); // query string
		
		console.log(data);
		
		$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(resp) {
				console.log(resp);
				listTable.find("tbody").empty();
				pagingArea.empty();
				
				let list = resp.data;
				let trTags = [];
				
				if(list.length > 0){
					$(list).each(function(idx, note){
						let noteType = null
						if (note.notechk == "송신"){
							noteType = note.sender;
						} else {
							noteType = note.receiver;
						}
						
						trTags.push(
							$("<tr>").append(
								$("<td>").html(
										$("<input type='checkbox' class='mt-1'>")),
								$("<td>"),
								$("<td>").text(note.notechk),
								$("<td>").text(note.filtercatenm),
								$("<td>").html(
										$("<a class='text-black-darker'>").text(note.notesubject)
										 .attr("href", "/officeKok/note/trashView/" + note.noteno)
										 .data("what", note.noteno)
								),
								$("<td>").text(note.sender),
								$("<td>").text(note.notedeldate)
							)
						);
						
					});
				}else{
					trTags.push($("<tr>").html($("<td colspan='6'>").text("조건에 맞는 쪽지가 없습니다.")));
				}
				
				listTable.find("tbody").html(trTags);
				pagingArea.html( resp.pagingHTML_BS );
			},
			error : function(errResp) {
				console.log("error");
			}
		});
		return false;
	});
	
})
