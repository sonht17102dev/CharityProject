package com.sonhtFX17102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sonhtFX17102.entities.News;

@Service
public interface INewsService {
	@Autowired
	public List<News> getAllNews();
	public List<News> getTop6List();
	public List<News> getNext6News(int iamount);
	public List<News> getPagingPage(int index);
	public int getCountAllNews();
	public void deleteNewsById(int id);
	public News checkNewsByTitleExisted(String title);
	public void insertNews(String description, String banner, String date, String content);
	public News getNewsById(int id);
	public void updateNewsById(int news_id, String description, String banner,
			String date, String content, String status);
	public List<News> getNewsByYear(String year);
	public List<News> getNewsByKey(String key);
}
