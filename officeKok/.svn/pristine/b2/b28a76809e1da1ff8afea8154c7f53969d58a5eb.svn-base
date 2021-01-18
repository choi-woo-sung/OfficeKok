/**
 * 
 */

let pagingArea = $("#pagingArea");
let pageCount = $("select[name='pageCount']");

let pageCountChange = pageCount.on("change", function() {
	$("input[name='pageCount']").val($(this).val());
	console.log("스크린 사이즈 : " + $("input[name='pageCount']").val());
	
	searchForm.submit();
});

let pagingA = pagingArea.on('click', "a" ,function(){
	let page = $(this).data("page");
	searchForm.find("[name='page']").val(page);
	searchForm.submit();
	searchForm.find("[name='page']").val(1);
	return false;
});