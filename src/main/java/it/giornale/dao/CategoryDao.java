package it.giornale.dao;

import java.util.List;

import it.giornale.model.Category;

public interface CategoryDao 
{
	void create(Category c);
	void update(Category c);
	void remove(Category c);
	List<Category> readAll();
	Category readById(int id);
}
