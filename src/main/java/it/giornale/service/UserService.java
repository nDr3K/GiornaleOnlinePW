package it.giornale.service;

import java.util.List;

import it.giornale.model.User;

public interface UserService 
{
	void createUser(User u);
	List<User> readAll();
	User readById(int id);
	void modifyUser(User u);
	void deleteUser(User u);
	User readByUsername(String username);
	boolean usernameExist(String username);
	boolean mailExist(String mail);
}
