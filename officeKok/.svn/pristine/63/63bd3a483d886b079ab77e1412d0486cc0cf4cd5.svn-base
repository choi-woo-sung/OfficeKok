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
<!-- Webix Library -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/template/webix.trial/filemanager/codebase/webix/webix.js"></script>
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
	if (!webix.env.touch && webix.env.scrollSize) webix.CustomScroll.init();
	
	  // numbers in 'mode' mean that this option will be shown
	  // 1) for files and folders 2) only in the right part of FM
	  // (will not be shown if the menu is opened for the left tree)
	  const mode = 0x01 | 0x20;
	  class CustomMenuBody extends fileManager.views["menus/menubody"] {
	    config() {
	      const menu = super.config();
	      menu.data.push({
	        id: "clone",
	        value: "공유하기",
	        show: mode,
	        icon: "wxi-plus",
	      });
	      return menu;
	    }
	  }
	  
	  class Operations extends fileManager.services.Operations {
	    initEvents() {
	      super.initEvents();

	      this.app.attachEvent("app:action", (name, info) => {
	        if (name === "clone") {
	          //this.addToClipboard("copy"); clone 클릭했을 때 이벤트
	          //this.paste();
	        }
	      });
	    }
	  }
	    
	  class MyBackend extends fileManager.services.Backend {
		  
		  directLink (id, download){
			  var temp = id;
			  var temp2 = id.replace("/","");
			  console.log(temp2);
			  return "${pageContext.request.contextPath }/drive/personal/2020005/"+temp2;
		  }
		  
		  //파일 업로드
		  upload(){
			  return "${pageContext.request.contextPath }/drive/personal/upload";
		  }
		  
		 //폴더 생성 	
		 makedir(id, name){
		   	return webix.ajax().post("${pageContext.request.contextPath }/drive/personal/makedir", {id, name})
		   		.then((data) => data.json());
		 }
		
		 //파일 백엔드에서 받아오는 처리(조회)
		 files(id) {
		        return webix.ajax("${pageContext.request.contextPath }/drive/personal/files", { id })
		            .then((data) => data.json());
		  }
		    		  
		  //아이콘 이미지
		  	icon(type, name, size) {
			  	console.log(type.value);
			  	var fileType = type.value.split(".").reverse()[0];
			  	var fileTypeTransper = fileType.toLowerCase();
			  	console.log(fileTypeTransper);
		        return '${pageContext.request.contextPath }/template/webix.trial/filemanager/icons/small/'+fileTypeTransper+'.svg';
		    }
		  	
		  	//드라이브 용량
			// or just return a data promise
		    getInfo() {
		      return Promise.resolve({
		        stats:{
		          free: 52 * 1000 * 1000,
		          total: 250 * 1000 * 1000,
		          used: 198.4 * 1000 * 1000,
		        }
		      });
		    }
		  
		}
	
	  
	  var app = new fileManager.App({
		view: "filemanager",
	    url: "${pageContext.request.contextPath }/drive/personal/", //폴더 구조 이 주소로 받아옴
	    override: new Map([
	      [fileManager.views["menus/menubody"], CustomMenuBody],
	      [fileManager.services.Operations, Operations],
	      [fileManager.services.Backend, MyBackend]
	    ])
	  });
	
	  app.render(document.getElementById("content"));

});

</script>
