<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form id="getToken" action="${url}" method="post" enctype="application/x-www-form-urlencoded">
	<input type="hidden" name="code" value="${code}"/>
	<input type="hidden" name="redirect_uri" value="${redirect_uri}"/>
	<input type="hidden" name="client_id" value="${client_id}"/>
	<input type="hidden" name="client_secret" value="${client_secret}" />
	<input type="hidden" name="grant_type" value="${grant_type}" />
</form>

<form id="tokenRegist" action="${pageContext.request.contextPath}/mail/receive/regist" method="post">
	<input type="hidden" name="refresh_token" />
	<input type="hidden" name="access_token" />
	<input type="hidden" name="expires_in" />
</form>

<script type="text/javascript">
	$(function() {
		console.log($("input[name='client_id']").val());
		
		$("#getToken").on("submit", function(event) {
			event.preventDefault();
			let url = this.action ? this.action : location.href;
			let method = this.method ? this.method : "post";
			let data = $(this).serialize();
			
			$.ajax({
				url : url,
				data : data,
				method : method,
				dataType : "json",
				success : function(resp) {
					let access_token = resp.access_token;
					let refresh_token = resp.refresh_token;
					let expires_in = resp.expires_in;
					
					console.log(resp);
					
					$("input[name='refresh_token']").val(refresh_token);
					$("input[name='access_token']").val(access_token);
					$("input[name='expires_in']").val(expires_in);
					
					$("#tokenRegist").submit();
				},
				error : function(errResp) {
					console.log(errResp);
				}
			})
		}).submit();
	})
</script>