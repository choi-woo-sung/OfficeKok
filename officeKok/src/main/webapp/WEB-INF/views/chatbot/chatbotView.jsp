<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 27.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/template/assets/css/google/app.min.css" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL CSS STYLE ================== -->
	<link href="${pageContext.request.contextPath}/template/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/template/assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/template/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/template/assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- begin panel -->
					<div class="panel panel-primary" data-sortable-id="index-2">
						<div class="panel-heading">
							<h4 class="panel-title">Chat History</h4>
							<span class="label bg-white text-blue">4 message</span>
						</div>
						<div class="panel-body ">
							<div class="chats" data-scrollbar="true" data-height="225px">
								<div class="left">
									<span class="date-time">yesterday 11:23pm</span>
									<a href="javascript:;" class="name">Sowse Bawdy</a>
									<a href="javascript:;" class="image"><img alt="" src="../assets/img/user/user-12.jpg" /></a>
									<div class="message">
										Lorem ipsum dolor sit amet, consectetuer adipiscing elit volutpat. Praesent mattis interdum arcu eu feugiat.
									</div>
								</div>
								<div class="right">
									<span class="date-time">08:12am</span>
									<a href="javascript:;" class="name"><span class="label label-primary">ADMIN</span> Me</a>
									<a href="javascript:;" class="image"><img alt="" src="../assets/img/user/user-13.jpg" /></a>
									<div class="message">
										Nullam posuere, nisl a varius rhoncus, risus tellus hendrerit neque.
									</div>
								</div>
								<div class="left">
									<span class="date-time">09:20am</span>
									<a href="javascript:;" class="name">Neck Jolly</a>
									<a href="javascript:;" class="image"><img alt="" src="../assets/img/user/user-10.jpg" /></a>
									<div class="message">
										Euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
									</div>
								</div>
								<div class="left">
									<span class="date-time">11:15am</span>
									<a href="javascript:;" class="name">Shag Strap</a>
									<a href="javascript:;" class="image"><img alt="" src="../assets/img/user/user-14.jpg" /></a>
									<div class="message">
										Nullam iaculis pharetra pharetra. Proin sodales tristique sapien mattis placerat.
									</div>
								</div>
							</div>
						</div>
						<div class="panel-footer">
							<form name="send_message_form" data-id="message-form">
								<div class="input-group">
									<input type="text" class="form-control" name="message" placeholder="Enter your message here.">
									<span class="input-group-append">
										<button class="btn btn-primary" type="button"><i class="fa fa-camera"></i></button>
										<button class="btn btn-primary" type="button"><i class="fa fa-link"></i></button>
									</span>
								</div>
							</form>
						</div>
					</div>
					<!-- end panel -->