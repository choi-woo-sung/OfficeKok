/**
 * 근태현황 그래프 js
 */

var annualLeaveChart = function() {	
	Morris.Donut({
		element: 'annual-leave-chart',
		data: annual,
		formatter: function (y) { return y + "개" },
		resize: true,
		gridLineColor: [COLOR_GREY_LIGHTER],
		gridTextFamily: FONT_FAMILY,
		gridTextColor: FONT_COLOR,
		gridTextWeight: FONT_WEIGHT,
		gridTextSize: FONT_SIZE,
		colors: [COLOR_DARK, COLOR_AQUA]
	});
};

var weekTimeChart = function() {
	Morris.Donut({
		element: 'week-time-chart',
		data: totalWeekWorkTime,
		formatter: function (y) { return y + "시간" },
		resize: true,
		gridLineColor: [COLOR_GREY_LIGHTER],
		gridTextFamily: FONT_FAMILY,
		gridTextColor: FONT_COLOR,
		gridTextWeight: FONT_WEIGHT,
		gridTextSize: FONT_SIZE,
		colors: [COLOR_DARK, COLOR_BLUE]
	});
};


var holidayChart = function() {
	Morris.Donut({
		element: 'holiday-chart',
		data: refresh,
		formatter: function (y) { return y + "일" },
		resize: true,
		gridLineColor: [COLOR_GREY_LIGHTER],
		gridTextFamily: FONT_FAMILY,
		gridTextColor: FONT_COLOR,
		gridTextWeight: FONT_WEIGHT,
		gridTextSize: FONT_SIZE,
		colors: [COLOR_DARK, COLOR_GREEN]
	});
};



var handleMorrisLineChart = function () {
	var months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
	Morris.Line({
		element: 'morris-line-chart',
		data: totalAddWorkTime,
		xkey: 'm',
		ykeys: ['연장 근무시간', '휴일 근무시간'],
		labels: ['연장 근무시간', '휴일 근무시간'],
		xLabelFormat: function(x) { // <--- x.getMonth() returns valid index
		    var month = months[x.getMonth()];
		    return month;
		},
	  	dateFormat: function(x) {
		    var month = months[new Date(x).getMonth()];
		    return month;
	  	},
		resize: true,
		pointSize: 5,
		lineWidth: 2.5,
		gridLineColor: [COLOR_GREY_LIGHTER],
		gridTextFamily: FONT_FAMILY,
		gridTextColor: FONT_COLOR,
		gridTextWeight: FONT_WEIGHT,
		gridTextSize: FONT_SIZE,
		lineColors: [COLOR_GREEN, COLOR_BLUE]
	});
};

var handleMorrisBarChart = function () {
	Morris.Bar({
	element: 'morris-bar-chart',
	data: totalWorkTime,
	xkey: 'month',
	ykeys: ['근무시간'],
	labels: ['근무시간'],
	barRatio: 0.4,
	xLabelAngle: 35,
	resize: true,
	gridLineColor: [COLOR_GREY_LIGHTER],
	gridTextFamily: FONT_FAMILY,
	gridTextColor: FONT_COLOR,
	gridTextWeight: FONT_WEIGHT,
	gridTextSize: FONT_SIZE,
	barColors: [COLOR_DARK]
	});
};

var MorrisChart = function () {
	"use strict";
	return {
		//main function
		init: function () {
			annualLeaveChart();
			weekTimeChart();
			holidayChart();
			handleMorrisLineChart();
			handleMorrisBarChart();
		}
	};
}();


$(document).ready(function() {
	MorrisChart.init();
	
	var date = new Date();
	var year = date.getFullYear();
	$(".page-header").text(year + "년 근태현황");
});