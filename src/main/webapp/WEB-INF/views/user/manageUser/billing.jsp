<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<div class="container-xl px-4 mt-4" style="margin-top: 70px !important;">
	<%@ include file="/WEB-INF/views/user/manageUser/menu.jsp"%>

	<div class="card mb-4">
		<div class="card-header">Lịch sử quyên góp</div>
		
		<div class="card-body p-0">

		<c:if test="${listOrders.isEmpty()}">
			<h2 class="deepPink font-larger text-center">Bạn chưa có lịch sử quyên góp !!!</h2>		
		</c:if>
		<c:if test="${!listOrders.isEmpty()}">
			<div class="table-responsive table-billing-history">
				<table class="table mb-0">
					<thead>
						<tr>
							<th class="border-gray-200" scope="col">Ngày</th>
							<th class="border-gray-200" scope="col">Tên hoàn cảnh</th>
							<th class="border-gray-200" scope="col">Tổng tiền (đv: nghìn đồng)</th>
							<th class="border-gray-200" scope="col">Trạng thái</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${listOrders}" var="o">
						<tr>
							<td>${o.circum_order_date}</td>
							<td>${o.circum_name}</td>
							<td>${o.circum_order_amount}</td>
							<c:if test="${o.circum_status == 'pending'}">
								<td><span class="badge bg-light text-dark">Đang chờ</span></td>
							</c:if>
							<c:if test="${o.circum_status == 'paid'}">
								<td><span class="badge bg-success">Đã nhận</span></td>
							</c:if>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		</div>
	</div>
</div>