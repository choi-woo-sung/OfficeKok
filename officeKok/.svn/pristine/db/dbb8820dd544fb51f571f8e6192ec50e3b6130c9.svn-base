//전역변수 선언-모든 홈페이지에서 사용 할 수 있게 index에 저장
var socket = null;

$(document).ready(function() {
	connectWs();
});

function createDate(data) {
//		alert(data);
	//		eval("("+data+")")
	var msgs = data.split("@@@@@");
	Command: toastr["info"](msgs[0], "알림!")
	$("#toast-container").on("click", function() {
		location.href = msgs[1];
	});

};

function connectWs() {

	sock = new WebSocket("wss://" + document.domain + "/officeKok/count");
	//sock = new SockJS('/replyEcho');
	socket = sock;

	//소켓이 열렸을때 쓰는 메소드
	sock.onopen = function() {
		console.log('info: connection opened.');
	};

	// 소켓에서 메세지가 왔을때 사용하는 function;
	sock.onmessage = function(evt) {
		var data = evt.data;
		console.log("알림메세지 : " + data + "\n");

		//알림을 보내주는 메서드. main.js에 등록하였음.
		createDate(data);

	};

	sock.onclose = function() {
		console.log('connect close');
		/* setTimeout(function(){conntectWs();} , 1000); */
	};

	sock.onerror = function(err) {
		console.log('Errors : ', err);
	};

}
