package it.giornale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import it.giornale.dao.CategoryDao;
import it.giornale.model.Category;

public class CategoryServiceImpl implements CategoryService
{
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public void create(Category c) 
	{
		categoryDao.create(c);
	}

	@Override
	public void remove(Category c) 
	{
		categoryDao.remove(c);
	}

	@Override
	public List<Category> readAll() 
	{
		return categoryDao.readAll();
	}

}
