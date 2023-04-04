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
}
