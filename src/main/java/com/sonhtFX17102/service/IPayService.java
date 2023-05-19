package com.sonhtFX17102.service;

import java.util.List;

import com.sonhtFX17102.entities.CircumOrder;

public interface IPayService {
	public void insertPayInfo(int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date, String circum_name);
	public List<CircumOrder> getCircumOrderByUsername(String username);
}
