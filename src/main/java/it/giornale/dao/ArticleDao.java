package it.giornale.dao;

import java.util.List;

import it.giornale.model.Article;

public interface ArticleDao {

	List<Article> readAll();
	void create(Article a);
	void update(Article a);
	void delete(Article a);
	Article readArticleById(int id);
	int getNext(int id);
	int getPrevious(int id);
	List<Article> readLastTen();
	boolean isCategoryEmpty(int id);
}
