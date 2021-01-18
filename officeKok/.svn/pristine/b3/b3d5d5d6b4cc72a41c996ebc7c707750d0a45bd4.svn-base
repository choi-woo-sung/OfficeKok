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
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
	<link href="${pageContext.request.contextPath }/template/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/template/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${pageContext.request.contextPath }/template/assets/plugins/gritter/js/jquery.gritter.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/flot/jquery.flot.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/flot/jquery.flot.time.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/flot/jquery.flot.resize.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/flot/jquery.flot.pie.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/jvectormap-next/jquery-jvectormap.min.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/jvectormap-next/jquery-jvectormap-world-mill.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/js/demo/dashboard.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

<!-- begin breadcrumb -->
			
			<!-- begin row -->
			<div class="row">
				<!-- begin col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-blue">
						<div class="stats-icon"><i class="fa fa-edit"></i></div>
						<div class="stats-info">
							<h4>결재 대기 문서</h4>
							<p>${apprTodoCnt}개</p>	
						</div>
						<div class="stats-link">
							<a href="${pageContext.request.contextPath }/approval/work/apprTodo">결재 대기함 <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-info">
						<div class="stats-icon"><i class="fa fa-paper-plane"></i></div>
						<div class="stats-info">
							<h4>확인하지 않은 쪽지</h4>
							<p>${noteUnreadCount }개</p>	
						</div>
						<div class="stats-link">
							<a href="${pageContext.request.contextPath }/note/receive">받은 쪽지함 <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
			
				<!-- begin col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-red">
						<div class="stats-icon"><i class="fa fa-clock"></i></div>
						<div class="stats-info">
							<h4>출근시간</h4>
							<p>${attendance.goworktime}</p>	
						</div>
						<div class="stats-link">
							<a href="${pageContext.request.contextPath }/attendance/oneday">출근 <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
				<!-- begin col-3 -->
				<div class="col-xl-3 col-md-6">
					<div class="widget widget-stats bg-orange">
						<div class="stats-icon"><i class="fa fa-clock"></i></div>
						<div class="stats-info">
							<h4>퇴근시간</h4>
							<p>${attendance.afterworktime}</p>	
						</div>
						<div class="stats-link">
							<a href="${pageContext.request.contextPath }/attendance/oneday">퇴근 <i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- end col-3 -->
			</div>
			<!-- end row -->
			<!-- begin row -->
			<div class="row">
				<!-- begin col-8 -->
				<div class="col-xl-8">
					
					<!-- 우성이가 고칠부분입니다. -->
					<ul class="nav nav-tabs nav-tabs-inverse nav-justified nav-justified-mobile" data-sortable-id="index-2">
						<li class="nav-item"><a href="#latest-post" data-toggle="tab" class="nav-link "> <i class="fas fa-lg fa-fw m-r-5 fa-bullseye"></i><span class="d-none d-md-inline">전체 게시판</span></a></li>
						<li class="nav-item"><a href="#purchase" data-toggle="tab" class="nav-link active"><i class="fa fa-archive fa-lg m-r-5"></i> <span class="d-none d-md-inline">공지사항 게시판</span></a></li>
						<li class="nav-item"><a href="#email" data-toggle="tab" class="nav-link"><i class="fas fa-lg fa-fw m-r-5 fa-bullhorn"></i> <span class="d-none d-md-inline">부서 게시판</span></a></li>
					</ul>
					<div class="tab-content" data-sortable-id="index-3">
						<div class="tab-pane fade" id="latest-post">
							<div class="height-sm" data-scrollbar="true">
								<table class="table">
									<thead>
										<tr class="text-center">
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
					<!-- 이거 수정 -->
										<c:set value="${totalboard}" var="totallist" />
										<c:choose>
											<c:when test="${not empty totallist }">
												<c:forEach var="total" items="${totallist }">
													<c:url value="/board/totalRead/${total.postno}" var="boardViewURL">
													</c:url>
													<tr class="text-center">
														<td class="text-blue f-w-600 text-nowrap">
															<h6><a href="${boardViewURL }" class="text-inverse">${total.postsubject}</a></h6>
														</td>
														<td>${total.empnm}</td>
														<td >${total.postdate}</td>
													<td class="text-nowrap">${total.posthit }</td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
<!-- 							이거까지 -->
							
									</tbody>
								</table>
							</div>
						</div>
<!-- 						이거부터 작업시작 -->
						<div class="tab-pane fade active show" id="purchase">
							<div class="height-sm" data-scrollbar="true">
								<table class="table">
									<thead>
										<tr class="text-center">
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
<!-- 									이거 수정 -->
										<c:set value="${noticeboard}" var="noticeList" />
										<c:choose>
											<c:when test="${not empty noticeList }">
												<c:forEach var="notice" items="${noticeList }">
													<c:url value="/board/noticeRead/${notice.postno}" var="boardViewURL">
													</c:url>
													<tr class="text-center">
														<td class="text-blue f-w-600 text-nowrap">
															<h6><a href="${boardViewURL }" class="text-inverse">${notice.postsubject}</a></h6>
														</td>
														<td>관리자</td>
														<td >${notice.postdate}</td>
													<td class="text-nowrap">${notice.posthit }</td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
<!-- 							이거까지 -->
							
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-pane fade" id="email">
							<div class="height-sm" data-scrollbar="true">
								<table class="table">
									<thead>
										<tr class="text-center">
											<th>제목</th>
											<th>작성자</th>
											<th>날짜</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
<!-- 									이거 수정 -->
										<c:set value="${deptboard}" var="deptlist" />
										<c:choose>
											<c:when test="${not empty deptlist }">
												<c:forEach var="dept" items="${deptlist }">
													<c:url value="/board/deptRead/${dept.postno}" var="boardViewURL">
													</c:url>
													<tr class="text-center">
														<td class="text-blue f-w-600 text-nowrap">
															<h6><a href="${boardViewURL }" class="text-inverse">${dept.postsubject}</a></h6>
														</td>
														<td>${dept.empnm}</td>
														<td >${dept.postdate}</td>
													<td class="text-nowrap">${dept.posthit }</td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
<!-- 							이거까지 -->
							
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 우성이가 고칠거끝나는입니다. -->
                    
					<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="index-5">
						<div class="panel-heading">
							<h4 class="panel-title">결재 대기 중인 문서</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<div class="height-sm" data-scrollbar="true">
								<ul class="media-list media-list-with-divider media-messaging">
									<c:choose>
										<c:when test="${not empty apprTodoList}">
											<c:forEach items="${apprTodoList}" var="apprTodo">
												<li class="media media-sm">
													<div class="media-body">
														<h5 class="media-heading">
															<i class="fa fa-lightbulb"></i>&nbsp;&nbsp; ${apprTodo.empnm} ${apprTodo.deptnm}
														</h5>
														
														<p class="text-muted">
															<br/>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<a class="f-s-600 text-inverse" href="${pageContext.request.contextPath}/approval/work/apprTodo/${apprTodo.apprdocno}">
																${apprTodo.apprdocsubject}
															</a>
															&nbsp;&nbsp;
															<span class="pull-right">${apprTodo.apprdocdate}</span>
														</p>
													</div>
												</li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<li class="media media-sm">
												<div class="media-body">
													<h5 class="media-heading"></h5>
													<p class="text-center"><i class="fa fa-lightbulb"></i>&nbsp;&nbsp;현재 결재 대기중인 문서가 없습니다.</p>
												</div>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>
						</div>
<!-- 						<div class="panel-footer"> -->
<%-- 							<a href="${pageContext.request.contextPath}/approval/work/apprTodo/${apprTodo.apprdocno}"> --%>
<!-- 								<i class="fa fa-plus text-muted"></i> -->
<!-- 							</a> -->
<!-- 						</div> -->
					</div>
					<!-- end panel -->
				</div>
				<!-- end col-8 -->
				<!-- begin col-4 -->
				<div class="col-xl-4">
				<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="index-10">
						<div class="panel-heading">
							<h4 class="panel-title">Calendar</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body">
							<div id="datepicker-inline" class="datepicker-full-width overflow-y-scroll position-relative"><div></div></div>
						</div>
					</div>
					<!-- end panel -->
					
					<!-- begin panel -->
					<div class="panel panel-inverse" data-sortable-id="index-8">
						<div class="panel-heading">
							<h4 class="panel-title">To do List</h4>
							<div class="panel-heading-btn">
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
								<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
							</div>
						</div>
						<div class="panel-body p-0">
							<ul class="todolist">
								<c:choose>
									<c:when test="${not empty calList }">
										<c:forEach items="${calList }" var="cal">
											<li>
												<a href="javascript:;" class="todolist-container" data-click="todolist">
													<p class="todolist-input"><i class="fa fa-square"></i></p>
													<p class="todolist-title">${cal.schedetailnm }</p>
													<input type="hidden" name="schedetailno" value="${cal.schedetailno }" />
													<input type="hidden" name="schedetailtype" value="${cal.schedetailtype }" />
													<input type="hidden" name="startdate" value="${cal.startdate }" />
													<input type="hidden" name="enddate" value="${cal.enddate }" />
												</a>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<li>
											<div class="text-center">오늘의 일정이 없습니다.</div>
										</li>
									</c:otherwise>
								</c:choose>
								
								<!-- <li>
									<a href="javascript:;" class="todolist-container active" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">2020년 하반기 보고서 초안 제출(11/23까지)</div>
									</a>
								</li>
								<li class="active">
									<a href="javascript:;" class="todolist-container" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">신입 교육 준비</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="todolist-container" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">12월 휴가신청서 결재 요청</div>
									</a>
								</li>
								<li class="active">
									<a href="javascript:;" class="todolist-container" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">대전 고객 미팅 준비(11/17 예정)</div>
									</a>
								</li>
								<li class="active">
									<a href="javascript:;" class="todolist-container" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">출장 준비(11/20 예정)</div>
									</a>
								</li>
								<li class="active">
									<a href="javascript:;" class="todolist-container" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">부서 회의(11/9 예정)</div>
									</a>
								</li>
								<li>
									<a href="javascript:;" class="todolist-container active" data-click="todolist">
										<div class="todolist-input"><i class="fa fa-square"></i></div>
										<div class="todolist-title">2021년 상반기 직원 채용 준비</div>
									</a>
								</li> -->
							</ul>
						</div>
					</div>
					<!-- end panel -->				
				</div>
				<!-- end col-4 -->
			</div>
			<!-- end row -->