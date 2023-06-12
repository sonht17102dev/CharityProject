package com.sonhtFX17102.service;

import java.util.List;

import com.sonhtFX17102.entities.CircumOrder;

public interface IPayService {
	public void insertPayInfo(int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date,
			String circum_name, String circum_status);
	public List<CircumOrder> getCircumOrderByUsername(String username);
	public int getCountAllPayment();
	public List<CircumOrder> getPagingPage(int index);
	public void updateStatusById(String type, int id);
	public List<CircumOrder> findByName(String keyword);
	public List<CircumOrder> findPaymentByType(String typeStatus) ;
	public void updateStatus(int id, String status);
	public List<CircumOrder> findOrderInactive(String status);
}
