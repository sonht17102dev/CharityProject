package com.sonhtFX17102.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sonhtFX17102.entities.Account;

public class MapperAccount implements RowMapper<Account>{

	@Override
	public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
		Account account = new Account();
		account.setAccount_id(rs.getInt("account_id"));
		account.setAccount_role(rs.getString("account_role"));
		account.setAccount_mail(rs.getString("account_mail"));
		account.setAccount_name(rs.getString("account_name"));
		account.setAccount_phone(rs.getString("account_phone"));
		account.setAccount_password(rs.getString("account_password"));
		account.setAccount_status(rs.getString("account_status"));
		account.setEnabled(rs.getInt("enabled"));
		return account;
	}

}
