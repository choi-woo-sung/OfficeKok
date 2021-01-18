<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 21.      이지윤      최초작성
* 2020. 11. 03.      정재은      내용수정
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.emp" var="emp"/>

<!-- begin navbar-header -->
<div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed navbar-toggle-left" data-click="sidebar-minify">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button> <!-- 햄버거 메뉴 -->
	
	<a href="${pageContext.request.contextPath }/main" class="navbar-brand">
		<b class="mr-1">Office</b> Kok
		<span class="navbar-logo">
			<span class="text-blue">o</span>
			<span class="text-red">f</span>
			<span class="text-orange">f</span>
			<span class="text-blue">i</span>
			<span class="text-green">c</span>
			<span class="text-red">e</span>
		</span>
	</a> <!-- 메인 들어가는 버튼 -->
</div>
<!-- end navbar-header -->

<!-- begin header-nav -->
<ul class="navbar-nav d-flex flex-grow-1"> <!-- 메인 버튼 왼쪽으로 쭉 -->
	<li class="navbar-form flex-grow-1"></li> <!-- 센터에 비어있는 부분 -->
	<li style="width:45px;"><a href="https://webchat.botframework.com/embed/hikokBot?s=lV9mtetbaDo.IW1c5rTACehe8W8BYEYGEkD0pBrRITEEoR68UUeZ-KA" onclick="window.open(this.href, '챗봇', 'width=400, height=500, top=200, left=700'); return false;"><i class="material-icons">android</i></a></li> <!-- 챗봇 아이콘 -->
	
	<li style="width:45px;"> <!-- 마이크 -->
	    <a id="btn-mic" class="off"><i class="fa fa-microphone"></i><span></span></a>
	    <span  id ="final_span" style="display:none;"></span>
    <button id="btn-tts" style="display:none;">Text to speech</button>
	</li> 

	
	<!-- 마이페이지 -->
	<li class="dropdown navbar-user">
		<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			<img src="data:image/*;base64,${emp.mem_imgBase64}" alt="" />
			<span class="d-none d-md-inline">${emp.empnm }</span> <b class="caret"></b>
		</a>
		<div class="dropdown-menu dropdown-menu-right">
			<a href="${pageContext.request.contextPath }/mypage" class="dropdown-item">Edit Profile</a>
			<a href="javascript:;" class="dropdown-item"><span class="badge badge-danger pull-right">2</span>Mail</a>
			<a href="${pageContext.request.contextPath }/cal" class="dropdown-item">Calendar</a>
			<div class="dropdown-divider"></div>
<%-- 		<a href="${pageContext.request.contextPath }/login" class="dropdown-item">LogOut</a> --%>
		</div>
	</li>
	
	<!-- 로그아웃 -->
	<c:if test="${not empty emp }">
		<form name="logoutForm" action="${pageContext.request.contextPath }/logout" method="post"></form>
		<li>
			<a href="#" onclick="document.logoutForm.submit();">
				<i class="material-icons">power_settings_new</i>
			</a>
		</li>
	</c:if>
<%--	<li><a href="${pageContext.request.contextPath }/login"><i class="material-icons">power_settings_new</i></a></li> --%>
</ul>
<!-- end header-nav -->
