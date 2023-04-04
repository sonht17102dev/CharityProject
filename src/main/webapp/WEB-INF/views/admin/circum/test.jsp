<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
				</li>

				<li><a href="quan-ly-quyen-gop">Quản Lý</a></li>
				<li class="active">Quản Lý Quyên Góp</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>Bảng thống kê các đợt quyên góp</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="hr hr-18 dotted hr-double"></div>

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các hoạt động quyên góp đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
										<div class="btn-toolbar">

											<!-- /.nav-search -->
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-success dropdown-toggle"
													aria-expanded="true">
													Thể Loại<span
														class="ace-icon fa fa-caret-down icon-on-right"></span>
												</button>
												<ul class="dropdown-menu dropdown-warning">
													<c:forEach items="${category}" var="c">
														<li><a href="search?type=${c}">${c}</a></li>
														<li class="divider"></li>
													</c:forEach>
												</ul>
											</div>

										</div>
									</div>
									<div class="col-xs-6">
										<div class="nav-search " id="nav-search">
											<form id="form-search" class="form-search" action="search" method="post">
												<span class="input-icon"> <input type="text"
													placeholder="Search Từ khóa" class="nav-search-input"
													id="nav-search-input" name="nav-search-input" autocomplete="off" /> <i
													class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</form>
										</div>
									</div>
								</div>
								<div id="dynamic-table_wrapper"
									class="dataTables_wrapper form-inline no-footer">
									
									<div class="row">
										<div class="col-xs-6">
											<button class="deleteall btn btn-danger"
												title="dynamic-table">Xóa đã chọn</button>
											<button class="btn btn-primary addCircum"
												title="Thêm quyên góp">Thêm quyên góp</button>

										</div>
										<div class="col-xs-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dynamic-table_paginate">
												<ul class="pagination" id="pagination">
												
												</ul>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
</div>
<script type="text/javascript">
var currentPage = 1;
var perPage = 10;
$(function () {
    window.pagObj = $('#pagination').twbsPagination({
        totalPages: 2,
        visiblePages: 10,
        onPageClick: function (event, page) {
            //console.info(page + ' (from options)');
        	$.ajax({
        	    url: '/CharityApp/admin/quan-ly-quyen-gop',
        	    method: 'GET',
        	    //data: { page: page, perPage: perPage },
        	    success: function(data) {
        	      $('#dynamic-table_wrapper').html(data.html);
        	      $('#pagination').html(data.pagination);
        	      currentPage = page;
        	      //console.log(data);
        	    }
        	  });
        }
    }).on('page', function (event, page) {
        //console.info(page + ' (from event listening)');
    });
});
function fetchData(page) {
  
}
/*
$(document).ready(function() {
  $('#pagination').on('click', '.page-link', function() {
    var page = $(this).data('page');
    fetchData(page);
  });

  fetchData(currentPage);
});
*/
	$('button.addCircum').on("click", function(event) {
		location.assign("/CharityApp/admin/them-quyen-gop");
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
</script>


