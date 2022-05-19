package it.giornale.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import it.giornale.dao.ArticleDao;
import it.giornale.model.Article;

public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	@Override
	public List<Article> readAll() {
		
		return articleDao.readAll();
	}

	@Override
	public void create(Article a) {

		articleDao.create(a);
	}


	@Override
	public void update(Article a) {
		
		articleDao.update(a);
	}

	@Override
	public void delete(Article a) {
		
		articleDao.delete(a);
	}

	@Override
	public Article getArticleById(int id)
	{
		return articleDao.readArticleById(id);
	}


}