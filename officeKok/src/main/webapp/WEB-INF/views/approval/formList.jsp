<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 26.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h1 class="page-header">양식 목록</h1>
<hr>
<div class="wrapper">
	<div class="pull-left">
		<select name="pageCount" class="form-control">
			<option>10</option>
			<option>15</option>
			<option>20</option>
			<option>25</option>
		</select>
	</div>
	
	<div class="pull-left mt-2">
		&nbsp;&nbsp;&nbsp;전체&nbsp;&nbsp;<span>${paging.totalRecord}</span>
	</div>
		
	<form id="searchForm" action="${pageContext.request.contextPath}/approval/work/apprWorkForm" method="post">
		<input type="hidden" name="page" />
		<input type="hidden" name="pageCount" />
		<input type="hidden" name="service" value="${paging.service}" />
		
		<div class="row pull-right">
			<div class="col-md-4">
				<select name="searchType" class="form-control">
					<option value="all">전체</option>
					<option value="docformnm">양식명</option>
					<option value="doctype">양식분류</option>
				</select>
			</div>
			
			<div class="col-md-6">
				<input class="form-control" type="text" name="searchWord" />
			</div>
			
			<div class="col-md-2">
				<button type="submit" class="btn btn-white pull-right">
					<i class="fa fa-search"></i>
				</button>
			</div>
		</div>
		
	</form>
</div>
<div class="wrapper mt-4">
	<table id="apprListTB" class="table table-striped table-bordered table-td-valign-middle table-th-valign-middle">
		<thead class="text-center">
			<tr>
				<th class="f-s-600 text-inverse">NO</th>
				<th>양식분류</th>
				<th>양식명</th>
			</tr>
		</thead>
		<tbody class="text-center">
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
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td class="f-s-600 text-inverse" colspan="3">양식이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>

<div id="pagingArea">
	${paging.pagingHTML_BS}
</div>

<script src="${pageContext.request.contextPath}/js/approval/approvalPaging.js"></script>
<script src="${pageContext.request.contextPath}/js/approval/approvalList.js"></script>