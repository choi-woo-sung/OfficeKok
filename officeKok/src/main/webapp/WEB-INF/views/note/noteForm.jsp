<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 26.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script
	src="${pageContext.request.contextPath}/template/assets/plugins/ckeditor/ckeditor.js"></script>
<script
	src="${pageContext.request.contextPath}/template/assets/plugins/jstree/dist/jstree.min.js"></script>
<link
	href="${pageContext.request.contextPath}/template/assets/plugins/jstree/dist/themes/default/style.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css"
	rel="stylesheet" />

<script type="text/javascript">
	$(function(){
		$("#temp").on("click", function(){
			var noteno = $(this).data("noteno");
			
			$("#noteno").val(noteno);
			$("#temp").submit();
		});
	});
</script>

<style type="text/css">
.modal-backdrop {
	position: relative;
}
</style>

<div class="noteForm">
	<div class="note-header">
		<h1 class="page-header text-center">쪽지 쓰기</h1>
	</div>

	<div class="note-body">
		<form id="noteForm" method="post" class="form-horizontal form-bordered">
			<input type="hidden" name="noteno" value="${note.noteno }" />
			<input type="hidden" name="notesend" value="${emp.empno }" />
			<input type="hidden" name="notedel" value="${note.notedel }" />
			<input type="hidden" name="notesave" value="${note.notesave }" />

			<div class="width-full"></div>
			<table class="table width-lg" style="margin-left: auto; margin-right: auto;">
				<tr>
					<th class="width-100">
						<input type="checkbox" name="noteurgent" id="urgentChk" value="N" />&nbsp;
							<i class="fa fa-exclamation text-red mt-1"></i>&nbsp;긴급&nbsp;
					</th>
					<td>
						<input type="radio" name="notecate" value="2" checked="checked" />&nbsp;일반&nbsp;&nbsp;
						<input type="radio" name="notecate" value="3" />&nbsp;공지&nbsp;&nbsp;
						<input type="radio" name="notecate" value="4" />&nbsp;중요&nbsp;&nbsp;
						<input type="radio" name="notecate" value="5" />&nbsp;배포&nbsp;&nbsp;
					</td>
				</tr>

				<tr>
					<th class="text-center"><label class="col-form-label">제목</label></th>
					<td>
						<input type="text" name="notesubject" class="form-control height-40" value="${note.notesubject }" 
						placeholder="제목을 입력해주세요." required>
					</td>
				</tr>

				<tr>
					<th class="text-center"><label class="col-form-label">첨부파일</label></th>
					<td><input type="file" /></td>
				</tr>

				<tr>
					<th class="text-center"><label class="col-form-label">수신자</label></th>
					<td>
						<div class="input-group">
							<input type="hidden" name="notereceive" value="${note.notereceive }" />
							<input id="receiveInfo" name="receiver" value="${note.receiver }" type="text"
								class="form-control height-40 bg-white" readonly />
							<div class="input-group-addon height-40" style="background-color: none;">
								<a class="showModal btn btn-inverse" href="#noteFormModal" data-toggle="modal" 
								data-service="recipient">
									<i class="fas fa-user"></i>
								</a>
								<!-- data-service=apprline -->
							</div>
						</div>
					</td>
				</tr>

				<tr>
					<td colspan="2">
						<textarea name="notecontent" cols="100" rows="15" style="border-color: lightgray;" 
						placeholder="내용" required></textarea>
					</td>
				</tr>
			</table>

			<div style="width: 100%; text-align: center;">
				<input type="button" value="임시저장" id="tempBtn" class="btn btn-gray mr-3" data-noteno="${note.noteno }"/>
				<input type="submit" value="등록" class="btn btn-gray mr-3" />
				<input type="reset" value="취소" class="btn btn-white mr-3" onclick="history.back();" />
			</div>

			<input type="hidden" name="deptno" />
			<input type="hidden" name="empno" />
		</form>
	</div>
</div>
<form:form modelAttribute="note" id="temp" action="${pageContext.request.contextPath }/note/temp" method="post">
	<input type="hidden" id="noteno" name="noteno" />
	<input type="hidden" id="notereceive" name="ntoereceive" />
	<input type="hidden" id="notedate" name="${note.notedate }" />
</form:form>

<div id="noteFormModal" class="modal fade">
	<div class="modal-dialog" style="margin-left: 20%">
		<div class="modal-content" style="min-width: 1000px; width: auto;">
			<div class="modal-header height-100 bg-green-transparent-9">
				<h4 id="modalTitle" class="modal-title text-center text-white">수신자 선택</h4>
			</div>

			<div class="modal-body">
				<div class="row height-500">
					<div class="col-4">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a href="#organization" data-toggle="tab" class="nav-link active">조직도 </a>
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
							<button id="noteFormAdd" class="btn btn-white btn-sm" type="button"><!--apprlineAdd-->
								<i class="fa fa-angle-right"></i>
							</button>
							<br>
							<button id="noteFormRemove" class="btn btn-white btn-sm mt-1" type="button"><!--apprlineRemove-->
								<i class="fa fa-angle-left"></i>
							</button>
						</div>
					</div>

					<div id="noteFormService" class="col-5">
						<strong class="modalServiceInfo"> </strong>
						<hr>
						<div class="wrapper bg-light text-center height-300">
							<b>수신자</b>
							<div class="row wrapper justify-content-center">
								<table id="noteFormTB"
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
		$("#noteFormModal").appendTo("body");

		let noteFormURL = ctx + "/note/form"; // apprLineURL approval/work/apprLine
		let noteFormTB = $("#noteFormTB"); //table 이름 approvalLineTB

		$(".showModal").on("click", function() { //트리 그려주는 거

			$.ajax({
				url : noteFormURL + "/noteFormTree",
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
			let trs = noteFormTB.find("tbody").children();

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

			noteFormTB.find("tbody").append(trTags); // approvalLineTB
		}

		$("#confirmApprLine").on("click", function() {
			let recipientTrs = noteFormTB.find("tbody").children(); // approvalLineTB
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
			noteFormTB.find("tbody").empty(); // approvalLineTB
		}
	});
</script>
