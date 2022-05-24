package it.giornale.service;

import java.util.List;
import it.giornale.model.Article;

public interface ArticleService {
	
	List<Article> readAll();
	void create(Article a);
	void update(Article a);
	void delete(Article a);
	Article getArticleById(int id);
	boolean checkData(String title, String author, String caption, String content);
	int getNext(int id);
	int getPrevious(int id);
	List<Article> readLastTen();
	List<Article> searchByCategory(String category);
	List<Article> searchByTitle(String title);
}