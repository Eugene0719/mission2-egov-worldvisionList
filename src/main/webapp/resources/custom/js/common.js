


$(document).ready(function () {
    $(".onlynum").css('imeMode', 'disabled').keypress(function(event) {
        if(event.which && (event.which == 45)) {
        	event.preventDefault();
        }

        if(event.which && (event.which < 48 || event.which > 57)) {
        	event.preventDefault();
        }
    });

    $(".float").css('imeMode', 'disabled').keypress(function(event) {
    	if(event.which && event.which == 46) {
    		if($(this).val().indexOf(".") >= 0) {
    			event.preventDefault();
    		}
    	} else if(!(event.which && (event.which > 47 && event.which < 58 || event.which == 8 || event.which == 46))) {
            event.preventDefault();
        }
    });

    $(".phonenum").css('imeMode', 'disabled').keypress(function(event) {
        if(event.which && (event.which == 45)) {
        	event.preventDefault();
        }

        if(event.which && (event.which < 48 || event.which > 57)) {
        	event.preventDefault();
        }
    }).keyup(function(event) {
    	if (event.keyCode == 8 ) {
    		return;
    	}

    	var num = $(this).val().replace(/-/g, '');
    	var formatNum = "";

    	if(num.indexOf('02') == 0) {
    		if(num.length == 10) {
    			formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
    		} else {
    			formatNum = num.replace(/(\d{2})(\d{3})(\d{4})/, '$1-$2-$3');
    		}
    	} else if(num.indexOf('01') == 0) {
    		if(num.length == 11) {
    			formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    		} else {
    			formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    		}
    	} else if(num.indexOf('07') == 0) {
    		if(num.length == 11) {
    			formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    		} else {
    			formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    		}
    	} else if(num.indexOf("0") == 0) {
    		if(num.length == 11) {
    			formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
    		} else {
    			formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
    		}
    	} else if(num.length == 8) {
    		formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
    	} else {
    		formatNum = num;
    	}

    	$(this).val(formatNum);
    }).attr("maxlength", 13);
});

//공통 Ajax Call
jQuery.ajaxCall = function(options) {
	var default_value =  {
		timeout : 15 * 1000
		, async : true
		, cache: false
		, dataType: "json"
		, type: "POST"
		, contentType : "application/x-www-form-urlencoded; charset=UTF-8"
		, bLoading : "Y"
	};
	var opts = $.extend({}, default_value, options);

	/*
	// 검색 조건
	var autoHistory = setHistoryAction();
	opts.data.autoHistory = autoHistory;*/
	

 	return xhr;
};

jQuery.fn.dataTableInit = function(options) {
	var dtLang = {
		"processing" : "처리중...",
		"zeroRecords": "조회 된 데이터가 없습니다.",
		"paginate" : {
			"first" : "<<",
			"last" : ">>",
			"next" : ">",
			"previous" : "<"
		},
		"info" : "총 _TOTAL_ 건",
		"infoEmpty" : "총 0 건",
		"lengthMenu": "_MENU_"
	};

	var default_value =  {
		processing : false,
		serverSide : false,
		pagingType : "full_numbers",
		language : dtLang,
		searching : true,
		ordering: true,
		order : [0, "asc"],
		orderFixed : [],
		lengthChange : true,
		lengthMenu : [ [10, 25, 50, 100], [10, 25, 50, 100] ],
		paging : true,
		info : true,
		stateSave : false,
		scrollX : false,
		page : 0,
		buttons: true,
		filter: true
		
	};

	var opts;

	if(options != null) {
		opts = $.extend({}, default_value, options);
	} else {
		opts = default_value;
	}

	var default_ajax = {
		type : "post",
		dataType : "json",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8"
	}

	var ajax_opts = "";

	if(options != null && options.ajax != null)
		ajax_opts = $.extend({}, default_ajax, options.ajax);

	var oTable;

	if(opts.columns != null) {
		oTable = this.DataTable({
			processing : opts.processing,		// 프로세스 처리 alert
			serverSide : opts.serverSide,		// 서버사이드 방식
			pagingType : opts.pagingType,		// 번호 페이징
			language : opts.language,
			searching : opts.searching,			// 조회 영역
			ordering: opts.ordering,
			order : opts.order,
			orderFixed : opts.orderFixed,
			lengthChange : opts.lengthChange,	// 한페이지에 최대 보여지는 갯수 선택 콤보박스
			lengthMenu : opts.lengthMenu,
			paging : opts.paging,
			info : opts.info,
			stateSave : opts.stateSave,
			scrollX : opts.scrollX,
			dom : "Bfrtip,lrtip",
			buttons : [
				{
					extend : 'excel',
					title : "",
					text: "엑셀 다운로드",
					exportOptions: {
						modifier: { page: "current" },
					},
					filename : $(".page-title").text() + "_" + (new Date().format("yyyyMMdd"))
				}
		    ],
			ajax : ajax_opts,
			columns : opts.columns, 
			columnDefs : opts.columnDefs,
		});
	} else {
		oTable = this.DataTable({
			processing : opts.processing,		// 프로세스 처리 alert
			serverSide : opts.serverSide,		// 서버사이드 방식
			pagingType : opts.pagingType,		// 번호 페이징
			language : opts.language,
			searching : opts.searching,			// 조회 영역
			ordering: opts.ordering,
			order : opts.order,
			orderFixed : opts.orderFixed,
			lengthChange : opts.lengthChange,	// 한페이지에 최대 보여지는 갯수 선택 콤보박스
			lengthMenu : opts.lengthMenu,
			paging : opts.paging,
			info : opts.info,
			stateSave : opts.stateSave,
			scrollX : opts.scrollX,
			dom : "Bfrtip,lrtip",
			buttons : [
				{
					extend : 'excel',
					title : "",
					text: "버튼명",
					filename : $(".page-title").text() + "_" + (new Date().format("yyyyMMdd"))
				}
		    ],
			ajax : ajax_opts,
			autoWidth : false,
		});
	}
	return oTable;
};


Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";

    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;

    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};

String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};