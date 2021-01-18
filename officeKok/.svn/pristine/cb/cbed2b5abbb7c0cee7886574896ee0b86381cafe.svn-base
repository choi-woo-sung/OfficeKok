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

<script src="${pageContext.request.contextPath }/js/note/noteSend.js"></script>

<div id="note">
	<h1 class="page-header">보낸 쪽지함</h1>
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
			<div class="input-group pull-right m-l-5 width-250">
				<input type="text" name="searchWord" class="form-control" placeholder="검색어" >
				<button type="submit" class="input-group-addon"><i class="fa fa-search"></i></button>
			</div>
			
			<div class="col-mt-1 pull-right m-l-5">
				<select name="searchType" class="form-control">
					<option value="receiver">받는사람</option>
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
		
			<div class="input-unread pull-right m-t-10">
				<label><i class="fa fa-check-circle text-red"></i>&nbsp;중요&nbsp;</label>
				<input type="checkbox" id="checkIsRead" name="isImportant" class="checkbox" value="0" title="중요">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			
			<div class="input-unread pull-right m-t-10">
				<label><i class="fa fa-exclamation text-red"></i>&nbsp;긴급&nbsp;</label>
				<input type="checkbox" id="checkIsUrgent" name="isUrgent" class="checkbox" value="1" title="긴급">
				&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</form>
	</div>
	
	<div style="height:50px;" ></div>
	<div class="table-body">
		<div class="table-content">
			<table id="noteTable" class="table table-striped table-bordered">
				<thead style="text-align:center;">
					<tr>
						<th><input type="checkbox" id="checkboxAllNoteItem" title="checkbox">
							<i class="fa fa-checkbox"></i>
						</th>
						<th><button style="border:none; background:none;" type="button" id="isUrgent" title="isUrgent" />
							<i class="fa fa-exclamation text-red"></i>
						</th>
						<th><button style="border:none; background:none;" type="button" id="important" title="important" />
							<i class="fa fa-check-circle text-red"></i>
						</th>
						<th><button style="border:none; background:none;" type="button" id="attatchFile" title="attatchFile" />
							<i class="fa fa-file"></i>
						</th>
						<th>분류</th>
						<th>제목</th>
						<th>받는사람</th>
						<th>보낸날짜</th>
					</tr>
				</thead>
				
				<tbody style="text-align:center;">
					<c:set value="${pagingVO.data }" var="dataList" />
					<c:choose>
						<c:when test="${not empty dataList }" >
							<c:forEach var="note" items="${dataList }">
								<tr>
									<td><input type="checkbox" class="mt-1"></td>
									<td>
										<c:if test="${'N' eq note.noteurgent }">
											<i class="fa fa-exclamation text-grey mt-1"></i>
										</c:if>
										<c:if test="${'Y' eq note.noteurgent }">
											<i class="fa fa-exclamation text-red mt-1"></i>
										</c:if>
									</td>
									<td><i class="fa fa-check-circle text-grey mt-1"></i></td>
									<td><!-- <i class="fa fa-file mt-2"></i> --></td>
									<td>${note.filtercatenm }</td>
									<c:url value="/note/sendView/${note.noteno }" var="noteSendViewURL"></c:url>
									<td>
										<a class="text-black-darker" href="${noteSendViewURL }">${note.notesubject }</a>
									</td>
									<td>${note.receiver }</td>
									<td>${note.notedate }</td>
								</tr>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<tr>
								<td colspan="9">검색 조건에 맞는 쪽지가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					
					<tr>
						<td colspan="9" id="pagingArea" style="text-align:center">${pagingVO.pagingHTML_BS }</td>
					</tr>
				</tfoot>
			</table>
		</div>
		<div class="table-foot" style="width:100%; text-align:right;">
			<input type="button" value="쪽지 쓰기" class="btn btn-gray" 
			onclick="location.href='${pageContext.request.contextPath}/note/form';"/>
			<input type="button" value="삭제" class="btn btn-default" />
		</div>
	</div>
		
</div>