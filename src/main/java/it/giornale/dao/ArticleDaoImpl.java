package it.giornale.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import it.giornale.model.Article;

public class ArticleDaoImpl implements ArticleDao {

	@Autowired
	private JdbcTemplate template;
	
	@Override
	public List<Article> readAll() {
		
		String sql = "SELECT * FROM articles";
		return template.query(sql,articleMapper);
	}

	@Override
	public void create(Article a) {
		
		String sql = "INSERT INTO articles (title,author,date,category_id,content,image) VALUES (?,?,?,?,?,?)";
		template.update(sql,a.getTitle(),a.getAuthor(),a.getDate(),
				a.getCategory(),a.getContent(),a.getImage());
		
	}

	@Override
	public void update(Article a) {

		String sql = "UPDATE articles SET title =?,author=?,date=?,category_id=?,content=?,image=? WHERE id=?";
		template.update(sql,a.getTitle(),a.getAuthor(),
				a.getDate(),a.getCategory(),a.getContent(),a.getImage(),a.getId());	
	}

	@Override
	public void delete(int id) {
		
		String sql = "DELETE FROM articles WHERE id=?";
		template.update(sql,id);
	}

	@Override
	public String readBookTitleById(int id) {

		String sql = "SELECT title FROM articles WHERE id=?";
		return template.queryForObject(sql,String.class, id);
	}
	
	
	
	private RowMapper<Article> articleMapper = (resultSet, rowNum) -> {
		
		Article a = new Article();
		
		a.setId(resultSet.getInt("id"));
		a.setTitle(resultSet.getString("title"));
		a.setAuthor(resultSet.getString("author"));
		a.setDate(resultSet.getDate("date"));
		a.setCategory(resultSet.getString("category_id"));
		a.setContent(resultSet.getString("content"));
		a.setImage(resultSet.getString("image"));
		return a;
	};
}
