<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 27.      이지윤      최초작성
* 2020. 10. 29.      정재은      내용추가
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/js/demo/form-plugins.demo.js"></script>
<link href="${pageContext.request.contextPath }/template/assets/css/approval/appr.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/js/mgr/empList.css" rel="stylesheet" />

<script type="text/javascript" src="${pageContext.request.contextPath }/js/mgr/empList.js"></script>

<div id="emp">
	<h1 class="page-header">구성원 조회</h1>
	<hr>
	
	<div>
		<div class="col-mt-1 pull-left">
			<select class="form-control">
				<option>5</option>
				<option>10</option>
				<option>25</option>
				<option>50</option>
			</select>
		</div>
		<div class="pull-left mt-2">
			&nbsp;&nbsp;&nbsp;전체&nbsp;<span>리스트 수</span>
		</div>
		<form id="searchForm">
			<input type="hidden" name="page" />
			<button type="submit" class="btn btn-primary pull-right"><i class="fa fa-search"></i></button>
			<div class="col-md-2 pull-right">
				<input type="text" class="form-control" name="searchWord" />
			</div>
			<div class="col-mt-1 pull-right">
				<select name="searchType" class="form-control">
					<option value="all">전체</option>
					<option value="name">이름</option>
					<option value="dept">부서</option>
					<option value="rank">직급</option>
				</select>
			</div>
			
		</form>
	</div>
	<br><br>
	
	<table id="empTable" class="table table-striped table-bordered table-td-valign-middle">
		<thead style="text-align:center;">
			<tr>
				<th style="width:8%;">사번</th>
				<th style="width:8%;">이름</th>
				<th style="width:13%;">부서</th>
				<th style="width:8%;">직급</th>
				<th style="width:15%;">이메일</th>
				<th style="width:10%;">전화번호</th>
				<th style="width:8%;">입사일</th>
			</tr>
		</thead>
		
		<tbody style="text-align:center;">
			<c:set value="${pagingVO.data }" var="dataList" />
			<c:choose>
				<c:when test="${not empty dataList }">
					<c:forEach var="emp" items="${dataList }">
						<tr class="odd">
							<td>${emp.empno }</td>
							<td><a href="#" data-who="${emp.empno }">${emp.empnm }</a></td>
							<td>${emp.deptnm }</td>
							<td>${emp.ranknm }</td>
							<td>${emp.empmail }</td>
							<td>${emp.emphp }</td>
							<td>${emp.enterdate }</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="7">검색 조건에 맞는 구성원이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="7" id="pagingArea">${pagingVO.pagingHTML_BS }</td>
			</tr>
		</tfoot>
	</table>
	
	<!-- 구성원 상세 조회 modal -->
	<div class="modal fade" id="empDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg modal-dialog-scrollable">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel"><span id="whoArea"></span>님의 상세정보</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<table id="empDetailModal" class="tabel table-bordered table-tr-valign-middle">
	      		<tbody id="empDetailBody"></tbody>
	      	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>
<script>
$('#empDetail').appendTo("body");
</script>