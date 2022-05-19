package it.giornale.service;

import org.springframework.beans.factory.annotation.Autowired;

import it.giornale.dao.RoleDao;
import it.giornale.model.Role;

public class RoleServiceImpl implements RoleService 
{
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public Role getRole(int id) 
	{
		return roleDao.getRole(id);
	}

}
