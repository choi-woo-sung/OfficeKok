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
<!-- begin page-header -->
	<h1 class="page-header">휴지통</h1>
	<hr>
<!-- end page-header -->	
	<button class="btn btn-inverse" id="onBtn" type="button"style="float:right;margin-right: 10px;">전체 삭제</button>
	<div class="input-group pull-left m-l-5 width-450">
		<input type="text" name="searchWord" class="form-control" title="검색어" placeholder="검색어를 입력해주세요" >
		<button class="input-group-addon"><i class="fa fa-search"></i></button>	
	</div>
