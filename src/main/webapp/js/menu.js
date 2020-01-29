(function($) {
	'use strict';
	var menuActions = {
		setFunc: function() {
			var menu = this;
			if(menu.find("ul.nav-sidebar-left").find('li').hasClass('active') == false){
				menu.find("ul.nav-sidebar-left a[role=tab]").first().data('menuCd','S01').data('index','0').tab('show');
				menu.find('ul.nav-sidebar-left').children('li').each(function(){
					$(this).removeClass('active');
				});
				menu.find('ul.nav-sidebar-left a[data-menu-cd=S01]').closest('li').addClass('active');
				menu.find('div [id^=right-menu-]').each(function(){
					$(this).removeClass('active');
				});
				menu.find('div#right-menu-0').addClass('active');
			}

			menu.find('ul.nav-sidebar-left a[role=tab]').on('shown.bs.tab', function(e) {
				menu.animate({scrollTop: 0}, 500, "easeInOutExpo");
				var tab = $(this);
				var target = $(tab.attr('href')).find('ul.nav-sidebar-right').children();

				var index = $(this).data().index;
				switch($(this).data().menuCd.substring(0,1)) {
				case "A": // 전자메일
					if( $("div#right-menu-0").children().first().find("a[data-role=menuMailWrite]").length < 1 ) {
						var btn = $('<a href="/mail/write/mailWritei" class="btn btn-primary btn-block" style="margin-top: 20px; margin-bottom: 10px;" data-role="menuMailWrite" title="메일 작성"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 메일 작성</a>')
						btn.appendTo($("div#right-menu-0").children().first().children());
					}
					break;
				case "B": // 전자결제
					break;
				case "C": // 주소록
					break;
				case "D": // 근태관리
					break;
				case "E": // 스케쥴
					// 일정 분류별 보기
					$("div#right-menu-4").children().last().children().eq(4).children("ul").remove();
					$.poizn.getJson({
						url: "/schedule/info/typeList",
						success: function(data) {
							if(data.length > 0) {
								var rightNm = "right-menu-4-4";
								$("div#right-menu-4").children().last().children().eq(4).children().children("a").attr("href", "#"+rightNm).attr("data-toggle", "collapse").attr("aria-expanded", "true").attr("aria-controls", "#"+rightNm).attr("role", "button").attr("data-href", "#"+rightNm);
								var ul = $('<ul class="nav nav-sub-sidebar collapse in" id="'+rightNm+'"></ul>');
								for(var i in data) {
									var item = data[i];
									ul.append('<li><a href="#" title="'+item.schClNm+'"><input type="checkbox" class="mr5" data-is-o="false" data-sch-cl-no="'+item.schClNo+'" style="color: '+item.schClColor+';" checked/>'+item.schClNm+'</a></li>');
								}
								ul.find("input[type=checkbox]").checkbox();
								ul.find("a").click(function(e) {
									e.preventDefault();
									var chk = $(this).find("input[type=checkbox]");
									chk.prop("checked", chk.prop("checked") ? false : true).trigger("change");
									if($("div#calendar").length > 0) $("div#calendar").fullCalendar("refetchEvents");
									return false;
								});
								ul.appendTo($("div#right-menu-4").children().last().children().eq(4).children());
							}
						}
					});
					// 일정 / 할일 등록
					if( $("div#right-menu-4").children().first().find("a[data-role=menuScheduleWrite]").length < 1 ) {
						var btn = $('<button type="button" class="btn btn-primary btn-block" style="margin-top: 20px; margin-bottom: 10px;" data-role="menuScheduleWrite" title="일정 / 할일 등록" data-toggle="modal" data-target="#scheduleModal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> 일정 / 할일 등록</button>')
						btn.appendTo($("div#right-menu-4").children().first().children());

						var modalHtml = '<div id="scheduleModal" class="modal fade" role="dialog" aria-labelledby="scheduleModal">'
							+ '<div class="modal-dialog">'
								+ '<div class="modal-content">'
									+ '<form id="schModalFrm" name="schModalFrm" method="post" action="/schedule/schedule/schedule">'
										+ '<fieldset>'
											+ '<div class="modal-header modal-color-dark-grey">'
												+ '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
												+ '<h4 class="modal-title">일정 등록</h4>'
											+ '</div>'
											+ '<div class="modal-body">'
												+ '<ul class="list-unstyled">'
													+ '<li class="text-center"><h5 class="text-primary">'
													+ '<i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>'
													+ '<span class="sr-only">Loading...</span>'
													+ '데이터 로딩중 입니다..</h5></li>'
													+ '<li></li>'
												+ '</ul>'
											+ '</div>'
											+ '<div class="modal-footer modal-color-dark-grey">'
												+ '<button type="submit" class="btn btn-clear-green">저장</button>'
												+ '<button type="button" class="btn btn-clear-white" data-dismiss="modal">닫기</button>'
											+ '</div>'
										+ '</fieldset>'
									+ '</form>'
								+ '</div>'
							+ '</div>'
						+ '</div>';
						$(modalHtml).appendTo("div[data-role=contents]");
						$("#scheduleModal").on("show.bs.modal", function(e) {
							var modal = $(this);
							var li = modal.find(".modal-body").children().children();
				            // 최초 로드 후 재사용시 loading 처리
				            li.first().show();
				            li.last().hide().empty();
						}).on("shown.bs.modal", function(e) {
							var button = $(e.relatedTarget);
							var modal = $(this);
							var li = modal.find(".modal-body").children().children();

							$.poizn.get({
								url: "/schedule/schedule/schedule",
								data: {selectDate: modal.data("date"), schType: modal.data("schType")},
								success: function(data) {
									li.last().html(data);

									li.first().slideUp("easeInOutExpo");
									li.last().slideDown("easeInOutExpo");
								}
							});
						});
					}
					break;
				case "F": // 자원관리
					break;

				case "G": // 게시판

					$.poizn.getJson({
						// url: '/board/manage/userTreeList',
						type: 'get',
						success: function(data) {
							// To-Do : 메뉴 생성
							if(data) {
								$("ul[data-role=customAddG01]").remove();
								var isManage = false;
								if( $("div#right-menu-"+index).children().last().children().length > 3 ) isManage = true;
								for(var i in data) {
									var item = data[i];
									var ul = $('<ul class="nav nav-sidebar-right" data-role="customAddG01"></ul>');
									var num = ((i*1+5) < 10) ? '0' + (i*1+5) : (i*1+5);
									var li = $('<li id="li_menu_G01'+num+'"></li>');
									ul.append(li);
									if(item.subList.length == 0) {
										li.append('<a href="/board/list?boardId='+item.boardId+'" data-href="/board/list?boardId='+item.boardId+'" data-board-id="'+item.boardId+'" title="'+item.boardNm+'">'+item.boardNm+'</a>');
									} else {
										//li.append('<a href="#right-menu-6-'+(i*1+5)+'" data-href="#right-menu-6-'+(i*1+5)+'" title="'+item.boardNm+'" role="button" data-toggle="collapse" aria-expanded="true" aria-controls="#right-menu-6-'+(i*1+5)+'">'+item.boardNm+'</a>');
										li.append('<a href="/board/list?boardId='+item.boardId+'" data-href="/board/list?boardId='+item.boardId+'" data-board-id="'+item.boardId+'" title="'+item.boardNm+'">'+item.boardNm+'</a>');
										var subUl = $('<ul class="nav nav-sub-sidebar collapse in" id="right-menu-6-'+(i*1+5)+'"></ul>');
										li.append(subUl);
										for(var j in item.subList) {
											var subItem = item.subList[j];
											subUl.append('<li data-target="#li_menu_G01'+num+'"><a href="/board/list?boardId='+subItem.boardId+'" data-board-id="'+subItem.boardId+'" title="'+subItem.boardNm+'">'+subItem.boardNm+'</a></li>');
										}
									}
									if(isManage) {
										ul.insertBefore($("div#right-menu-"+index).children().last().children().last());
									} else {
										ul.appendTo($("div#right-menu-"+index).children().last().children().last());
									}

								}
								var params = $.poizn.contents.getParam();
								if( typeof params == "object" && params.hasOwnProperty('boardId') ) {
									if( $("div#right-menu-"+index).children().last().find("a[data-board-id="+params.boardId+"]").length > 0 ) {
										$("div#right-menu-"+index).children().last().find("li.active").removeClass("active");
										$("div#right-menu-"+index).children().last().find("a[data-board-id="+params.boardId+"]").parent().addClass("active");
										if( $("div#right-menu-"+index).children().last().find("a[data-board-id="+params.boardId+"]").parent().data("target") ) {
											$($("div#right-menu-"+index).children().last().find("a[data-board-id="+params.boardId+"]").parent().data('target')).addClass("active");
										}
									}
								}
							}
						}
					});
					break;
				case "H": // 설문조사
					break;
				case "I": // 쪽지
					$.poizn.getJson({
		                url: "/messageMgmt/privateBoxs",
		                type: "get",
		                success: function(data) {
		                	if( data.notReadMessageCnt ) {
		                		if(target.first().find('a').children('small').length < 1) {
		                			target.first().find('a').append('&nbsp;<small>('+data.notReadMessageCnt+')</small>');
		                		} else {
		                			target.first().find('a').children('small').text('('+data.notReadMessageCnt+')');
		                		}
		                	}
		                	if(data.messagePrivateBoxs.length > 0){
		                		var url = target.eq(3).children('a').data('href');
		                		var params = $.poizn.contents.getParam();
		                        var txt = "";
		                        txt+='<ul class="nav nav-sub-sidebar collapse in" id="right-menu-3-3">';
		                        for(var i = 0; i < data.messagePrivateBoxs.length ; i++){
		                        	txt+='<li';
		                        	if(url == window.location.pathname) {
		                        		if(params) {
				                        	if(data.messagePrivateBoxs[i].messageGroupId == params.messageGroupId){
				                        		txt+=' class="active"';
				                        	}
		                        		}
		                        	}
		                        	txt+='><a href="'+url+'?messageGroupId='+data.messagePrivateBoxs[i].messageGroupId+'" title="'+data.messagePrivateBoxs[i].messageGroupNm+'">'+data.messagePrivateBoxs[i].messageGroupNm+'</a></li>';
		                        }
		                        txt += '</ul>';
		                		target
	                			.eq(3)
	                			.children('a')
	                			.attr('href', '#right-menu-3-3')
	                			.attr('role', 'button')
	                			.attr('data-toggle', 'collapse')
	                			.attr('aria-expanded', 'true')
	                			.attr('aria-controls', '#right-menu-3-3');
		                		target
	                			.eq(3)
	                			.children('ul')
	                			.remove();
		                		target
	                			.eq(3)
	                			.append(txt);
		                	}
		                }
		            });
					break;
				case "J": // 마이페이지
					break;
				case "K": // 시스템관리
					break;
				}
			});
			menu.find('ul.nav-sidebar-left li.active a[role=tab]').trigger('shown.bs.tab');
		},
		setBackground: function() {
			var menu = this;
			var opt = menu.data();
			if( opt.target != undefined ) {
				$(opt.target).click(function() {
					var o = $(this).data();
					if( o.target != undefined ) {
						$(o.target).addClass("active");
					}
					if( $(".sidebarBack").length < 1 ) {
						var sidebarBack = $("<div class='sidebarBack hidden-lg'></div>");
						sidebarBack.addClass("active");
						sidebarBack.click(function() {
							$(o.target).removeClass("active");
							sidebarBack.removeClass("active");
						});
						$(o.target).after(sidebarBack);
					} else {
						$(".sidebarBack").addClass("active");
					}
				});
			}
			return this;
		},
		init: function(options) {
			var defaults = {
			};
			var _options = $.extend(true, defaults, options);
			var menu = this;
			var opt = menu.data();

			menuActions.setBackground.apply(this);
			menuActions.setFunc.apply(this);


			return this;
		}
	};
	$.fn.menu = function(action) {
		if( menuActions[action] ) {
			return menuActions[action].apply(this, Array.prototype.slice.call(arguments, 1));
		} else {
			return menuActions.init.apply(this, arguments);
		}
	};
})($);