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
				<c:if test="${messagePartner!=null}">
					alert('${messagePartner}');
					location.assign("/CharityApp/admin/quan-ly-doi-tac");
				</c:if>
			</script>
			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="home">Home</a>
				</li>

				<li><a href="quan-ly-doi-tac">Quản Lý</a></li>
				<li class="active">Quản Lý Đối Tác</li>
			</ul>
			<!-- /.breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1 class="text-center">
					Bảng thống kê các đối tác đồng hành
				</h1>
			</div>
			<!-- /.page-header -->
			<!-- begin row -->
			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">Danh sách các đối tác đang hoạt động</div>
							<!-- div.dataTables_borderWrap -->
							<div>
								<div class="row">

									<div class="col-xs-6">
											<!-- /.nav-search -->
											<div class="btn-group">
												<button data-toggle="dropdown"
													class="btn btn-success dropdown-toggle"
													aria-expanded="true">
													Bộ lọc<span
														class="ace-icon fa fa-caret-down icon-on-right"></span>
												</button>
												<ul class="dropdown-menu dropdown-warning">
													<li><a href="${pageContext.request.contextPath}/admin/search-money">
													Tổng tiền quyên góp > 2 tỷ</a></li>
													<li class="divider"></li>
													<li><a href="${pageContext.request.contextPath}/admin/search-project">
													Tổng số dự án > 30</a></li>
												</ul>
											</div>
									</div>
									<div class="col-xs-6">
										<div class="nav-search " id="nav-search">
											<form id="form-search" class="form-search" method="post"
											action="${pageContext.request.contextPath}/admin/search-partner" >
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
												<th class="center">Tên đối tác</th>
												<th class="center">Logo</th>
												<th class="center">Tổng số tiền nhận (Đơn vị: triệu đồng)</th>
												<th class="center">Tổng các dự án </th>

												<th class="center">Chức năng</th>
											</tr>
										</thead>

										<tbody id="tbody">
											<c:forEach items="${listTop5Partner}" var="o">
											<c:set var="money" value="${o.partner_total_money}"/>
												<tr class="product-brand-number">
													<td class="center"><label class="pos-rel"> <input
															type="checkbox" class="checkbox" /> <span class="lbl"></span>
													</label></td>
													<td class="hidden">${o.partner_id}</td> 
													<td class="center"><span class="label label-success arrowed">${o.partner_status}</span></td>
													<td>${o.partner_name}</td>
													<td class="center"><img src="${o.partner_logo}" width="70" height="30"></td>
													
													<c:if test="${money <= 1000}">
													<td class="center">${money==0?"Đang cập nhật": money} </td>
													</c:if>
													<c:if test="${money > 1000}">
													<td class="center">
													<fmt:formatNumber type = "number" 
         										pattern = "###,###" value = "${money==0?'Đang cập nhật': money}" /> </td>
													</c:if>
													<td class="center">${o.partner_number_donate==0?"Đang cập nhật":o.partner_number_donate} </td>
													<td class="center">
														<div class="">
															<a class="green" title="Chỉnh sửa"> <i
																class="ace-icon fa fa-pencil bigger-130"></i>
															</a> 
															<a class="red delete_single" title="Xóa"> <i
																class="ace-icon fa fa-trash-o bigger-130"></i>
															</a>
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
											<button class="btn btn-primary addPartner"
												title="Thêm đối tác">Thêm đối tác</button>
											<button class="btn btn-warning" 
												id = "btn-inactive-partner"
												title="Xem danh sách đã xóa">Xem danh sách đã xóa</button>
										</div>
										<div class="col-xs-6">
											<div class="dataTables_paginate paging_simple_numbers"
												id="dynamic-table_paginate">
												
												<ul class="pagination" id="pagination">
													<li aria-controls="dynamic-table"
														id="dynamic-table_previous"><a
														class="paginate_button previous ${(tag==null||tag==1) ? "
														hidden " : "" }" href="quan-ly-doi-tac?trang=${tag - 1}">Previous</a></li>
													<c:forEach begin="1" end="${endPage}" var="i">
														<li aria-controls="dynamic-table" tabindex="${i}"><a
															class='paginate_button ${tag == i ? "active" : ""}'
															href="quan-ly-doi-tac?trang=${i}">${i}</a></li>
													</c:forEach>
													<li aria-controls="dynamic-table" id="dynamic-table_next"><a
														class='paginate_button next ${tag==endPage ? "hidden" : "" }'
														href="quan-ly-doi-tac?trang=${tag + 1}">Next</a></li>
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


<script type="text/javascript" src="<c:url value="/resources/admin/assets/js/managePartner.js"/>">
</script>