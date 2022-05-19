package it.giornale.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import it.giornale.model.Role;

@Repository
public class RoleDaoImpl implements RoleDao 
{
	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public Role getRole(int id) 
	{
		return manager.find(Role.class, id);
	}

}
