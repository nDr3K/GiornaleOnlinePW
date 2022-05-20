package it.giornale.service;

import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.giornale.dao.ArticleDao;
import it.giornale.model.Article;

@Service
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

	@Override
	public boolean checkData(String title, String author, String caption, String content) 
	{
		if( Pattern.matches("[a-zA-Z-0-9אטלעש\\s'.,!?:-]{1,255}", title) &&
			Pattern.matches("[a-zA-Zאטלעש\\s']{1,255}", author) &&
			Pattern.matches("[a-zA-Z-0-9-אטלעש\\s'.,:_!?-]{1,}", caption) &&
			Pattern.matches("[a-zA-Z-0-9-אטלעש\\s'.,:_!?-]{1,}", content)	)
		return true;
		return false;
	}
}