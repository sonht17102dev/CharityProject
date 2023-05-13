package com.sonhtFX17102.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.PayDAO;
import com.sonhtFX17102.service.IPayService;

@Service
public class PayImpl implements IPayService {
	private PayDAO payDAO;

	@Autowired
	public PayImpl(PayDAO payDAO) {
		this.payDAO = payDAO;
	}

	@Override
	public void insertPayInfo(int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date) {
		payDAO.insertPayInfo(circum_id, circum_order_name, circum_order_mail, circum_order_phone,
				circum_order_bank, circum_order_bankname, circum_order_address,
				circum_order_amount, circum_order_date);
	}

}
