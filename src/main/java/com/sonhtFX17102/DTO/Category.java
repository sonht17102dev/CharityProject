package com.sonhtFX17102.DTO;

import java.util.ArrayList;
import java.util.List;

public class Category {
	private List<Category> categories;
	public Category() {
		this.categories = new ArrayList<>();
	}
	public List<Category> getCategories() {
		return categories;
	}
	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}
	
}
