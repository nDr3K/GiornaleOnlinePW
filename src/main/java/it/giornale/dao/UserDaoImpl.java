package it.giornale.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import it.giornale.model.User;

@Repository
public class UserDaoImpl implements UserDao 
{
	@PersistenceContext
	private EntityManager manager;
	
	@Override
	@Transactional
	public void createUser(User u) 
	{
		manager.persist(u);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> readAll() 
	{
		return manager.createQuery("SELECT u FROM User u").getResultList();
	}

	@Override
	public User readById(int id) 
	{
		return manager.find(User.class, id);
	}

	@Override
	@Transactional
	public void modifyUser(User u) 
	{
		manager.merge(u);
	}

	@Override
	public void deleteUser(User u) 
	{
		manager.remove(manager.merge(u));
	}

}
