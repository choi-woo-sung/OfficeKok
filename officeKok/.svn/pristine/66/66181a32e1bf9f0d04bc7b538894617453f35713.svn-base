

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
						trTags.push(
							$("<tr>").append(
								$("<td>").html(
										$("<input type='checkbox' class='mt-1'>")),
								$("<td>"),
								$("<td>").text(note.filtercatenm),
								$("<td>").html(
										$("<a class='text-black-darker'>").text(note.notesubject)
												.attr("href", "/officeKok/note/tempView/" + note.noteno)
												.data("what", note.noteno)
								),
								$("<td>").text(note.receiver),
								$("<td>").text(note.notedate)
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
	
//	$("#empTable>tbody").on("click", "a", function(){
//		let who = $(this).data("who");
//		
//		$.ajax({
//			url : location.href + "/mgr/empView",
//			method : "get",
//			data : {
//				who:who
//			},
//			dataType : "json",
//			success : function(resp) {
//				console.log(resp.empnm);
//				$("#empDetail").find("#whoArea").text(resp.empnm);
//				
//				let trTags = [];
//				let tr1 = $("<tr>");
//				tr1.append(
//					$("<td>").text("이름"),
//					$("<td>").text(resp.empnm)
//				);
//				let tr2 = $("<tr>");
//				tr2.append(
//					$("<td>").text("사번"),
//					$("<td>").text(resp.empno)
//				);
//				let tr3 = $("<tr>");
//				tr3.append(
//					$("<td>").text("상급자 사번"),
//					$("<td>").text(resp.mgrno)
//				);
//				let tr4 = $("<tr>");
//				tr4.append(
//					$("<td>").text("부서"),
//					$("<td>").text(resp.deptnm)
//				);
//				let tr5 = $("<tr>");
//				tr5.append(
//					$("<td>").text("직급"),
//					$("<td>").text(resp.ranknm)
//				);
//				let tr6 = $("<tr>");
//				tr6.append(
//					$("<td>").text("이메일"),
//					$("<td>").text(resp.empmail)
//				);
//				let tr7 = $("<tr>");
//				tr7.append(
//					$("<td>").text("비밀번호"),
//					$("<td>").text(resp.emppw)
//				);
//				let tr8 = $("<tr>");
//				tr8.append(
//					$("<td>").text("주민번호"),
//					$("<td>").text(resp.empregno)
//				);
//				let tr9 = $("<tr>");
//				tr9.append(
//					$("<td>").text("휴대전화번호"),
//					$("<td>").text(resp.emphp)
//				);
//				let tr10 = $("<tr>");
//				tr10.append(
//					$("<td>").text("우편번호"),
//					$("<td>").text(resp.emzip)
//				);
//				let tr11 = $("<tr>");
//				tr11.append(
//					$("<td>").text("주소"),
//					$("<td>").text(resp.empadd)
//				);
//				let tr12 = $("<tr>");
//				tr12.append(
//					$("<td>").text("성별"),
//					$("<td>").text(resp.empgen)
//				);
//				let tr13 = $("<tr>");
//				tr13.append(
//					$("<td>").text("입사일"),
//					$("<td>").text(resp.enterdate)
//				);
//				let tr14 = $("<tr>");
//				tr14.append(
//					$("<td>").text("퇴사일"),
//					$("<td>").text(resp.leavedate)
//				);
//				let tr15 = $("<tr>");
//				tr15.append(
//					$("<td>").text("탈퇴여부"),
//					$("<td>").text(resp.empdel)
//				);
//				
//				trTags.push(tr1, tr2, tr3, tr4, tr5, tr6, tr7, tr8, tr9, tr10, tr11, tr12, tr13, tr14, tr15);
//				
//				
//				$("#empDetailBody").html(trTags);
//				$("#empDetail").modal("show");
//			},
//			error : function(errResp) {
//				console.log(errResp);
//			}
//		});
//		return false;
//	});
})
