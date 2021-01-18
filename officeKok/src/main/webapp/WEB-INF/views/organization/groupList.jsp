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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath }/js/organization/orgchart.js"></script>

<!-- begin page-header -->
	<h1 class="page-header">조직도</h1>
	<hr>
<!-- end page-header -->

	<div id="tree"></div>
	
<script>   
	OrgChart.templates.myTemplate = Object.assign({}, OrgChart.templates.ula);
	
	OrgChart.templates.myTemplate.exportMenuButton = '<img src="${pageContext.request.contextPath }/template/assets/img/my/save.png" style="position:absolute;right:{p}px;top:{p}px; width:40px;height:40px;cursor:pointer;" control-export-menu=""></img>';
	
	var chart = new OrgChart(document.getElementById("tree"), {
	    template: "myTemplate",
	    enableDragDrop: false,
	    menu: {
	        pdfPreview: {
	            text: "PDF 저장",
	            icon: OrgChart.icon.pdf(24, 24, '#7A7A7A'),
	            onClick: preview
	        },
	        png: { text: "PNG 저장" },
	        svg: { text: "SVG 저장" },
	        csv: { text: "CSV 저장" }
	    },
	    toolbar: {
	        zoom: true,
	        fit: true
	    },
	    nodeBinding: {
	        field_0: "name",
	        field_3: "tel",
	        field_5: "fax",
	        field_2: "addr",
	        field_4: "mail"
	        
	    }
	    
	});


	function preview() {
	    OrgChart.pdfPrevUI.show(chart, {
	        format: 'A4'
	    });
	}
	
	function nodePdfPreview(nodeId) {
	    OrgChart.pdfPrevUI.show(chart, {
	        format: 'A4',
	        nodeId: nodeId
	    });
	}
	
	chart.load(${list});
	
</script>