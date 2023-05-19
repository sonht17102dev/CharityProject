package com.sonhtFX17102.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sonhtFX17102.DTO.AccountDetailsDTO;
import com.sonhtFX17102.entities.Account;

public class MapperAccountDetailsDTO implements RowMapper<AccountDetailsDTO>{

	@Override
	public AccountDetailsDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		AccountDetailsDTO account = new AccountDetailsDTO();
		
		account.setAccount_id(rs.getInt("account_id"));
		account.setAccount_name(rs.getString("account_name"));
		account.setAccount_mail(rs.getString("account_mail"));
		account.setAccount_phone(rs.getString("account_phone"));
		account.setAccount_firstName(rs.getString("account_firstName"));
		account.setAccount_lastName(rs.getString("account_lastName"));
		account.setAccount_image(rs.getString("account_image"));
		account.setAccount_address(rs.getString("account_address"));
		account.setAccount_birthday(rs.getString("account_birthday"));
		account.setAccount_organization(rs.getString("account_organization"));
		account.setAccount_bank(rs.getString("account_bank"));
		account.setAccount_bankname(rs.getString("account_bankname"));
		return account;
	}

}
