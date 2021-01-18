<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<security:authentication property="principal.emp" var="emp"/>
<form:form modelAttribute="cal" method="post" action="<c:uri value='${currentAction }' />" class="form-inline" />

<link href="${pageContext.request.contextPath }/js/cal/jquery.datetimepicker.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/js/cal/jquery.datetimepicker.full.min.js"></script>

<script>
	$(function(){
		jQuery('#date_timepicker_start').datetimepicker({
			format:'Y/m/d H:i',
			onShow:function( ct ){
				this.setOptions({
					maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
				})
			},
			timepicker:true
		});
		
		jQuery('#date_timepicker_end').datetimepicker({
			format:'Y/m/d H:i',
			onShow:function( ct ){
				this.setOptions({
					minDate:jQuery('#date_timepicker_start').val()?jQuery('#date_timepicker_start').val():false,
				})
			},
			timepicker:true
		});
		
// 		alert(new Date());
		
		$("#privateImg").on("click", function(){
			alert("일정의 시간 및 내용이 공개되지 않아 본인만 조회 가능합니다.\n(타인은 조회 불가)");
		});
	});
</script>

<script>
	function allDayCheck(){
		var allDay = document.getElementById("allDay");
		
		if(allDay.checked){
			jQuery('#date_timepicker_start').datetimepicker({
				format:'Y/m/d',
				defaultDate:new Date(),
				timepicker:false
			});
			
			jQuery('#date_timepicker_end').datetimepicker({
				format:'Y/m/d',
				defaultDate:new Date(),
				timepicker:false
			});
		};
	}
	
	function openCheck(){
		var openChk = document.getElementById("openchk");
		var input = $("[name='openchk']");
		
		if(openChk.checked == true){
			var input = $('input[name=openchk]').attr('value', 'N');
// 			alert(openChk.checked); // checked - true
// 			alert(input[0].defaultValue);
			console.log(input[0].defaultValue);
		}else if(openChk.checked == false){
			var input = $('input[name=openchk]').attr('value', 'Y');
// 			alert(openChk.checked); // checked - false
			console.log(input[0].defaultValue);
		}
		
	}
</script>

<div class="group" id="groupForm">
	<div class="group-head">
		<h1 class="page-header">일정 등록</h1><hr>
	</div>
	
	<div class="group-body">
		<form id="scheduleForm" method="post" class="form-horizontal form-bordered">
			<input type="hidden" name="schedetailno" value="${calDetail.schedetailno }" />
			<input type="hidden" name="scheno" value="${calDetail.scheno }" />
			<div class="form-group row">
				<div class="bg-grey-transparent-1 width-full">
					<i class="fa fa-exclamation-circle text-red"></i>
					&nbsp;&nbsp;일정을 참여자 외 다른 직원과 공유하지 않을 경우 아래의 비공개를 선택하시기 바랍니다.
				</div>
				<div class="width-full"></div>
				<table>
					<tr>
						<th><label class="col-xs-12 col-form-label">기간</label></th>
						<td>
							<div id="term" class="col-xs-12"><div class="row row-space-30">
								<div class="input-group date col-xs-4">
									<input type="text" style="height:40px;" name="startdate" value="${calDetail.startdate }" 
									class="form-control" id="date_timepicker_start" required>
									<div class="input-group-addon">
										<i class="fa fa-calendar" id="date_timepicker_start"></i>
									</div>
								</div>
								<div class="m-t-5">~</div>
								<div class="input-group date col-xs-4">
									<input type="text" style="height:40px;" name="enddate" value="${calDetail.enddate }" 
									class="form-control"  id="date_timepicker_end" required>
									<div class="input-group-addon">
										<i class="fa fa-calendar" id="date_timepicker_end"></i>
									</div>
								</div>
 								<div class="m-t-10">
 									<label>
 										<input id="allDay" name="allDay" value="allDay" class="allDayCheck" type="checkbox" 
 										onclick="allDayCheck()" />
 										&nbsp;&nbsp;종일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
 								</div>
								<div class="m-t-10">
									<label>
										<input id="deptSche" class="valid" type="checkbox" aria-invalid="false">
										&nbsp;&nbsp;부서일정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
								</div>
								<div class="m-t-10">
									<label>
										<input id="openchk" name="openchk" class="valid" type="checkbox" onclick="openCheck()"
										value="Y">&nbsp;&nbsp;비공개&nbsp;
									</label>
										<a><i id="privateImg" class="fa fa-question-circle text-red"></i></a>
								</div>
							</div></div>
						</td>
					</tr>
					<tr>
						<th><label class="col-xs-12 col-form-label">제목</label></th>
						<td>
							<div name="titleCate" value="${calDetail.schedetailtype }" class="block-form m-t-5" id="titleCate" 
							style="position: relative;">
								<label style="padding-left:15px;">
									<select id="schedetailtype" name="schedetailtype" class="form-control" required>
										<option value>구분</option>
										<option value="업무">업무</option>
										<option value="중요">중요</option>
										<option value="출장">출장</option>
										<option value="휴가">휴가</option>
										<option value="영업활동">영업활동</option>
									</select>
								</label>
								<label>
									<input name="schedetailnm" value="${calDetail.schedetailnm }" type="text" 
									placeholder="제목" class="form-control" id="title" style="width:1100px;" required>
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<th><label class="col-xs-12 col-form-label">장소</label></th>
						<td>
							<label style="padding-left:15px;" class="m-t-5">
								<input name="schedetailplace" value="${calDetail.schedetailplace }" type="text" 
								placeholder="장소" class="form-control" id="title" style="width:1207px;">
							</label>
						</td>
					</tr>
					<!-- <tr>
						<th><label class="col-xs-12 col-form-label">첨부파일</label></th>
						<td>
							<div style="padding-left:15px;" class="input-group m-t-5">
								<input style="height:40px;" name="scheattoriginalfilename" type="text" placeholder="첨부파일"
								class="form-control" id="scheattoriginalfilename" style="width:300px;">
								<div style="width:40px; height:40px;" class="input-group-addon">
									<i class="fa fa-file"></i>
								</div>
							</div>
						</td>
					</tr> -->
					<tr>
						<th><label class="col-xs-12 col-form-label">참여자</label></th>
						<td>
							<div style="padding-left:15px;" class="input-group m-t-5">
								<input style="height:40px;" name="participant" value="" type="text" 
								placeholder="참여자" class="form-control" id="participant" style="width:1100px;">
<!-- 								<div style="width:40px; height:40px;" class=""> -->
								<a class="showModal btn btn-inverse input-group-addon" href="#calFormModal" 
								data-toggle="modal" data-service="recipient">
									<i class="fa fa-user"></i>
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<th><label class="col-xs-12 col-form-label">내용</label></th>
						<td>
							<div style="padding-left:15px;" class="m-t-5">
								<textarea name="schedetailcontent" rows="10" placeholder="내용" class="form-control" 
								id="schedetailcontent" style="width:1207px;">
								</textarea>
							</div>
						</td>
					</tr>
				</table>
				<div style="width:100%; text-align:center;">
					<input type="submit" value="저장" class="btn btn-primary mr-3" />
					<input type="reset" value="취소" class="btn btn-warning mr-3" 
					onclick="location.href='${pageContext.request.contextPath }/cal';"/>
					<input type="button" value="뒤로가기" class="btn btn-info"
					onclick="location.href='${pageContext.request.contextPath}/cal';" />
				</div>
			</div>
		</form>
	</div>
</div>

<div id="calFormModal" class="modal fade">
	<div class="modal-dialog" style="margin-left: 20%">
		<div class="modal-content" style="min-width: 1000px; width: auto;">
			<div class="modal-header height-100 bg-green-transparent-9">
				<h4 id="modalTitle" class="modal-title text-center text-white">참여자 선택</h4>
			</div>

			<div class="modal-body">
				<div class="row height-500">
					<div class="col-4">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a href="#organization" data-toggle="tab" class="nav-link active">조직도</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade active show" id="organization">
								<div id="jstree-checkable"></div>
							</div>
						</div>
					</div>

					<div class="col-3 text-center">
						<div class="wrapper height-200"></div>

						<div class="bg-light wrapper">
							<button id="calFormAdd" class="btn btn-white btn-sm" type="button"><!--apprlineAdd-->
								<i class="fa fa-angle-right"></i>
							</button>
							<br>
							<button id="calFormRemove" class="btn btn-white btn-sm mt-1" type="button"><!--apprlineRemove-->
								<i class="fa fa-angle-left"></i>
							</button>
						</div>
					</div>

					<div id="calFormService" class="col-5">
						<strong class="modalServiceInfo"> </strong>
						<hr>
						<div class="wrapper bg-light text-center height-300">
							<b>참여자</b>
							<div class="row wrapper justify-content-center">
								<table id="calFormTB"
									class="table table-hover table-boadered table-td-valign-middle table-th-valign-middle">
									<tbody>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer height-100 bg-grey-transparent-2">
				<a id="confirmApprLine" class="btn btn-yellow mr-2" href="#" data-dismiss="modal">적용</a>
				<a id="cancelApprLine" class="btn btn-white" href="/" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$("#calFormModal").appendTo("body");

		let calFormURL = ctx + "/cal/calRegistForm"; // apprLineURL approval/work/apprLine
		let calFormTB = $("#calFormTB"); //table 이름 approvalLineTB

		$(".showModal").on("click", function() { //트리 그려주는 거

			$.ajax({
				url : noteFormURL + "/calFormTree",
				method : "post",
				dataType : "json",
				success : function(resp) {
					console.log(resp);
					TreeView.init(resp);
				},
				error : function(errResp) {
					console.log(errResp);
				}
			});
		});

		var handleJstreeCheckable = function(data) { // organization부분
			$('#jstree-checkable').jstree({
				'plugins' : [ "wholerow", "checkbox", "types" ],
				'core' : {
					"themes" : {
						"responsive" : false
					},
					'data' : data
				},
				"types" : {
					"default" : {
						"icon" : "fa fa-folder text-primary fa-lg"
					},
					"file" : {
						"icon" : "fa fa-file text-success fa-lg"
					}
				}
			});
		};

		var TreeView = function() {
			"use strict";
			return {
				init : function(data) {
					console.log(data);
					handleJstreeCheckable(data);
				}
			};
		}();

		$("#noteFormAdd").on(
				"click",
				function() { // apprlineAdd
					var selectedNode = $("#jstree-checkable").jstree(
							"get_selected", true);

					if (selectedNode.length == 0) {
						alert("선택한 수신자가 없습니다.");
						return false;
					}
					recipientAdd(selectedNode);

				});

		function recipientAdd(selectedNode) {
			let trs = calFormTB.find("tbody").children();

			if (trs.length > 1 || selectedNode.length > 1
					|| (trs.length + selectedNode.length) > 2) {
				alert("수신자는 1명만 지정 가능합니다.");
				return false;
			} // 여러명 선택했을 때 추가 안되게 하는 거(1명만 선택 가능)

			let id = selectedNode[0].id; // id : empno, 사람만 선택
			let idArray = id.split('/');

			let empnm = selectedNode[0].text;
			let empno = idArray[0]; // chargerempno

			let parent = selectedNode[0].parent; // deptno 가져오는거

			var parentNode = $('#jstree-checkable').jstree(true).get_node(
					parent); // deptno를 바탕으로 node 가져옴
			let deptnm = parentNode.text;
			let deptno = parentNode.id.split('/')[0]; // 컨트롤러에 empno/deptno 붙여놓은거 잘라서 사용(필요한 것만 가져오기)

			let trTags = [];
			let data = {};

			data.trs = trs;

			trTags.push($("<tr>").append( // 어떻게 그릴건지, 필요한 데이터는 attr로 <tr>에 있는 td의 데이터를 tr 한 곳에다가 넣어 둠(필요한 것만)
			$("<td>").text(deptnm).attr("colspan", 1),
					$("<td>").text(empnm).attr("colspan", 2)).attr({
				"data-deptno" : deptno, // deptno
				"data-empno" : empno
			// chargerempno
			}))

			calFormTB.find("tbody").append(trTags); // approvalLineTB
		}

		$("#confirmApprLine").on("click", function() {
			let recipientTrs = calFormTB.find("tbody").children(); // approvalLineTB
			confirmRecipient(recipientTrs);
		});

		function confirmRecipient(trs) {
			if (trs.length == 0) {
				return false;
			}

			let tr = trs[0];
			console.log(tr);

			let deptno = $(tr).data("deptno"); // 테이블에 저장된 데이터 뽑아오는 부분(tr)
			let empno = $(tr).data("empno"); // chargerempno
			let deptnm = $(tr).children().eq(0).text();
			let empnm = $(tr).children().eq(1).text();
			console.log(deptno);
			console.log(deptnm);
			console.log(empno);
			console.log(empnm);

			$("#receiveInfo").val(empnm); // 어디에 저장할지 텍스트 저장 부분
			$("input[name='deptno']").val(deptno); // form에 hidden으로 숨겨놓은 데이터 value?
			$("input[name='empno']").val(empno); // chargerempno
			calFormTB.find("tbody").empty(); // approvalLineTB
		}
	});
</script>
