package it.giornale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.giornale.dao.CategoryDao;
import it.giornale.model.Category;

@Service
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
	public void update(Category c) 
	{
		categoryDao.update(c);
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

	@Override
	public Category readById(int id) 
	{
		return categoryDao.readById(id);
	}

}
