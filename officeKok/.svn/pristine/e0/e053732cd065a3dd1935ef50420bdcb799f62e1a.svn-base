<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 11. 18.      정재은      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
 <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/js/demo/form-plugins.demo.js"></script>
<link href="${pageContext.request.contextPath }/template/assets/css/approval/appr.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath }/js/note/noteSend.js"></script>

<script type="text/javascript">
	$(function(){
		$("#noteDeleteBtn").on("click", function(){
			var noteno = $(this).data("noteno");
			
			$("#noteno").val(noteno);
			$("#trashCan").submit();
		});
	});
</script>

<style>
	th{
		width:200px;
		text-align:center;
	}
</style>

<div id="noteView">
	<h1 class="page-header">휴지통</h1>
	
	<table class="table table-bordered">
		<tr id="title">
<!-- 			<th></th> -->
			<td colspan="2"><span class="label text-black-darker f-s-18">${note.notesubject }</span></td>
		</tr>
		
		<tr id="type">
			<th><span class="label text-black-darker f-s-14">분류</span></th>
			<td><span class="list">${note.filtercatenm }</span></td>
		</tr>
		
		<tr id="date">
			<th><span class="label text-black-darker f-s-14">보낸날짜</span></th>
			<td><span class="list">${note.notedate }</span></td>
		</tr>
		
		<tr id="sender">
			<th><span class="label text-black-darker f-s-14">보낸사람</span></th>
			<td><span class="list">${note.sender }</span></td>
		</tr>
		
		<tr id="receiver">
			<th><span class="label text-black-darker f-s-14">받는사람</span></th>
			<td>
				<span class="list">${note.receiver }&nbsp;
					<span style="border-radius:70px; background-color:lightgrey">&nbsp;미확인&nbsp;</span>
				</span>
			</td>
		</tr>
		
		<tr id="attachFile">
			<th><span class="label text-black-darker f-s-14">첨부파일</span></th>
			<td><span class="list"></span></td>
		</tr>
		
		<tr id="content">
			<td colspan="2"><textarea style="border:none;" readonly rows="10" cols="180">${note.notecontent }</textarea></td>
		</tr>
	</table>
	
	<div style="width:100%; text-align:right;" id="btn">
		<input type="button" id="noteDeleteBtn" value="삭제" class="btn btn-white"  data-noteno="${note.noteno }">
		<input type="button" value="목록" class="btn btn-grey" 
			onclick="location.href='${pageContext.request.contextPath}/note/trash';">
	</div>
</div>

<form:form modelAttribute="note" id="trashCan" action="${pageContext.request.contextPath }/note/trash" method="post">
		<input type="hidden" id="noteno" name="noteno" />
		<input type="hidden" id="notedeldate" name="${today }" />
	</form:form>