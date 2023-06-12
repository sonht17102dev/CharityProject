$('button.addCircum').on("click", function(event) {
		location.assign("/CharityApp/admin/them-quyen-gop");
	});
$('button#btn-inactive-circum').on("click", function(event) {
		location.assign("/CharityApp/admin/searchCircum?status=inactive");
	});
	$('a.green').on(
			"click",
			function(event) {
				var idValue = this.parentNode.parentNode.parentNode
						.getElementsByTagName('td')[1].textContent;
				location.assign("/CharityApp/admin/cap-nhat-quyen-gop?id="
						+ idValue);
			});
	$(document)
			.ready(
					function() {
						//function is used to delete individual row
						$('a.delete_single')
								.on(
										"click",
										function(event) {
											var $this = $(this);
											var idValue = this.parentNode.parentNode.parentNode
													.getElementsByTagName('td')[1].textContent;
											var status = this.parentNode.parentNode.parentNode
											.getElementsByTagName('td')[2].textContent;
											//console.log(status);
											var c = confirm('Bạn muốn xóa dòng này chứ?\nClick Ok để tiếp tục\nClick cancle nếu bạn chưa muốn xóa !!!');
											if (c) {
												$
														.ajax({
															url : "/CharityApp/admin/quan-ly-quyen-gop",
															type : 'GET',
															data : {
																id : idValue,
																action : 'deleteCircum',
																status : status
															},
															success : function(
																	response) {
																alert('Xóa Thành Công!');
															},
															error : function() {
																alert('Xóa Thất Bại');
															}
														});
												$this.parents('tr').fadeOut(
														function() {
															$this.remove(); //remove row when animation is finished
														});
											} else {
												alert('Xóa Thất Bại');
											}
											return false;
										});

						//function is used to delete selected row
						$('button.deleteall')
								.on(
										"click",
										function(event) {
											var tb = $(this).attr('title');
											var sel = false;
											var ch = $('#' + tb)
													.find(
															'tbody input[type=checkbox]');
											var c = confirm('Bạn muốn xóa những dòng này chứ?\nClick Ok để tiếp tục!!!\nClick cancle nếu bạn chưa muốn xóa !!!');
											if (c) {
												ch
														.each(function() {
															var $this = $(this);
															var idValue = this.parentNode.parentNode.parentNode
																	.getElementsByTagName('td')[1].textContent;
															var status = this.parentNode.parentNode.parentNode
															.getElementsByTagName('td')[2].textContent;
															//console.log(status);
															if ($this
																	.is(':checked')) {
																sel = true; //set to true if there is/are selected row
																$
																		.ajax({
																			url : "/CharityApp/admin/quan-ly-quyen-gop",
																			type : 'GET',
																			data : {
																				id : idValue,
																				action : 'deleteCircum',
																				status : status
																			},
																			success : function(
																					response) {
																			}
																		});
																$this
																		.parents(
																				'tr')
																		.fadeOut(
																				function() {
																					$this
																							.remove(); //remove row when animation is finished
																				});
															}
														});
												if (sel)
													alert("Xóa Thành Công!");
												if (!sel)
													alert('Xóa Thất Bại - Không có trường nào được chọn');
											}
											return false;
										});
					});

	function toggleChecked(status) {
		$(".checkbox").each(function() {
			$(this).attr("checked", status);
		})
	}