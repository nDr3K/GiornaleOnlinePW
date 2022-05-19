package it.giornale.service;

import java.util.List;
import it.giornale.model.Article;

public interface ArticleService {

	String EXPRESSION_ONE = "[a-zA-Z0-9אטלעש\\s'.,-]{1,255}";
	String EXPRESSIONE_TWO = "[a-zA-Z0-9אטלעש\\s'.,:-]{1,}";
	
	List<Article> getArticles(String searchBy);
	void create(Article a);
	boolean checkData(String...data);
	String readArticleTitleById(int id);
	void update(Article a);
	void delete(int id);
}