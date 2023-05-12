<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
				</li>

				<li><a href="quan-ly-tin-tuc">Quản Lý</a></li>
				<li class="active">Quản Lý Tin Tức</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					Bảng thống kê các tin tức
				</h1>
			</div>
			<c:if test="${param.message == 'Cập nhật thành công !!!'}">
			<div class="page-header" style="color:green;">
				<h2>Cập nhật thành công !!!</h2>
			</div>
			</c:if>
			<!-- /.page-header -->
			<!-- begin row -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các tin tức đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
											<!-- /.nav-search -->
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-success dropdown-toggle"
													aria-expanded="true">
													Bộ lọc ngày đăng bài<span
														class="ace-icon fa fa-caret-down icon-on-right"></span>
												</button>
												<ul class="dropdown-menu dropdown-warning">
													<li><a href="${pageContext.request.contextPath}/admin/searchYear?year=2023">
													2023</a></li>
													<li class="divider"></li>
													<li><a href="${pageContext.request.contextPath}/admin/searchYear?year=2022">
													2022</a></li>
													<li class="divider"></li>
													<li><a href="${pageContext.request.contextPath}/admin/searchYear?year=2021">
													2021</a></li>
												</ul>
											</div>
									</div>
									<div class="col-xs-6">
										<div class="nav-search " id="nav-search">
											<form id="form-search" class="form-search" method="post"
												action="${pageContext.request.contextPath}/admin/search-news" >
												<span class="input-icon"> 
												<input type="text"
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
									<table id="dynamic-table"
										class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center"><label class="pos-rel"> <input
														type="checkbox" class="checkall"
														onclick="toggleChecked(this.checked)" /> <span
														class="lbl"></span>
												</label></th>
												<th class="hidden">Id</th>
												<th class="center">Trạng thái</th>
												<th class="center">Tên tin tức</th>
												<th class="center">Ngày đăng bài</th>
												<th class="center">Chức năng</th>
											</tr>
										</thead>

										<tbody id="tbody">
											<c:forEach items="${listTop6News}" var="o">
												<tr class="product-brand-number">
													<td class="center"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>
													<td class="hidden">${o.news_id}</td> 
													<td class="center">
													<span class="label label-success arrowed">${o.news_status}</span>
													</td>
													<td>${o.news_description}</td>
													<td class="center">${o.news_post_date} </td>
													<td class="center">
														<div class="hidden-sm hidden-xs action-buttons">
															<a class="green" title="Chỉnh sửa"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> 
															<a class="red delete_single" title="Xóa"> <i
																class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
														</div>
														<div class="hidden-md hidden-lg">
															<div class="inline pos-rel">
																<button
																	class="btn btn-minier btn-yellow dropdown-toggle"
																	data-toggle="dropdown" data-position="auto">
																	<i
																		class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
																</button>

																<ul
																	class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																	<li><a href="#" class="tooltip-info"
																		data-rel="tooltip" title="View"> <span
																			class="blue"> <i
																				class="ace-icon fa fa-search-plus bigger-120"></i>
																		</span>
																	</a></li>

																	<li><a class="tooltip-success" data-rel="tooltip">
																			<span class="green"> <i
																				class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																		</span>
																	</a></li>

																	<li><a class="tooltip-error" data-rel="tooltip">
																			<span class="red"> <i
																				class="ace-icon fa fa-trash-o bigger-120"></i>
																		</span>
																	</a></li>
																</ul>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div class="row">
										<div class="col-xs-6">
											<button class="deleteall btn btn-danger"
												title="dynamic-table">Xóa đã chọn</button>
											<button class="btn btn-primary addNews"
												title="Thêm tin tức">Thêm tin tức</button>

										</div>
										<div class="col-xs-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dynamic-table_paginate">
												
												<ul class="pagination" id="pagination">
													<li aria-controls="dynamic-table"
														id="dynamic-table_previous"><a
														class="paginate_button previous ${(tag==null||tag==1) ? "
														hidden " : "" }" href="quan-ly-tin-tuc?trang=${tag - 1}">Previous</a></li>
													<c:forEach begin="1" end="${endPage}" var="i">
														<li aria-controls="dynamic-table" tabindex="${i}"><a
															class='paginate_button ${tag == i ? "active" : ""}'
															href="quan-ly-tin-tuc?trang=${i}">${i}</a></li>
													</c:forEach>
													<li aria-controls="dynamic-table" id="dynamic-table_next"><a
														class='paginate_button next ${tag==endPage ? "hidden" : "" }'
														href="quan-ly-tin-tuc?trang=${tag + 1}">Next</a></li>
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
$('button.addNews').on("click", function(event) {
	location.assign("/CharityApp/admin/them-tin-tuc");
});
$('a.green').on("click",function(event) {
	var idValue = this.parentNode.parentNode.parentNode
			.getElementsByTagName('td')[1].textContent;
	location.assign("/CharityApp/admin/cap-nhat-tin-tuc?id="+ idValue);
});
$(document).ready(function() {
	//function is used to delete individual row
	$('a.delete_single').on("click",function(event) {
		var $this = $(this);
		var idValue = this.parentNode.parentNode.parentNode
				.getElementsByTagName('td')[1].textContent;
		console.log(idValue);
		var c = confirm('Bạn muốn xóa dòng này chứ?\nClick Ok để tiếp tục\nClick cancle nếu bạn chưa muốn xóa !!!');
		if (c) {
			$.ajax({
				url : "/CharityApp/admin/quan-ly-tin-tuc",
				type : 'GET',
				data : {
					id : idValue,
					action : 'deleteNews'
				},
				success : function(response) {
					alert('Xóa Thành Công!');
					location.assign("/CharityApp/admin/quan-ly-tin-tuc");
				},
				error : function() {
					alert('Xóa Thất Bại');
					location.assign("/CharityApp/admin/quan-ly-tin-tuc");
				}
			});
			$this.parents('tr').fadeOut(function() {
				$this.remove(); //remove row when animation is finished
			});
		} else {
			alert('Xóa Thất Bại');
		}
		return false;
});

	//function is used to delete selected row
	$('button.deleteall').on("click",function(event) {
		var tb = $(this).attr('title');
		console.log(tb);
		var sel = false;
		var ch = $('#' + tb).find('tbody input[type=checkbox]');
		console.log(ch);
		var c = confirm('Bạn muốn xóa những dòng này chứ?\nClick Ok để tiếp tục!!!\nClick cancle nếu bạn chưa muốn xóa !!!');
		if (c) {
			ch.each(function() {
				var $this = $(this);
				var idValue = this.parentNode.parentNode.parentNode
						.getElementsByTagName('td')[1].textContent;
				if ($this.is(':checked')) {
					sel = true; //set to true if there is/are selected row
					$.ajax({
						url : "/CharityApp/admin/quan-ly-tin-tuc",
						type : 'GET',
						data : {
							id : idValue,
							action : 'deleteNews'
						},
						success : function(response) {
						},
						error : function() {
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
</script>