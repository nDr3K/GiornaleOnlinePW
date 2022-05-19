package it.giornale.service;

import java.util.List;

import it.giornale.model.Category;

public interface CategoryService 
{
	void create(Category c);
	void remove(Category c);
	List<Category> readAll();
}
