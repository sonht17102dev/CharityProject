package com.sonhtFX17102.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperAccount implements RowMapper<Account>{

	@Override
	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
		Account account = new Account();
		account.setAccount_id(rs.getInt("account_id"));
		account.setAccount_role(rs.getInt("account_role"));
		account.setAccount_mail(rs.getString("account_mail"));
		account.setAccount_name(rs.getString("account_name"));
		account.setAccount_phone(rs.getString("account_phone"));
		account.setTotal_donated(rs.getLong("total_donated"));
		account.setAccount_password(rs.getString("account_password"));
		account.setAccount_status(rs.getString("account_status"));
		return account;
	}

}
