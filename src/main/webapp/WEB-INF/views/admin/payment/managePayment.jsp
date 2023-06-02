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
				<c:if test="${messagePayment!=null}">
					alert('${messagePayment}');
					location.assign("/CharityApp/admin/quan-ly-thanh-toan");
				</c:if>
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
				</li>

				<li><a href="quan-ly-thanh-toan">Quản Lý</a></li>
				<li class="active">Quản Lý Thanh Toán</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1 class="text-center">Bảng thống kê thông tin thanh toán của các đợt quyên góp</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các thông tin thanh toán quyên góp đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
											<!-- /.nav-search -->
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-success dropdown-toggle"
													aria-expanded="true">
													Thể Loại<span
														class="ace-icon fa fa-caret-down icon-on-right"></span>
												</button>
												<ul class="dropdown-menu dropdown-warning">
													<li><a href="searchByStatus?type=pending">Đang chờ</a></li>
													<li class="divider"></li>
													<li><a href="searchByStatus?type=paid">Đã thanh toán</a></li>
													<li class="divider"></li>
												</ul>
											</div>
									</div>
									<div class="col-xs-6">
										<div class="nav-search " id="nav-search">
											<form id="form-search" class="form-search" action="search-payment" method="post">
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
												<th class="center">Tên đợt quyên góp</th>
												<th class="center">Địa chỉ mail</th>
												<th class="center">Số tiền</th>
												<th class="center">Ngày tháng</th>
												<th class="center">Chức năng</th>
											</tr>
										</thead>

										<tbody id="tbody">
											<c:forEach items="${listTop5Payment}" var="o">
												<%-- c:if test='${o.circum_status == "active"}'>--%>
												<tr class="product-brand-number">
													<td class="center"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>
													<td class="hidden">${o.circum_order_id}</td> 
													<c:if test="${o.circum_status == 'pending'}">
													<td class="center">
													<span class="label label-xlg label-primary arrowed-in-right arrowed-in">Đang chờ</span>
													</td>
													</c:if>
													<c:if test="${o.circum_status == 'paid'}">
													<td class="center">
													<span class="label label-xlg label-success arrowed-in-right arrowed-in">Đã thanh toán</span>
													</td>
													</c:if>
													<td>${o.circum_name}</td>
													<td class="center">${o.circum_order_mail}</td>
													<td class="center">${o.circum_order_amount}</td>
													<td class="center">${o.circum_order_date}</td>
													<td class="center">
														<div class="btn-group ">
															<button data-toggle="dropdown" 
															class="btn btn-success dropdown-toggle" 
															aria-expanded="false">Xác nhận GD
																<span class="ace-icon fa fa-caret-down icon-on-right"></span>
															</button>
															<ul class="dropdown-menu dropdown-success dropdown-menu-right">
																<li>
																	<a class="pending">Đang chờ</a>
																</li>
			
																<li class="divider"></li>
			
																<li>
																	<a class="paid">Đã nhận</a>
																</li>
															</ul>
														</div>
													</td>
												</tr>
													<%-- </c:if> --%> 
											</c:forEach>
										</tbody>
									</table>
									<div class="row">
										<div class="col-xs-6">

										</div>
										<div class="col-xs-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dynamic-table_paginate">
												
												<ul class="pagination" id="pagination">
													<li aria-controls="dynamic-table"
														id="dynamic-table_previous"><a
														class='paginate_button previous ${(tag==null||tag==1) ? 
														"hidden" : "" }' href="quan-ly-thanh-toan?trang=${tag - 1}">Previous</a></li>
													<c:forEach begin="1" end="${endPage}" var="i">
														<li aria-controls="dynamic-table" tabindex="${i}"><a
															class='paginate_button ${tag == i ? "active" : ""}'
															href="quan-ly-thanh-toan?trang=${i}">${i}</a></li>
													</c:forEach>
													<li aria-controls="dynamic-table" id="dynamic-table_next"><a
														class='paginate_button next ${tag==endPage ? "hidden" : "" }'
														href="quan-ly-thanh-toan?trang=${tag + 1}">Next</a></li>
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
		</div>
		<!-- /.page-content -->
	</div>
</div>
<script type="text/javascript">
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

	});

	function toggleChecked(status) {
		$(".checkbox").each(function() {
			$(this).attr("checked", status);
		})
	}
	
</script>


