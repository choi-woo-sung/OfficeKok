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

<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/js/demo/form-plugins.demo.js"></script>
<link href="${pageContext.request.contextPath }/template/assets/css/approval/appr.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath }/js/note/noteTrash.js"></script>

<div id="note">
	<h1 class="page-header">휴지통</h1>
	<hr>
	
	<div class="table-header">
		<div class="col-mt-1 pull-left">
			<select id="pageCount" class="form-control">
				<option>5</option>
				<option>10</option>
				<option>25</option>
				<option>50</option>
			</select>
		</div>
		
		<div class="pull-left mt-2" id="totalNum">
			&nbsp;&nbsp;&nbsp;전체&nbsp;<span>${pagingVO.totalRecord }</span>
		</div>
		
		<form id="searchForm">
			<input type="hidden" name="page" />
			<input type="hidden" name="notedeldate" id="${today }" />
			<div class="input-group pull-right m-l-5 width-250">
				<input type="text" name="searchWord" class="form-control" placeholder="검색어" >
				<button type="submit" class="input-group-addon"><i class="fa fa-search"></i></button>
			</div>
		
			<div class="col-mt-1 pull-right m-l-5">
				<select name="searchType" class="form-control">
					<option value="person">보낸/받는사람</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
			</div>
		
			<div class="col-mt-1 pull-right">
				<select class="form-control">
					<option value="all">전체</option>
					<option value="normal">일반</option>
					<option value="important">중요</option>
					<option value="notice">공지</option>
					<option value="distribute">배포</option>
				</select>
			</div>
		</form>
	</div>
	
	<div style="height:50px;"></div>
	<div class="table-body">
		<div class="table-content">
			<table id="noteTable" class="table table-striped table-bordered">
				<thead style="text-align:center;">
					<tr>
						<th><input type="checkbox" id="checkboxAllNoteItem" title="checkbox">
							<i class="fa fa-checkbox"></i>
						</th>
						<th><button style="border:none; background:none;" type="button" id="attatchFile" title="attatchFile" />
							<i class="fa fa-file"></i>
						</th>
						<th>유형</th>
						<th>분류</th>
						<th>제목</th>
						<th>보낸/받는사람</th>
						<th>삭제일시</th>
					</tr>
				</thead>
				
				<tbody style="text-align:center;">
					<c:set value="${pagingVO.data }" var="dataList" />
					<c:choose>
						<c:when test="${not empty dataList }">
							<c:forEach var="note" items="${dataList }">
								<tr>
									<td><input type="checkbox"></td>
									<td><!-- <i class="fa fa-file"></i> --></td>
									<td>${note.notechk }</td>
									<td>${note.filtercatenm }</td>
									<c:url value="/note/trashView/${note.noteno }" var="noteTrashViewURL"></c:url>
									<td>
										<a class="text-black-darker" href="${noteTrashViewURL }">${note.notesubject }</a>
									</td>
									<td>
										<c:if test="${note.notechk eq '송신' }">
											${note.receiver }
										</c:if>
										<c:if test="${note.notechk eq '수신' }">
											${note.sender }
										</c:if>
									</td>
									<td>${note.notedeldate }</td>
								</tr>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td colspan="7">검색 조건에 맞는 쪽지가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" id="pagingArea" style="text-align:center">${pagingVO.pagingHTML_BS }</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="table-foot" style="width:100%; text-align:right;">
			<!-- <input type="button" value="이동" class="btn btn-default" /> -->
			<input type="button" value="삭제" class="btn btn-default" />
			<input type="button" value="비우기" class="btn btn-gray" />
		</div>
	</div>
		
</div>
