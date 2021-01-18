<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 11. 2.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${pageContext.request.contextPath }/template/assets/plugins/jstree/dist/jstree.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<link href="${pageContext.request.contextPath }/template/assets/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL JS ================== -->
	<script src="${pageContext.request.contextPath }/js/organization/orgTree.js"></script>		
		
		<a href="#modal-dialog" class="btn btn-sm btn-success" data-toggle="modal">Demo</a>
		
		<div class="modal fade" id="modal-dialog" aria-hidden="true" style="display: none;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">Modal Dialog</h4>
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										</div>
										<div class="modal-body">
												<div class="panel panel-inverse" data-sortable-id="tree-view-2">
													<div class="panel-heading">
														<h4 class="panel-title">Checkable Tree</h4>
														<div class="panel-heading-btn">
															<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
															<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
															<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
															<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
														</div>
													</div>
													<div class="panel-body">
														<div id="jstree-checkable"></div>
													</div>
												</div>
										</div>
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-white" data-dismiss="modal">Close</a>
											<a href="javascript:;" class="btn btn-success">Action</a>
										</div>
									</div>
								</div>
							</div>
		
		<!-- begin panel -->
<!-- 		<div class="panel panel-inverse" data-sortable-id="tree-view-2"> -->
<!-- 			<div class="panel-heading"> -->
<!-- 				<h4 class="panel-title">Checkable Tree</h4> -->
<!-- 				<div class="panel-heading-btn"> -->
<!-- 					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a> -->
<!-- 					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a> -->
<!-- 					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a> -->
<!-- 					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="panel-body"> -->
<!-- 				<div id="jstree-checkable"></div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- end panel -->
<script>
	var data = ${list};
	console.log(data);
	$('#modal-dialog').appendTo("body");
</script>
