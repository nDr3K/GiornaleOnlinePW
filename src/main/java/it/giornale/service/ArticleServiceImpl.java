package it.giornale.service;

import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

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
		a.getUsers().clear();
		update(a);
		articleDao.delete(a);
	}

	@Override
	public Article getArticleById(int id)
	{
		return articleDao.readArticleById(id);
	}

	@Override
	public boolean checkData(String title, String author) 
	{
		if( Pattern.matches("[a-zA-Z0-9אטילעש\\s':.,!?-]{1,255}", title) &&
			Pattern.matches("[a-zA-Zאטלעש\\s']{1,255}", author))
		return true;
		return false;
	}

	@Override
	public int getNext(int id) 
	{
		return articleDao.getNext(id);
	}

	@Override
	public int getPrevious(int id) 
	{
		return articleDao.getPrevious(id);
	}

	@Override
	public List<Article> readLastTen() 
	{
		return articleDao.readLastTen();
	}

	@Override
	public List<Article> searchByCategory(String category) 
	{
		List<Article> list = articleDao.readAll();
		
		list = list
					.stream()
					.filter(b -> b.getCategory().getDescription().contains(category))
					.collect(Collectors.toList());
		
		return list;
	}

	@Override
	public List<Article> searchByTitle(String title) {
		
		List<Article> list = articleDao.readAll();
		
		list = list 
				.stream()
				.filter(b -> b.getTitle().contains(title))
				.collect(Collectors.toList());
		
		return list;
	}

	@Override
	public List<Article> searchByAuthor(String author) {

		List<Article> list = articleDao.readAll();
		
		list = list 
				.stream()
				.filter(b -> b.getAuthor().contains(author))
				.collect(Collectors.toList());
		
		return list;
	}

	@Override
	public List<Article> searchByKeywords(String keyword) {
		
		List<Article> list = articleDao.readAll();
				
		list = list 
				.stream()
				.filter(b -> b.getKeywords().toLowerCase().contains(keyword.toLowerCase()))
				.collect(Collectors.toList());
		
		return list;
	}

	@Override
	public boolean isCategoryEmpty(int id) 
	{
		return articleDao.isCategoryEmpty(id);
	}
	
}