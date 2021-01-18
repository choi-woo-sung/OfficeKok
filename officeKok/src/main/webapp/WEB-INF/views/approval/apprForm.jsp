<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="${pageContext.request.contextPath}/template/assets/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/plugins/jstree/dist/jstree.min.js"></script>
<link href="${pageContext.request.contextPath}/template/assets/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />

<style type="text/css">
.modal-backdrop {
	position: relative;
}
</style>

<c:url value="/approval/work/apprWorkForm" var="apprWorkURL" />

<h1 class="page-header">기안문 작성</h1>
<hr>
<p class="text-right m-b-10">
	<a class="showModal btn btn-inverse" href="#apprModal" data-toggle="modal" data-service="apprline"> 결재선 </a>
	<a class="showModal btn btn-inverse ml-1" href="#apprModal" data-toggle="modal" data-service="recipient">수신처</a>
	<button class="apprRequest btn btn-inverse ml-1" type="button" data-service="request">결재요청</button>
	<button class="apprRequest btn btn-white ml-1" type="button" data-service="temp">임시저장</button>
	<a class="btn btn-white ml-1" href="${apprWorkURL}">취소</a>
</p>


<div id="apprCommonPaper" class="text-center">
	<h2>${docform.docformnm}</h2>

	<div class="overflow-auto m-b-20 text-center">
		<div class="pull-right">
			<input type="hidden" name="apprline" />
			<table id="apprLineTB" class="table table-bordered">
				<tbody>
				</tbody>
			</table>
		</div>
	</div>

	<div class="width-full">
		<table class="width-full table table-bordered table-td-valign-middle">
			<caption></caption>
			<colgroup>
				<col style="width: 15%;">
				<col style="width: 35%;">
				<col style="width: 15%;">
				<col style="width: 35%;">
			</colgroup>
			<tbody>
				<tr class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">문서번호</th>
					<td class="text-left p-l-5">자동채번</td>
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">기안일자</th>
					<td class="text-left p-l-5"><fmt:formatDate pattern="yyyy.MM.dd" value="${today}" /></td>
				</tr>
				<tr class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">기안자</th>
					<td class="text-left p-l-5">${draftEmp.empnm}</td>
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">기안부서</th>
					<td class="text-left p-l-5">${draftEmp.deptnm}</td>
				</tr>
				<tr class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">참조자</th>
					<td class="text-left p-l-5 with-input-group" colspan="3">
						<div class="input-group">
							<input id="apprReferenceInfo" class="form-control height-30 bg-white" type="text" readonly />
							<div class="input-group-append">
								<a class="showModal btn btn-white height-30" href="#apprModal" data-toggle="modal" data-service="reference"> + </a>
							</div>
						</div>
					</td>
				</tr>
				<tr id="apprReceiveLineTr" class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">수신처</th>
					<td id="receiveInfo" class="text-left p-l-5" colspan="3"></td>
				</tr>
				<tr class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">문서제목</th>
					<td class="text-left p-l-5 with-form-control" colspan="3">
						<input class="form-control form-control-sm" type="text" name="apprsubject" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<div id="docformArea">
	<form>${docform.docformhtml}</form>
</div>

<form id="draftForm" class="form-horizontal" action="${apprWorkURL}/draft" method="post" enctype="multipart/form-data">
	<c:if test="${docform.docformno ne 'A006'}">
		<div class="panel panel-inverse">
			<div class="panel-heading">
				<h4 class="panel-title">파일 업로드</h4>
			</div>

			<div class="panel-body">
				<div class="row fileupload-buttonbar">
					<div class="col-xl-7">
						<span class="btn btn-primary fileinput-button m-r-3"> 
							<i class="fa fa-fw fa-plus"></i> 
							<span>파일 추가</span> 
							<input id="file" type="file" name="attatchFiles" multiple>
						</span>
<!-- 						<button id="fileUploadBtn" type="submit" class="btn btn-primary start m-r-3"> -->
<!-- 							<i class="fa fa-fw fa-upload"></i> <span>업로드</span> -->
<!-- 						</button> -->
						<button id="fileDeleteBtn" type="button" class="btn btn-default delete m-r-3">
							<i class="fa fa-fw fa-trash"></i> 
							<span>삭제</span>
						</button>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table table-striped table-condensed table-boaderd">
					<colgroup>
						<col width="10%"></col>
						<col width="50%"></col>
						<col width="30%"></col>
						<col width="10%"></col>
					</colgroup>
					<thead>
						<tr>
							<th>NO</th>
							<th>파일명</th>
							<th>파일 크기</th>
							<th></th>
						</tr>
					</thead>
					<tbody class="files">
						<tr>
							<td colspan="4" class="text-center text-muted p-t-30 p-b-30">
								<div class="m-b-10">
									<i class="fa fa-file fa-3x"></i>
								</div>
								<div>업로드한 파일이 없습니다.</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>

	<input type="hidden" name="docformno" value="${docform.docformno}" /> 
	<input type="hidden" name="apprlineno" value="0" /> 
	<input type="hidden" name="apprdocsubject" /> <input type="hidden" name="apprdoccontent" />
	<input type="hidden" name="draftno" value="${draftEmp.empno}" /> 
	<input type="hidden" name="apprdocstate" />
	<input type="hidden" name="references" />
	<input type="hidden" name="deptno" />
	<input type="hidden" name="chargerempno" />
	<input type="hidden" name="service" />
</form>

<p class="text-right m-b-10">
	<a class="showModal btn btn-inverse" href="#apprModal" data-toggle="modal" data-service="apprline"> 결재선 </a>
	<a class="showModal btn btn-inverse ml-1" href="#apprModal" data-toggle="modal" data-service="recipient">수신처</a>
	<button class="apprRequest btn btn-inverse ml-1" type="button" data-service="request">결재요청</button>
	<button class="apprRequest btn btn-white ml-1" type="button" data-service="temp">임시저장</button>
	<a href="${apprWorkURL}" class="btn btn-white ml-1">취소</a>
</p>

<div id="apprModal" class="modal fade">
	<div class="modal-dialog" style="margin-left: 20%">
		<div class="modal-content" style="min-width: 1000px; width: auto;">
			<div class="modal-header height-100 bg-green-transparent-9">
				<h4 id="modalTitle" class="modal-title text-center text-white">

				</h4>
			</div>

			<div class="modal-body">
				<div class="row height-500">
					<div class="col-4">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a href="#organization" data-toggle="tab" class="nav-link active">조직도 </a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade active show" id="organization">
								<div id="jstree-checkable"></div>
							</div>
						</div>
					</div>

					<div class="col-3 text-center">
						<div class="wrapper height-150"></div>
						<div id="apprType" class="wrapper">
							<strong>결재방법</strong>
							<hr>
							<div class="radio radio-css radio-inline">
								<input id="approvalChk" type="radio" name="approvaltype" value="3" checked /> 
								<label for="approvalChk">결재</label>
							</div>
							<div class="radio radio-css radio-inline">
								<input id="consentChk" type="radio" name="approvaltype" value="2" /> 
								<label for="consentChk">합의</label>
							</div>
						</div>

						<div class="bg-light wrapper">
							<button id="apprLineAdd" class="btn btn-yellow btn-sm" type="button">
								<i class="fa fa-angle-right"></i>
							</button>
							<br />
							<button id="apprLineRemove" class="btn btn-white btn-sm mt-1" type="button">
								<i class="fa fa-angle-left"></i>
							</button>
						</div>
					</div>

					<div id="apprLineService" class="col-5">
						<strong class="modalServiceInfo">
						</strong>
						<hr>
						
						<div class="wrapper bg-light text-center">
							<b>사용자 결재선</b>
							<div class="row wrapper justify-content-center">
								<select name="apprLine" class="form-control form-control-sm col-8">
									<option value="0">
										------------ 사용자 결재선 선택 ------------
									</option>
								</select> 
								<input id="deleteApprLine" class="form-control form-control-sm col-2 btn btn-white ml-2" type="button" value="삭제" />
							</div>
						</div>
						
						<table id="approvalLineTB" class="table table-hover table-boadered table-td-valign-middle table-th-valign-middle">
							<tbody>
								<tr class="lastStep" data-apprtypeno="1" data-stepempno="${draftEmp.empno}">
									<td>최종</td>
									<td>기안</td>
									<td>${draftEmp.empnm}</td>
									<td>${draftEmp.deptnm}</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">결재선명</th>
									<td class="bg-silver-transparent-7" colspan="2">
										<input class="form-control form-control-sm col-12 ml-2 text-center" type="text" name="apprlinenm" placeholder="결재선명을 입력하세요.!"
												onfocus="this.placeholder=''" onblur="this.placeholder='결재선명을 입력하세요.!'" />
									</td>
									<td class="bg-silver-transparent-7">
										<input id="apprLineSave" class="form-control-sm btn btn-white ml-2" type="button" value="저장" />
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
					
					<div id="refenceService" class="col-5">
						<strong class="modalServiceInfo"></strong>
						<hr>
						<table id="referenceTB" class="table table-hover tablle-boadered table-td-valign-middle table-th-valign-middle">
							<tbody>
							</tbody>
						</table>
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

<input type="hidden" name="modalService" />
<input type="hidden" name="apprLineChk" />

<script src="${pageContext.request.contextPath}/template/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/demo/render.highlight.js"></script>

<script type="text/javascript">
	$(function() {
		let apprLineURL = ctx + "/approval/work/apprLine";
		
		$("#apprModal").appendTo("body");
		
		let apprsubject = $("#apprsubject");
		let draftForm = $("#draftForm");
		let approvalLineTB = $("#approvalLineTB");
		let apprLineTB = $("#apprLineTB");
		let referenceTB = $("#referenceTB");
		
		$(".showModal").on("click", function() {	
			let service = $(this).data('service');
			$("input[name='modalService']").val(service);
			let apprTypeArea = $("#apprType");
			let apprLineServiceArea = $("#apprLineService");
			let referenceServiceArea = $("#refenceService");
			
			let modalService = null;
			if (service == 'reference') {
				apprTypeArea.hide();
				apprLineServiceArea.hide();
				referenceServiceArea.show();
				
				modalService = "참조자";
			} else {
				if (service == 'recipient') {
					apprTypeArea.hide();
					referenceServiceArea.hide();
					apprLineServiceArea.show();
					approvalLineTB.find("tbody").empty();
					
					let selectApprline = $("select[name='apprLine']");
					selectApprline.empty();
					let fixedOption = $("<option>").text("------------ 사용자 결재선 선택 ------------").attr("value", "0")
					selectApprline.append(fixedOption);
					
					modalService = "수신처";
				} else if(service == 'apprline') {
					apprTypeArea.show();
					apprLineServiceArea.show();
					referenceServiceArea.hide();
					approvalLineTB.find("tbody").empty();
					
					modalService = "결재선";
					
					$.ajax({
						url : apprLineURL + "/apprLineList",
						method : "post",
						dataType : "json",
						success : function(resp) {
							let selectApprline = $("select[name='apprLine']");
							selectApprline.empty();
							let fixedOption = $("<option>").text("------------ 사용자 결재선 선택 ------------").attr("value", "0")
							selectApprline.append(fixedOption);
							
							$.each(resp, function(idx) {
								let apprlineOption = $("<option>").text(resp[idx].apprlinenm).attr("value", resp[idx].apprlineno);
								selectApprline.append(apprlineOption);
							});
						},
						error : function(errResp) {
							console.log(errResp);
						}
					});
					
					$("#apprLineChk").val("N");
					let tr = $("<tr>").append(
									$("<td>").text("최종"),
									$("<td>").text("기안"),
									$("<td>").text("${draftEmp.empnm}"),
									$("<td>").text("${draftEmp.deptnm}")
								).attr({
									"class" : "lastStep",
									"data-apprtypeno" : "1",
									"data-stepempno" : "${draftEmp.empno}"
								})
					approvalLineTB.find("tbody").html(tr);
				}
			}
			$(".modalServiceInfo").text(modalService + " 정보");
			$("#modalTitle").text(modalService);
			
			$.ajax({
				url : apprLineURL + "/apprTree",
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
		
		var handleJstreeCheckable = function(data) {
		    $('#jstree-checkable').jstree({
		        'plugins': ["wholerow", "checkbox", "types"],
		        'core': {
		            "themes": {
		                "responsive": false
		            },    
		            'data': data
		            },
		        "types": {
		            "default": {
		                "icon": "fa fa-folder text-primary fa-lg"
		            },
		            "file": {
		                "icon": "fa fa-file text-success fa-lg"
		            }
		        }
		    });
		};

		var TreeView = function () {
			"use strict";
			return {
				init: function (data) {
					handleJstreeCheckable(data);
				}
			};
		}();
		
		$("select[name='apprLine']").on("change", function() {
			let apprlineno = $(this).val();
			
			if (apprlineno == "0") {
				approvalLineTB.find("tbody").empty();
				$("#apprLineChk").val("N");
				let tr = $("<tr>").append(
								$("<td>").text("최종"),
								$("<td>").text("기안"),
								$("<td>").text("${draftEmp.empnm}"),
								$("<td>").text("${draftEmp.deptnm}")
							).attr({
								"class" : "lastStep",
								"data-apprtypeno" : "1",
								"data-stepempno" : "${draftEmp.empno}"
							})
				approvalLineTB.find("tbody").html(tr);
				return false;
			}
			
			$("input[name='apprlineno']").val(apprlineno);
			
			let data = {
				apprlineno : apprlineno
			};
			
			$.ajax({
				url : apprLineURL,
				data : data,
				method : "post",
				dataType : "json",
				success : function(resp) {
					let list = resp[0].apprStepList;
					let trTags = [];
					
					if (list.length > 0) {
						approvalLineTB.find("tbody").empty();
						$("#apprLineChk").val("Y");
						
						$(list).each(
								function(idx, apprstep) {
									if (idx != list.length - 1) {
										trTags.push($("<tr>").append(
												$("<td>").text(""),
												$("<td>").text(apprstep.apprtype),
												$("<td>").text(apprstep.empnm),
												$("<td>").text(apprstep.deptnm)
												).attr({
													"data-apprtypeno" : apprstep.apprtypeno,
													"data-stepempno" : apprstep.stepempno
												})
										)
									} else if(idx == list.length - 1) {
										trTags.push($("<tr>").append(
												$("<td>").text("최종"),
												$("<td>").text(apprstep.apprtype),
												$("<td>").text(apprstep.empnm),
												$("<td>").text(apprstep.deptnm)
												).attr({
													"class" : "lastStep",
													"data-apprtypeno" : apprstep.apprtypeno,
													"data-stepempno" : apprstep.stepempno
												})
										)
									}
						});
					}
					approvalLineTB.find("tbody").html(trTags);
				},
				error : function(errResp) {
					console.log(errResp);
				}
			})
		});
		
		// 모달창 결재라인 tr태그 클릭 시 이벤트 발생
		approvalLineTB.on("click", "tr", function() {
			let step = $(this);
			let seletedStep = $(".selectedStep");
			
			let hasSelected = step.hasClass("selectedStep");
			if (hasSelected) {
				let isLastStep = step.hasClass("lastStep");
				if (isLastStep) {
					seletedStep.removeClass();
					step.addClass("lastStep");
				} else {
					seletedStep.removeClass();
				}
			} else {
				seletedStep.removeClass();
				step.addClass("selectedStep bg-silver-transparent-7");
			}
		});
		
		referenceTB.on("click", "tr", function() {
			let referenceEmp = $(this);
			let seletedReferenceEmp = $(".selectedReference");
			
			let hasSelected = referenceEmp.hasClass("selectedReference");
			if (hasSelected) {
				seletedReferenceEmp.removeClass();
			} else {
				seletedReferenceEmp.removeClass();
				referenceEmp.addClass("selectedReference bg-silver-transparent-7");
			}
		})
		
		$("#apprLineAdd").on("click", function() {
			var selectedNode = $("#jstree-checkable").jstree("get_selected", true);
			
			if (selectedNode.length == 0) {
				alert("선택한 사용자가 없습니다.");
				return false;
			}
			
			let service = $("input[name='modalService']").val();
			if (service == "reference") {
				referenceAdd(selectedNode);
			} else if (service == "apprline") {
				apprLineAdd(selectedNode);
			} else if (service == "recipient") {
				recipientAdd(selectedNode);
			}
			
		});
		
		function apprLineValidation(data) {
			let trs = data.trs;
			let stepempno = data.stepempno;
			let validation = true;
			$.each(trs, function(idx) {
				let trStepEmpno = $(trs[idx]).data("stepempno");
				if (stepempno == trStepEmpno) {
					validation = false;
				}
			});
			return validation;
		}
		
		function apprLineAdd(selectedNode) {
			let node = selectedNode.find(function(node) {
				let id = node.id;
				let idArray = id.split('/');
				
				return idArray[1] == "deptno";
			});
			
			if (node) {
				let nodeIdx = selectedNode.indexOf(node);
				selectedNode.splice(nodeIdx, 1);
			}
			
			$("#apprLineChk").val("N");
			$("input[name='apprlineno']").val("0");
			
			let trs = approvalLineTB.find("tbody").children();
			
			if (selectedNode.length > 5 || trs.length > 5 
					|| (selectedNode.length + trs.length) > 5) {
				alert("결재선은 최대 5명까지 지정할 수 있습니다.!!");
				return false;
			}
			
			let apprtypeno = $("input[name='approvaltype']:checked").val();
			let apprtypenm = apprtypeno == "3" ? "결재" : "합의";
			
			let trTags = [];
			
			let data = {};
			$.each(selectedNode, function(idx) {
				let id = selectedNode[idx].id;
				let idArray = id.split('/');
				
				if (idArray[1] == "deptno") {
					return false;
				}
				
				let txt = selectedNode[idx].text;

				let deptno = selectedNode[idx].parent;
				
				var node = $('#jstree-checkable').jstree(true).get_node(deptno);
				
				let deptnm = node.text;
				let empnm = txt.split(' ')[0];
				let stepempno = idArray[0];
				
				data.trs = trs;
				data.stepempno = stepempno;
				
				let validation = apprLineValidation(data);
				if (!validation) {
					alert(empnm + "은 이미 결재선에 존재합니다.");
					return true;
				}
				
				$(".lastStep :first-child").text("");
				$(".lastStep").removeClass();
				
				if (idx == selectedNode.length - 1) {
					trTags.push($("<tr>").append(
							$("<td>").text("최종"),
							$("<td>").text(apprtypenm),
							$("<td>").text(empnm),
							$("<td>").text(deptnm)
							).attr({
								"class" : "lastStep",
								"data-apprtypeno" : apprtypeno,
								"data-stepempno" : stepempno
							})
					)
				} else {
					trTags.push($("<tr>").append(
							$("<td>").text(""),
							$("<td>").text(apprtypenm),
							$("<td>").text(empnm),
							$("<td>").text(deptnm)
							).attr({
								"data-apprtypeno" : apprtypeno,
								"data-stepempno" : stepempno
							})
					)
				}
			});
			approvalLineTB.find("tbody").append(trTags);
		}
		
		function referenceAdd(selectedNode) {
			let node = selectedNode.find(function(node) {
				let id = node.id;
				let idArray = id.split('/');
				
				return idArray[1] == "deptno";
			});
			
			if (node) {
				let nodeIdx = selectedNode.indexOf(node);
				selectedNode.splice(nodeIdx, 1);
			}
			
			let trs = referenceTB.find("tbody").children();
			
			if (selectedNode.length > 5 || trs.length > 5 
					|| (selectedNode.length + trs.length) > 5) {
				alert("참조자는 최대 5명까지 지정할 수 있습니다.!!");
				return false;
			}
			
			let trTags = [];
			
			let data = {};
			
			$.each(selectedNode, function(idx) {
				let id = selectedNode[idx].id;
				let idArray = id.split('/');
				
				if (idArray[1] == "deptno") {
					return false;
				}

				let deptno = selectedNode[idx].parent;
				
				var node = $('#jstree-checkable').jstree(true).get_node(deptno);
				
				let deptnm = node.text;
				let empnm = selectedNode[idx].text;
				let referenceempno = idArray[0];
				
				data.trs = trs;
				data.referenceempno = referenceempno;
				
				console.log(referenceempno);
				
				let validation = referenceValidation(data);
				if (!validation) {
					alert(empnm + "은 이미 참조자 목록에 존재합니다.");
					return true;
				}
				trTags.push($("<tr>").append(
						$("<td>").text(empnm),
						$("<td>").text(deptnm)
						).attr({
							"data-referenceempno" : referenceempno
						})
				)
			});
			referenceTB.find("tbody").append(trTags);
		}
		
		function referenceValidation(data) {
			let trs = data.trs;
			let referenceempno = data.referenceempno;
			let validation = true;
			$.each(trs, function(idx) {
				let trReferenceEmpno = $(trs[idx]).data("referenceempno");
				if (referenceempno == trReferenceEmpno) {
					validation = false;
				}
			});
			return validation;
		}
		
		function recipientAdd(selectedNode) {
			let trs = approvalLineTB.find("tbody").children();
			
			if (trs.length > 1 || selectedNode.length > 1 || (trs.length + selectedNode.length) > 1) {
				alert("수신처는 1개팀(부서)만 지정 가능합니다.!!");
				return false;
			}
			
			let id = selectedNode[0].id;
			let idArray = id.split('/');
			
			let empnm = selectedNode[0].text;
			let chargerempno = idArray[0];
			
			let parent = selectedNode[0].parent;
			
			var parentNode = $('#jstree-checkable').jstree(true).get_node(parent);
			let deptnm = parentNode.text;
			let deptno = parentNode.id.split('/')[0];
			
			let trTags = [];
			let data = {};
			
			data.trs = trs;
			data.chargerempno = chargerempno;
			if(!recipientValidation(data)) {
				alert("이미 존재하는 수신처입니다.");
				return false;
			};

			trTags.push($("<tr>").append(
					$("<td>").text("수신").attr("colspan", 1),
					$("<td>").text(deptnm).attr("class", "text-center"),
					$("<td>").text(empnm).attr("colspan", 2)
					).attr({
						"data-deptno" : deptno,
						"data-chargerempno" : chargerempno
					})
			)	
				
			approvalLineTB.find("tbody").append(trTags);
		}
		
		function recipientValidation(data) {
			let trs = data.trs;
			let chargerempno = data.chargerempno;
			let validation = true;
			$.each(trs, function(idx) {
				let trChargerempno = $(trs[idx]).data("chargerempno");
				if (chargerempno == trChargerempno) {
					validation = false;
				}
			});
			return validation;
		}
		
		$("#apprLineRemove").on("click", function() {
			let service = $("input[name='modalService']").val();
			if (service == "reference") {
				referenceRemove();
			} else if (service == "recipient") {
				recipientRemove();
			} else if (service == "apprline") {
				apprLineRemove();
			}
		});
		
		function apprLineRemove() {
			let selectedStep = $(".selectedStep");
			if (selectedStep.length == 0) {
				alert("삭제할 결재스탭을 선택하세요!!");
				return false;
			}
			
			if (selectedStep.data("apprtypeno") == 1) {
				alert("기본 결재스탭은 삭제할 수 없습니다.");
				return false;
			};
			
			let lastStep = $(".lastStep");
			if ($(selectedStep[0]).data("stepempno") == $(lastStep[0]).data("stepempno")) {
				lastStep.remove();
				lastStep = approvalLineTB.find("tbody :last-child");
				lastStep.addClass("lastStep");
				lastStep.find(":first-child").text("최종");
			} else {
				selectedStep.remove();
			}
		}
		
		function recipientRemove() {
			let selectedStep = $(".selectedStep");
			if (selectedStep.length == 0) {
				alert("삭제할 수신처를 선택하세요!!");
				return false;
			}
			selectedStep.remove();
		}
		
		function referenceRemove() {
			let selectedReference = $(".selectedReference");
			if (selectedReference.length == 0) {
				alert("삭제할 참조자를 선택하세요!!");
				return false;
			}
			selectedReference.remove();
		}
		
		$("#apprLineSave").on("click", function() {
			let trs = approvalLineTB.find("tbody").children();
			if (trs.length == 1 || trs.length == 0) {
				$("input[name='apprlinenm']").focus();
				alert("결재스탭을 추가해주세요!!");
				return false;
			}
			
			let apprlinenm = $("input[name='apprlinenm']").val();
			
			if (apprlinenm == null || apprlinenm == "") {
				alert("결재선명을 입력하세요.!!");
				return false;
			}
			
			let apprline = {}; //초기화;
			let apprStepList = [];
			
			$.each(trs, function(idx, tr) {
				apprstep = {};
				apprstep.apprstepprior = idx + 1;
				apprstep.stepempno = $(tr).data("stepempno");
				apprstep.apprtypeno = $(tr).data("apprtypeno");
				
				apprStepList.push(apprstep);
			});
			
			apprline.apprlinenm = apprlinenm;
			apprline.apprStepList = apprStepList;
			
			$.ajax({
				url : apprLineURL + "/regist",
				data : JSON.stringify(apprline),
				contentType : "application/json",
				method : "post",
				dataType : "json",
				success : function(resp) {
					if (resp.res == "fail") {
						alert(resp.meg);
					} else {
						alert(resp.msg);
						
						let selectApprline = $("select[name='apprLine']");
						selectApprline.empty();
						let fixedOption = $("<option>").text("------------ 사용자 결재선 선택 ------------").attr("value", "0")
						selectApprline.append(fixedOption);
						
						let apprLineArray = resp.apprline;
						$.each(apprLineArray, function(idx) {
							let apprlineOption = $("<option>").text(apprLineArray[idx].apprlinenm).attr("value", apprLineArray[idx].apprlineno);
							selectApprline.append(apprlineOption);
						});
					}
					$("input[name='apprlinenm']").val("");
				},
				error : function(errResp) {
					console.log(errResp);
				}
			});
		});
		
		$("#confirmApprLine").on("click", function() { 
			let service = $("input[name='modalService']").val();
			if (service == "reference") {
				let trs = referenceTB.find("tbody").children();
				if (trs.length == 0) {
					return false;
				}
				confirmReference(trs);
			} else if (service == "recipient") {
				let recipientTrs = approvalLineTB.find("tbody").children();
				confirmRecipient(recipientTrs);
			} else if (service == "apprline") {
				let apprlineTrs = approvalLineTB.find("tbody").children();
				confirmApprLine(apprlineTrs);
			}
		});
		
		function confirmReference(trs) {
			let referenceempno = "";
			let referenceempnm = "";
			let trsLength = trs.length;
			$.each(trs, function(idx, tr) {
				let referenceempnoTxt = $(tr).data("referenceempno");
				let referenceempnmTxt = $(tr).children().eq(0).text();
				
				if (trsLength == (idx + 1)) {
					referenceempnm += referenceempnmTxt;
					referenceempno += referenceempnoTxt;
				} else {
					referenceempnmTxt = referenceempnmTxt + ", ";
					referenceempnoTxt = referenceempnoTxt + "/";
					referenceempnm += referenceempnmTxt;
					referenceempno += referenceempnoTxt;
				}
			});
			$("#apprReferenceInfo").val(referenceempnm);
			$("input[name='references']").val(referenceempno);
			
			referenceTB.find("tbody").empty();
		}
		
		function confirmRecipient(trs) {
			if (trs.length == 0) {
				return false;
			}
			
			let tr = trs[0];
			
			let deptno = $(tr).data("deptno");
			let chargerempno = $(tr).data("chargerempno");
			let deptnm = $(tr).children().eq(1).text();
			let empnm = $(tr).children().eq(2).text();
			
			$("#receiveInfo").text(deptnm + " " + empnm);
			$("input[name='deptno']").val(deptno);
			$("input[name='chargerempno']").val(chargerempno);
			approvalLineTB.find("tbody").empty();
		}
		
		function confirmApprLine(trs) {
			apprLineTB.find("tbody").empty();
			
			console.log(trs);
			let apprTypeTrTag = $("<tr>");
			let apprEmpNmTrTag = $("<tr>");
			
			let apprTxt = "결\n\n재";
			apprTxt = apprTxt.replace(/\n/g, '<br/>');
			
			apprTypeTrTag.append($("<th>").html(apprTxt).attr({
					width : "20",
					rowspan : "2"
				})
			).addClass("bg-silver-transparent-7");
			
			let apprline = {};
			let apprStepList = [];
			
			let trTags = [];
			
			$.each(trs, function(idx, tr) {
				apprstep = {};
				
				let stepempno = $(tr).data("stepempno");
				let apprtypeno = $(tr).data("apprtypeno");
				apprstep.apprstepprior = idx + 1;
				apprstep.stepempno = stepempno;
				apprstep.apprtypeno = apprtypeno;
				
				apprStepList.push(apprstep);
				
				let apprtypenm = "";
				if (apprtypeno == "1") {
					apprtypenm = "기안";
				} else if (apprtypeno == "2") {
					apprtypenm = "합의";
				} else if (apprtypeno == "3") {
					apprtypenm = "결재";
				}
				
				let empnm = $(tr).children().eq(2).text();
				
				apprTypeTrTag.append(
						$("<th>").text(apprtypenm).attr("width", "80")
				);
					
				apprEmpNmTrTag.append(
						$("<td>").text(empnm).attr("height", "60")
				);
			});
			
			apprline.apprStepList = apprStepList;
			let jsonDATA = JSON.stringify(apprline);
			
			$("input[name='apprline']").val(jsonDATA);
			
			trTags.push(apprTypeTrTag, apprEmpNmTrTag);
			
			apprLineTB.find("tbody").html(trTags);
		}
		
		$("#cancelApprLine").on("click", function() { 
			let service = $("input[name='modalService']").val();
			if (service == "reference") {
				referenceTB.find("tbody").empty();
			} else if (service == "recipient") {
				approvalLineTB.find("tbody").empty();
			} else if (service == "apprline") {
				approvalLineTB.find("tbody").empty();
				$("select[name='apprLine']").val("0");
			}
			
		});
		
		$("#deleteApprLine").on("click", function() {
			let selectApprLine = $("select[name='apprLine']");
			let apprlineno = selectApprLine.val();
			if (apprlineno == "0") {
				alert("삭제할 수 없습니다.!!");
				return false;
			}
			
			let data = {
				apprlineno : apprlineno
			}
			
			$.ajax({
				url : apprLineURL + "/delete",
				data : data,
				method : "post",
				dataType : "json",
				success : function(resp) {
					console.log(resp.res);
				},
				error : function(errResp) {
					console.log(errResp);
				}
			});
		})
		
		$("#file").on("change", function() {
			let filebody = $(".files");
			
			let fileList = $(this)[0].files;
			
			let trTags = [];
			
			if (fileList.length > 0) {
				filebody.empty();
				
				for (var i = 0; i < fileList.length; i++) {
					var file = fileList[i];
					
					trTags.push(
						$("<tr>").append(
							$("<td>").text(i + 1),
							$("<td>").text(file.name), 
							$("<td>").text(file.size + "byte"),
							$("<td>").html(
								$("<button>").html(
									$("<i>").addClass("fa fa-fw fa-trash")
								).attr("type", "button")
								.addClass("fileDelete btn btn-white")
							)
						)
					);
				}
				filebody.html(trTags);
			}
		})
// 		CKEDITOR.instances.apprdoccontent.getData();
		
// 		$(".jstree-checkable").bind('select_node.jstree', function(event, data){
// 		    var id = data.instance.get_node(data.selected).id;        //id 가져오기
// 		    var type = data.instance.get_node(data.selected).type;    //type 가져오기
// 		    var path = data.instance.get_node(data.selected).path;    //paht 가져오기
// 		    var a = data.instance.get_node(data.selected).data.a;    //data 에서 a 가져오기
		    
// 		    console.log(id);
// 		})


		// 		$("#file").change(function() { fileSelect() });

		$(".apprRequest").on("click", function() { 
			let apprlineLength = apprLineTB.find("tbody").children().length;
			
			let confirmMsg = null;

			let service = $(this).data("service");
			let apprdocstate = $("input[name='apprdocstate']");

			if (service == "request") {
				confirmMsg = "결재를 요청하시겠습니까??";
				if (apprlineLength < 2) {
					alert("결재선을 지정해주세요.!!");
					return false;
				}
				apprdocstate.val(2);
			} else if (service == "temp") {
				confirmMsg = "문서를 저장하시겠습니까??";
				apprdocstate.val(1);
				$("input[name='service']").val(service);
			}

			if (!validation(service)) {
				return false;
			}
			
			let data = $("input[name='apprline']").val();
			
			$.ajax({
				url : apprLineURL + "/regist",
				data : data,
				method : "post",
				dataType : "json",
				contentType : "application/json",
				success : function(resp) {
					console.log(resp);
					let result = resp.res;
					if (result == "success") {
						$("input[name='apprlineno']").val(resp.apprlineno);
						if (confirm(confirmMsg)) {
							let subjectTxt = $("input[name='apprsubject']").val();
							let contentTxt = null;
							if ($("input[name='docformno']").val() == 'A001') {
								contentTxt = CKEDITOR.instances.apprdoccontent.getData();
							}
	
							$("input[name=apprdocsubject]").val(subjectTxt);
							$("input[name=apprdoccontent]").val(contentTxt);
	
							if ($("input[name='apprlineno']").val() == "0") {
								alert("결재선을 선택하세요!!");
								return false;
							}
							
			 				draftForm.submit();
						}
					} else {
						alert(resp.msg);
						return false;
					}
				},
				error : function(errResp) {
					console.log(errResp);
				}
			})
		});
		
		function validation(service) {
			let subjectText = $("input[name='apprsubject']").val();
			
			if (!subjectText) {
				alert("문서 제목을 입력하세요.!!");
				$("input[name='apprsubject']").focus();
				return false;
			}
			
			if (service == "temp") {
				return true;
			}
			return true;
		}
		
		
		
		console.log($("#docformArea")[0].innerHTML);
	});
</script>