<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 21.      이지윤      최초작성
* 2020. 11. 03.		  정재은	 내용추가
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.emp" var="emp"/>

<script type="text/javascript">
	$(function(){
		var uri = $(location).attr('href');
		$("#sidebar a").each(function(index, a){
			let auri = $(this).attr('href');
			let mainMenu = $(this).attr('href').split('/')[2]; //최상위 메뉴
			if(uri.indexOf(auri) != -1){
				mainMenu = $("li[data-mainmenu='" +mainMenu+ "']");
				let parents = $(this).parent().addClass("active"); //액티브
				
				while (mainMenu != null) {
					parents = $(parents).parent();
					if(parents.hasClass("has-sub") == true){
						$(parents).addClass("expand");
					}else if(parents.hasClass("sub-menu") == true){
						$(parents).css("display","block");
					}
					let data = parents[0].dataset['mainmenu'];
					if(data != null && data == mainMenu)break;
				}
				return false;
			}
		})
	})
	
	
	function goChatPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window
				.open(
						"${pageContext.request.contextPath }/chat",
						"pop",
						"width=660, height=775, left=650, top=200, scrollbars=no, resizable=no");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
</script>
			<!-- begin sidebar user -->
			<ul class="nav">
				<li class="nav-profile">
					<a href="javascript:;" data-toggle="nav-profile">
						<div class="cover with-shadow"></div>
						<div class="image">
							<img style="width: 60px; height: 60px;" src="data:image/*;base64,${emp.mem_imgBase64}" alt="" />
						</div>
							<div class="info">
								${emp.empnm }
							</div>
						</a>
					</li>
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav"><li class="nav-header">메뉴</li>
					<li>
						<a href="${pageContext.request.contextPath }/groupChart">
							<i class="material-icons">people</i>
							<span>조직도</span>
						</a>
					</li>
<!-- 					<li data-mainmenu='addrBook' class="has-sub"> -->
<!-- 						<a href="javascript:;"> -->
<!-- 							<b class="caret"></b> -->
<!-- 							<i class="material-icons">call</i> -->
<!-- 							<span>주소록</span> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/addrBook/retreive">전체 주소록</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/addrBook/allGroupMgr">전체 주소록 관리</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/addrBook/private">개인 주소록</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/addrBook/groupMgr">개인 주소록 관리</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/addrBook/boomarkMgr">자주 연락하는 사람 관리</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<li data-mainmenu='attendance' class="has-sub">
						<a href="javascript:;">
							<b class="caret"></b>
							<i class="material-icons">access_alarm</i>
							<span>근태</span>
						</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/attendance/oneday">일일근태</a></li>
							<li><a href="${pageContext.request.contextPath }/attendance/state">근태현황</a></li>
						</ul>
					</li>
					<li data-mainmenu='approval' class="has-sub">
						<a href="javascript:;">
							<b class="caret"></b>
							<i class="material-icons">assignment_turned_in</i>
							<span>전자결재</span>
						</a>
						<ul class="sub-menu">
							<li class="has-sub">
								<a href="javascript:;"><b class="caret"></b>기안</a>
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/approval/work/apprWorkForm">기안문 작성</a></li>
									<li><a href="${pageContext.request.contextPath }/approval/work/apprMyRequest">결재 요청함</a></li>
									<li><a href="${pageContext.request.contextPath }/approval/work/apprTemp">임시 저장함</a></li>
								</ul>
							</li>
							<li class="has-sub">
								<a href="javascript:;"><b class="caret"></b>결재</a>
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/approval/work/apprTodo">결재 대기함</a></li>
									<li><a href="${pageContext.request.contextPath }/approval/work/apprProc">결재 진행함</a></li>
									<li><a href="${pageContext.request.contextPath }/approval/work/apprComplete">완료 문서함</a></li>
								</ul>
							</li>
							<li class="has-sub">
								<a href="javascript:;"><b class="caret"></b>발신/수신</a>
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/approval/work/apprDeptRec">부서 수신함</a></li>
<%-- 									<li><a href="${pageContext.request.contextPath }/approval/work/apprDeptDes">재지정함</a></li> --%>
								</ul>
							</li>
							<li class="has-sub">
								<a href="javascript:;"><b class="caret"></b>문서함</a>
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/approval/work/apprReject">반려 문서함</a></li>
<%-- 									<li><a href="${pageContext.request.contextPath }/approval/work/apprDeptReject">반송 문서함</a></li> --%>
									<li><a href="${pageContext.request.contextPath }/approval/work/apprReference">참조 문서함</a></li>
								</ul>
							</li>
						</ul>						
					</li>
					<li data-mainmenu='board' class="has-sub">
						<a href="javascript:;">
							<b class="caret"></b>
							<i class="material-icons">article</i>
							<span>게시판</span>
						</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/board/noticeRead">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/board/totalRead">전체 게시판</a></li>
							<li><a href="${pageContext.request.contextPath }/board/deptRead">부서 게시판</a></li>
						</ul>
					</li>
<!-- 					<li data-mainmenu='vote' class="has-sub"> -->
<!-- 						<a href="javascript:;"> -->
<!-- 						 	<b class="caret"></b> -->
<!-- 							<i class="material-icons">how_to_vote</i> -->
<!-- 							<span>투표</span> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/vote/roulette">룰렛</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/vote/ladder">사다리 타기</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
<!-- 					<li data-mainmenu='mail'> -->
<!-- 						<a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3a%2f%2fmail.google.com%2f&access_type=offline&include_granted_scopes=true&response_type=code&state=state_parameter_passthrough_value&redirect_uri=http%3a%2f%2flocalhost%2fofficeKok%2fmail%2freceive%2ftoken&client_id=194180887465-ctas4fs561j9d2kuok9fg98ttjtcte1c.apps.googleusercontent.com"> -->
<!-- 							<span class="badge pull-right">10</span> 알림 디자인-->
<!-- 							<i class="material-icons">email</i> -->
<!-- 							<span>Email</span> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/mail/regist">메일쓰기</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/mail/regist/toMe">내게쓰기</a></li> --%>
<!-- 							<li class="has-sub"> -->
<!-- 								<a href="javascript:;"> -->
<!-- 								<b class="caret"></b> -->
<!-- 									<span>기본 메일함</span> -->
<!-- 								</a> -->
<!-- 								<ul class="sub-menu"> -->
<!-- 									<li><a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3a%2f%2fmail.google.com%2f&access_type=offline&include_granted_scopes=true&response_type=code&state=state_parameter_passthrough_value&redirect_uri=http%3a%2f%2flocalhost%2fofficeKok%2fmail%2freceive%2ftoken&client_id=194180887465-ctas4fs561j9d2kuok9fg98ttjtcte1c.apps.googleusercontent.com">받은 메일함</a></li> -->
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/my">내게쓴 메일함</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/send">보낸 메일함</a></li> --%>
<!-- 									<li style=display:inline-block;> -->
<%-- 										<a style=display:inline-block; href="${pageContext.request.contextPath }/mail/spam">스팸 메일함</a> --%>
<!-- 										<div style=float:right;padding-top:3px;padding-left:18px;> -->
<%-- 											<img onclick="location.href='${pageContext.request.contextPath }/login'" style=width:14px;height:14px;cursor:pointer; title="스팸메일함 비우기" src="${pageContext.request.contextPath }/template/assets/img/my/delete.png" alt="delete"> --%>
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 									<li style=display:inline-block;> -->
<%-- 										<a style=display:inline-block; href="${pageContext.request.contextPath }/mail/garbage">휴지통</a> --%>
<!-- 										<div style=float:right;padding-top:3px;padding-left:48px;> -->
<%-- 											<img onclick="location.href='${pageContext.request.contextPath }/login'" style=width:14px;height:14px;cursor:pointer; title="휴지통 비우기" src="${pageContext.request.contextPath }/template/assets/img/my/delete.png" alt="delete"> --%>
<!-- 										</div> -->
<!-- 									</li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/mail/private">개인 메일함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/mail/temp">임시 보관함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/mail/mgr">메일함 관리</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/mail/setting">환경설정</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<li data-mainmenu='note' class="has-sub">
						<a href="javascript:;">
							<b class="caret"></b>
							<i class="material-icons">send</i>
							<span>쪽지</span>
						</a>
						<ul class="sub-menu">
<%-- 							<li><a href="${pageContext.request.contextPath }/note/form">쪽지 작성</a></li> --%>
							<li><a href="${pageContext.request.contextPath }/note/receive">받은 쪽지함</a></li>
							<li><a href="${pageContext.request.contextPath }/note/send">보낸 쪽지함</a></li>
							<li><a href="${pageContext.request.contextPath }/note/temp">임시 보관함</a></li>
<%-- 							<li><a href="${pageContext.request.contextPath }/note/store">개인 보관함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/note/folder">개인 보관함 관리</a></li> --%>
							<li><a href="${pageContext.request.contextPath }/note/trash">휴지통</a></li>
						</ul>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/cal">
							<i class="material-icons">date_range</i> 
							<span>일정</span>
						</a>
					</li>
<!-- 					<li data-mainmenu='drive' class="has-sub"> -->
<!-- 						<a href="javascript:;"> -->
<!-- 							<b class="caret"></b> -->
<!-- 							<i class="material-icons">cloud</i>  -->
<!-- 							<span>드라이브</span> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/personal">개인 폴더함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/dept">부서 폴더함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/share">공유 폴더함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/trash">휴지통</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<li>
						<a onClick="goChatPopup();">
							<i class="material-icons">chat</i> 
							<span>메신저</span>
						</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath }/conference/main">
							<i class="material-icons">laptop_mac</i> 
							<span>화상회의</span>
						</a>
					</li>
					<li>
						<a href="https://webchat.botframework.com/embed/hikokBot?s=lV9mtetbaDo.IW1c5rTACehe8W8BYEYGEkD0pBrRITEEoR68UUeZ-KA" onclick="window.open(this.href, '챗봇', 'width=400, height=500, top=200, left=700'); return false;">
							<i class="material-icons">android</i> 
							<span>챗봇</span>
						</a>
					</li>
<!-- 					<li class="has-sub"> -->
<!-- 					<a href="javascript:;"> -->
<!-- 							<b class="caret"></b> -->
<!-- 							<i class="material-icons">info</i>  -->
<!-- 							<span>관리</span> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<!-- 							<li class="has-sub"> -->
<!-- 								<a href="javascript:;"><b class="caret"></b>구성원 관리</a> -->
<!-- 								<ul class="sub-menu"> -->
<%-- 									<li><a href="${pageContext.request.contextPath }/emp/retrieve">구성원 조회</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mgr">이메일 계정 관리</a></li> --%>
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li><a href="javascript:;">회사 정보 관리</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->
					<li class="has-sub">
						<a href="javascript:;">
							<i class="material-icons">help1</i>
							<span>고객센터</span>
						</a>
					</li>
				</ul>
				<!-- end sidebar nav -->			
		