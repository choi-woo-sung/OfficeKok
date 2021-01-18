<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/js/demo/form-plugins.demo.js"></script>
<link href="${pageContext.request.contextPath }/template/assets/css/approval/appr.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />

<h1 class="page-header">일정 조회</h1><hr>
<div class="pull-right" style="margin-bottom:5px;">등록자 : ${calDetail.empnm } ${calDetail.ranknm } &nbsp;</div>
<div class="calViewDiv">
	<input type="hidden" name="schedetailno" required value="${calDetail.schedetailno }"/>
	
	<table class="table table-bordered">
			<tr>
				<th style="text-align:right;">기간</th>
				<td>${calDetail.startdate } ~ ${calDetail.enddate }</td>
			</tr>
			
			<tr>
				<th style="text-align:right;">제목</th>
				<td>
					<span>[${calDetail.schedetailtype }]</span>
					${calDetail.schedetailnm }
				</td>
			</tr>
			
			<tr>
				<th style="text-align:right;">장소</th>
				<td>${calDetail.schedetailplace }</td>
			</tr>
			
			<tr>
				<th style="text-align:right;">참여자</th>
				<td><span>${calDetail.empnm } ${calDetail.ranknm }</span></td>
			</tr>
			
			<tr>
				<th style="text-align:right;">내용</th>
				<td>${calDetail.schedetailcontent }</td>
			</tr>
			
			<tr>
				<th style="text-align:right;">첨부파일</th>
				<td>${calDetail.calendarAttList.scheattoriginalfilename }</td>
			</tr>
	</table>
	<div class="pull-right">
		<%-- <input type="button" value="수정" class="btn btn-gray" id="scheUpdate" 
		onclick="location.href='${pageContext.request.contextPath}/cal/calRegistForm?what=${calDetail.schedetailno }';"> --%>
		<input type="submit" value="수정" class="btn btn-gray" id="scheUpdate">
		<input type="button" value="삭제" class="btn btn-gray" id="scheDelete">
		<input type="button" value="목록" class="btn btn-white"
		onclick="location.href='${pageContext.request.contextPath}/cal';" />
	</div>
	
	<form id="calUpdateForm" action="${pageContext.request.contextPath }/cal/calUpdate">
		<input type="hidden" name="what" required value="${calDetail.schedetailno }" />
	</form>
	
	<script type="text/javascript">
		let calUpdateForm = $("#calUpdateForm");
		$("#scheUpdate").on("click", function(){
			calUpdateForm.submit();
		});
	</script>
	
</div>