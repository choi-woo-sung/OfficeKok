<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 27.      이지윤      최초작성
* 2020. 10. 27.      최우성           작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style>
#content {
	padding: 0;
}
#name {
	font-size: 0.8em;
}

.filebox input[type="file"] {
	/* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<script>
	$(function() {
		$("#zusoconfirm").hide();
		$("#fileconfirm").hide();
		$("#checkconfirm2").hide();
		var readURL = function(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#profileimg').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".file-upload").on('change', function() {
			readURL(this);
		});

	});

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window
				.open(
						"${pageContext.request.contextPath }/juso/jsp_sample/jusoPopup.jsp",
						"pop",
						"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadAddrPart1, addrDetail, zipNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.empadd1.value = roadAddrPart1;

		document.form.empadd2.value = addrDetail;

		document.form.empzip.value = zipNo;
	}
</script>
<div class="wrapper bg-grey-transparent-2">
<form name="form" id="form" method="post" enctype="multipart/form-data">
	<!-- begin profile -->
	<div class="profile">
		<div class="profile-header">
			<!-- BEGIN profile-header-cover -->
			<div class="profile-header-cover"></div>
			<!-- END profile-header-cover -->
			<!-- BEGIN profile-header-content -->
			<div class="profile-header-content">
				<!-- BEGIN profile-header-img -->
				<div style="height:100% " class="profile-header-img">
					<img id="profileimg" src="data:image/*;base64,${emp.mem_imgBase64}"
						alt="">
				</div>

				<!-- END profile-header-img -->
				<!-- BEGIN profile-header-info -->
				<div class="profile-header-info">
					<h4 class="mt-0 mb-1">${emp.empnm}</h4>
					<p class="mb-2">${emp.deptnm}&nbsp/&nbsp${emp.ranknm}</p>
					<div class="filebox">
						<label for="ex_file" id="fileconfirm" class="btn btn-xs btn-yellow">프로필사진 변경</label> 
						<input type="file" name="pro_imagefile" id="ex_file" class="file-upload">
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
	<div class="tab-pane fade show active" id="profile-about">
		<!-- begin table -->
		<div class="table-responsive form-inline justify-content-center">
			<!-- 	form3가 진짜로 보내는 폼임 -->
			<div class="jumbotron bg-light mt-4">
			<table class="table table-profile table-th-valign-middle">
				<colgroup>
					<col style="width: 25%;">
					<col style="width: 75%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">사번</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input type="text" name="empno" class="form-control"
								value="${emp.empno}" readonly />
							</span>
						<td>
					</tr>
					<tr>
						<th scope="row">메일</th>
						<td>
							<input id="empmail" name="empmail" type="text" class="form-control"
								value="${emp.empmail}" readonly />
							<a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3a%2f%2fmail.google.com%2f&access_type=offline&include_granted_scopes=true&response_type=code&state=state_parameter_passthrough_value&redirect_uri=http%3a%2f%2flocalhost%2fofficeKok%2fmypage%2ftoken&client_id=194180887465-ctas4fs561j9d2kuok9fg98ttjtcte1c.apps.googleusercontent.com" 
								class="btn btn-white ml-4">
								메일 계정 등록
							</a>
						</td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input id="password" name="emppw2" type="password"
								class="form-control" value="${emp.emppw2}" readonly />
							</span>
						<td>
					</tr>

					<tr>
						<th scope="row">주민번호</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input type="text" class="form-control" value="${emp.empregno}"
								readonly />
							</span>
						<td>
					</tr>

					<tr>
						<th scope="row">HP</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input id="hp" name="emphp" type="text" class="form-control"
								value="${emp.emphp}" readonly />
							</span>
						<td>
					</tr>
					<tr>
						<th scope="row">입사일</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input type="text" class="form-control" value="${emp.enterdate}"
								readonly />
							</span>
						<td>
					</tr>

					<tr>
						<th scope="row">주소</th>
						<td>
							<span> 
							<input type="text" style="width: 300px;" class="form-control" 
								id="roadAddrPart1" name="empadd1" value="${emp.empadd1}" readonly />
							</span>
							<input type="button" id="zusoconfirm" class="btn btn-primary ml-3" 
								onClick="goPopup();" value="주소 찾기" />
						<td>
					</tr>

					<tr>
						<th scope="row">상세주소</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input type="text" class="form-control" id="addrDetail"
								name="empadd2" value="${emp.empadd2}" readonly />
							</span>
						<td>
					</tr>

					<tr>
						<th scope="row">우편번호</th>
						<td>
							<span style="width: 120px; height: 20px;"> 
							<input type="text" class="form-control" id="zipNo" name="empzip"
								value="${emp.empzip}" readonly />
							</span>
						<td>
					</tr>

					<tr>
						<th scope="row">성별</th>
						<td>
							<span> 
							<input type="text" class="form-control" name="emp" value="${emp.empgen}" readonly />
							</span>
						<td>
					</tr>

					<tr>
						<td class="justify-content-center" scope="row">
							<button type="button" id="checkconfirm" class="btn btn-primary width-150 mt-2">수정</button> 
							<!-- 이게 submit로 변환 -->
							<button type="submit" id="checkconfirm2" class="btn btn-primary width-150 mt-2">확인</button>
						</td>
						<td>
							<input type="button" value="돌아가기" class="btn btn-white width-150 ml-2 mt-2" 
								onclick="history.back();" />
						</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</form>
</div>

<script type="text/javascript">
	let mail = $("#mailconfirm");
	$('#checkconfirm').on("click", function() {
	//		mail.show();
		$("#fileconfirm").show();
		$("#zusoconfirm").show();
		$("#checkconfirm2").show();
		$("#checkconfirm").hide();
		$('#password').attr("readonly", false);
		$('#hp').attr("readonly", false);
	});
</script>