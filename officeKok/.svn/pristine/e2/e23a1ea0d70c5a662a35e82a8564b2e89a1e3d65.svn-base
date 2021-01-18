<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 21.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>officeKok</title>
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
	name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- Favicon -->
<tiles:insertAttribute name="preScript" />
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show">
	<span class="spinner"></span>
</div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container"
	class="fade page-sidebar-fixed page-header-fixed page-content-full-height page-with-top-menu page-with-wide-sidebar page-with-light-sidebar">
	<!-- begin #header -->
	<div id="header" class="header navbar-default">
		<tiles:insertAttribute name="headerMenu" />
	</div>
	<!-- end #header -->

	<!-- begin #top-menu -->
	<div id="top-menu" class="top-menu">
		<tiles:insertAttribute name="topMenu" />
	</div>
	<!-- end #top-menu -->

	<!-- begin #sidebar -->
	<div id="sidebar" class="sidebar">
		<!-- begin sidebar scrollbar -->
		<div data-scrollbar="true" data-height="100%">
			<tiles:insertAttribute name="leftMenu" />
		</div>
		<!-- end sidebar scrollbar -->
	</div>
	<div class="sidebar-bg"></div>
	<!-- end #sidebar -->

	<!-- begin #content -->
	<div id="content" class="content" style="margin-top:46px;">
		<tiles:insertAttribute name="content" />
	</div>
	<!-- end #content -->

	<!-- begin scroll to top btn -->
	<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade"
		data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	<!-- end scroll to top btn -->
</div>
<!-- end page container -->
</body>

</html>