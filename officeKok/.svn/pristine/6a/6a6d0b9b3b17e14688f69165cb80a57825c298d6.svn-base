<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath}/js/addrbook/addrbook.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/template/assets/plugins/jstree/dist/themes/default/style.min.css"
	rel="stylesheet" />
<link
	href="https://translate.googleapis.com/translate_static/css/translateelement.css" />

<div class="vertical-box">
	<div class="vertical-box-column width-250">
		<div class="vertical-box">
			<div class="wrapper bg-indigo-transparent-2">
				<div class="d-flex align-items-center justify-content-center">
					<c:url value="/addrBook/regist" var="addrBookRegistURL" />
					<a href="${addrBookRegistURL}" data-service="write"
						class="btn btn-primary p-l-40 p-r-40 btn-sm">주소록 등록 </a>
				</div>
			</div>
			<div class="vertical-box-row bg-indigo-transparent-2">
				<div class="vertical-box-cell">
					<div class="vertical-box-inner-cell">
						<div data-scrollbar="true" data-height="100%" class="wrapper">
							<div id="jstree-drag-and-drop"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="vertical-box-column">
		<div class="vertical-box">
			<div class="vertical-box-row">
				<div class="vertical-box-cell">
					<div class="vertical-box-inner-cell">
						<div data-scrollbar="true" data-height="100%" class="wrapper">
							<div class="panel panel-inverse">
								<div class="panel-heading">전체 주소록</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-sm-12 col-md-3 ml-2">
											<div class="row">
												<select class="form-control form-control-sm col-2" name="pageNumberSelect">
													<option value="10" selected>10</option>
													<option value="15">15</option>
													<option value="25">25</option>
													<option value="50">50</option>
												</select>
												<small class="ml-2 mt-2 text-black-darker">전체 </small>
												<small id="addrBookNumberText" class="ml-2 mt-2 text-red"></small>
											</div>
										</div>
										<div class="col-sm-12 col-md-8">
											<div class="row pull-right">
												<div class="checkbox checkbox-css">
													<input type="checkbox" id="myRegistAddrChk" checked /> 
													<label for="myRegistAddrChk"> 
														<small class="text-center">내가 등록한 주소록</small>
													</label>
												</div>
												<div class="row ml-2">
													<select class="form-control form-control-sm col-4 ml-2">
													</select> 
													<input class="form-control form-control-sm col-4 ml-2" type="text" /> 
													<a class="text-inverse fas fa-lg fa-fw m-r-10 ml-3 mt-2 fa-search" href="#"></a>
												</div>
											</div>
										</div>
									</div>
									<div class="table-responsive mt-3">
										<table class="table table-bordered">
											<thead>
												<tr>
													<td class="with-checkbox mt-2" colspan="2">
														<div class="checkbox checkbox-css"
															style="display: inline;">
															<input type="checkbox" id="allCheck" checked /> 
															<label for="allCheck"> 
																<small class="text-center">전체  선택</small>
															</label>
														</div>
													</td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="with-checkbox with-img">
														<div class="checkbox checkbox-css" style="display: inline;">
															<input type="checkbox" id="check" checked /> 
															<label for="check">&nbsp;</label> 
															<i id="bookMark" class="far fa-sm fa-fw m-r-10 fa-star" onclick="bookMark(this)"></i> 
															<img src="${pageContext.request.contextPath}/template/assets/img/user/user-1.jpg" class="img-rounded height-50" />
														</div>
														<div style="display: inline;">
															<c:url value="/addrBook/detail" var="addrBookDetailURL">
																<c:param name="what" value="123" />
															</c:url>
															<a class="text-inverse ml-2" href="${addrBookDetailURL}">이원우</a>
															<ul class="list-unstyled ml-4 mt-3">
																<li><small>휴대전화번호 :</small></li>
																<li><small>회사명 :</small></li>
																<li><small>메일 :</small></li>
															</ul>
														</div>
													</td>
													<td class="with-checkbox with-img">
														<div class="checkbox checkbox-css"
															style="display: inline;">
															<input type="checkbox" value="" id="check" checked /> <label
																for="check">&nbsp;</label> <i id="bookMark"
																class="far fa-sm fa-fw m-r-10 fa-star"
																onclick="bookMark(this)"></i> <img
																src="${pageContext.request.contextPath}/template/assets/img/user/user-1.jpg"
																class="img-rounded height-50" />
														</div>
														<div style="display: inline;">
															<c:url value="/addrBook/detail" var="addrBookDetailURL">
																<c:param name="what" value="123" />
															</c:url>
															<a class="text-inverse ml-2" href="${addrBookDetailURL}">이원우</a>
															<ul class="list-unstyled ml-4 mt-3">
																<li><small>휴대전화번호 :</small></li>
																<li><small>회사명 :</small></li>
																<li><small>메일 :</small></li>
															</ul>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="${pageContext.request.contextPath}/template/assets/plugins/jstree/dist/jstree.min.js"></script>
<script type="text/javascript">

	var bookMark = function(bookmark) {
		if ($(bookmark).hasClass("far")) {
			$(bookmark).removeClass("far");
			$(bookmark).addClass("fas");
		} else if ($(bookmark).hasClass("fas")) {
			$(bookmark).removeClass("fas");
			$(bookmark).addClass("far");
		}
	}

	var handleJstreeDragAndDrop = function() {
		$("#jstree-drag-and-drop").jstree({
			"core" : {
				"themes" : {
					"responsive" : false
				},
				"check_callback" : true,
				'data' : [ {
					"text" : "Parent Node",
					"children" : [ {
						"text" : "Initially selected",
						"state" : {
							"selected" : true
						}
					}, {
						"text" : "Folder 1"
					}, {
						"text" : "Folder 2"
					}, {
						"text" : "Folder 3"
					}, {
						"text" : "Initially open",
						"icon" : "fa fa-folder text-success fa-lg",
						"state" : {
							"opened" : true
						},
						"children" : [ {
							"text" : "Disabled node",
							"disabled" : true
						}, {
							"text" : "Another node"
						} ]
					}, {
						"text" : "Another Custom Icon",
						"icon" : "fa fa-cog text-inverse fa-lg"
					}, {
						"text" : "Disabled Node",
						"state" : {
							"disabled" : true
						}
					}, {
						"text" : "Sub Nodes",
						"icon" : "fa fa-folder text-danger fa-lg",
						"children" : [ {
							"text" : "Item 1",
							"icon" : "fa fa-file fa-lg"
						}, {
							"text" : "Item 2",
							"icon" : "fa fa-file fa-lg"
						}, {
							"text" : "Item 3",
							"icon" : "fa fa-file fa-lg"
						}, {
							"text" : "Item 4",
							"icon" : "fa fa-file fa-lg"
						}, {
							"text" : "Item 5",
							"icon" : "fa fa-file fa-lg"
						} ]
					} ]
				}, "Another Node" ]
			},
			"types" : {
				"default" : {
					"icon" : "fa fa-folder text-warning fa-lg"
				},
				"file" : {
					"icon" : "fa fa-file text-warning fa-lg"
				}
			},
			"state" : {
				"key" : "demo2"
			},
			"plugins" : [ "contextmenu", "dnd", "state", "types" ]
		});
	};
	var TreeView = function() {
		"use strict";
		return {
			init : function() {
				handleJstreeDragAndDrop();
			}
		};
	}();

	$(document).ready(function() {
		TreeView.init();
	});
</script>