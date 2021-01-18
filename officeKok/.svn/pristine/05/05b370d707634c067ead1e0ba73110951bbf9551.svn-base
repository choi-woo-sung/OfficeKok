<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 21.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.marginli{
		margin-right: 55px;
	}
</style>
			<!-- begin nav -->
			<ul class="nav">
				<!-- 조직도 start -->
				<li class="has-sub f-s-15 marginli" style="margin-left: 55px;">
				<a href="${pageContext.request.contextPath }/groupChart">
						<i class="material-icons">people</i> 
						<span>조직도</span>
					</a>
				</li>
				<!-- 조직도 end-->
				<!-- 주소록 start -->
<!-- 				<li class="has-sub"> -->
<!-- 				<a href="javascript:;"> -->
<!-- 						<i class="material-icons">call</i>  -->
<!-- 						<span>주소록</span> -->
<!-- 						<b class="caret"></b> -->
<!-- 					</a> -->
<!-- 					<ul class="sub-menu"> -->
<%-- 						<li><a href="${pageContext.request.contextPath }/addrBook/retreive">전체 주소록</a></li> --%>
<%-- 						<li><a href="${pageContext.request.contextPath }/addrBook/allGroupMgr">전체 주소록 관리</a></li> --%>
<%-- 						<li><a href="${pageContext.request.contextPath }/addrBook/private">개인 주소록</a></li> --%>
<%-- 						<li><a href="${pageContext.request.contextPath }/addrBook/groupMgr">개인 주소록 관리</a></li> --%>
<%-- 						<li><a href="${pageContext.request.contextPath }/addrBook/boomarkMgr">자주 연락하는 사람 관리</a></li> --%>
<!-- 					</ul> -->
<!-- 				</li> -->
				<!-- 주소록 end-->
				<!-- 근태 start -->
				<li class="has-sub f-s-15 marginli">
				<a href="javascript:;">
						<i class="material-icons">access_alarm</i> 
						<span>근태</span>
						<b class="caret"></b>
					</a>
					<ul class="sub-menu">
						<li><a href="${pageContext.request.contextPath }/attendance/oneday">일일근태</a></li>
						<li><a href="${pageContext.request.contextPath }/attendance/state">근태현황</a></li>
					</ul>
				</li>
				<!-- 근태관리 end -->
				<!-- 전자결재 메뉴 start -->
				<li class="has-sub f-s-15 marginli">					
					<a href="javascript:;">
						<i class="material-icons">assignment_turned_in</i>
						<span>전자결재</span>
						<b class="caret"></b>
					</a>
					<ul class="sub-menu">
						<li class="has-sub">
							<a href="javascript:;">
								기안
								<b class="caret"></b>
							</a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath }/approval/work/apprWorkForm">기안문 작성</a></li>
								<li><a href="${pageContext.request.contextPath }/approval/work/apprMyRequest">결재 요청함</a></li>
								<li><a href="${pageContext.request.contextPath }/approval/work/apprTemp">임시 저장함</a></li>
							</ul>
						</li>
						<li class="has-sub">
							<a href="javascript:;">
								결재
								<b class="caret"></b>
							</a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath }/approval/work/apprTodo">결재 대기함</a></li>
								<li><a href="${pageContext.request.contextPath }/approval/work/apprProc">결재 진행함</a></li>
								<li><a href="${pageContext.request.contextPath }/approval/work/apprComplete">완료 문서함</a></li>
							</ul>
						</li>
						<li class="has-sub">
							<a href="javascript:;">
								발신/수신
								<b class="caret"></b>
							</a>
							<ul class="sub-menu">
								<li><a href="${pageContext.request.contextPath }/approval/work/apprDeptRec">부서 수신함</a></li>
<%-- 								<li><a href="${pageContext.request.contextPath }/approval/work/apprDeptDes">재지정함</a></li> --%>
							</ul>
						</li>
						<li class="has-sub">
							<a href="javascript:;">
								문서함
								<b class="caret"></b>
							</a>
								<ul class="sub-menu">
									<li><a href="${pageContext.request.contextPath }/approval/work/apprReject">반려 문서함</a></li>
<%-- 									<li><a href="${pageContext.request.contextPath }/approval/work/apprDeptReject">반송 문서함</a></li> --%>
									<li><a href="${pageContext.request.contextPath }/approval/work/apprReference">참조 문서함</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<!-- 전자결재 메뉴 end -->
					<!--  게시판 메뉴 start -->
					<li class="has-sub f-s-15 marginli">
					<a href="javascript:;">
						<i class="material-icons">article</i>
						<span>게시판</span>
						<b class="caret"></b>
					</a>
					<ul class="sub-menu">
						<li><a href="${pageContext.request.contextPath }/board/noticeRead">공지사항</a></li>
						<li><a href="${pageContext.request.contextPath }/board/totalRead">전체 게시판</a></li>
						<li><a href="${pageContext.request.contextPath }/board/deptRead">부서 게시판</a></li>
					</ul>
					</li>
					<!--  게시판 메뉴 end -->
					<!-- 투표 start -->
<!-- 					<li class="has-sub"> -->
<!-- 					<a href="javascript:;"> -->
<!-- 							<i class="material-icons">how_to_vote</i>  -->
<!-- 							<span>투표</span> -->
<!-- 							<b class="caret"></b> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/vote/roulette">룰렛</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/vote/ladder">사다리 타기</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<!-- 투표 end -->
					<!-- email start -->
<!-- 					<li> -->
<!-- 						<a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3a%2f%2fmail.google.com%2f&access_type=offline&include_granted_scopes=true&response_type=code&state=state_parameter_passthrough_value&redirect_uri=http%3a%2f%2flocalhost%2fofficeKok%2fmail%2freceive%2ftoken&client_id=194180887465-ctas4fs561j9d2kuok9fg98ttjtcte1c.apps.googleusercontent.com"> -->
<!-- 							<i class="material-icons">email</i> -->
<!-- 							<span>Email</span> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<!-- 							<li class="has-sub"> -->
<%-- 							<a href="${pageContext.request.contextPath }/mail/regist">메일쓰기</a></li> --%>
<%-- 							<li class="has-sub"><a href="${pageContext.request.contextPath }/mail/regist/toMe">내게쓰기</a></li> --%>
<!-- 							<li class="has-sub"> -->
<!-- 								<a href="javascript:;"> -->
<!-- 									기본 메일함 -->
<!-- 									<b class="caret"></b> -->
<!-- 								</a> -->
<!-- 								<ul class="sub-menu"> -->
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/receive">받은 메일함</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/my">내게쓴 메일함</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/send">보낸 메일함</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/spam">스팸 메일함</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mail/garbage">휴지통</a></li> --%>
<!-- 								</ul> -->
<!-- 							</li> -->
<%-- 							<li class="has-sub"><a href="${pageContext.request.contextPath }/mail/private">개인 메일함</a></li> --%>
<%-- 							<li class="has-sub"><a href="${pageContext.request.contextPath }/mail/temp">임시 보관함</a></li> --%>
<%-- 							<li class="has-sub"><a href="${pageContext.request.contextPath }/mail/mgr">메일함 관리</a></li> --%>
<%-- 							<li class="has-sub"><a href="${pageContext.request.contextPath }/mail/setting">환경설정</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<!-- email end -->
					<!-- 쪽지 start -->
					<li class="has-sub f-s-15 marginli">
					<a href="javascript:;">
							<i class="material-icons">send</i> 
							<span>쪽지</span>
							<b class="caret"></b>
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
					<!-- 쪽지 end -->
					<!-- 캘린더 start -->
					<li class="has-sub f-s-15 marginli">
					<a href="${pageContext.request.contextPath }/cal">
							<i class="material-icons">date_range</i> 
							<span>일정</span>
						</a>
					</li>
					<!-- 캘린더 end -->
					<!-- 드라이브 start -->
<!-- 					<li class="has-sub"> -->
<!-- 					<a href="javascript:;"> -->
<!-- 							<i class="material-icons">cloud</i>  -->
<!-- 							<span>드라이브</span> -->
<!-- 							<b class="caret"></b> -->
<!-- 						</a> -->
<!-- 						<ul class="sub-menu"> -->
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/personal">개인 폴더함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/dept">부서 폴더함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/share">공유 폴더함</a></li> --%>
<%-- 							<li><a href="${pageContext.request.contextPath }/drive/trash">휴지통</a></li> --%>
<!-- 						</ul> -->
<!-- 					</li> -->
					<!-- 드라이브 end -->
					<!-- 채팅 start -->
					<li class="has-sub f-s-15 marginli">
					<a href="${pageContext.request.contextPath }/chat">
							<i class="material-icons">chat</i> 
							<span>메신저</span>
						</a>
					</li>
					<!-- 채팅 end -->
					<!-- 화상채팅 start -->
					<li class="has-sub f-s-15 marginli">
					<a href="${pageContext.request.contextPath }/conference/main">
							<i class="material-icons">laptop_mac</i> 
							<span>화상회의</span>
						</a>
					</li>
					<!-- 화상채팅 end -->
					<!-- 관리 start - 권한자 메뉴 -->
					<li class="has-sub f-s-15 marginli">
					<a href="javascript:;">
							<i class="material-icons">help1</i> 
							<span>고객센터</span>
						</a>
<!-- 						<ul class="sub-menu"> -->
<!-- 							<li class="has-sub"> -->
<!-- 								<a href="javascript:;">구성원 관리 -->
<!-- 									<b class="caret"></b> -->
<!-- 								</a> -->
<!-- 								<ul class="sub-menu"> -->
<%-- 									<li><a href="${pageContext.request.contextPath }/emp/retrieve">구성원 조회</a></li> --%>
<%-- 									<li><a href="${pageContext.request.contextPath }/mgr">이메일 계정 관리</a></li> --%>
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li><a href="javascript:;">회사 정보</a></li> -->
<!-- 						</ul> -->
					</li>
					<!-- 관리 end -->
				
				<li class="menu-control menu-control-left">
					<a href="javascript:;" data-click="prev-menu"><i class="fa fa-angle-left"></i></a>
				</li>
				<li class="menu-control menu-control-right">
					<a href="javascript:;" data-click="next-menu"><i class="fa fa-angle-right"></i></a>
				</li>
			</ul>
			<!-- end nav -->


<script>
    toastr.options = {
    		  "closeButton": false,
    		  "debug": false,
    		  "newestOnTop": false,
    		  "progressBar": false,
    		  "positionClass": "toast-bottom-right",
    		  "preventDuplicates": false,
    		  "showDuration": "60000",
    		  "hideDuration": "1000",
    		  "timeOut": "60000",
    		  "extendedTimeOut": "1000",
    		  "showEasing": "swing",
    		  "hideEasing": "linear",
    		  "showMethod": "fadeIn",
    		  "hideMethod": "fadeOut"
    		}
    </script>