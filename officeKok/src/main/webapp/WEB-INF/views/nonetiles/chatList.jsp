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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="style.css">
<link href="${pageContext.request.contextPath }/css/chatbox.css"
	rel="stylesheet" />
	<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.form.min.js"></script>
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/template/assets/css/google/app.min.css" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath }/template/assets/js/theme/google.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<script src="${pageContext.request.contextPath}/js/jquery.form.min.js"></script>
	<script type="text/javascript" charset="utf-8">
		sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
	</script>
	<script src="${pageContext.request.contextPath}/js/common/contextPath.js"></script>	
	
<style>
.VirtualView {
		width: 200px;
		height: 700px;
 		overflow: hidden;
		position: relative;
		float: right;
	}

	.hideMenuBody {
		width: 200px;
		height: 100%;
		background-color: white;
 		padding-top: 20px; 
		transition: transform 600ms;
		transform: translate(-200px, 0px);

		-ms-transition: -ms-transform 600ms;
		-webkit-transition: -webkit-transform 600ms;
		-moz-transition: -moz-transform 600ms;
		-o-transition: -o-transform 600ms;

		-ms-transform: translate(-200px, 0px);
		-webkit-transform: translate(-200px, 0px);
		-moz-transform: translate(-200px, 0px);
		-o-transform: translate(-200px, 0px);
	}

	#invitelist {
/* 		width: 150px; */
		height: 30px;
		line-height: 30px;
		vertical-align: middle;
/* 		text-align: center; */
		color: black;
		cursor: pointer;
		margin-bottom: 5px;
 		/* box-shadow: 1px 1px 0px #ffffff; */ 
	}

	#invitelist:hover {
		
	}

</style>





<body>
	<div class="messaging">
		<!-- 	 이거 일단 넣음 -->
		<div class="VirtualView" style="background-color: #f8f8f8">
			<div class="hideMenuBody " id="hideMenuBodyId" style="background-color: #f8f8f8">
			<i class="fas fa-sm fa-fw m-r-10 fa-user-plus" style="color: #f8f8f8"></i>
				<span style="width: 30px; margin-left: 180px;"
					onclick="closeLeftMenu(); return false;">
					<i style="float: right" class="fas fa-lg fa-fw m-r-10 fa-window-close"></i>
				</span>
				<input style="border: 1px; text-align:center;" class="m-t-20 m-l-10" type="text" placeholder="방이름을 입력하세요 " name="roomnm">
				<button class="btn btn-white m-t-20 m-r-10 width-100 pull-right" onclick="roomcreate();">방만들기</button>
				<div id="invitelist" style="border:none; text-align:center;">
				</div>
			</div>
				
			<div class="circleBt" id="circleBt"
				onclick="showLeftMenu(this); return false;">
				<div style="margin-top: 13px;"></div>
				<div></div><div></div>
			</div>
		</div>
		<!-- 여기까지 -->
		
		<div class="inbox_people">

			<div class="headind_srch">
				<div class="recent_heading">
					<h4>메신저</h4>
				</div>
				<div class="srch_bar">
					<form id="searchForm" class="input-group"
						action="${pageContext.request.contextPath }/chat">
						<input type="hidden" id="searchval" name="searchvalue" value="1">
						<input class="col-5 bg-none" type="text" placeholder="search" name="searchWord">
						<button class="input-group-addon">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
						<div class="pull-right">
							<button id="invite" class="btn" onclick="showLeftMenu(this); return false;">
								<i class="fas fa-lg fa-fw m-r-10 fa-user-plus"></i>
							</button>
						</div>
					</form>
				</div>
				<button id="friend" class="btn" style="float: left">
					<i class="fas fa-user-circle  fa-2x"></i>
				</button>
				<button id="chat" class="btn"  style="float: left">
					<i class="fas fa-comments  fa-2x"></i>
				</button>
				<button class="btn" style="float: left">
					<i class="fas fa-cog  fa-2x"></i>
				</button>
			</div>

			<div id="chatlist" class="inbox_chat">
				<c:set value="${chatlist }" var="chatList" />
				<c:choose>
					<c:when test="${not empty chatList }">
						<c:forEach var="friend" items="${chatList}">
							<div class="chat_list">
								<div class="chat_people">
									<div class="chat_img">
										<img src="data:image/*;base64,${friend.mem_imgBase64}"
											alt="sunil">
									</div>
									<div class="chat_ib">
										<h5 style="display:none;" class="emp_no">${friend.empno}</h5>
										<h5 class="chat_nm">${friend.empnm}${friend.ranknm}</h5>
										<p>${friend.deptnm }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>



</body>








<script type="text/javascript">
let listTable = $("#chatlist");

function roomcreate() {
	var chatnm = $('input[name=roomnm]').val();
	console.log($("#invitelist").children());
	var invitelist = $("#invitelist").children();
	var list=new Array();
	var obj=new Object();
 	obj.chatnm = chatnm;
 	list.push(obj);
	
	for(var i=0; i<invitelist.length; i++){
		var obj2=new Object();
		var arr = invitelist[i].children;
		console.log(arr[0].innerHTML);
		obj2.empno= arr[0].innerHTML;
		list.push(obj2);
		
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath }/chat/chatcreate/",
		method : "post",
		dataType : "json",
		contentType : "application/json",
		data : JSON.stringify(list),
		success : function() {
			
		},
		error : function(errResp) {
			console.log(errResp);
		}
	});
	 var jsonData = JSON.stringify(list) ;
     alert('방이생성되었습니다') ;
     closeLeftMenu();
     
     
	
}

function showLeftMenu(){
	var circleBtObj = document.getElementById('circleBt');
	var leftMenuObj = document.getElementById('hideMenuBodyId');
	circleBtObj.style['display'] = "none";
	leftMenuObj.style['transform'] = "translate(0px, 0px)";
	
	leftMenuObj.style['msTransform'] = "translate(0px, 0px)";
	leftMenuObj.style['mozTransform'] = "translate(0px, 0px)";
	leftMenuObj.style['webkitTransform'] = "translate(0px, 0px)";
	leftMenuObj.style['oTransform'] = "translate(0px, 0px)";
}

function closeLeftMenu() {
	var circleBtObj = document.getElementById('circleBt');
	var leftMenuObj = document.getElementById('hideMenuBodyId');

	circleBtObj.style['display'] = "block";
	leftMenuObj.removeAttribute("style");
}


$(function(){
let url = this.action?this.action:location.href;

	let searchForm = $("#searchForm").ajaxForm({
		url : url, 
		dataType : "json",
		success : function(resp) {
			
			let searchId = $('#searchval').val();
			console.log(resp);
			listTable.empty();
			let list = resp;
			let trTags = [];
			
			if(list.length>0){
				
				for(var i=0; i<list.length;i++ ){
					if(searchId==1 ||searchId==null){
						trTags.push(
							$("<div class='chat_list'>").append( 
									$("<div class='chat_people'>").append(
											$("<div class='chat_img'>").append(
								$("<img>").attr("src", "data:image/*;base64,"+list[i].mem_imgBase64)
								),
								$("<div class='chat_ib'>").append(
										$("<h5 style='display:none' class='emp_no'>").text(
												 list[i].empno), 
									$("<h5 class='chat_nm'>").text(
											 list[i].empnm + list[i].ranknm), 
									$("<p>").text(
											list[i].deptnm)
			 						)
								) 
		 					)
						)		
					} 
				else if(searchId==2){
					trTags.push(
							$("<div class='chat_list'>").append( 
									$("<div class='chat_people'>").append(
											$("<div class='chat_img'>").append(
												$("<img>").attr("src", "https://ptetutorials.com/images/user-profile.png")
												),
												$("<div class='chat_ib'>").append(
													$("<h5>").text(
														 list[i].chatrmnm)
															.append(
																$("<span class='chat_date'>").text(list[i].chatrmcnt+"명")		
															)
												)
		 							),
		 						$("<input class='chat_no'>").attr("type", "hidden").val(list[i].chatrmno)
							)
					)
// 						<div class="chat_list">
// 		              <div class="chat_people">
// 		                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
// 		                <div class="chat_ib">
// 		                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
// 		                  <p>Test, which is a new approach to have all solutions 
// 		                    astrology under one roof.</p>
// 		                </div>
// 		              </div>
// 		            </div>
				}
			} 
		}else {
			trTags.push($("<tr>").html($("<td colspan='5'>").text("검색되지 않음.")));
		}
			listTable.html(trTags);
		},
		error : function(errResp) {
		}
	}
	);
	
	$("#friend").click(function() {
		$("#searchval").val('1');
		$("input[name=searchWord]").val('');
		searchForm.submit();
		});
	
	$("#chat").click(function() {
		$("#searchval").val('2');
		$("input[name=searchWord]").val('');
		searchForm.submit();
	});
	
	$("#chatlist").on("dblclick",".chat_list", function() {
		
		let searchId = $('#searchval').val();
		if(searchId==1 ||searchId==null){
			let chatdiv = $(this).children().children();
			let chatnmdiv = null;
			$.each(chatdiv, function(idx) {
				let isChatNm = $(chatdiv[idx]).hasClass("chat_ib");
				chatnmdiv = chatdiv[idx];
			})
			console.log(chatnmdiv);
			
			let chatnm = $(chatnmdiv).children('.chat_nm').text();
			let empno = $(chatnmdiv).children('.emp_no').text();
			
			console.log(chatnm);
			console.log(empno);
			
			$("#invitelist").append(
					$("<div id='chatnm'>").text(chatnm).append(
							$("<div style='display:none;'>").text(empno)
							)
			);
		}
		else if(searchId==2 ){
			let chatno = $(this).children('.chat_no').val();
			openWindowPop(chatno);
		}
	});
	
	$("#chatlist").on("hover",".chat_list", function() {
		$(this).attr('class', 'chat_list active_chat');
	});
	
	
	$("#invitelist").on("dblclick","#chatnm", function() {
		
		console.log($(this).text());
		$(this).remove();
	});

	function openWindowPop(chatno){
		var pop2 = window.open(
				"${pageContext.request.contextPath }/chat/chatview/"+ chatno,
				"pop2",
				"width=570,height=700, left=690, top=240, scrollbars=no, resizable=yes");
	};

	


	

	
	
	
	

// 	$(document).on('mousedown', function() {
// 		 console.log("ha")
// 		});
	
// 	$(document).bind("contextmenu", function(event) { 
// 	    event.preventDefault();
// 	    console.log('ha')
// 	    $("<li class='custom-menu'>")
// 	        .appendTo("body")
// 	        .css({top: event.pageY + "px", left: event.pageX + "px"});
// 	}).bind("click", function(event) {
// 	    $("li.custom-menu").hide();
// 	});

})
</script>