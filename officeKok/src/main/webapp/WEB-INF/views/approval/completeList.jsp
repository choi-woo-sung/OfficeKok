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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${pageContext.request.contextPath}/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<link href="${pageContext.request.contextPath}/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />

<h1 class="page-header">완료 문서함</h1>
<hr>

<div class="wrapper bg-light">
	<form id="searchForm" action="${pageContext.request.contextPath}/approval/work/apprComplete" method="POST">
		<input type="hidden" name="page" />
		<input type="hidden" name="pageCount" />
		<input type="hidden" name="service" value="${paging.service}" />
		
		<table class="search-table">
			<colgroup>
				<col style="width: 15% ;">
				<col style="width: 30%;">
				<col style="width: 15%;">
				<col style="width: 30%;">
				<col style="width: 10%;">
			</colgroup>
			
			<tbody>
				<tr class="text-center">
					<th scope="row">
						<label>기안자</label>
					</th>
					<td>
						<div class="col-md-8">
							<input type="text" name="empnm" class="form-control mb-2" />
						</div>
					</td>
					<th scope="row">
						<label>양식명</label>
					</th>
					<td>
						<div class="col-md-8">
							<input type="text" name="doformnm" class="form-control mb-2" />
						</div>
					</td>
					<td rowspan="3">
						<button type="submit" class="btn btn-primary">
							<i class="fa fa-search fa-fw"></i> 검색
						</button>
					</td>
				</tr>
				<tr class="text-center">
					<th scope="row"><label>문서제목</label></th>
					<td>
						<div class="col-md-8">
							<input type="text" name="apprdocsubject" class="form-control" />
						</div>
					</td>
					<th scope="row"><label>완료일</label></th>
					<td>
						<div class="col-md-12">
							<div class="input-group">
								<input type="date" class="form-control" name="start" placeholder="시작일" /> 
								<span class="input-group-addon">~</span>
								<input type="date" class="form-control" name="end" placeholder="종료일" />
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<div class="pull-left mt-3 mb-3">
	<select name="pageCount" class="form-control">
		<option>10</option>
		<option>15</option>
		<option>20</option>
		<option>25</option>
	</select>
</div>

<div class="pull-left mt-4">
	&nbsp;&nbsp;&nbsp;전체&nbsp;&nbsp;<span>${paging.totalRecord}</span>
</div>

<table id="apprListTB" class="table table-striped table-bordered table-td-valign-middle table-th-valign-middle">
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 25%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
		<col style="width: 10%;">
	</colgroup>
	<thead class="text-center">
		<tr>
			<th>양식명</th>
			<th>문서번호</th>
			<th>문서제목</th>
			<th>기안부서</th>
			<th>기안자</th>
			<th>완료일</th>
			<th>문서상태</th>
		</tr>
	</thead>
	<tbody class="text-center">
		<c:choose>
			<c:when test="${not empty paging.data}">
				<c:forEach items="${paging.data}" var="apprComplete">
					<tr>
						<td>${apprComplete.docformnm}</td>
						<td>${apprComplete.apprdocno}</td>
						<td>
							<a class="f-s-600 text-inverse" href="${pageContext.request.contextPath}/approval/work/apprComplete/${apprComplete.apprdocno}">
								${apprComplete.apprdocsubject}
							</a>
						</td>
						<td>${apprComplete.deptnm}</td>
						<td>${apprComplete.empnm}</td>
						<td>${apprComplete.apprhisdate}</td>
						<td>
							<c:if test="${apprComplete.apprdocstate eq 3}">
								완료
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7">문서가 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<div id="pagingArea">
	${paging.pagingHTML_BS}
</div>

<c:url value="/approval/work/apprWorkForm" var="apprFormURL" />
<a class="pull-right btn btn-primary" href="${apprFormURL}">등록</a>

<script src="${pageContext.request.contextPath}/js/approval/approvalPaging.js"></script>
<script src="${pageContext.request.contextPath}/js/approval/approvalList.js"></script>