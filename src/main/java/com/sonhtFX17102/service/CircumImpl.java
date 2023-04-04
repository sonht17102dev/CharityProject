package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.CircumDao;
import com.sonhtFX17102.DTO.CircumDTO;
import com.sonhtFX17102.entities.Circum;

@Service
public class CircumImpl implements ICircumService {
	@Autowired
	private CircumDao circumDao;

	@Override
	public int getCountAllCircums() {

		return circumDao.getCountAllCircums();
	}

	@Override
	public List<Circum> get6NewestCircums() {
		// TODO Auto-generated method stub
		return circumDao.get6NewestCircums();
	}

	@Override
	public List<Circum> getTop6Circums() {
		// TODO Auto-generated method stub
		return circumDao.getTop6Circums();
	}

	@Override
	public CircumDTO getCircumDetailsById(int id) {
		// TODO Auto-generated method stub
		return circumDao.getCircumDetailsById(id);
	}

	@Override
	public List<Circum> getTop10Circums() {
		// TODO Auto-generated method stub
		return circumDao.getTop10Circums();
	}

	@Override
	public List<Circum> getPagingPage(int index) {
		// TODO Auto-generated method stub
		return circumDao.getPagingPage(index);
	}

	@Override
	public List<Circum> getPagingPageAdmin(int index) {
		// TODO Auto-generated method stub
		return circumDao.getPagingPageAdmin(index);
	}

	@Override
	public Circum getCircumById(int index) {
		// TODO Auto-generated method stub
		return circumDao.getCircumById(index);
	}

	@Override
	public void insertCircum(int partner_id, String name, String type, String content, String image, String des,
			int donations, long target, long raise, int time_end, String start_donate) {
		circumDao.insertCircum(partner_id, name, type, content, image, des, donations, target, raise, time_end,
				start_donate);
	}

	@Override
	public Circum checkCircumByNameExist(String name) {
		// TODO Auto-generated method stub
		return circumDao.checkCircumByNameExist(name);
	}

	@Override
	public void deleteCircum(int id) {
		// TODO Auto-generated method stub
		circumDao.deleteCircum(id);
	}


	@Override
	public List<Circum> findByCategory(String type) {
		// TODO Auto-generated method stub
		return circumDao.findByCategory(type);
	}

	@Override
	public List<Circum> findByName(String name) {
		// TODO Auto-generated method stub
		return circumDao.findByName(name);
	}

	@Override
	public List<Circum> getAllCircums() {
		// TODO Auto-generated method stub
		return circumDao.getAllCircums();
	}

	@Override
	public void updateStatus(int id, String status) {
		// TODO Auto-generated method stub
		circumDao.updateStatus(id, status);
	}

	@Override
	public void upDateCircum(int circum_id, int partner_id, String name, String type, String content, String image,
			String des, int donations, long target, long raise, int time_end, String start_donate, String status) {
		// TODO Auto-generated method stub
		circumDao.upDateCircum(circum_id, partner_id, name, type, content, image, des, donations, target, raise, time_end, start_donate, status);
	}

	@Override
	public List<Circum> findCircumsInactive(String status) {
		// TODO Auto-generated method stub
		return circumDao.findCircumsInactive(status);
	}

}
