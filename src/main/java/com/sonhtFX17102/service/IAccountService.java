package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sonhtFX17102.DTO.AccountDetailsDTO;
import com.sonhtFX17102.entities.Account;

@Service
public interface IAccountService {
	public int getCountAllAccount();
	public List<Account> getPagingPage(int index);
	public Account checkAccountByMailExist(String mail);
	public void insertAccount(String account_role, String account_mail, String account_name,
			String account_phone, String account_password, String account_status, int enabled) ;
	public Account getAccountByID(int id);
	public void updateAccount(int account_id, String account_role, String account_mail,
			String account_name, String account_phone);
	public void updateRole(int id, String role);
	public List<Account> getAccountEnabled(int enabled);
	public void updateEnabled(String id) ;
	public void deleteAccountById(int id);
	public void updateStatusOffline(String account_name);
	public void updateStatusOnline(String account_name);
	public List<Account> getAccountsByRole(String role);
	public List<Account> getAccountsByKey(String key);
	public void updatePasswordByUsername(String pass, String username);
	public void updatePasswordByMail(String pass, String mail);
	public AccountDetailsDTO getAccountDetails(int id);
	public void updateAccountDetailsByUser(
			int account_id, String account_firstName, String account_lastName,
			String account_address, String account_birthday, String account_organization,
			String account_name, String account_phone, String account_bank, String account_bankname);
	public void addAccountDetailsByUser(int account_id, String account_firstName, String account_lastName,
			String account_image, String account_address, String account_birthday, String account_organization,
			int total_donated, String account_bank, String account_bankname);
	public AccountDetailsDTO getAccountDetailsByUsername(String username);
	public void uploadAvatar(String image, String id);
	public Account getAccountByUsername(String username);
}
