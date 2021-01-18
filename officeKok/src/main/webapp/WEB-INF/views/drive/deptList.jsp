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
<!-- Webix Library -->
<script type="text/javascript" src="${pageContext.request.contextPath }/template/webix.trial/filemanager/codebase/webix/webix.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/template/webix.trial/filemanager/codebase/webix/webix.css">
	<!-- App -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/template/webix.trial/filemanager/codebase/filemanager.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/template/webix.trial/filemanager/codebase/filemanager.css">
<style>
#content {
	padding: 0;
}
</style>

<script>
webix.ready(function() {
    // use custom scrolls, optional
    if (!webix.env.touch && webix.env.scrollSize)
        webix.CustomScroll.init();
 
    var app = new fileManager.App({
        url: "https://docs.webix.com/filemanager-backend/",
    });
	app.render(document.getElementById("content"));
});
		</script>