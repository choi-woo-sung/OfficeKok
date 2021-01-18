<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/template/assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />

<div id="addrbook" class="row">
	<div class="panel panel-inverse width-full" data-sortable-id="form-stuff-4">
		<div class="panel-heading">주소록 등록</div>
		<div class="panel-body">
			<form:form action="${pageContext.request.contextPath}" method="post" enctype="multipart/form-data">
				<div class="row form-group m-b-30">
					<div class="col-md-12">
						<div class="row row-space-20">
							<div class="col-md-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">성</span>
									</div>
									<input type="text" name="lastnm" class="form-control ml-3" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">이름</span>
									</div>
									<input type="text" name="nm" class="form-control ml-3" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-12">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">회사명</span>
							</div>
							<input type="text" name="comnm" class="form-control ml-3" />
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-12">
						<div class="row row-space-20">
							<div class="col-md-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">휴대전화번호</span>
									</div>
									<input type="text" name="addbkhp" class="form-control ml-3" placeholder="-를 제외한 숫자만 입력하세요" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">메일</span>
									</div>
									<input type="email" name="addbkmail" class="form-control ml-3" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-12">
						<div class="row row-space-20">
							<div class="col-md-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">회사전화번호</span>
									</div>
									<input type="text" name="comtel" class="form-control ml-3" placeholder="-를 제외한 숫자만 입력하세요" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">회사팩스번호</span>
									</div>
									<input type="text" name="comfax" class="form-control ml-3" placeholder="-를 제외한 숫자만 입력하세요" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-12">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">사진 등록</span>
							</div>
							<input type="file" name="profileimg" class="form-control col-md-4 ml-3" />
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">개인 주소록 그룹</span>
							</div>
							<select name="" class="form-control ml-3">
							</select>
						</div>
					</div>
					<div class="col-md-4 ml-2" style="display: none;">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">선택 그룹</span>
							</div>
							<select class="form-control ml-3">
							</select>
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">전체 주소록 그룹</span>
							</div>
							<select class="form-control ml-3">
							</select>
						</div>
					</div>
					<div class="col-md-4 ml-2" style="display: none;">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">선택 그룹</span>
							</div>
							<select class="form-control ml-3">
							</select>
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">공개 여부</span>
							</div>
							<div class="btn-group ml-3">
							  <input type="button" class="btn btn-white invChk active" value="공개" />
							  <input type="button" class="btn btn-white invChk" value="비공개" />
							  <input type="hidden" name="invChk" value="Y" />
							</div>
						</div>
					</div>
				</div>
				<div id="detail" style="display: none;">
					<div class="row form-group m-b-30">
						<div class="col-md-12">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">직급</span>
								</div>
								<input type="text" name="ranknm" class="form-control ml-3" />
							</div>
						</div>
					</div>
					<div class="row form-group m-b-30">
						<div class="col-md-12">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">부서</span>
								</div>
								<input type="text" name="deptnm" class="form-control ml-3" />
							</div>
						</div>
					</div>
					<div class="row form-group m-b-30">
						<div class="col-md-4">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">생일</span>
								</div>
								<input type="text" name="addbkbirth" class="form-control ml-3" id="datepicker-autoClose" placeholder="mm/dd/yyyy" />
							</div>
						</div>
					</div>
					<div class="row form-group m-b-30">
						<div class="col-md-12">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">메모</span>
								</div>
								<textarea class="form-control ml-3" name="memo" rows="10" cols="10"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group m-b-30 pull-right">
					<div class="col-md-12" >
						<div class="input-group">
							<input id="detailRegist" type="button" class="btn btn-info" value="상세등록" />
							<input type="submit" class="btn btn-inverse ml-2" value="등록" />
							<input type="reset" class="btn btn-danger ml-2" value="취소" />
							<a class="btn btn-warning ml-2" href="${pageContext.request.contextPath}/addrBook/retreive">
								목록
							</a>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		var detailRegistView = $("#detail");
		var detailRegistBtn = $("#detailRegist");
		
		detailRegistBtn.on("click", function() {
			console.log(detailRegistView.css('display'));
			if (detailRegistView.css('display') == "none") {
				detailRegistBtn.val("간편등록");
				detailRegistView.show();
			} else {
				detailRegistBtn.val("상세등록");
				detailRegistView.hide();
			}
		});
		
		$(".invChk").on("click", function() {
			$(".active").removeClass("active");
			$(this).addClass("active");
			var chkVal = $(this).val();
			
			if (chkVal == "공개") {
				$("[name='invChk']").val("Y");
			} else if (chkVal == "비공개") {
				$("[name='invChk']").val("N");
			}
		})
		
	});
</script>

<script src="${pageContext.request.contextPath}/template/assets/plugins/jquery-migrate/dist/jquery-migrate.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/plugins/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/template/assets/js/demo/form-plugins.demo.js"></script>