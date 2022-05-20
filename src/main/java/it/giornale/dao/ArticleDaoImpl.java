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
}
