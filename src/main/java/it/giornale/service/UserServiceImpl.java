package it.giornale.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.giornale.dao.UserDao;
import it.giornale.model.User;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDao userDao;
	
	@Override
	public void createUser(User u) 
	{
		userDao.createUser(u);
	}

	@Override
	public List<User> readAll() 
	{
		return userDao.readAll();
	}

	@Override
	public User readById(int id) 
	{
		return userDao.readById(id);
	}

	@Override
	public void modifyUser(User u) 
	{
		userDao.modifyUser(u);
	}

	@Override
	public void deleteUser(User u) 
	{
		u.getFavorites().clear();
		u.setRole(null);
		modifyUser(u);
		userDao.deleteUser(u);
	}

	@Override
	public User readByUsername(String username) 
	{
		return userDao.readByUsername(username);
	}

	@Override
	public boolean usernameExist(String username) 
	{
		try 
		{
			readByUsername(username);
			return true;
		} catch (Exception e) 
		{
			return false;
		}
	}

	@Override
	public boolean mailExist(String mail) 
	{
		return userDao.mailExist(mail);
	}

}
