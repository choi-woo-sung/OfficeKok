<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="security" %>
<security:authentication property="principal.emp" var="emp"/>

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


<html>
<link href="${pageContext.request.contextPath }/css/chatbox.css"
	rel="stylesheet" />
	
<style>
.fa-fw {
    width: 1.0em;
}
.img_ms{
	width: 50px; height: 30px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" value="CO"  id="connect" />
<input type="hidden" value="DISCONNECT"  id="disconnect" />
<hr />
<!-- <input type="text" id="message" /> -->
<!-- <input type="button" id="send" value="SEND"/> -->

<div class="mesgs" style="width: 100%;">
          <div class="msg_history">


<div id="messageArea">
</div>


          <div class="type_msg"  style=" width :100%; float:center; position:absolute; right:0px; bottom:0px;">
            <div class="input_msg_write">
              <input type="text"  id="message" class="write_msg" placeholder="Type a message" />
              
              <button class="msg_send_btn"  id="send" type="button"><i class="far fa-lg fa-fw m-r-4 fa-paper-plane" aria-hidden="false"></i></button>
            </div>

</div>



 
<!--             <div class="incoming_msg"> -->
<!--               <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div> -->
<!--               <div class="received_msg"> -->
<!--                 <div class="received_withd_msg"> -->
<!--                   <p>Test which is a new approach to have all -->
<!--                     solutions</p> -->
<!--                   <span class="time_date"> 11:01 AM    |    June 9</span></div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="outgoing_msg"> -->
<!--               <div class="sent_msg"> -->
<!--                 <p>Test which is a new approach to have all -->
<!--                   solutions</p> -->
<!--                 <span class="time_date"> 11:01 AM    |    June 9</span> </div> -->
<!--             </div> -->
<!--             <div class="incoming_msg"> -->
<!--               <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div> -->
<!--               <div class="received_msg"> -->
<!--                 <div class="received_withd_msg"> -->
<!--                   <p>Test, which is a new approach to have</p> -->
<!--                   <span class="time_date"> 11:01 AM    |    Yesterday</span></div> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="outgoing_msg"> -->
<!--               <div class="sent_msg"> -->
<!--                 <p>Apollo University, Delhi, India Test</p> -->
<!--                 <span class="time_date"> 11:01 AM    |    Today</span> </div> -->
<!--             </div> -->
<!--             <div class="incoming_msg"> -->
<!--               <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div> -->
<!--               <div class="received_msg"> -->
<!--                 <div class="received_withd_msg"> -->
<!--                   <p>We work directly with our designers and suppliers, -->
<!--                     and sell direct to you, which means quality, exclusive -->
<!--                     products, at a price anyone can afford.</p> -->
<!--                   <span class="time_date"> 11:01 AM    |    Today</span></div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="type_msg"> -->
<!--             <div class="input_msg_write"> -->
<!--               <input type="text" class="write_msg" placeholder="Type a message" /> -->
<!--               <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button> -->
<!--             </div> -->
          </div>
        </div>
        
	<script type="text/javascript">
	let ws = null;
	
	$(function(){
		//그럼 일단 테스트용 으로 고정아이피를 사용하고 시연 할때는 document.domain을 쓴다.
		ws = new WebSocket("wss://"+document.domain+"${pageContext.request.contextPath}/echo/"+ ${chatno});
		init(ws);
	});
	
	
	$('#disconnect').on("click", function(){
		if(ws!=null){
			ws.close();
			ws = null;
		}
	});
	$("#send").on("click", function(){
		if(ws==null) return false;
		let msg = $('#message').val();
// 		msg2 = "{'chatNo': 방번호 , 'msg':msg}";
// 		ws.send(msg2);
//  		appendMessage("send : "+msg);
	ws.send(msg);
		$('#message').val("");
		
	});
	function appendMessage(message, image , sender){
		let empnm;
		let img;
		 if('${emp.empnm}' === sender){
			 empnm = $("<div class='pull-right'>").text(sender);
			 img = $("<div class='incoming_msg_img' >").append
				($("<img class='img_ms'>").attr("src", "data:image/*;base64,"+image));
						
			}else{
				empnm = $("<div class='pull-left'>").text(sender);
			img = $("<div class='incoming_msg_img' style='float:right' >").append
			($("<img class='img_ms'>").attr("src", "data:image/*;base64,"+image));
			};
		
			
			
		
		$("#messageArea").append($("<div class='incoming_msg'>").append
				(img,
				 $("<div class='received_msg'>").append(
						 $("<div class='received_withd_msg' style='word-break: break-all'>").append(
							$("<p>").text(message),
							empnm
							),
				$("<span class='time_date'>").text(
						<fmt:formatDate value="${now}" type="time"/>	
				)
				 )
				)
		);
	}
	function logHandler(event){
		console.log(event);
	}
	function init(ws){
		ws.onopen=function(event){
			console.log(event.target.url + " 와의 연결수립");
			logHandler(event);
		};
		ws.onclose=function(event){
			console.log(event.target.url + " 와의 연결종료, "+event.code+", "+event.reason);
			logHandler(event);
		};
		ws.onerror=logHandler;
		
		ws.onmessage=function(event){
			let msgVO = JSON.parse( event.data );
			let image = msgVO.base64Str;
			appendMessage(msgVO.message, image , msgVO.sender);
			logHandler(event);
		};
		
	}
	
	// 카카오톡 처럼 1:1 채팅을 
	$(function(){
		$('#message').keydown(function(key){
			if(key.keyCode == 13){
				$('#message').focus();
				if(ws==null) return false;
				let msg = $('#message').val();
				ws.send(msg);
// 				appendMessage("send : "+msg);
				$('#message').val("");
			}
		})
	});
</script>
</body>
</html>















