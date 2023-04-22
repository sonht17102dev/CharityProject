package com.sonhtFX17102.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.sonhtFX17102.entities.Account;
import com.sonhtFX17102.entities.MapperAccount;

@Repository
public class AccountDAO extends BaseDao {
	/*
	 * method getCountAllAccount trả về tổng số items của bảng account
	 */
	public int getCountAllAccount() {
		String sql = "select * from account";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list.size();
	}
	/*
	 * method getPagingPage trả về items của bảng account
	 * thực hiện phân trang dữ liệu
	 * mỗi lần chỉ lấy 5 item trong db để hiển thị phân trang
	 */
	public List<Account> getPagingPage(int index) {
		index = (index - 1) * 5;
		String sql = "select * from account where enabled=1" + "order by account_id\r\n" + "OFFSET " + index
				+ " ROWS FETCH NEXT 5 ROWS ONLY";

		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}
	/*
	 * method checkAccountByMailExist kiểm tra trường account_mail có bị trùng trong db ko
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
	 * method insertAccount thêm mới items vào database
	 */
	public void insertAccount(String account_role, String account_mail, String account_name, String account_phone,
			long total_donated, String account_password, String account_status) {
		String sql = "INSERT INTO Account([account_role],[account_mail],[account_name],[account_phone],[total_donated],[account_password],[account_status]) "
				+ "VALUES ('" + account_role + "',"
				+ " N'"+ account_mail +"',"
				+ " N'"+ account_name +"',"
				+ " '"+ account_phone +"',"
				+ " 0,"
				+ "'"+account_password +"',"
				+ "'"+account_status +"',"
				+ ");";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method getAccountByID tìm kiếm 1 item account trong database dựa trên id
	 */
	public Account getAccountByID(int id) {
		String sql = "Select * from account where account_id = " + id;
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list.get(0);
	}
	/*
	 * method updateAccount cập nhật dữ liệu trong database dựa trên id 
	 */
	public void updateAccount(int account_id, String account_role, String account_mail, String account_name, String account_phone,
			long total_donated, String account_password, String account_status) {
		String sql = "UPDATE ACCOUNT\r\n"
				+ "SET\r\n"
				+ "account_role = '" + account_role+"',\r\n"
				+ "account_mail = N'"+ account_mail + "',\r\n"
				+ "account_name = N'"+ account_name +"',\r\n"
				+ "account_phone = N'"+ account_phone +"',\r\n"
				+ "total_donated = "+ total_donated + ", \r\n"
				+ "account_password = N'"+ account_password +"', \r\n"
				+ "account_status = '" + account_status+"'\r\n"
				+ "WHERE\r\n"
				+ "account_id = "+ account_id +";";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method updateRole cập nhật trường account_role trong database dựa trên id 
	 */
	public void updateRole(int id, String role) {
		String sql = "UPDATE ACCOUNT"
				+ "SET account_role = '"+ role + "'"
				+ "WHERE account_id = "+ id +";";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method getAccountEnabled lấy về tất cả các item account trong database
	 * có trường enabled tương ứng tham số enabled 
	 * là 0 -> disable (user ko được phép login) 
	 * hay 1 -> enabled (user được phép login)
	 */
	public List<Account> getAccountEnabled(int enabled){
		String sql = "SELECT * FROM ACCOUNT WHERE enabled = "+ enabled +";";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}
	/*
	 * method deleteAccountById thay đổi trường enabled từ 0 -> 1
	 * ngăn account có trường enabled = 0 truy cập vào hệ thống dựa trên id
	 */
	public void deleteAccountById(int id) {
		String sql = "update account "
				+ "set enabled = 0"
				+ "where account_id = " + id +";";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method updateStatusOffline cập nhật trường status theo account_mail
	 */
	public void updateStatusOffline(String account_mail) {
		String sql = "update account "
				+ "set account_status = 'offline' "
				+ "where account_mail = '"+ account_mail +"';";
		_jdbcTemplate.update(sql);
	}
	/*
	 * method updateStatusOnline cập nhật trường status theo account_mail
	 */
	public void updateStatusOnline(String account_mail) {
		String sql = "update account "
				+ "set account_status = 'online' "
				+ "where account_mail = '"+ account_mail +"';";
		_jdbcTemplate.update(sql);
	}
	public List<Account> getAccountsByRole(String role) {
		// TODO Auto-generated method stub
		String sql = "select * from account where account_role = '"+ role +"';" ;
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}
	
	public List<Account> getAccountsByKey(String key) {
		String sql = "select * from account "
				+ "where account_mail like N'%"+ key +"%'";
		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
		return list;
	}
	
//	public List<Account> getAccountsByPhone(String phone) {
//		String sql = "select * from account "
//				+ "where account_phone = '%"+ phone +"'";
//		List<Account> list = _jdbcTemplate.query(sql, new MapperAccount());
//		return list;
//	}
}
