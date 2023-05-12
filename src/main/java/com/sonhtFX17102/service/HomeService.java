package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.CircumDao;
import com.sonhtFX17102.DAO.NewsDAO;
import com.sonhtFX17102.DAO.PartnerDAO;
import com.sonhtFX17102.entities.Circum;
import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.entities.Partner;

@Service
public class HomeService {
	@Autowired
	private CircumDao circumDao;
	@Autowired
	private PartnerDAO partnerDAO;
	@Autowired
	private NewsDAO newsDAO;
	
	public List<Circum> getTop6Circums() {
		return circumDao.getTop6Circums();
	}
	
	public List<Partner> getTop6Partner() {
		return partnerDAO.getTop6Partner();
	}
	
	public List<News> getTop2News() {
		return newsDAO.getTop2News();
	}
}
