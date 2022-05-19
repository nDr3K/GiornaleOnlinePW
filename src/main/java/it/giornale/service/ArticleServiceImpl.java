package it.giornale.service;

import java.util.List;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import it.giornale.dao.ArticleDao;
import it.giornale.model.Article;

public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	@Override
	public List<Article> getArticles(String searchBy) {
		
		List<Article> listArticle = articleDao.readAll();
		if(!searchBy.isEmpty()) {
			listArticle = listArticle
					.stream()
					.filter(b -> b.getTitle().toLowerCase()
							.contains(searchBy.toLowerCase()))
					.collect(Collectors.toList());
		}
		
		return listArticle;
	}

	@Override
	public void create(Article a) {

		articleDao.create(a);
	}

	@Override
	public boolean checkData(String... data) {

		boolean isDataOk = false;
		if(Pattern.matches(EXPRESSION_ONE,data[0]) && 
				Pattern.matches(EXPRESSION_ONE, data[1]) && 
				Pattern.matches(EXPRESSION_ONE,data[4])) {
			
			isDataOk = true;
			
			try {
				Integer.parseInt(data[2]);
				Double.parseDouble(data[3].replace(",","."));
				Integer.parseInt(data[5]);
			} catch (Exception e) {
				isDataOk = false;
			}
		}
		
		return isDataOk;
	}

	@Override
	public String readArticleTitleById(int id) {
		
		return articleDao.readBookTitleById(id);
	}

	@Override
	public void update(Article a) {
		
		articleDao.update(a);
	}

	@Override
	public void delete(int id) {
		
		articleDao.delete(id);
	}


}