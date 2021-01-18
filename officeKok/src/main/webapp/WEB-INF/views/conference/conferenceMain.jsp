<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<link rel="styleSheet" href="${cPath }/css/groupcall/style.css" type="text/css" media="screen">
<script src="${cPath }/js/groupcall/adapter.js"></script>
<script src="${cPath }/js/groupcall/conferenceroom.js"></script>
<script src="${cPath }/js/groupcall/participant.js"></script>
<script src="${cPath}/js/kurento-utils.js"></script>
</head>
<script type="text/javascript">
let empmail = '${emp.empmail}';



window.onload=function(){
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	            results = regex.exec(location.search);
	    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var roomid = getParameterByName('room');
	
	if(roomid){
		$('#roomName').val(roomid);
		register2();
	}
}
</script>
<style>
	body {
		background-color: none;
	}
</style>

<body>
	<div id="container">
		<div id="wrapper">
			<div id="join" class="animate join">
				<h1>Join a Room</h1>
				<form onsubmit="register(); return false;" accept-charset="UTF-8">
					<p>
						<input type="hidden" name="name" value="${emp.empnm}" id="name"
							placeholder="Username" required>
					</p>
					<p>
						<input type="text" name="room" value="" id="roomName"
							placeholder="Room" required>
					</p>
					<p class="submit">
						<input type="submit" name="commit" value="Join!">
					</p>
				</form>
			</div>
			<div id="room" style="display: none;">
				<h2 id="room-header"></h2>
				<div id="participants"></div>
				<input type="button" id="button-leave" onmouseup="leaveRoom();"
					value="Leave room">
			</div>
		</div>
	</div>
</body>
</html>
