/**
 * 
 */
  CKEDITOR.replace( 'postcontent' , {
 	 filebrowserImageUploadUrl:"imageUpload.do?type=image"
  });
  let boardForm = $("#boardForm");
  let newFileArea = $("#newFileArea");
	//<input type="text" name="deleteAttatchNos" /> 동적 추가 입력 태그
  $(".fileDelBtn").on("click", function(){
  	let span = $(this).parents("span:first").hide();
  	let attNo = $(span).data("attno");
  	boardForm.append( $("<input>").attr({
  		type:"text",
  		name:"deleteAttatchNos"
  	}).val(attNo));
  	newFileArea.append($("<input>").attr({
  		type:"file",
  		name:"attatchFiles"
  	}).addClass("form-control mr-2"));
  });