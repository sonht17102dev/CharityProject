package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.CircumDao;
import com.sonhtFX17102.entities.Circum;

@Service
public class HomeImpl{
	@Autowired
	private CircumDao circumDao;
	
	public int getCountAllCircums() {
		
		return circumDao.getCountAllCircums();
	}
	
	
	public List<Circum> get6NewestCircums() {
		// TODO Auto-generated method stub
		return circumDao.get6NewestCircums();
	}
	
	public List<Circum> getTop6Circums() {
		// TODO Auto-generated method stub
		return circumDao.getTop6Circums();
	}
	public List<Circum> getTop3Circums() {
		// TODO Auto-generated method stub
		return circumDao.getTop3Circums();
	}
	
}
