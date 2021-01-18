<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 26.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- begin vertical-box -->
<div class="vertical-box with-grid inbox ">
	<!-- begin vertical-box-column -->
	<div class="vertical-box-column width-200">
		<!-- begin vertical-box -->
		<div class="vertical-box">
			<!-- begin wrapper -->
			<div class="wrapper">
				<div class="d-flex align-items-center justify-content-center">
					<a href="#emailNav" data-toggle="collapse" class="btn btn-inverse btn-sm mr-auto d-block d-lg-none"> 
						<i class="fa fa-cog"></i>
					</a> 
					<a href="email_compose.html" class="btn btn-inverse mr-2 btn-sm"> 
						메일 쓰기 
					</a>
					<a href="email_compose.html" class="btn btn-inverse btn-sm"> 
						내게 쓰기 
					</a>
				</div>
			</div>
			<!-- end wrapper -->
			<!-- begin vertical-box-row -->
			<div class="vertical-box-row collapse d-lg-table-row" id="emailNav">
				<!-- begin vertical-box-cell -->
				<div class="vertical-box-cell">
					<!-- begin vertical-box-inner-cell -->
					<div class="vertical-box-inner-cell">
						<!-- begin scrollbar -->
						<div data-scrollbar="true" data-height="100%">
							<!-- begin wrapper -->
							<div class="wrapper p-0">
								<div class="nav-title">
									<b>전체 메일함</b>
								</div>
								<ul class="nav nav-inbox">
									<li class="active">
										<a href="email_inbox.html">
											<i class="fa fa-inbox fa-fw m-r-5"></i> 
												받은 메일함 
											<span class="badge pull-right">52</span>
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-flag fa-fw m-r-5"></i> 
											내게쓴 메일함
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-envelope fa-fw m-r-5"></i> 
											보낸 메일함
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-pencil-alt fa-fw m-r-5"></i>
											스팸 메일함
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-trash fa-fw m-r-5"></i> 
											휴지통
										</a>
									</li>
								</ul>
								<div class="nav-title">
									<b>개인 메일함</b>
								</div>
								<ul class="nav nav-inbox">
									<li class="active">
										<a href="email_inbox.html">
											<i class="fa fa-inbox fa-fw m-r-5"></i> 
												Inbox 
											<span class="badge pull-right">52</span>
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-flag fa-fw m-r-5"></i> 
											Important
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-envelope fa-fw m-r-5"></i> Sent
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-pencil-alt fa-fw m-r-5"></i> Drafts
										</a>
									</li>
									<li>
										<a href="email_inbox.html">
											<i class="fa fa-trash fa-fw m-r-5"></i> Trash
										</a>
									</li>
								</ul>
							</div>
							<!-- end wrapper -->
						</div>
						<!-- end scrollbar -->
					</div>
					<!-- end vertical-box-inner-cell -->
				</div>
				<!-- end vertical-box-cell -->
			</div>
			<!-- end vertical-box-row -->
		</div>
		<!-- end vertical-box -->
	</div>
	<!-- end vertical-box-column -->
	
	<!-- begin vertical-box-column -->
	<div class="vertical-box-column">
		<!-- begin vertical-box -->
		<div class="vertical-box">
			<!-- begin wrapper -->
			<div class="wrapper">
				<!-- begin btn-toolbar -->
				<h4 class="page-header">받은 메일함</h4>
				<div class="btn-toolbar align-items-center">
					<div class="custom-control custom-checkbox mr-2">
						<input type="checkbox" class="custom-control-input" data-checked="email-checkbox" 
							id="emailSelectAll" data-change="email-select-all" /> 
						<label class="custom-control-label" for="emailSelectAll"></label>
					</div>
					<div class="dropdown mr-2">
						<button class="btn btn-white btn-sm" data-toggle="dropdown">
							View All <span class="caret m-l-3"></span>
						</button>
						<div class="dropdown-menu">
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2"></i> 
								All
							</a> 
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2 text-muted"></i> 
								Unread
							</a> 
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2 text-blue"></i> 
								Contacts
							</a> 
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2 text-success"></i> 
								Groups
							</a> 
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2 text-warning"></i>
								Newsletters
							</a> 
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2 text-danger"></i> 
								Social updates
							</a> 
							<a href="javascript:;" class="dropdown-item">
								<i class="fa fa-circle f-s-9 fa-fw mr-2 text-indigo"></i>
								Everything else
							</a>
						</div>
					</div>
					<button class="btn btn-sm btn-white mr-2">
						<i class="fa fa-redo"></i>
					</button>
					<!-- begin btn-group -->
					<div class="btn-group">
						<button class="btn btn-sm btn-white hide" data-email-action="delete">
							<i class="fa fa-times mr-2"></i> 
							<span class="hidden-xs">Delete</span>
						</button>
						<button class="btn btn-sm btn-white hide" data-email-action="archive">
							<i class="fa fa-folder mr-2"></i> <span class="hidden-xs">Archive</span>
						</button>
						<button class="btn btn-sm btn-white hide" data-email-action="archive">
							<i class="fa fa-trash mr-2"></i> <span class="hidden-xs">Junk</span>
						</button>
					</div>
					<!-- end btn-group -->
					<!-- begin btn-group -->
					<div class="btn-group ml-auto">
						<button class="btn btn-white btn-sm">
							<i class="fa fa-chevron-left"></i>
						</button>
						<button class="btn btn-white btn-sm">
							<i class="fa fa-chevron-right"></i>
						</button>
					</div>
					<!-- end btn-group -->
				</div>
				<!-- end btn-toolbar -->
			</div>
			<!-- end wrapper -->
			<!-- begin vertical-box-row -->
			<div class="vertical-box-row">
				<!-- begin vertical-box-cell -->
				<div class="vertical-box-cell">
					<!-- begin vertical-box-inner-cell -->
					<div class="vertical-box-inner-cell bg-white">
						<!-- begin scrollbar -->
						<div data-scrollbar="true" data-height="100%">
							<!-- begin list-email -->
							<ul class="list-group list-group-lg no-radius list-email">
								<li class="list-group-item">
									<div class="email-checkbox">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" data-checked="email-checkbox" id="emailCheckbox6">
											<label class="custom-control-label" for="emailCheckbox6"></label>
										</div>
									</div> 
									<a href="email_detail.html" class="email-user"> 
										<img src="../assets/img/user/user-12.jpg" alt="" />
									</a>
									<div class="email-info">
										<a href="email_detail.html"> 
											<span class="email-sender">GeraldHuff</span> 
											<span class="email-title">Handlebars help you to build semantic template</span> 
											<span class="email-desc">Proin </span> 
											<span class="email-time">2 months ago</span>
										</a>
									</div>
								</li>
							</ul>
							<!-- end list-email -->
						</div>
						<!-- end scrollbar -->
					</div>
					<!-- end vertical-box-inner-cell -->
				</div>
				<!-- end vertical-box-cell -->
			</div>
			<!-- end vertical-box-row -->
			<!-- begin wrapper -->
			<div class="wrapper clearfix d-flex align-items-center">
				<div class="text-inverse f-w-600">1,232 messages</div>
				<div class="btn-group ml-auto">
					<button class="btn btn-white btn-sm">
						<i class="fa fa-fw fa-chevron-left"></i>
					</button>
					<button class="btn btn-white btn-sm">
						<i class="fa fa-fw fa-chevron-right"></i>
					</button>
				</div>
			</div>
			<!-- end wrapper -->
		</div>
		<!-- end vertical-box -->
	</div>
	<!-- end vertical-box-column -->
</div>
<!-- end vertical-box -->
