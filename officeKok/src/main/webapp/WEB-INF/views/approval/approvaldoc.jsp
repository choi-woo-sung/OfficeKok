<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />

<h1 class="page-header">
	<c:if test="${approval.service eq 'myRequest'}">
		결재 요청함
		<c:url value="/approval/work/apprMyRequest" var="listURL" />
	</c:if>
	<c:if test="${approval.service eq 'temp'}">
		임시 저장함
		<c:url value="/approval/work/apprTemp" var="listURL" />
	</c:if>
	<c:if test="${approval.service eq 'todo'}">
		결재 대기함
		<c:url value="/approval/work/apprTodo" var="listURL" />
	</c:if>
	<c:if test="${approval.service eq 'proc'}">
		결재 진행함
		<c:url value="/approval/work/apprProc" var="listURL" />
	</c:if>
	<c:if test="${approval.service eq 'complete'}">
		완료 문서함
		<c:url value="/approval/work/apprComplete" var="listURL" />
	</c:if>
	<c:if test="${approval.service eq 'reference'}">
		참조 문서함
		<c:url value="/approval/work/apprReference" var="listURL" />
	</c:if>
</h1>
<hr>
<form id="apprForm" method="post">
	<p class="text-right m-b-10">
		<c:if test="${approval.service eq 'todo'}">
			<a id="approval" class="btn btn-inverse" href="#procModal" data-toggle="modal">결재</a>
		</c:if>
		<c:if test="${approval.service eq 'proc' or approval.service eq 'myRequest'}">
			<c:choose>
				<c:when test="${approval.apprdocstate eq 5 or approval.apprdocstate eq 1}">
					<button id="reDraft" class="btn btn-inverse" type="button">재기안</button>	
				</c:when>
				<c:otherwise>
					<button id="collection" class="btn btn-inverse" type="button">결재회수</button>
				</c:otherwise>
			</c:choose>
		</c:if>
		<button id="printAppr" class="btn btn-inverse ml-1">인쇄</button>
		<a href="${listURL}" class="btn btn-white ml-1">목록</a>
	</p>
	
	<input type="hidden" name="apprdocno" value="${approval.apprdocno}"/>
</form>

<div id="apprDetail">
	<h2 class="text-center">
		${approval.docformnm}
	</h2>
	
	<div class="overflow-auto m-b-20 text-center">
		<div class="pull-right">
			<table id="apprLineTB" class="table-bordered">
				<tbody class="text-center">
					<c:if test="${not empty apprStepList and fn:length(apprStepList) > 0}">
						<tr class="bg-silver-transparent-7">
							<th width="20" rowspan="2">결<br><br>재</th>
							
						<c:forEach items="${apprStepList}" var="apprStep">
							<th width="80">${apprStep.apprtype}</th>
						</c:forEach>
							
						</tr>
						<tr>
							<c:forEach items="${apprStepList}" var="apprStep">
								<td height="60">
									${apprStep.empnm}
									<br/>
									<c:if test="${apprStep.apprHistory.apprhisstate eq 1 or apprStep.apprHistory.apprhisstate eq 2}">
										<b>승인</b>
									</c:if>
									<c:if test="${apprStep.apprHistory.apprhisstate eq 3}">
										<b>반려</b>
									</c:if>
									<c:if test="${apprStep.apprHistory.apprhisstate eq 0}">
										<b>미결</b>
									</c:if>
									<br/>
									<c:if test="${not empty apprStep.apprHistory}">
										${apprStep.apprHistory.apprhisdate}
									</c:if>
								</td>
							</c:forEach>
							
						</tr>
					</c:if>
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
					<td class="text-left p-l-5">
						<c:choose>
							<c:when test="${approval.apprdocstate eq 3}">	
								${approval.apprdocno}
							</c:when>
							<c:otherwise>
								자동채번
							</c:otherwise>
						</c:choose>
					</td>
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">기안일자</th>
					<td class="text-left p-l-5">${approval.apprdocdate}</td>
				</tr>
				<tr class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">기안자</th>
					<td class="text-left p-l-5">${approval.empnm}</td>
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">기안부서</th>
					<td class="text-left p-l-5">${approval.deptnm}</td>
				</tr>
				<tr class="height-40">	
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">참조자</th>
					<td class="text-left p-l-5 with-input-group" colspan="3">
						<c:if test="${not empty apprDocRefList}">
							<c:forEach items="${apprDocRefList}" var="apprDocRef" varStatus="status">
								${apprDocRef.empnm}&nbsp${apprDocRef.deptnm}
								<c:if test="${not status.last}">
									,
								</c:if>
							</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr id="apprReceiveLineTr" class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">수신처</th>
					<td class="text-left p-l-5" colspan="3">
						<c:if test="${not empty recipient}">
							${recipient.empnm}&nbsp${recipient.deptnm}
						</c:if>
					</td>
				</tr>
				<tr class="height-40">
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">문서제목</th>
					<td class="text-left p-l-5 with-form-control" colspan="3">
						${approval.apprdocsubject}
					</td>
				</tr>
				<tr>
					<th class="bg-silver-transparent-7 text-right p-r-10" scope="row">참고 파일</th>
					<c:if test="${not empty approval.apprAttList}">
						<td colspan="3">
							<c:forEach items="${approval.apprAttList}" var="apprAtt" varStatus="status">
								<a class="f-s-600 text-inverse" href="" style="text-decoration: underline;">
									${apprAtt.apprattoriginalfilename}
								</a>
								<c:if test="${not status.last}">
									,
								</c:if>
							</c:forEach>
						</td>
					</c:if>
				</tr>
				<tr>
					<td colspan="4">
						<div id="apprdocArea">
							${approval.apprdoccontent}
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
		
	<c:if test="${not empty apprHistoryList}">
		<div id="apprHistoryArea">
			<h4 class="text-left">결재의견</h4>
			<hr>
			<table class="table table-striped table-bordered table-th-valign-middle table-td-valign-middle">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 15%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 30%;">
					<col style="width: 15%;">
				</colgroup>
				<thead class="text-center">
					<tr>
						<th>결재</th>
						<th>결재자</th>
						<th>부서</th>
						<th>결재일시</th>
						<th>의견</th>
						<th colspan="2">파일</th>
					</tr>
				</thead>
				<tbody class="text-center">
					<c:forEach items="${apprHistoryList}" var="apprhistory">
						<tr>
							<td>
								<c:if test="${apprhistory.apprhisstate eq 1 or apprhistory.apprhisstate eq 2}">
									승인
								</c:if>
								<c:if test="${apprhistory.apprhisstate eq 3}">
									반려
								</c:if>
							</td>
							<c:forEach items="${apprStepList}" var="apprhisstep">
								<c:if test="${apprhisstep.apprstepno eq apprhistory.apprstepno}">
									<td>${apprhisstep.deptnm}</td>
									<td>${apprhisstep.empnm}</td>
								</c:if>
							</c:forEach>
							<td>${apprhistory.apprhisdate}</td>
							<td>${apprhistory.apprhisopinion}</td>
							<td>
								<c:if test="${not empty apprhistory.apprHisAtt}">
									<c:forEach items="${apprhistory.apprHisAtt}" var="hisAtt" varStatus="status">
										<a class="f-s-600 text-inverse" href="">
											${hisAtt.apprhisoriginalfilename}
										</a>
										<c:if test="${not status.last}">
											, 
										</c:if>
									</c:forEach>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
</div>

<div id="procModal" class="modal fade">
	<div class="modal-dialog" style="position: relative; margin-left: 20%;">
		<div class="modal-content">
			<div class="modal-header height-70 bg-red-transparent-9">
				<h4 class="modal-title text-center text-white">결재 처리</h4>
			</div>
			
			<div class="modal-body">
				<form id="apprProcForm" action="${pageContext.request.contextPath}/approval/work/apprProc" method="post" enctype="multipart/form-data">
					<table class="table table-boadered">
						<colgroup>
							<col style="width: 25%;">
							<col style="width: 75%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									결재 종류
								</th>
								<td>
									<div class="radio radio-css radio-inline">
										<input id="appr" type="radio" name="apprhisstate" value="2" checked /> 
										<label for="appr">승인</label>
									</div>
									<div class="radio radio-css radio-inline">
										<input id="reject" type="radio" name="apprhisstate" value="3" /> 
										<label for="reject">반려</label>
									</div>
								</td>
						</tr>
						<tr>
							<th scope="row">결재 의견</th>
							<td>
								<textarea class="form-control" rows="5" cols="20" name="apprhisopinion">
									
								</textarea>
							</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td class="row">
								<input id="fileName" class="form-control form-control-sm ml-2 col-8 bg-white" type="text" readonly />
								<span class="form-control form-control-sm col-3 mb-1 ml-2 btn btn-white fileinput-button">
									<span class="f-s-12">파일선택</span>
									<input id="file" type="file" name="attatchFiles" multiple>
								</span>
							</td>
						</tr>
						</tbody>
					</table>
					<input type="hidden" name="apprdocno" value="${approval.apprdocno}" />
					<input type="hidden" name="apprstepno" value="${currentStep.apprstepno}" />
					<input type="hidden" name="apprstepprior" value="${currentStep.apprstepprior}" />
				</form>
			</div>

			<div class="modal-footer height-70 bg-grey-transparent-2">
				<button id="confirmAppr" class="btn btn-inverse mr-2" data-dismiss="modal">결재</button>
				<a class="btn btn-white"  href="/" data-dismiss="modal">취소</a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$("#procModal").appendTo("body");
		
		var apprForm = $("#apprForm");
		$("#collection").on("click", function() {
			
			let apprdocno = $("input[name='apprdocno']").val();
			let data = {
					apprdocno : apprdocno
			}
			
			console.log(apprdocno);
			
			$.ajax({
				url : ctx + "/approval/work/apprMyRequest/validation",
				data : data,
				method : "post",
				dataType : "json",
				success : function(resp) {
					if (resp.apprHistoryCnt > 1) {
						alert("결재가 진행중입니다. 결재 회수를 할수 없습니다.");
						return false;
					} else if (resp.collectionChk == 5) {
						alert("이미 회수하였습니다.");
						return false;
					} else {
						if (confirm("결재를 회수하시겠습니까??")) {
							apprForm.attr("action", ctx + "/approval/work/apprMyRequest/apprCollection");
							apprForm.attr("method", "post");
							apprForm.submit();
						}
					}
				},
				error : function(errResp) {
					console.log(errResp);
				}
			})
		});
		
		$("#confirmAppr").on("click", function() {
			if (confirm("결재하시겠습니까??")) {
				if ($("#apprhisopinion").val() > 200) {
					alert("의견은 최대 200자입니다.");
					return false;
				}
				
				$("#apprProcForm").submit();
			}
		});
		
		$("#reDraft").on("click", function() {
			if (confirm("다시 기안하시겠습니까??")) {
				apprForm.attr("action", ctx + "/approval/work/apprWorkForm/${approval.docformno}");
				apprForm.attr("method", "get");
				apprForm.submit();
			}
		});
		
		$("#file").on("change", function() {
			let fileList = $(this)[0].files;
			
			if (fileList.length > 0) {
				let fileNames = $("#fileName");
				let fileName = "";
				for (var i = 0; i < fileList.length; i ++) {
					var file = fileList[i];
					
					if ((i + 1) == fileList.length) {
						fileName += file.name;
					} else {
						fileName += (file.name + ", ");
					}
					
				}
				
				fileNames.val(fileName);
			}
		})
	});
</script>