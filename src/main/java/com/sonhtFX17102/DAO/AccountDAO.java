package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sonhtFX17102.DTO.AccountDetailsDTO;
import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.mapper.MapperAccount;
import com.sonhtFX17102.mapper.MapperAccountDetailsDTO;

@Repository
public class AccountDAO extends BaseDao {
	/*
	 * method getCountAllAccount trả về tổng số items của bảng account
	 */
	public int getCountAllAccount() {
		String sql = "select * from account where enabled=1;";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list.size();
	}

	/*
	 * method getPagingPage trả về items của bảng account thực hiện phân trang dữ
	 * liệu mỗi lần chỉ lấy 5 item trong db để hiển thị phân trang
	 */
	public List<Account> getPagingPage(int index) {
		index = (index - 1) * 5;
		String sql = "select * from account " + " where enabled=1" + " order by account_id\r\n" + "OFFSET " + index
				+ " ROWS FETCH NEXT 5 ROWS ONLY";

		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}

	/*
	 * method checkAccountByMailExist kiểm tra trường account_mail có bị trùng trong
	 * db ko
	 */
	public Account checkAccountByMailExist(String mail) {
		String sql = "select * from account where account_mail = '" + mail + "'";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}

	/*
	 * method checkAccountByNameExist kiểm tra trường account_name có bị trùng trong
	 * db ko
	 */
	public Account getAccountByUsername(String username) {
		String sql = "select * from account where account_name = '" + username + "'";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		if (list.size() == 0)
			return null;
		else
			return list.get(0);
	}

	/*
	 * method insertAccount thêm mới items vào database
	 */
	public void insertAccount(String account_role, String account_mail, String account_name, String account_phone,
			String account_password, String account_status, int enabled) {
		String sql = "INSERT INTO Account([account_role],[account_mail],[account_name],[account_phone],[account_password],[account_status]) "
				+ "VALUES ('" + account_role + "'," + " N'" + account_mail + "'," + " N'" + account_name + "'," + " '"
				+ account_phone + "'," + "'" + account_password + "'," + "'" + account_status + "', " + " " + enabled
				+ " " + ");";
		_jdbcTemplate.update(sql);
	}

	/*
	 * method getAccountByID tìm kiếm 1 item account trong database dựa trên id
	 */
	public Account getAccountByID(int id) {
		String sql = "Select * from account where account_id = " + id +";";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list.get(0);
	}

	/*
	 * method updateAccount cập nhật dữ liệu trong database dựa trên id
	 */
	public void updateAccount(int account_id, String account_role, String account_mail, String account_name,
			String account_phone) {
		String sql = "UPDATE ACCOUNT\r\n" + "SET\r\n" + "account_role = '" + account_role + "',\r\n"
				+ "account_mail = N'" + account_mail + "',\r\n" + "account_name = N'" + account_name + "',\r\n"
				+ "account_phone = N'" + account_phone + "' "
				+ " WHERE\r\n" + "account_id = " + account_id + ";";
		_jdbcTemplate.update(sql);
	}

	/*
	 * method updateRole cập nhật trường account_role trong database dựa trên id
	 */
	public void updateRole(int id, String role) {
		String sql = "UPDATE ACCOUNT" + "SET account_role = '" + role + "'" + "WHERE account_id = " + id + ";";
		_jdbcTemplate.update(sql);
	}

	/*
	 * method getAccountEnabled lấy về tất cả các item account trong database có
	 * trường enabled tương ứng tham số enabled là 0 -> disable (user ko được phép
	 * login) hay 1 -> enabled (user được phép login)
	 */
	public List<Account> getAccountEnabled(int enabled) {
		String sql = "SELECT * FROM ACCOUNT WHERE enabled = " + enabled + ";";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}
	
	public void updateEnabled(String id) {
		String sql = "Update account " + "set enabled = 1 where account_id = "+id + " ;";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method deleteAccountById thay đổi trường enabled từ 0 -> 1 ngăn account có
	 * trường enabled = 0 truy cập vào hệ thống dựa trên id
	 */
	public void deleteAccountById(int id) {
		String sql = "update account " + "set enabled = 0" + "where account_id = " + id + ";";
		_jdbcTemplate.update(sql);
	}

	/*
	 * method updateStatusOffline cập nhật trường status theo account_mail
	 */
	public void updateStatusOffline(String account_name) {
		String sql = "update account " + "set account_status = 'offline' " + "where account_name = '" + account_name
				+ "';";
		_jdbcTemplate.update(sql);
	}

	/*
	 * method updateStatusOnline cập nhật trường status theo account_mail
	 */
	public void updateStatusOnline(String account_name) {
		String sql = "update account " + "set account_status = 'online' " + "where account_name = '" + account_name
				+ "';";
		_jdbcTemplate.update(sql);
	}
	public void updateStatusBan(String account_id) {
		String sql = "update account " + "set account_status = 'ban' " + "where account_id = " + account_id
				+ ";";
		_jdbcTemplate.update(sql);
	}

	public List<Account> getAccountsByRole(String role) {
		// TODO Auto-generated method stub
		String sql = "select * from account where account_role = '" + role + "' and enabled=1;";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}

	public List<Account> getAccountsByKey(String key) {
		String sql = "select * from account\r\n" + "where account_mail like N'%" + key + "%' OR account_phone like '%"
				+ key + "%' and enabled=1;";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}

	public void updatePasswordByUsername(String pass, String username) {
		String sql = "Update account " + "set account_password = N'" + pass + "' " + "where account_name = N'"
				+ username + "' " + ";";
		_jdbcTemplate.update(sql);
	}

	public void updatePasswordByMail(String pass, String mail) {
		String sql = "Update account " + "set account_password = N'" + pass + "' " + "where account_mail = N'" + mail
				+ "' " + ";";
		_jdbcTemplate.update(sql);
	}

	public AccountDetailsDTO getAccountDetailsByUsername(String name) {
		String sql = "select a.account_id, account_name, account_mail, account_phone, account_address,"
				+ " account_firstName, account_lastName, account_image, account_birthday,"
				+ " account_organization, total_donated, account_bank, account_bankname from account a\r\n"
				+ " inner join ACCOUNTDETAILS ad\r\n " + " on a.account_id = ad.account_id\r\n "
				+ " where account_name = '" + name + "';";
		List<AccountDetailsDTO> list = _jdbcTemplate.query(sql, new MapperAccountDetailsDTO());
		return list.get(0);
	}

	public void uploadAvatar(String image, String id) {
		String sql = "Update ACCOUNTDETAILS SET " + " account_image = '" + image + "' " + " where account_id = '" + id
				+ "';";
		_jdbcTemplate.update(sql);
	}

	public void updateAccountDetailsByUser(int account_id, String account_firstName, String account_lastName,
			String account_address, String account_birthday, String account_organization, String account_name,
			String account_phone, String account_bank, String account_bankname) {
//		int id = getAccountByID(account_id)
		String sql = "Update account " + "Set " + "account_name = N'" + account_name + "', " + "account_phone = '"
				+ account_phone + "' " + "where account_id = " + account_id + "; ";

		String sqlAddAccountDetail = "Update ACCOUNTDETAILS " + "set account_firstName = N'" + account_firstName + "', "
				+ "account_lastName = N'" + account_lastName + "', " + "account_address = N'" + account_address + "', "
				+ "account_birthday = N'" + account_birthday + "', " + "account_organization = N'"
				+ account_organization + "', " + "account_bank = N'" + account_bank + "', " + "account_bankname = N'"
				+ account_bankname + "' " + "where account_id = " + account_id + "; ";
		_jdbcTemplate.update(sql);
		_jdbcTemplate.update(sqlAddAccountDetail);

	}

	public AccountDetailsDTO getAccountDetails(int id) {
		String sql = "select * from accountdetails where account_id = " + id + ";";
		List<AccountDetailsDTO> list = _jdbcTemplate.query(sql, new MapperAccountDetailsDTO());
		return list.get(0);
	}

}
