package it.giornale.service;

import java.util.List;
import it.giornale.model.Article;

public interface ArticleService {
	
	List<Article> getArticles(String searchBy);
	void create(Article a);
	void update(Article a);
	void delete(Article a);
	Article getArticleById(int id);
}