package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DTO.CircumDTO;
import com.sonhtFX17102.entities.Circum;

@Service
public interface ICircumService {

	public List<Circum> get6NewestCircums();

	public List<Circum> getTop6Circums();

	public List<Circum> getTop3Circums();

	public List<Circum> getAllCircums();

	public int getCountAllCircums();

	public List<Circum> getTop10Circums();

	public CircumDTO getCircumDetailsById(int id);

	public List<Circum> getPagingPage(int index);

	public List<Circum> getPagingPageAdmin(int index);

	public Circum getCircumById(int index);

	public void insertCircum(int partner_id, String name, String type, String content, String image, String des,
			int donations, long target, long raise, int time_end, String start_donate, String status);

	public Circum checkCircumByNameExist(String name);

	public void deleteCircum(int id);

	public void upDateCircum(int circum_id, int partner_id, String name, String type, String content, String image,
			String des, int donations, long target, long raise, int time_end, String start_donate, String status);

	public List<Circum> findByCategory(String type);

	public List<Circum> findByName(String name);

	public void updateStatus(int id, String status);

	public List<Circum> findCircumsInactive(String status);
	
}
