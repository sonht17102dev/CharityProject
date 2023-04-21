package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonhtFX17102.entities.Account;

@Service
public interface IAccountService {
	public int getCountAllAccount();
	public List<Account> getPagingPage(int index);
	public Account checkAccountByMailExist(String mail);
	public void insertAccount(String account_role, String account_mail, String account_name, String account_phone,
			long total_donated, String account_password, String account_status) ;
	public Account getAccountByID(int id);
	public void updateAccount(int account_id, String account_role, String account_mail, String account_name,
			String account_phone, long total_donated, String account_password, String account_status);
	public void updateRole(int id, String role);
	public List<Account> getAccountEnabled(int enabled);
	public void deleteAccountById(int id);
	public void updateStatus(String account_mail);
}
