<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.5.1.min.js"></script>
<div id="content">
  <span id="icon-music">♬</span>

  <div class="wrap">
    <p>
      WebRTC 관련 예제로 Speech Recognition API를 활용하면 더 재밌는 기능을 만들 수 있습니다.<br />
      아래 버튼을 누른 후 마이크에 이야기를 해보세요. (마이크와 가까울수록 인식률이 좋습니다)
    </p>
    <div id="result">
      <span class="final" id="final_span"></span>
      <span class="interim" id="interim_span"></span>
    </div>
    <button id="btn-mic" class="off">마이크 <span></span></button>
    <button id="btn-tts">Text to speech</button>
    <audio id="audio" src="audio/ending.mp3"></audio>

		<div>
		  <button onclick="document.getElementById('audio').play()">Play the Audio</button>
		  <button onclick="document.getElementById('audio').pause()">Pause the Audio</button>
		  <button onclick="document.getElementById('audio').volume+=0.2">Increase Volume</button>
		  <button onclick="document.getElementById('audio').volume-=0.2">Decrease Volume</button>
		</div>
		
    <br /><br />
    <h3>예약어 (마이크를 켠 상태에서 아래 문자를 읽어보세요)</h3>
    <ul>
      <li>레드, 그린, 옐로우, 오렌지, 그레이, 골드, 블랙</li>
      <li>알람</li>
      <li>노래 켜, 노래 꺼, 음악 켜, 음악 꺼</li>
      <li>볼륨업, 볼륨다운</li>
      <li>스피치, 말해줘</li>
    </ul>
  </div>
</div>

<script src="js/main.js"></script>


</html>