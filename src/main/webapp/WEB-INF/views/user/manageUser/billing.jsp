<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="container-xl px-4 mt-4" style="margin-top: 50px !important;">
	<%@ include file="/WEB-INF/views/user/manageUser/menu.jsp"%>

	<div class="card mb-4">
		<div class="card-header">Lịch sử quyên góp</div>
		<div class="card-body p-0">

			<div class="table-responsive table-billing-history">
				<table class="table mb-0">
					<thead>
						<tr>
							<th class="border-gray-200" scope="col">Transaction ID</th>
							<th class="border-gray-200" scope="col">Ngày</th>
							<th class="border-gray-200" scope="col">Tổng tiền</th>
							<th class="border-gray-200" scope="col">Trạng thái</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>#39201</td>
							<td>06/15/2021</td>
							<td>$29.99</td>
							<td><span class="badge bg-light text-dark">Đang chờ</span></td>
						</tr>
						<tr>
							<td>#38594</td>
							<td>05/15/2021</td>
							<td>$29.99</td>
							<td><span class="badge bg-success">Đã nhận</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>