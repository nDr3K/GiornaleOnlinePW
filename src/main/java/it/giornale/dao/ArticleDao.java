package it.giornale.dao;

import java.util.List;
import it.giornale.model.Article;

public interface ArticleDao {

	List<Article>readAll();
	void create(Article a);
	void update(Article a);
	void delete(int id);
	String readBookTitleById(int id);
}
