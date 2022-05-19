package it.giornale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import it.giornale.model.Category;

public class CategoryServiceImpl implements CategoryService
{
	@Autowired
	private CategoryService categoryService;
	
	@Override
	public void create(Category c) 
	{
		categoryService.create(c);
	}

	@Override
	public void remove(Category c) 
	{
		categoryService.remove(c);
	}

	@Override
	public List<Category> readAll() 
	{
		return categoryService.readAll();
	}

}
