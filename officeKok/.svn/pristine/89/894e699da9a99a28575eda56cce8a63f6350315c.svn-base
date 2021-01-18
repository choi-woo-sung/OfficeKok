/**
 * 조직도 트리구조 js
 */

var handleJstreeCheckable = function() {
    $('#jstree-checkable').jstree({
        'plugins': ["wholerow", "checkbox", "types"],
        'core': {
            "themes": {
                "responsive": false
            },    
            'data': data
            },
        "types": {
            "default": {
                "icon": "fa fa-folder text-primary fa-lg"
            },
            "file": {
                "icon": "fa fa-file text-success fa-lg"
            }
        }
    });
};


var TreeView = function () {
	"use strict";
	return {
		//main function
		init: function () {
			handleJstreeCheckable();
		}
	};
}();

$(document).ready(function() {
	TreeView.init();
});