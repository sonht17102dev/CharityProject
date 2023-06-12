$('button.addAccount').on("click", function(event) {
		location.assign("/CharityApp/admin/them-tai-khoan");
	});
$('button#btn-inactive-account').on("click", function(event) {
		location.assign("/CharityApp/admin/searchAccountInactive");
	});
	$('a.green').on("click",function(event) {
		var idValue = this.parentNode.parentNode.parentNode
			.getElementsByTagName('td')[1].textContent;
		location.assign("/CharityApp/admin/cap-nhat-tai-khoan?id="+ idValue);
	});
		$('a.reactivate').on("click",function(event) {
			var idValue = this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[1].textContent;
			console.log(idValue);
			location.assign("/CharityApp/admin/reactivate?id="+ idValue);
		});
	$(document).ready(function() {

		//function is used to delete individual row
		$('a.delete_single').on("click",function(event) {
			var $this = $(this);
			var roleValue = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[2].textContent;
			var idValue = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[1].textContent;
			var status = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[6].textContent;
			
			//console.log(status);
			if(roleValue === 'ADMIN') {
					alert('Không được xóa admin!!!');
			} else {
				var c = confirm('Bạn muốn xóa dòng này chứ?\nClick Ok để tiếp tục\nClick cancle nếu bạn chưa muốn xóa !!!');
				if (c) {
					$.ajax({
						url : "/CharityApp/admin/quan-ly-tai-khoan",
						type : 'GET',
						data : {
							id : idValue,
							action : 'deleteAccount',
							role : roleValue
						},
						success : function(response) {
							alert('Xóa thành công !!!');
							location.assign("/CharityApp/admin/quan-ly-tai-khoan");
						}
					});
													
				} else {
					alert('Xóa Thất Bại !!!');
				}
				return false;
			}
		});

		//function is used to delete selected row
		$('button.deleteall').on("click",function(event) {
			var tb = $(this).attr('title');
			var sel = false;
			var ch = $('#' + tb).find('tbody input[type=checkbox]');
			var c = confirm('Bạn muốn xóa những dòng này chứ?\nClick Ok để tiếp tục!!!\nClick cancle nếu bạn chưa muốn xóa !!!');
			if (c) {
				ch.each(function() {
					var $this = $(this);
					var idValue = this.parentNode.parentNode.parentNode
							.getElementsByTagName('td')[1].textContent;
					var role = this.parentNode.parentNode.parentNode
							.getElementsByTagName('td')[2].textContent;
					if ($this.is(':checked')) {
						sel = true; //set to true if there is/are selected row
						$.ajax({
							url : "/CharityApp/admin/quan-ly-tai-khoan",
							type : 'GET',
							data : {
								id : idValue,
								action : 'deleteAccount',
								role : role
							},
							success : function(response) {
							}
					});
					$this.parents('tr').fadeOut(function() {
						$this.remove(); //remove row when animation is finished
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