 package it.giornale.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import it.giornale.model.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao 
{
	@PersistenceContext
	private EntityManager manager;
	
	
	@Override
	@Transactional
	public void create(Category c) 
	{
		manager.persist(c);
	}
	
	@Override
	@Transactional
	public void update(Category c) 
	{
		manager.merge(c);
	}

	@Override
	@Transactional
	public void remove(Category c) 
	{
		manager.remove(manager.merge(c));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> readAll() 
	{
		return manager.createQuery("SELECT c FROM Category c").getResultList();
	}

	@Override
	public Category readById(int id) 
	{
		return manager.find(Category.class, id);
	}

}
