package com.sonhtFX17102.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.AccountDAO;
import com.sonhtFX17102.DTO.AccountDetailsDTO;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.service.IAccountService;

@Service
public class AccountImpl implements IAccountService {
	@Autowired
	private AccountDAO accountDAO;

	@Override
	public int getCountAllAccount() {
		// TODO Auto-generated method stub
		return accountDAO.getCountAllAccount();
	}

	@Override
	public List<Account> getPagingPage(int index) {
		// TODO Auto-generated method stub
		return accountDAO.getPagingPage(index);
	}

	@Override
	public Account checkAccountByMailExist(String mail) {
		// TODO Auto-generated method stub
		return accountDAO.checkAccountByMailExist(mail);
	}

	@Override
	public Account getAccountByID(int id) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountByID(id);
	}

	@Override
	public void updateRole(int id, String role) {
		// TODO Auto-generated method stub
		accountDAO.updateRole(id, role);
	}

	@Override
	public void updateAccount(int account_id, String account_role, String account_mail, String account_name,
			String account_phone) {
		// TODO Auto-generated method stub
		accountDAO.updateAccount(account_id, account_role, account_mail, account_name, account_phone);
	}

	@Override
	public void insertAccount(String account_role, String account_mail, String account_name, String account_phone,
			String account_password, String account_status) {
		// TODO Auto-generated method stub
		accountDAO.insertAccount(account_role, account_mail, account_name, account_phone, account_password,
				account_status);
	}

	@Override
	public List<Account> getAccountEnabled(int enabled) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountEnabled(enabled);
	}

	@Override
	public void deleteAccountById(int id) {
		// TODO Auto-generated method stub
		accountDAO.deleteAccountById(id);
	}

	@Override
	public void updateStatusOffline(String account_name) {
		// TODO Auto-generated method stub
		accountDAO.updateStatusOffline(account_name);
	}

	@Override
	public void updateStatusOnline(String account_name) {
		// TODO Auto-generated method stub
		accountDAO.updateStatusOnline(account_name);
	}

	@Override
	public List<Account> getAccountsByRole(String role) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountsByRole(role);
	}

	@Override
	public List<Account> getAccountsByKey(String key) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountsByKey(key);
	}

	@Override
	public void updatePasswordByEmail(String pass, String email) {
		// TODO Auto-generated method stub
		accountDAO.updatePasswordByEmail(pass, email);
	}

	@Override
	public void updateAccountDetailsByUser(int account_id, String account_firstName, String account_lastName,
			String account_address, String account_birthday, String account_organization, String account_name,
			String account_phone) {
		// TODO Auto-generated method stub
		accountDAO.updateAccountDetailsByUser(account_id, account_firstName, account_lastName, account_address,
				account_birthday, account_organization, account_name, account_phone);
	}

	@Override
	public AccountDetailsDTO getAccountDetails(int id) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountDetails(id);
	}

	@Override
	public AccountDetailsDTO getAccountDetailsByMail(String mail) {
		// TODO Auto-generated method stub
		return accountDAO.getAccountDetailsByMail(mail);
	}

	@Override
	public void uploadAvatar(String image, String id) {
		// TODO Auto-generated method stub
		accountDAO.uploadAvatar(image, id);
	}


}
