package com.sonhtFX17102.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.DAO.NewsDAO;
import com.sonhtFX17102.entities.News;
import com.sonhtFX17102.service.INewsService;

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

	@Override
	public int getCountAllNews() {
		// TODO Auto-generated method stub
		return newsDAO.getCountAllNews();
	}

	@Override
	public void deleteNewsById(int id) {
		newsDAO.deleteNewsById(id);
	}

	@Override
	public News checkNewsByTitleExisted(String title) {
		// TODO Auto-generated method stub
		return newsDAO.checkNewsByTitleExisted(title);
	}

	@Override
	public void insertNews(String description, String banner, String date, String content) {
		// TODO Auto-generated method stub
		newsDAO.insertNews(description, banner, date, content);
	}

	@Override
	public List<News> getPagingPage(int index) {
		// TODO Auto-generated method stub
		return newsDAO.getPagingPage(index);
	}

	@Override
	public News getNewsById(int id) {
		// TODO Auto-generated method stub
		return newsDAO.getNewsById(id);
	}

	@Override
	public void updateNewsById(int news_id, String description, String banner, String date, String content,
			String status) {
		// TODO Auto-generated method stub
		newsDAO.updateNewsById(news_id, description, banner, date, content, status);
	}
}
