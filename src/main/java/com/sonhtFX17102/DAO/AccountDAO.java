package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.entities.MapperAccount;

@Repository
public class AccountDAO extends BaseDao {

	public int getCountAllAccount() {
		String sql = "select * from account";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list.size();
	}

	public List<Account> getPagingPage(int index) {
		index = (index - 1) * 5;
		String sql = "select * from account\r\n" + "order by account_id\r\n" + "OFFSET " + index
				+ " ROWS FETCH NEXT 5 ROWS ONLY";

		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}

	public Account checkAccountByMailExist(String mail) {
		String sql = "select * from account where account_mail = '" + mail + "'";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}

	public void insertAccount(int account_role, String account_mail, String account_name, String account_phone,
			long total_donated, String account_password, String account_status) {
		String sql = "INSERT INTO Account([account_role],[account_mail],[account_name],[account_phone],[total_donated],[account_password],[account_status]) "
				+ "VALUES (" + account_role + ","
				+ " N'"+ account_mail +"',"
				+ " N'"+ account_name +"',"
				+ " '"+ account_phone +"',"
				+ " 0,"
				+ "'"+account_password +"',"
				+ " 0"
				+ ");";
		_jdbcTemplate.update(sql);
	}
	
	public Account getAccountByID(int id) {
		String sql = "Select * from account where account_id = " + id;
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list.get(0);
	}
	
	public void updateAccount(int account_id, int account_role, String account_mail, String account_name, String account_phone,
			long total_donated, String account_password, int account_status) {
		String sql = "UPDATE ACCOUNT\r\n"
				+ "SET\r\n"
				+ "account_role = " + account_role+",\r\n"
				+ "account_mail = N'"+ account_mail + "',\r\n"
				+ "account_name = N'"+ account_name +"',\r\n"
				+ "account_phone = N'"+ account_phone +"',\r\n"
				+ "total_donated = "+ total_donated + ", \r\n"
				+ "account_password = N'"+ account_password +"', \r\n"
				+ "account_status = " + account_status+"\r\n"
				+ "WHERE\r\n"
				+ "account_id = "+ account_id +";";
		_jdbcTemplate.update(sql);
	}
	
	public void updateRole(int id, int role) {
		String sql = "UPDATE ACCOUNT"
				+ "SET account_role = "+ role 
				+ "WHERE account_id = "+ id +";";
		_jdbcTemplate.update(sql);
	}
	
	public List<Account> getAccountBanned(String status){
		String sql = "SELECT * FROM ACCOUNT WHERE account_status = '"+ status +"';";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}
}
