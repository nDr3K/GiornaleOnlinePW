package it.giornale.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;
import it.giornale.model.Article;

@Repository
public class ArticleDaoImpl implements ArticleDao {

	@PersistenceContext
	private EntityManager manager;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Article> readAll() {
		
		return manager.createQuery("SELECT a FROM Article a").getResultList();
	}
	
	@Override
	@Transactional
	public void create(Article a) {
		
		manager.persist(a);		
	}

	@Override
	@Transactional
	public void update(Article a) {

		manager.merge(a);
	}

	@Override
	@Transactional
	public void delete(Article a) {
		
		manager.remove(manager.merge(a));
	}

	@Override
	public Article readArticleById(int id) {
		
		return manager.find(Article.class, id);
	}

	@Override
	public int getNext(int id)
	{
		int n = id;
		try 
		{
			n = (int) manager.createNativeQuery("CALL next("+id+")").getResultList().get(0);
		} catch (Exception e) {}
		return n;
	}

	@Override
	public int getPrevious(int id)
	{
		int n = id;
		try 
		{
			n = (int) manager.createNativeQuery("CALL previous("+id+")").getResultList().get(0);
		} catch (Exception e) 
		{}
		return n;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> readLastTen() 
	{
		return manager.createQuery("SELECT a FROM Article a WHERE a.visible = false ORDER BY a.date desc").setMaxResults(10).getResultList();
	}
}
