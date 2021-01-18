<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 26.      이지윤      최초작성
* 2020. 10. 27.      정재은      내용작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="kr.or.ddit.vo.EmpVO"%>
<%@page import="kr.or.ddit.vo.CalendarDetailVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.CalendarVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.emp" var="emp"/>

<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath }/template/assets/js/demo/form-plugins.demo.js"></script>
<link href="${pageContext.request.contextPath }/template/assets/css/approval/appr.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" />

<!-- 기본 라이브러리 -->
<link href='${pageContext.request.contextPath }/js/cal/core/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/js/cal/daygrid/main.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath }/js/cal/fullcalendar.min.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath }/js/cal/core/main.js'></script>
<script src='${pageContext.request.contextPath }/js/cal/interaction/main.js'></script>
<script src='${pageContext.request.contextPath }/js/cal/daygrid/main.js'></script>
<script src='${pageContext.request.contextPath }/js/cal/timegrid/main.js'></script>
<script src='${pageContext.request.contextPath }/js/cal/core/locales-all.js'></script>
<script src='${pageContext.request.contextPath }/js/cal/moment.min.js'></script>
<%-- <script src='${pageContext.request.contextPath }/js/cal/gcal.js'></script> --%>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			
			// interaction : 기본 달력 그리기
			// dayGrid : 클릭, 드래그, 이벤트 감지 등
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			locale : 'ko', // 한글 표기 설정
			
			// ToolBar
			header : {
				left : 'prevYear,prev,next,nextYear', // today는 버튼
				center : 'title',
				right : 'today,dayGridMonth,dayGridWeek,timeGridDay', 
			},
			
			buttonText : { 
				today : '오늘',
				dayGridMonth : '월별',
				dayGridWeek : '주별', 
				timeGridDay : '일별'
			},
			
			navLinks : true, // 숫자를 선택했을 때 그 날짜에 해당하는 세부 스케줄로 넘어가는 기능
			editable : true, // 편집 여부 결정(길이 조절로 편집), interaction 플러그인 사용
			eventLimit : true, // 하루에 표시되는 이벤트 개수
// 			timezone : "local",

			events : 
				[ 
 				<%
 				List<CalendarVO> list = (ArrayList<CalendarVO>)request.getAttribute("cal");
 				CalendarVO cal = new CalendarVO();
 					for(int i = 0; i < list.size(); i++){
 						cal = (CalendarVO)list.get(i);
 						System.out.println("id = " + list.get(i).getSchedetailtype());
 						
//  						String id = list.get(i).getSchedetailtype();
//  						if(id == "영업활동"){
 				%>
					
				{
 					id : '<%=cal.getSchedetailno() %>', 
 					title : '<%=cal.getSchedetailnm() %>', 
 					start : '<%=cal.getStartdate() %>', 
 					end : '<%=cal.getEnddate() %>',
					color : '#ffa94d'
 				},
				
				
 				<%
//  						}
 					}
 				%>
				], 
				
				// 일정 클릭 시 모달창으로 정보 띄워주기
				eventClick : function(event){
					console.log(event.event.id);
					
					let schedetailno = event.event.id;
				 	let data = {
				 			schedetailno : schedetailno 
				 	};
					
					$.ajax({
						url : '${pageContext.request.contextPath }/cal/calFormList',
						method : 'get',
						data : data,
						dataType : 'json',
						success : function(resp) {
							let divTags = [];
							
							divTags.push(
								$("<input type='hidden' name='what' value='${calFormView.schedetailno}'>"),
								$("<div id='date'>").text(resp.startdate + " ~ " + resp.enddate),
								$("<hr>"),
								$("<div>").append(
									$("<span class='text-blue'>").text("["),
									$("<span class='text-blue'>").text(resp.schedetailtype),
									$("<span class='text-blue'>").text("] "),
									$("<span>").text(resp.schedetailnm)
								),
								$("<hr>"),
								$("<div>").append(
									$("<span class='text-red'>").text("[등록자] "),
									$("<span>").text(resp.empnm)
								),
								$("<div>").append(
										$("<span class='text-red'>").text(" [장소] "),
										$("<span>").text(resp.schedetailplace)
									),
								$("<hr>"),
								$("<div>").append(
									$("<span class='text-red'>").text("[참여자] "),
									$("<span>").text(resp.empnm)
								),
								$("<hr>"),
								$("<div>").append(
									$("<span class='text-red'>").text("[파일첨부] "),
									$("<span>").text("파일")
								)
							);
							
							$(".modal-body").html(divTags);
							$("#scheduleDetail").modal();
						},
						error : function(errResp) {
							console.log(errResp);
						}
					});
					return false;
				}
			});
		calendar.render();
		
	});
	
</script>

<script>
	$(function(){
		$("#taskCalImg").on("click", function(){
			alert("업무관리와 연계되는 일정입니다.\n업무관리에서 설정한 마감일에 맞춰 일정이 등록됩니다.")
		});
		
		$("#deptCalImg").on("click", function(){
			alert("등록자가 소속된 부서의 일정입니다.\n일정 등록 시 부서 일정을 체크하면 등록할 수 있습니다.")
		});
		
		$("#companyCalImg").on("click", function(){
			alert("회사 구성원 전체의 일정입니다.\n일정 등록 시 회사일정을 체크하면 등록할 수 있습니다.\n회사일정은 일정 관리자만 등록할 수 있습니다. 권한이 없을 경우 회사관리자에게 요청하세요.")
		});
	});
</script>

<style>
	.fc .fc-view-container .fc-head .fc-head-container .fc-widget-header {
		background-color : black;
	}
	
	#taskImg {
		cursor: pointer;
	}
	
	.popupLayer {
		position: absolute;
		display: none;
		background-color: #ffffff;
		border: solid 2px #d0d0d0;
		width: 350px;
		height: 150px;
		padding: 10px;
	}
	.popupLayer div {
		position: absolute;
		top: 5px;
		right: 5px
	}
</style>

<!-- <div class="header" > -->
	<a href="" style="text-decoration:none;" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		<img style="width:34px; height:34px; border-radius:70px;" src="${pageContext.request.contextPath }/template/assets/img/my/cat.jpg" 
		 alt="" /> 
		<span class="d-none d-md-inline" style="color:black;">나의 일정</span>
		<b style="color:black" class="caret"></b>
		<span>&nbsp;&nbsp;&nbsp;</span>
	</a>
	
	<div class="dropdown-menu dropdown-menu-left">
		<a href="javascript:;" class="dropdown-item">나의 일정<span class="badge badge-danger pull-right">2</span></a>
		<div class="dropdown-divider"></div>
		<a href="javascript:;" class="dropdown-item">조직도 트리</a>
		<div class="dropdown-divider"></div>
		<a href="javascript:;" class="dropdown-item">회사 일정</a>
	</div>
	
	<button type="button" value="일정 등록" class="btn btn-white btn-primary"
		onclick="location.href='${pageContext.request.contextPath }/cal/calRegistForm'">일정 등록</button>
<!-- 	<button type="button" value="회사 일정 등록" class="btn btn-white btn-primary">회사 일정 등록</button> -->
	
	<div class="pull-right mt-3">
		<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="업무 일정"><span>&nbsp;업무 일정</span></label>
		<a style="border:none; background:none;">
			<img id="taskCalImg" class="mb-1" style="width:17px; height:17px; border-radius:70px;"
			 src="${pageContext.request.contextPath }/template/assets/img/my/questionMark.PNG" alt="Help" />
		</a>
	</div>
		
	<div class="pull-right mt-3">
		<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="부서 일정"><span>&nbsp;부서 일정</span></label>
		<a style="border:none; background:none;">
			<img id="deptCalImg" class="mb-1" style="width:17px; height:17px; border-radius:70px;"
			 src="${pageContext.request.contextPath }/template/assets/img/my/questionMark.PNG" alt="Help" />
		</a>
	</div>
		
	<div class="pull-right mt-3">
		<label>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="회사 일정"><span>&nbsp;회사 일정</span></label>
		<a style="border:none; background:none;">
			<img id="companyCalImg" class="mb-1" style="width:17px; height:17px; border-radius:70px;"
			 src="${pageContext.request.contextPath }/template/assets/img/my/questionMark.PNG" alt="Help" />
		</a>
	</div>
	
<script>
	
</script>

<!-- </div> -->
<hr>
<div id='calendar'></div>

<!-- #modal-dialog -->
<!-- 일정modal -->
<div class="modal fade" id="scheduleDetail" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title"><span id="whoArea"></span>일정 조회</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body">
			</div>
			<div class="modal-footer">
				<a href="${pageContext.request.contextPath }/cal/<%=cal.getSchedetailno() %>" class="btn btn-white">상세정보</a>
				<%-- <a href="${pageContext.request.contextPath }/cal/calRegistForm?what=<%=cal.getSchedetailno() %>" 
				class="btn btn-white">수정</a> --%>
				<input type="submit" value="수정" class="btn btn-white" id="scheUpdate">
				<button type="button" class="btn btn-gray" id="scheDelete">삭제</button>
				<button type="button" class="btn btn-gray" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<form id="calUpdateForm" action="${pageContext.request.contextPath }/cal/calUpdate">
	<input type="hidden" name="what" required value="${calFormView.schedetailno }" />
</form>
	
<script type="text/javascript">
	let calUpdateForm = $("#calUpdateForm");
	$("#scheUpdate").on("click", function(){
		calUpdateForm.submit();
	});
</script>

<script>
$('#scheduleDetail').appendTo("body");
</script>
