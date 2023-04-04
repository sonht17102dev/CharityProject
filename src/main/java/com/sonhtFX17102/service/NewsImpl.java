package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.NewsDAO;
import com.sonhtFX17102.entities.News;

@Service
public class NewsImpl implements INewsService{
	@Autowired
	private NewsDAO newsDAO;
	
	@Override
	public List<News> getAllNews() {
		// TODO Auto-generated method stub
		return newsDAO.getAllNews();
	}

	public List<News> getNext6News(int iamount) {
		// TODO Auto-generated method stub
		return newsDAO.getNext6News(iamount);
	}
	public List<News> getTop6List() {
	 return newsDAO.getTop6List();
	}
}
