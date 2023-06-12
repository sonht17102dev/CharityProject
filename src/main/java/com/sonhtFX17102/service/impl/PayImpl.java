package com.sonhtFX17102.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.PayDAO;
import com.sonhtFX17102.entities.CircumOrder;
import com.sonhtFX17102.service.IPayService;

@Service
public class PayImpl implements IPayService {
	private PayDAO payDAO;

	@Autowired
	public PayImpl(PayDAO payDAO) {
		this.payDAO = payDAO;
	}

	@Override
	public List<CircumOrder> getCircumOrderByUsername(String username) {
		// TODO Auto-generated method stub
		return payDAO.getCircumOrderByUsername(username);
	}

	@Override
	public void insertPayInfo(int circum_id, String circum_order_name, String circum_order_mail,
			String circum_order_phone, String circum_order_bank, String circum_order_bankname,
			String circum_order_address, int circum_order_amount, String circum_order_date,
			String circum_name, String circum_status) {
		// TODO Auto-generated method stub
		payDAO.insertPayInfo(circum_id, circum_order_name, circum_order_mail, circum_order_phone, circum_order_bank,
				circum_order_bankname, circum_order_address, circum_order_amount, circum_order_date,
				circum_name, circum_status);
	}

	@Override
	public int getCountAllPayment() {
		// TODO Auto-generated method stub
		return payDAO.getCountAllPayment();
	}

	@Override
	public List<CircumOrder> getPagingPage(int index) {
		// TODO Auto-generated method stub
		return payDAO.getPagingPage(index);
	}

	@Override
	public void updateStatusById(String type, int id) {
		// TODO Auto-generated method stub
		payDAO.updateStatusById(type, id);
	}

	@Override
	public List<CircumOrder> findByName(String keyword) {
		// TODO Auto-generated method stub
		return payDAO.findByName(keyword);
	}

	@Override
	public List<CircumOrder> findPaymentByType(String typeStatus) {
		// TODO Auto-generated method stub
		return payDAO.findPaymentByType(typeStatus);
	}

	@Override
	public void updateStatus(int id, String status) {
		// TODO Auto-generated method stub
		payDAO.updateStatus(id, status);
	}

	@Override
	public List<CircumOrder> findOrderInactive(String status) {
		// TODO Auto-generated method stub
		return payDAO.findOrderInactive(status);
	}

}
