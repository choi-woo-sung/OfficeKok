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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />

<h1 class="page-header">부서 수신함</h1>
<hr>

<div class="wrapper bg-light">
	<form:form id="searchForm" action="/" method="POST">
		<input type="hidden" name="page" />
		<input type="hidden" name="pageCount" />
		<input type="hidden" name="service" value="${paging.service}" />
		
		<table class="search-table">
			<colgroup class="width-auto">
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
							<input type="text" name="dofromnm" class="form-control mb-2" />
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
					<th scope="row"><label>결재일</label></th>
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
	</form:form>
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

<table id="apprListTB" class="table table-striped table-bordered table-td-valign-middle">
	<colgroup>
		<col style="width: 10%;">
		<col style="width: 10%;">
		<col style="width: 25%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 15%;">
		<col style="width: 10%;">
	</colgroup>
	<thead class="text-center">
		<tr>
			<th class="f-s-600 text-inverse">NO</th>
			<th>유형</th>
			<th>문서제목</th>
			<th>기안자</th>
			<th>기안부서</th>
			<th>수신일</th>
			<th>문서상태</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty paging.data}">
				<c:forEach items="${paging.data}" var="docForm" varStatus="status">
					<tr>
						<td class="f-s-600 text-inverse">${status.count}</td>
						<td>${docForm.doctype}</td>
						<td>
							<a class="f-s-600 text-inverse" href="${pageContext.request.contextPath}/approval/work/apprWorkForm/${docForm.docformno}">
								${docForm.docformnm}
							</a>
						</td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td class="f-s-600 text-inverse text-center" colspan="7">문서가 존재하지 않습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<div id="docFormListPagingArea">
	${paging.pagingHTML_BS}
</div>

<c:url value="/approval/work/apprWorkForm" var="apprFormURL" />
<a class="pull-right btn btn-primary" href="${apprFormURL}">등록</a>