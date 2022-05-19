package it.giornale.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

public class Article {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Pattern(regexp = "[a-zA-Z-0-9-אטלעש\\s'.,!?:.-]{1,255}", message = "{article.error.title}")
	@Column(name = "title", length = 255, nullable = false)
	private String title;
	
	@Pattern(regexp = "[a-zA-Z-0-9-אטלעש\\s'.,]{1,255}", message = "{article.error.author}")
	@Column(name = "author", length = 255, nullable = false)
	private String author;
	
	
	@Column(name = "date", nullable = false)
	private Date date;
	
	@Pattern(regexp = "[a-zA-Z-0-9-אטלעש\\s'.,]{1,255}", message = "{article.error.category}")
	@Column(name = "category_id", length = 255, nullable = false)
	private String category;
	
	@Pattern(regexp = "[a-zA-Z-0-9-אטלעש\\s'.,-:_!?]{1,}", message = "{article.error.content}")
	@Column(name = "content", nullable = false)
	private String content;
	
	
	@Column(name = "image", length = 255, nullable = false)
	private String image;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}	
}