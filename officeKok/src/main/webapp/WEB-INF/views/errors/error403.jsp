<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 23.      안승원      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>Color Admin | 403 Error Page</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/template/assets/css/google/app.min.css" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
</head>
<body class="pace-top">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade show">
		<span class="spinner"></span>
	</div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade">
		<!-- begin error -->
		<div class="error">
			<div class="error-code">403</div>
			<div class="error-content">
				<div class="error-message">사용자님은 콘텐츠에 접근할 권리를 가지고 있지 않습니다.</div>
				<div class="error-desc mb-3 mb-sm-4 mb-md-5">
					권한을 부여받은 후 다시 접근해주세요. <br />
				</div>
				<div>
					<a href="${pageContext.request.contextPath }" class="btn btn-success p-l-20 p-r-20">홈으로</a>
				</div>
			</div>
		</div>
		<!-- end error -->
		
		
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${pageContext.request.contextPath}/template/assets/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath}/template/assets/js/theme/google.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</body>
</html>