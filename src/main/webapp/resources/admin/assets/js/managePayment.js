	$(document).ready(function() {
		$('a.pending').on("click",function(event) {
			var idValue = this.parentNode.parentNode.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[1].textContent;
			console.log(idValue);
			location.assign("/CharityApp/admin/payment?type=pending&id="+ idValue);
		});
		$('a.paid').on("click",function(event) {
			var idValue = this.parentNode.parentNode.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[1].textContent;
			console.log(idValue);
			location.assign("/CharityApp/admin/payment?type=paid&id="+ idValue);
		});
		$('button#btn-inactive-order').on("click", function(event) {
			location.assign("/CharityApp/admin/searchOrder?status=inactive");
		});
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
					//console.log(idValue)
					var status = this.parentNode.parentNode.parentNode
						.getElementsByTagName('td')[2].textContent;
					//console.log(status);
					if ($this.is(':checked')) {
						sel = true; //set to true if there is/are selected row
						$.ajax({
							url : "/CharityApp/admin/quan-ly-thanh-toan",
							type : 'GET',
							data : {
								id : idValue,
								action : 'deleteCircum',
								status : status
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
	