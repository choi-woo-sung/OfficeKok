<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2020. 10. 26.      이지윤      최초작성
* Copyright (c) 2020 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://www.springframework.org/security/tags" prefix="security" %> 
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<security:authentication property="principal.emp" var="emp"/>
<!-- begin page-header -->
	<h1 class="page-header">일일근태</h1>
	<hr>
<!-- end page-header -->	
	<div class="search-wrap" style="background:#F2F2F2; height:70px;">
		<form id="oneday" action="${pageContext.request.contextPath }/attendance/oneday/search.do">
		<div class="form-group">
			<table>
				<colgroup>
					<col width="100">
					<col width="">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label style="padding-left:30px; padding-top:20px; width:100px;">* 근무일자</label></th>
						<td>
						    <input id="today" style="margin-left:20px; margin-top:15px;" type="date" name="date">
						</td>
						<td>
						<button id="search" style="margin-left:990px; margin-top:15px;" type="submit" class="btn btn-primary"><i class="fa fa-search fa-fw"></i> 검색</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</form>
	</div>
	<div style="margin-top: 10px;">
		<i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;근무시간은 출근 기준시(09:00), 연장 근로시간은 퇴근 기준시(18:00)로부터 계산됩니다.<br>
		<i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;출근처리가 이루어지지 않거나, 근무·휴일·연장 근로에 대한 시간이 계산되지 않는 경우 담당자에게 문의하세요.
	</div>
	<div style="margin-top:40px; float:right;">
		<button class="btn btn-inverse" id="onBtn" type="button" data-toggle="modal" data-target="#myModal" onclick="init()">출근</button>
		<button class="btn btn-inverse" id="offBtn" type="button" disabled="disabled">퇴근</button>
	</div>
	
	<div class="table-responsive" >
	<hr>
								<table class="table" id="attendTable">
									<thead class="text-center">
										<tr>
											<th>사원번호</th>
											<th>사원명</th>
											<th>출근시간</th>
											<th>퇴근시간</th>
											<th>근무시간</th>
											<th>휴일근로</th>
											<th>연장근로</th>
										</tr>
									</thead>
									<tbody class="text-center">
										<tr>
											<td>${emp.empno }</td>
											<td>${emp.empnm }</td>
											<td id="goworktime">${list.goworktime }</td>
											<td id="afterworktime">${list.afterworktime }</td>
											<td id="todayTotal">${list.worktime }시간  </td>
											<td id="holyworktime">${list.holyworktime }시간</td>
											<td id="plusworktime">${list.plusworktime }시간</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Modal -->
							<div id="myModal" class="modal fade" role="dialog">
							  <div class="modal-dialog modal-lg">
								
							    <!-- Modal content-->
							    <div class="modal-content">
							      <div class="modal-header">
							      </div>
							      <div class="modal-body">
							        <div id="webcam-container"></div>
									<div id="label-container"></div>
							      </div>
							      <div class="modal-footer">
							        <button id="close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							      </div>
							    </div>
							
							  </div>
							</div>

<script type="text/javascript">
	var date = new Date();
	
	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	
	if (month < 10) month = "0" + month;
	if (day < 10) day = "0" + day;	
	if (hours < 10) hours = "0" + hours;
	if (minutes < 10) minutes = "0" + minutes;

	var today = year + "-" + month + "-" + day; 
	
	$("#today").attr("value", today);
	$("#today").attr("max", today);
	
//===========================================================================================	
	
	let searchForm = $("#oneday").on("submit", function(event){
		event.preventDefault();
		let url = this.action?this.action:location.href;
		let method = this.method?this.method:"get";
		let data = $(this).serialize(); // query string 
			$.ajax({
				url : url,
				method : method,
				data : data,
				dataType : "json",
				success : function(resp) {
					var goworktime = resp.goworktime;
					var afterworktime = resp.afterworktime;
					var workhours = resp.worktime;
					var plushours = resp.plusworktime;
					var holyworktime = resp.holyworktime;
					$("#goworktime").text(goworktime);
					$("#afterworktime").text(afterworktime);
					$("#todayTotal").text(workhours + "시간");
					$("#plusworktime").text(plushours + "시간");
					$("#holyworktime").text(holyworktime + "시간");
					
			}
		});
	});
	
	//$("#today").val(new Date().toISOString().slice(0, 10));
//============================================================================
	$("#close").on("click", function(){
		 location.reload();
	});
	
	$('#myModal').appendTo("body");
//=========================================================================================================
	 var allData = { "year": year, "month": month, "day" : day, "hours" : hours, "minutes" : minutes };
	   
	 var insertTime = function(){
		   $.ajax({
				url : "${pageContext.request.contextPath }/attendance/oneday/inseart.do",
				method : "post",
				data : allData,
				dataType : "json",
				success : function() {
			}
		});
	   }
	 
	 var updateTime = function(){
		   $.ajax({
				url : "${pageContext.request.contextPath }/attendance/oneday/update.do",
				method : "post",
				data : allData,
				dataType : "json",
				success : function() {
			}
		});
	   }

 //===========================================================================================================    
       // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    const URL = "${pageContext.request.contextPath }/my_model/";

    let model, webcam, labelContainer, maxPredictions;

    // Load the image model and setup the webcam
    async function init() {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";

        // load the model and metadata
        // Refer to tmImage.loadFromFiles() in the API to support files from a file picker
        // or files from your local hard drive
        // Note: the pose library adds "tmImage" object to your window (window.tmImage)
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();

        // Convenience function to setup a webcam
        const flip = true; // whether to flip the webcam
        webcam = new tmImage.Webcam(765, 500, flip); // width, height, flip
        await webcam.setup(); // request access to the webcam
        await webcam.play();
        window.requestAnimationFrame(loop);

        // append elements to the DOM
        document.getElementById("webcam-container").appendChild(webcam.canvas);
        labelContainer = document.getElementById("label-container");
        for (let i = 0; i < maxPredictions; i++) { // and class labels
            labelContainer.appendChild(document.createElement("div"));
        }
    }

    async function loop() {
        webcam.update(); // update the webcam frame
        if(await predict()){
        	location.href = location.href;
        	return false;
        }
        window.requestAnimationFrame(loop);
    }
	
    var empnm = "${emp.empnm}";
    
    // run the webcam image through the image model
    async function predict() {
        // predict can take in an image, video or canvas html element
        const prediction = await model.predict(webcam.canvas);
        for (let i = 0; i < maxPredictions; i++) {
        	if(prediction[i].className == empnm){
            	const classPrediction =
                prediction[i].className + ": " + prediction[i].probability.toFixed(2);
            	labelContainer.childNodes[i].innerHTML = classPrediction;
        		if(prediction[i].probability.toFixed(2) >= 0.7){
        			insertTime();
        			alert(empnm + "님 " + year + "-" + month + "-" + day + " " + hours + ":" + minutes + " 출근완료!"); 
        			return true;
        		}
        	}
        }
    }
	 
//============================================================================================================	 
	var goworktime = $("#goworktime").text();
    var afterworktime = $("#afterworktime").text();
   
   if(goworktime != "00:00" && afterworktime == "00:00") {   	
   	$('#offBtn').attr('disabled', false);
	$('#onBtn').attr('disabled', true);
   }else if(goworktime != "00:00" && afterworktime != "00:00") {
	$('#offBtn').attr('disabled', true);
	$('#onBtn').attr('disabled', true);	   
   }else if(goworktime == "00:00" && afterworktime == "00:00"){
	$('#offBtn').attr('disabled', true);
	$('#onBtn').attr('disabled', false);
   }
   
	$("#offBtn").on("click", function(){
		var ok = confirm("퇴근하시겠습니까?")
		if(ok){
			updateTime();
			alert("퇴근완료");					
			location.href = location.href;
		}else{
			return;
		}
	});
</script>
	
