<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 27.      이지윤      최초작성
* 2020. 10. 27.      최우성          작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>

<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-autofill-bs4/css/autofill.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-colreorder-bs4/css/colreorder.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-keytable-bs4/css/keytable.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-rowreorder-bs4/css/rowreorder.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-select-bs4/css/select.bootstrap4.min.css" --%>
<!-- 	rel="stylesheet" /> -->
<!-- ================== END PAGE LEVEL STYLE ================== -->


<div>
	<!-- begin page-header -->
	<h1 class="page-header">공지사항 게시판</h1>
	<!-- end page-header -->
		<hr>
	<div>

		<div class="pull-left mt-2">
			&nbsp;&nbsp;&nbsp;전체&nbsp;<span>리스트 수</span>
		</div>
		<form id="searchForm" action="${pageContext.request.contextPath }/board/totalRead" >
			<div class="col-mt-1 pull-left">
			<select name="pagecount" id="pagecount" class="form-control">
				<option>5</option>
				<option  selected>10</option>
				<option>25</option>
				<option>50</option>
			</select>
		</div>
			<input type="hidden" name="page" />
			<button type="submit" class="btn btn-primary pull-right">
				<i class="fa fa-search"></i>
			</button>
			<div class="col-md-2 pull-right">
				<input type="text" class="form-control" name="searchWord" />
			</div>

			<div class="col-mt-1 pull-right">
				<select name="searchType" class="form-control">
					<option value="subject">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
			</div>
		</form>
	</div>
	<br><br><!-- begin row -->

	<div class="row">
		<!-- begin col-2 -->
		<!-- 				<div class="col-xl-2"> -->
		<!-- 					<h5>Combination Include:</h5> -->
		<!-- 					<ul class="p-l-25 m-b-15"> -->
		<!-- 						<li>Autofill</li> -->
		<!-- 						<li>ColReorder</li> -->
		<!-- 						<li>Buttons</li> -->
		<!-- 						<li>KeyTable</li> -->
		<!-- 						<li>Responsive</li> -->
		<!-- 						<li>RowReorder</li> -->
		<!-- 						<li>Select</li> -->
		<!-- 					</ul> -->
		<!-- 					<p class="m-b-20"> -->
		<!-- 						<a href="http://www.datatables.net/" target="_blank" class="btn btn-inverse btn-sm">View Official Website</a> -->
		<!-- 					</p> -->
		<!-- 				</div> -->
		<!-- end col-2 -->
		<!-- begin col-10 -->
		<div class="col-xl-12">
			<div class="panel panel-inverse">
				<!-- begin panel-heading -->
				<!-- end panel-heading -->
				<!-- begin panel-body -->
				<div class="panel-body">
				<input type="button" class="btn btn-info" value="새글쓰기"  
				onclick="location.href='<c:url value="/board/boardInsert.do"/>';" /><br><br>
					<table id="data-table-combine"
						class="table table-striped table-bordered table-td-valign-middle">
						<thead>
							<tr>
								<th class="text-nowrap">번호</th>
								<th class="text-nowrap">제목</th>
								<th class="text-nowrap">작성자</th>
								<th class="text-nowrap">작성날짜</th>
								<th class="text-nowrap"><i class="fas fa-lg fa-fw m-r-10 fa-eye"></i></th>
							</tr>
						</thead>
						<tbody>

							<c:set value="${pagingVO.data }" var="dataList" />
							<c:choose>
								<c:when test="${not empty dataList }">
									<c:forEach var="post" items="${dataList }">
										<c:url value="/board/noticeRead/${post.postno}" var="boardViewURL">
										</c:url>
										<tr class="odd gradeX">
											<td width="1%" class="f-s-600 text-inverse">${post.rnum }</td>
											<td><c:if test="${post.level gt 1 }">
													<c:forEach begin="1" end="${post.level-1 }" var="idx"
														varStatus="vs">
										&nbsp;&nbsp;
										${vs.last?"re:":"" }
									</c:forEach>
												</c:if> <a href="${boardViewURL }">${post.postsubject }</a>
											</td>
											<td>관리자</td>
											<td>${post.postdate }</td>
											<td>${post.posthit }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6">검색 조건에 맞는 게시글이 없음.</td>
									</tr>
								</c:otherwise>
							</c:choose>


						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" id="pagingArea">${pagingVO.pagingHTML_BS }</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- end panel-body -->
			</div>
		</div>
		<!-- end col-10 -->
	</div>
	<!-- end row -->


	<!-- end page container -->

</div>


<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net/js/jquery.dataTables.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-autofill/js/dataTables.autofill.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-autofill-bs4/js/autofill.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-colreorder/js/dataTables.colreorder.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-colreorder-bs4/js/colreorder.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-keytable/js/dataTables.keytable.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-keytable-bs4/js/keytable.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-rowreorder/js/dataTables.rowreorder.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-rowreorder-bs4/js/rowreorder.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-select/js/dataTables.select.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/datatables.net-select-bs4/js/select.bootstrap4.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/pdfmake/build/pdfmake.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/pdfmake/build/vfs_fonts.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/plugins/jszip/dist/jszip.min.js"></script> --%>
<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/template/assets/js/demo/table-manage-combine.demo.js"></script> --%>
<!-- ================== END PAGE LEVEL JS ================== -->

<script type="text/javascript">

$(function(){
	let listTable = $("#data-table-combine");
	let pagingArea = $("#pagingArea");
	let pagingA = pagingArea.on('click', "a" ,function(){
		let page = $(this).data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	});
	
	$("#pagecount").change(function() {
		let page = pagingArea.data("page");
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
		searchForm.find("[name='page']").val(1);
		return false;
	})
	
	
	
	let url = this.action?this.action:location.href;
	
	let searchForm = $("#searchForm").ajaxForm({
		url : url, 
		dataType : "json",
		success : function(resp) {
			console.log(resp);
			listTable.find("tbody").empty();
			pagingArea.empty();
			let list = resp.data;
			let trTags = [];
			
			if(list.length>0){
				$(list).each(function(idx, data){
					trTags.push(
						$("<tr class='odd gradeX'>").append(
							$("<td width='1%' class='f-s-600 text-inverse'>").text(data.rnum),
							$("<td>").html(
									$("<a>").text(data.postsubject)
											.attr("href", "${pageContext.request.contextPath }/board/noticeRead/" + data.postno)
											.data("what", data.postno)
							),
							$("<td>").text('관리자'),
							$("<td>").text(data.postdate),
							$("<td>").text(data.posthit)
	 					)
					);		
				});
			}else{
				trTags.push($("<tr>").html($("<td colspan='5'>").text("조건에 맞는 게시글이 없음.")));
			}
			listTable.find("tbody").html(trTags);
			if(list.length>0)
				pagingArea.html(resp.pagingHTML_BS);
		},
		error : function(errResp) {
		}
	});
	// 이제 오른쪽클릭
	
});
</script>