/*
 * (C) Copyright 2014 Kurento (http://kurento.org/)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

var ws = null;
var participants = null;
var name;
var name123 ;
const PROTOCOL = location.href.startsWith("https")?"wss":"ws";


window.onbeforeunload = function() {
	ws.close();
};


//초기화부분에서 
function init(){
	participants = {};
	ws = new WebSocket(PROTOCOL+'://' + location.host + '/officeKok/groupcall/');
	// 프로토콜을잡고 
	
	//
	//ws.onopen ()?
	ws.onclose=function(){
		init();
	}
	ws.onmessage = function(message) {
		var parsedMessage = JSON.parse(message.data);
		console.info('Received message: ' + message.data);
		
		//만약 아이디를 붙인다면
		switch (parsedMessage.id) {
		case 'existingParticipants':
			onExistingParticipants(parsedMessage);
			break;
		case 'newParticipantArrived':
			onNewParticipant(parsedMessage);
			break;
		case 'participantLeft':
			onParticipantLeft(parsedMessage);
			break;
		case 'receiveVideoAnswer':
			receiveVideoResponse(parsedMessage);
			break;
		case 'iceCandidate':
			participants[parsedMessage.name].rtcPeer.addIceCandidate(parsedMessage.candidate, function (error) {
		        if (error) {
			      console.error("Error adding candidate: " + error);
			      return;
		        }
		    });
		    break;
		default:
			console.error('Unrecognized message', parsedMessage);
		}
	}
}

init();
//register 부문에서 처음으로 네임과 방이름을 보낸다.
function register() {
	name = document.getElementById('name').value;
	let room = document.getElementById('roomName').value;

	document.getElementById('room-header').innerText = room;
	document.getElementById('join').style.display = 'none';
	document.getElementById('room').style.display = 'block';

	var message = {
		id : 'joinRoom',
		name : name,
		room : room,
	}
	// 시작할때 메세지를 보낸다. 메세지에는 이름과 방번호가 담겨있음. 이미 메세지를 보냈으니 콜핸들러에서 구분을 해주겠군.
	sendMessage(message);
	
	let socketMsg = "conf," + empmail +","+name+ ","+ room;
	console.log("msgmsg : " + socketMsg);
	socket.send(socketMsg);
	
}

function register2() {
	name = document.getElementById('name').value;
	let room = document.getElementById('roomName').value;

	document.getElementById('room-header').innerText = 'ROOM ' + room;
	document.getElementById('join').style.display = 'none';
	document.getElementById('room').style.display = 'block';

	var message = {
		id : 'joinRoom',
		name : name,
		room : room,
	}
	// 시작할때 메세지를 보낸다. 메세지에는 이름과 방번호가 담겨있음. 이미 메세지를 보냈으니 콜핸들러에서 구분을 해주겠군.
	sendMessage(message);
}

function onNewParticipant(request) {
	receiveVideo(request.name);
}

function receiveVideoResponse(result) {
	participants[result.name].rtcPeer.processAnswer (result.sdpAnswer, function (error) {
		if (error) return console.error (error);
	});
}

function callResponse(message) {
	if (message.response != 'accepted') {
		console.info('Call not accepted by peer. Closing call');
		stop();
	} else {
		webRtcPeer.processAnswer(message.sdpAnswer, function (error) {
			if (error) return console.error (error);
		});
	}
}

function onExistingParticipants(msg) {
	var constraints = {
		audio : true,
		video : {
			mandatory : {
				maxWidth : 600,
				maxFrameRate : 15,
				minFrameRate : 15
			}
		}
	};
	console.log(name + " registered in room " + room);
	var participant = new Participant(name);
	participants[name] = participant;
	var video = participant.getVideoElement();

	var options = {
	      localVideo: video,
	      mediaConstraints: constraints,
	      onicecandidate: participant.onIceCandidate.bind(participant)
	    }
	participant.rtcPeer = new kurentoUtils.WebRtcPeer.WebRtcPeerSendonly(options,
		function (error) {
		  if(error) {
			  return console.error(error);
		  }
		  this.generateOffer (participant.offerToReceiveVideo.bind(participant));
	});

	msg.data.forEach(receiveVideo);
}

function leaveRoom() {
	sendMessage({
		id : 'leaveRoom'
	});

	for ( var key in participants) {
		participants[key].dispose();
	}

	document.getElementById('join').style.display = 'block';
	document.getElementById('room').style.display = 'none';

	ws.close();
}

function receiveVideo(sender) {
	var participant = new Participant(sender);
	participants[sender] = participant;
	var video = participant.getVideoElement();

	var options = {
      remoteVideo: video,
      onicecandidate: participant.onIceCandidate.bind(participant)
    }

	participant.rtcPeer = new kurentoUtils.WebRtcPeer.WebRtcPeerRecvonly(options,
			function (error) {
			  if(error) {
				  return console.error(error);
			  }
			  this.generateOffer (participant.offerToReceiveVideo.bind(participant));
	});;
}

function onParticipantLeft(request) {
	console.log('Participant ' + request.name + ' left');
	var participant = participants[request.name];
	participant.dispose();
	delete participants[request.name];
}

function sendMessage(message) {
	var jsonMessage = JSON.stringify(message);
	console.log('Sending message: ' + jsonMessage);
	ws.send(jsonMessage);
}
