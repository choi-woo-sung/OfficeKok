/**
 * 
 */
let formListTB = $("#apprListTB");

let searchForm = $("#searchForm").ajaxForm({
		dataType : "json",
		success : function(resp) {
			formListTB.find("tbody").empty();
			pagingArea.empty();
			
			let list = resp.data;
			let trTags = [];
			
			if (resp.service == "docform") {
				trTags = docformList(list, trTags);
			} else if (resp.service == "myRequest") {
				trTags = myRequestList(list, trTags);
			} else if (resp.service == "temp") {
				trTags = tempList(list, trTags);
			} else if (resp.service == "todo") {
				trTags = todoList(list, trTags);
			} else if (resp.service == "proc") {
				trTags = procList(list, trTags);
			} else if (resp.service == "complete") {
				trTags = completeList(list, trTags);
			} else if (resp.service == "reference") {
				trTags = referenceList(list, trTags);
			} else if (resp.service == "reject") {
				trTags = rejectList(list, trTags);
			}
			
			formListTB.find("tbody").html(trTags);
			pagingArea.html(resp.pagingHTML_BS);
			
			$("#searchForm")[0].reset();
		},
		error : function(errResp) {
			console.log(errResp);
		}
});

function docformList(list, trTags) {
	if (list.length > 0) {
		$(list).each(
				function(idx, docform) {
					trTags.push($("<tr>").append(
							$("<td>").text(docform.rn).addClass("f-s-600 text-inverse"),
							$("<td>").text(docform.doctype),
							$("<td>").html(
									$("<a>").text(docform.docformnm).
									attr("href",  ctx + "/approval/work/apprWorkForm/" + docform.docformno)
									.addClass("f-s-600 text-inverse")
							)
					)
			);
		});
	} else {
		trTags.push($("<tr>").html(
				$("<td colspan='3'>").text("양식이 존재하지 않습니다.")));
	}
	return trTags;
}

function myRequestList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, myRequest){
			let rn = myRequest.rn;
			let apprdocsubject = myRequest.apprdocsubject;
			let apprdocno = myRequest.apprdocno;
			let apprdocdate = myRequest.apprdocdate;
			let apprhisdate = "";
			let apprdocstate = myRequest.apprdocstate;
			
			if (apprdocstate == 3) {
				apprhisdate = myRequest.apprhisdate;
				apprdocstate = "완료";
			} else if (apprdocstate == 2) {
				apprdocstate = "진행";
			} else if (apprdocstate == 4) {
				apprhisdate = myRequest.apprhisdate;
				apprdocstate = "반려";
			} else if (apprdocstate == 5) {
				apprhisdate = myRequest.apprhisdate;
				apprdocstate = "회수";
			}
			
			trTags.push(
				$("<tr>").append(
					$("<td>").text(rn),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprMyRequest/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(apprdocdate),
					$("<td>").text(apprhisdate),
					$("<td>").text(apprdocstate)
				)
			);
			
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='5'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}

function tempList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, temp){
			let rn = temp.rn;
			let apprdocno = temp.apprdocno;
			let apprdocsubject = temp.apprdocsubject;
			let deptnm = temp.deptnm;
			let empnm = temp.empnm;
			let apprdocdate = temp.apprdocdate;
			
			trTags.push(
				$("<tr>").append(
					$("<td>").html(
							$("<div>").append(
									$("<input>").attr({
										id : "tempChk" + rn,
										type : "checkbox",
										name : "tempChk",
										value : apprdocno
									}),
									$("<label>").attr("for", "tempChk" + rn).html("&nbsp;")
							).addClass("checkbox checkbox-css")
					).addClass("with-checkbox"),
					$("<td>").text(rn),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprTemp/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(deptnm),
					$("<td>").text(empnm),
					$("<td>").text(apprdocdate)
				)
			);
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='6'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}

function todoList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, todo){
			let rn = todo.rn;
			let apprdocno = todo.apprdocno;
			let apprdocsubject = todo.apprdocsubject;
			let empnm = todo.empnm;
			let deptnm = todo.deptnm;
			let apprdocdate = todo.apprdocdate;

			trTags.push(
				$("<tr>").append(
					
						$("<td>").html(
							$("<div>").append(
									$("<input>").attr({
										id : "todoChk" + rn,
										type : "checkbox",
										name : "todoChk",
										value : apprdocno
									}),
									$("<label>").attr("for", "todoChk" + rn).html("&nbsp;")
							).addClass("checkbox checkbox-css")
					).addClass("with-checkbox"),
					$("<td>").text(rn),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprTodo/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(deptnm),
					$("<td>").text(empnm),
					$("<td>").text(apprdocdate)
				)
			);
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='6'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}

function procList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, proc){
			let rn = proc.rn;
			let apprdocno = proc.apprdocno;
			let apprdocsubject = proc.apprdocsubject;
			let deptnm = proc.deptnm;
			let empnm = proc.empnm;
			let apprdocdate = proc.apprdocdate;
			let apprhisdate = proc.apprhisdate;
			let apprdocstate = proc.apprdocstate;
			
			if (apprdocstate = 3) {
				apprdocstate = "완료";
			}

//			NO	문서제목	기안부서	기안자	기안일	결재일	문서상태
			trTags.push(
				$("<tr>").append(
					$("<td>").text(rn),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprTodo/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(deptnm),
					$("<td>").text(empnm),
					$("<td>").text(apprdocdate),
					$("<td>").text(apprhisdate),
					$("<td>").text(apprdocstate)
				)
			);
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='7'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}

function completeList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, complete){
			let rn = complete.rn;
			let apprdocno = complete.apprdocno;
			let docformnm = complete.docformnm;
			let apprdocsubject = complete.apprdocsubject;
			let empnm = complete.empnm;
			let deptnm = complete.deptnm;
			let apprhisdate = complete.apprhisdate;
			let apprdocstate = complete.apprdocstate;
			
			if (complete.apprdocstate == 3) {
				apprdocstate = "완료";
			} else {
				apprdocstate = "";
			}

			trTags.push(
				$("<tr>").append(
					$("<td>").text(docformnm),
					$("<td>").text(apprdocno),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprComplete/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(deptnm),
					$("<td>").text(empnm),
					$("<td>").text(apprhisdate),
					$("<td>").text(apprdocstate)
				)
			);
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='7'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}

function referenceList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, reference){
			let rn = reference.rn;
			let apprdocno = reference.refdocno;
			let apprdocdate = reference.apprdoc.apprdocdate;
			let apprdocsubject = reference.apprdoc.apprdocsubject;
			let empnm = reference.empnm;
			let deptnm = reference.deptnm;
			let apprhisdate = reference.apprdoc.apprhisdate;
			let apprdocstate = reference.apprdoc.apprdocstate;
			
			if (apprdocstate == 2) {
				apprdocstate = "진행중";
			} else if (apprdocstate == 3) {
				apprdocstate = "완료";
			} else if (apprdocstate == 4) {
				apprdocstate = "반려";
			}
			
			trTags.push(
				$("<tr>").append(
					$("<td>").text(rn),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprReference/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(deptnm),
					$("<td>").text(empnm),
					$("<td>").text(apprdocdate),
					$("<td>").text(apprhisdate),
					$("<td>").text(apprdocstate)
				)
			);
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='7'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}

function rejectList(list, trTags) {
	if (list.length > 0){
		$(list).each(function(idx, reject){
			let rn = reject.rn;
			let apprdocno = reject.apprdocno;
			let apprdocsubject = reject.apprdocsubject;
			let empnm = reject.empnm;
			let deptnm = reject.deptnm;
			let apprhisdate = reject.apprhisdate;
			let apprdocstate = reject.apprdocstate;
			
			if (apprdocstate == 4) {
				apprdocstate = "반려";
			}
			
			trTags.push(
				$("<tr>").append(
					$("<td>").text(rn),
					$("<td>").html(
							$("<a>").text(apprdocsubject)
									.attr("href", ctx + "/approval/work/apprReject/" + apprdocno)
									.addClass("f-s-600 text-inverse")
					),
					$("<td>").text(deptnm),
					$("<td>").text(empnm),
					$("<td>").text(apprhisdate),
					$("<td>").text(apprdocstate)
				)
			);
		});
	} else {
		trTags.push($("<tr>").html($("<td colspan='7'>").text("문서가 존재하지 않습니다.")));
	}
	return trTags;
}