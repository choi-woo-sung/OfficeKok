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
<!-- ================== BEGIN PAGE CSS STYLE ================== -->
<link href="${pageContext.request.contextPath }/template/assets/plugins/morris.js/morris.css" rel="stylesheet" />
<!-- ================== END PAGE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${pageContext.request.contextPath }/template/assets/plugins/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/morris.js/morris.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/attendance/attendance.js"></script>
<!-- ================== END PAGE LEVEL JS ================== -->
	<!-- begin page-header -->
	<h1 class="page-header"></h1>
	<hr>
	<!-- end page-header -->

	<!-- begin row -->
	<div class="row">
		<!-- begin col-6 -->
		<div class="col-xl-6">
					<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="morris-chart-1" style="height: 418px;">
						<div class="panel-heading">
							<h4 class="panel-title">State</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<div id="week-time-chart" style="float: left; width:200px; "></div>
							<div id="annual-leave-chart" style="float: left; width:200px; "></div>
							<div id="holiday-chart" style="float: left; width:200px; "></div>
						</div>
					</div>
					<!-- end panel -->
					<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="morris-chart-2" style="height: 418px;">
						<div class="panel-heading">
							<h4 class="panel-title">Work hours</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<h4 class="text-center">월별 근무시간 현황</h4>
							<div id="morris-bar-chart" class="height-sm"></div>
						</div>
					</div>
					<!-- end panel -->
				</div>
				<!-- end col-6 -->
				
				<!-- begin col-6 -->
				<div class="col-xl-6">
					<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="morris-chart-3" style="height: 418px;">
						<div class="panel-heading">
							<h4 class="panel-title">Details</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body" >
							<!-- begin table-responsive -->
							<div style="width:100%; height:330px; overflow:auto">
							<div class="table-responsive">
								<table class="table m-b-0">
									<thead class="text-center">
										<tr>
											<th>일자</th>
											<th>내역</th>
											<th>사유</th>
										</tr>
									</thead>
									<tbody class="text-center">
									<c:set var="list" value="${detail}" />
									<c:choose>
										<c:when test="${not empty list}">
											<c:forEach items="${detail}" var="list">
												<tr>
													<td>${list.monthly}월${list.daily}일</td>
													<td>${list.refreshName }</td>
													<td>${list.refreshreason }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="col">내역 없음.</td>
											</tr>
										</c:otherwise>
									</c:choose>										    
									</tbody>
								</table>
							</div>
							<!-- end table-responsive -->
							</div>
						</div>
					</div>
					<!-- end panel -->
					<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="morris-chart-4" style="height: 418px;">
						<div class="panel-heading">
							<h4 class="panel-title">Extended labor</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<h4 class="text-center">월별 연장/휴일 근무시간 현황</h4>
							<div id="morris-line-chart" class="height-sm"></div>
						</div>
					</div>
					<!-- end panel -->
					</div>
				<!-- end col-6 -->
			</div>
			<!-- end row -->
<script type="text/javascript">
var annual = ${annual};
var refresh = ${refresh};
var totalAddWorkTime = ${totalAddWorkTime};
var totalWorkTime = ${totalWorkTime};
var totalWeekWorkTime = ${totalWeekWorkTime};
</script>